defmodule AdventOfCode2022.Day5 do
  def get_input do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day5_input.txt")

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def get_board_and_moves(list) do
    interpret_moves = fn move ->
      [_, count, _, fromStack, _, toStack] = String.split(move, " ")
      %{:count => String.to_integer(count), :from => String.to_integer(fromStack), :to => String.to_integer(toStack)}
    end

    moves =
      Enum.filter(list, fn x -> String.starts_with?(x, "move ") end)
      |> Enum.map(interpret_moves)

    board =
      Enum.filter(list, fn x -> not String.starts_with?(x, "move ") end)

    # board =
    #   Enum.filter(list, fn x -> not String.starts_with?(x, "move ") end)
    #   |> Enum.filter(fn x -> not String.starts_with?(x, "1") end)
    #   |> Enum.filter(fn x -> String.length(x) > 0 end)
    #   # |> Enum.map(fn x -> Regex.replace(~r/\] /, x, "]") end)
    #   # |> Enum.map(fn x -> Regex.replace(~r/\[ /, x, "[") end)
    #   |> Enum.map(fn x -> Regex.replace(~r/    /, x, "   ") end)
    #   |> Enum.map(fn x -> String.split(x, "") end)
    #   # |> Enum.map(fn x -> Enum.chunk_every(String.split(x, "", trim: true), 3) end)

    {board, moves}
  end

  def part1 do
    input = get_input()

    IO.inspect(get_board_and_moves(input))
  end
end
