defmodule AdventOfCode2022.Day2 do
  def get_result {opponent, ours} do
    cond do
      opponent == ours -> :draw
      opponent == :paper and ours == :rock -> :loss
      opponent == :rock and ours == :scissors -> :loss
      opponent == :scissors and ours == :paper -> :loss
      true -> :win
    end
  end

  def part1 do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day_2_input.txt")

    shapes = %{
      "A" => :rock,     "X" => :rock,
      "B" => :paper,    "Y" => :paper,
      "C" => :scissors, "Z" => :scissors,
    }
    shape_score = %{ :rock => 1, :paper => 2, :scissors => 3 }
    result_score = %{ :win => 6, :draw => 3, :loss => 0 }

    map_shapes = fn str ->
      [raw_opponent, raw_ours] = String.split str, " "

      opponent = shapes[raw_opponent]
      ours = shapes[raw_ours]

      {opponent, ours}
    end


    score_round = fn {opponent, ours} ->
      score_for_shape = shape_score[ours]
      result = get_result({opponent, ours})
      score_for_result = result_score[result]
      score_for_shape + score_for_result
    end

    score = File.stream!(file_path)
           |> Stream.map(&String.trim/1)
           |> Enum.to_list()
           |> Enum.map(map_shapes)
           |> Enum.map(score_round)
           |> Enum.sum

    IO.inspect score
  end

  def part2 do
  end
end
