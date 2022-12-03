defmodule AdventOfCode2022.Day3 do
  @alphabet "abcdefghijklmnopqrstuvwxyz" |> String.split("", trim: true)

  def get_rucksacks do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day_3_input.txt")

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def get_priority_score(letter) do
    alphabet_idx = @alphabet |> Enum.find_index(fn x -> x == letter or x == String.downcase(letter) end)

    if Enum.member?(@alphabet, letter), do: alphabet_idx + 1, else: alphabet_idx + 1 + 26
  end

  def part1 do
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

    get_rucksacks()
    |> Enum.map(split_in_two)
    |> Enum.map(get_repeated_character)
    |> Enum.map(&get_priority_score(&1))
    |> Enum.sum
  end

  def part2 do
    get_repeated_character = fn [compartment1, compartment2, compartment3] ->
      set1 = MapSet.new(compartment1)
      set2 = MapSet.new(compartment2)
      set3 = MapSet.new(compartment3)

      MapSet.intersection(set1, set2) |> MapSet.intersection(set3) |> MapSet.to_list |> List.first
    end

    convert_to_lists = fn list_of_strs ->
      Enum.map(list_of_strs, fn x -> String.split(x, "", trim: true) end)
     end

    get_rucksacks()
    |> Enum.chunk_every(3)
    |> Enum.map(convert_to_lists)
    |> Enum.map(get_repeated_character)
    |> Enum.map(&get_priority_score(&1))
    |> Enum.sum
  end
end
