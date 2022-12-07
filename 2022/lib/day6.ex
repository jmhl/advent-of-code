defmodule AdventOfCode2022.Day6 do
  def get_datastream do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day6_input.txt")

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> List.first()
  end

  def find_start_of_packet(input, marker_count) do
    input_items = String.split(input, "", trim: true)

    input_items
    |> Enum.with_index()
    |> Enum.reduce_while(nil, fn {_, idx}, nil ->
      uniq_slice = Enum.slice(input_items, idx, marker_count) |> Enum.uniq() |> Enum.to_list() |> length

      if uniq_slice == marker_count do
        {:halt, idx + marker_count}
      else
        {:cont, nil}
      end
    end)
  end

  def part1 do
    find_start_of_packet(get_datastream(), 4)
  end

  def part2 do
    find_start_of_packet(get_datastream(), 14)
  end
end
