defmodule AdventOfCode2022.Day3 do
  @alphabet "abcdefghijklmnopqrstuvwxyz" |> String.split("", trim: true)

  def part1 do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day_3_input.txt")

    get_repeated_character = fn [compartment1, compartment2] ->
      set1 = MapSet.new(compartment1)
      set2 = MapSet.new(compartment2)

      MapSet.intersection(set1, set2) |> MapSet.to_list |> List.first
    end

    split_in_two = fn str ->
      String.split(str, "", trim: true)
      |> Enum.split(round(String.length(str) / 2))
      |> Tuple.to_list
    end

    get_value = fn letter ->
      alphabet_idx = @alphabet |> Enum.find_index(fn x -> x == letter or x == String.downcase(letter) end)

      if Enum.member?(@alphabet, letter), do: alphabet_idx + 1, else: alphabet_idx + 1 + 26
    end

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.map(split_in_two)
    |> Enum.map(get_repeated_character)
    |> Enum.map(get_value)
    |> Enum.sum
  end
end
