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

        > alias Chapter6.Math
        > Math.sum(4)
        10
        > Math.gcd(5, 15)
        5
        > Math.guess(273)
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

  defmodule ModulesAndFunctions do
  @doc """
    3. Find the approprate Erlang or Elixir lib for the task

      ## Examples

        iex> :io_lib.format("~.2f~n", [3.23432423])
        iex> ['3.23', '\n']
        iex> System.get_env("LOGNAME")
        iex> "richard.vancamp"
        iex> Path.extname("chapter_2.ex")
        iex> ".ex"
        iex> System.cwd
        iex> "/Users/richard.vancamp/WebstormProjects/elixir_journey"

    """
  end
end