defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  test "should return the correct answer for part 1" do
    assert AdventOfCode2022.Day1.part1() == 70116
  end

  test "should return the correct answer for part 2" do
    assert AdventOfCode2022.Day1.part2() == 206_582
  end
end
