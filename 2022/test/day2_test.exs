defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  test "should return the correct answer for part 1" do
    assert AdventOfCode2022.Day2.part1() == 13005
  end

  test "should return the correct answer for part 2" do
    assert AdventOfCode2022.Day2.part2() == 11373
  end
end
