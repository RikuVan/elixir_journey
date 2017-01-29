defmodule Chapter12 do

  @moduledoc """
   Control flow
"""

  @doc """
  1. Fizzbuzz with case maybe a little more concise than pattern matching functions

  2. Exception raising ok
 """

  def do_fizzbuzz(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Fizz"
      {_, 0, _} -> "Buzz"
      {_, _, n} -> n
    end
  end

  def fizzbuzz(n) do
    1..n |> Enum.map(&(do_fizzbuzz/1))
  end

  def ok(str) do
    if (String.valid?(str) && String.length(str) > 0) do
      {:ok, str}
    else
      raise "#{str} is not a valid string with length"
    end
  end
end
