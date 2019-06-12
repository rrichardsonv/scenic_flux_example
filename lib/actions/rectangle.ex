defmodule Flux.Actions.Rectangle do
  alias Flux.Utils
  alias Scenic.Primitive.Rectangle
  alias Scenic.ViewPort

  import Scenic.Primitives

  def initial_state(%ViewPort.Status{size: {x, y}}) do
    %{
      shapes: [
        rect_spec({20, 20},
          fill: :red,
          stroke: {3, :blue},
          join: :round
        )
      ],
      transforms: [translate: Utils.center_coords(x, y)]
    }
  end

  defguardp is_rectangle(node_type) when node_type == Rectangle
  #
  #
  #
  #
  #
  # ACTION CREATORS  -----------
  def dispatch({"R", _, _} = event), do: &rotate_rectangle(&1, event)
  # def dispatch({"G", _, _} = event), do: &grow_rectangle(&1, event)
  def dispatch(_event), do: & &1
  #
  #
  #
  #
  # ACTIONS  -------------------
  def rotate_rectangle(%{module: node_type} = node, _event) when is_rectangle(node_type) do
    current_rotation = Utils.dig(node, [:transforms, :rotate], 0)
    update_opts(node, rotate: current_rotation + 0.1)
  end

  def rotate_rectangle(node, _event), do: node

  # def grow_rectangle(%{module: node_type} = node, _event) when is_rectangle(node_type) do
  #   # Code here
  # end
  # def grow_rectangle(node, _event), do: node
end
