defmodule Flux.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph
  alias Scenic.ViewPort
  alias Flux.Actions

  import Scenic.Primitives
  # import Scenic.Components

  # ============================================================================
  # setup

  # --------------------------------------------------------
  @spec init(any, nil | keyword | map) :: {:ok, Scenic.Graph.t(), [{:push, map}]}
  def init(_, opts) do
    {:ok, status} = ViewPort.info(opts[:viewport])

    %{shapes: shapes, transforms: transforms} = Actions.Rectangle.initial_state(status)

    graph =
      status
      |> initialize_graph()
      |> add_specs_to_graph(shapes, transforms)

    {:ok, graph, push: graph}
  end

  def handle_input({:key, event}, _context, state) do
    # Logger.info("Received event: #{inspect(event)}")
    event
    # Get action
    |> Actions.Rectangle.dispatch()
    # Map update onto the graph
    |> update(state)
    # Push to the ui
    |> view()
  end

  def handle_input(_event, _context, state), do: {:noreply, state}

  defp update(action, state), do: Graph.map(state, action)
  defp view(new_state), do: {:noreply, new_state, push: new_state}

  defp initialize_graph(%ViewPort.Status{size: {width, height}}) do
    background = rect_spec({width, height})
    Graph.build(font: :roboto, font_size: 24) |> add_specs_to_graph([background])
  end
end
