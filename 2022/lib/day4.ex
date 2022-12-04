defmodule AdventOfCode2022.Day4 do
  def get_assignments do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day4_input.txt")

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.map(&get_ranges/1)
  end

  def get_ranges(assignments) do
    String.split(assignments, ",", trim: true)
    |> Enum.map(fn x -> String.split(x, "-", trim: true) end)
    |> Enum.map(fn [start_section_str, end_section_str] ->
      start_section = String.to_integer(start_section_str)
      end_section = String.to_integer(end_section_str)

      Enum.to_list(start_section..end_section)
    end)
  end

  def get_overlap([elf1_assignment, elf2_assignment]) do
    MapSet.intersection(MapSet.new(elf1_assignment), MapSet.new(elf2_assignment)) |> MapSet.to_list()
  end

  def part1 do
    is_overlapping = fn [elf1_assignment, elf2_assignment] ->
      intersection_length = get_overlap([elf1_assignment, elf2_assignment]) |> length

      intersection_length == length(elf1_assignment) or intersection_length == length(elf2_assignment)
    end

    get_assignments() |> Enum.filter(is_overlapping) |> length
  end

  def part2 do
    get_assignments()
    |> Enum.map(&get_overlap/1)
    |> Enum.filter(fn x -> length(x) > 0 end)
    |> length
  end
end
