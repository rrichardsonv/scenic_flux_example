defmodule Flux.Utils do
  # Helpers
  def center_coords(x, y), do: Enum.map([x, y], &Integer.floor_div(&1, 2)) |> List.to_tuple()

  def dig(nil, _, default), do: default
  def dig(result, [], _default), do: result

  def dig(map_like, [key | keys], default) when is_map(map_like) do
    map_like
    |> Map.get(key)
    |> dig(keys, default)
  end
end
