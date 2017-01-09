defmodule Chapter6 do

  @moduledoc """
   Modules and Named Functions
   Create and run the functions that do the following
  """

  defmodule Times do
    @doc """
      basic functions in a module

      ## Examples

          iex> alias Chapter6.Times
          iex> Times.double(2)
          4
          iex> Times.triple(2)
          6
          iex> Times.quadruple(2)
          16

      """
    def double(n) do
      n * 2
    end

    def triple(n) do
      n * 3
    end

    def quadruple(n) do
      double(n) * double(n)
    end
  end

  defmodule Math do
  @doc """
    1. recursion with pattern matching
    2. divide and conquer number using guard clauses

      ## Examples

        iex> alias Chapter6.Math
        iex> Math.sum(4)
        10
        iex> Math.gcd(5, 15)
        5
        iex> Math.guess(273)
        "Is it 500?"
        "Is it 250?"
        "Is it 374?"
        "Is it 312?"
        "Is it 281?"
        "Is it 266?"
        "Is it 273?"
        "273, You are correct!"
        :ok

    """
    def sum(0), do: 0
    def sum(n), do: n + sum(n - 1)

    def gcd(x, 0), do: x
    def gcd(x, y), do: gcd(y, rem(x, y))

    def print_guess(guess), do: IO.puts("Is it #{guess}?")

    def do_guess(guess, guess, _) do
      print_guess(guess)
      IO.puts("#{guess}, You are correct!")
    end

    def do_guess(actual, guess, low.._high) when actual < guess do
      print_guess(guess)
      do_guess(actual, div(guess + low, 2), low..guess-1)
    end

    def do_guess(actual, guess, _low..high) when actual > guess do
      print_guess(guess)
      do_guess(actual, div(high + guess, 2), guess+1..high)
    end

    def guess(actual, low..high = range \\ 1..1000) do
      do_guess(actual, div(low + high, 2), range)
    end
  end
end