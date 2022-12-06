defmodule Mix.Tasks.Solution do
  use Mix.Task

  def run([day_num, part_num]) do
    module_name = Module.concat(AdventOfCode2022, "Day#{day_num}")
    method_name = String.to_atom("part#{part_num}")

    result = apply(module_name, method_name, [])

    # IO.puts("Result for day #{day_num}, part #{part_num}:\n\n#{result}")
  end
end
