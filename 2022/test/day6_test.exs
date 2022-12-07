defmodule AdventOfCode.Day6Test do
  use ExUnit.Case

  test "should return correct answers for part 1 sample values" do
    assert AdventOfCode2022.Day6.find_start_of_packet("bvwbjplbgvbhsrlpgdmjqwftvncz", 4) == 5
    assert AdventOfCode2022.Day6.find_start_of_packet("nppdvjthqldpwncqszvftbrmjlhg", 4) == 6
    assert AdventOfCode2022.Day6.find_start_of_packet("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 4) == 10
    assert AdventOfCode2022.Day6.find_start_of_packet("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 4) == 11
  end

  test "should return correct answers for part 2 sample values" do
    assert AdventOfCode2022.Day6.find_start_of_packet("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14) == 19
    assert AdventOfCode2022.Day6.find_start_of_packet("bvwbjplbgvbhsrlpgdmjqwftvncz", 14) == 23
    assert AdventOfCode2022.Day6.find_start_of_packet("nppdvjthqldpwncqszvftbrmjlhg", 14) == 23
    assert AdventOfCode2022.Day6.find_start_of_packet("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14) == 29
    assert AdventOfCode2022.Day6.find_start_of_packet("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14) == 26
  end

  test "should return the correct answer for part 1" do
    assert AdventOfCode2022.Day6.part1() == 1625
  end

  test "should return the correct answer for part 2" do
    assert AdventOfCode2022.Day6.part2() == 2250
  end
end
