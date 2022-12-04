defmodule AdventOfCode2022.Day1 do
  def get_calories do
    chunk = fn calorie_amt, acc ->
      clean_calorie_amt = String.trim(calorie_amt)

      if clean_calorie_amt == "" do
        {:cont, acc, []}
      else
        {calorie_amt_int, ""} = Integer.parse(clean_calorie_amt)
        {:cont, [calorie_amt_int | acc]}
      end
    end

    after_chunk = fn
      [] -> {:cont, []}
      acc -> {:cont, acc, []}
    end

    file_path = Application.app_dir(:advent_of_code_2022, "priv/day1_input.txt")

    File.stream!(file_path)
    |> Stream.chunk_while([], chunk, after_chunk)
    |> Enum.to_list()
    |> Enum.map(&Enum.sum(&1))
  end

  def part1 do
    AdventOfCode2022.Day1.get_calories() |> Enum.max
  end

  def part2 do
    AdventOfCode2022.Day1.get_calories()
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum
  end
end
