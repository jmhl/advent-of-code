defmodule Mix.Tasks.Day1 do
  use Mix.Task

  def run(_) do
    calories = AdventOfCode2022.Day1.get_calories()

    largest = calories |> Enum.max
    IO.puts "largest: #{largest}"

    largest_3_sum = calories
                    |> Enum.sort(&(&1 >= &2))
                    |> Enum.take(3)
                    |> Enum.sum
    IO.puts "sum of 3 largest: #{largest_3_sum}"
  end
end
