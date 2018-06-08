# ModulesAndFunctions-6
defmodule Chop do
  def guess(actual, _..max) when actual === max do
    max
  end

  def guess(actual, min..max) when actual in min..max and actual > div(min + max, 2) do
    IO.puts("Is it #{div(min + max, 2)}")
    guess(actual, div(min + max, 2)..max)
  end

  def guess(actual, min..max) when actual in min..max and actual <= div(min + max, 2) do
    IO.puts("Is it #{div(min + max, 2)}")
    guess(actual, min..div(min + max, 2))
  end
end
