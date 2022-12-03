defmodule Mix.Tasks.Day1 do
  use Mix.Task

  def run(args) do
    part = List.first(args) || 'nil'

    cond do
      part == "part1" ->
        IO.puts "Day 1, Part 1:"
        IO.puts AdventOfCode2022.Day1.part1()
      part == "part2" ->
        IO.puts "Day 1, Part 2:"
        IO.puts AdventOfCode2022.Day1.part2()
      true ->
        IO.puts "provide 'part1' or 'part1' as an arg, got #{part}"
    end
  end
end
