defmodule AdventOfCode2022.Day2 do
  @shapes %{
    "A" => :rock,     "X" => :rock,
    "B" => :paper,    "Y" => :paper,
    "C" => :scissors, "Z" => :scissors,
  }
  @shape_score %{ :rock => 1, :paper => 2, :scissors => 3 }
  @result_score %{ :win => 6, :draw => 3, :loss => 0 }
  @strategy_outcomes %{ "X" => :loss, "Y" => :draw, "Z" => :win }

  def get_result {opponent, ours} do
    cond do
      opponent == ours -> :draw
      opponent == :paper and ours == :rock -> :loss
      opponent == :rock and ours == :scissors -> :loss
      opponent == :scissors and ours == :paper -> :loss
      true -> :win
    end
  end

  def get_rps do
    file_path = Application.app_dir(:advent_of_code_2022, "priv/day_2_input.txt")

    File.stream!(file_path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def score_round {opponent, ours} do
    score_for_shape = @shape_score[ours]
    result = get_result({opponent, ours})
    score_for_result = @result_score[result]
    score_for_shape + score_for_result
  end

  def part1 do
    map_shapes = fn str ->
      [raw_opponent, raw_ours] = String.split(str, " ")

      opponent = @shapes[raw_opponent]
      ours = @shapes[raw_ours]

      {opponent, ours}
    end

    get_rps()
    |> Enum.map(map_shapes)
    |> Enum.map(&score_round/1)
    |> Enum.sum
  end

  def part2 do
    map_shapes = fn str ->
      [raw_opponent, raw_required_result] = String.split(str, " ")
      opponent = @shapes[raw_opponent]
      required_result = @strategy_outcomes[raw_required_result]

      choices = [:rock, :paper, :scissors]
      choice_idx = Enum.find_index(choices, fn choice ->
        get_result({opponent, choice}) == required_result
      end)
      ours = Enum.at(choices, choice_idx)

      {opponent,ours}
    end

    get_rps()
    |> Enum.map(map_shapes)
    |> Enum.map(&score_round/1)
    |> Enum.sum
  end
end
