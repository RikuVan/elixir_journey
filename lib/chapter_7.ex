defmodule Chapter7 do

  @moduledoc """
   Recursion
"""

   @doc """
     1. with accummulator

    ## Examples

      iex>Chapter7.sum [10, 7, 4]
      21

   """

  def do_sum([], total), do: total
  def do_sum([head | tail], total), do: do_sum(tail, total + head)

  def sum list do
    do_sum(list, 0)
  end

  @doc """
    1. mapsum

      ## Examples

        iex>Chapter7.mapsum [1, 2, 3], &(&1 * &1)
        14

  """
   def do_mapsum([], _func, total), do: total

   def do_mapsum([head | tail], func, total) do
     do_mapsum(tail, func, total + func.(head))
   end

   def mapsum(list, func) do
     do_mapsum(list, func, 0)
   end

   @doc """
     2. max

       ## Examples

         iex>Chapter7.max [10, 4, 11, 8]
         11

  """
    ## first try

    def do_max([], max), do: max

    def do_max([head | tail], max) do
      cond do
        (head > max) -> do_max(tail, head)
        (head <= max) -> do_max(tail, max)
      end
    end

    def max([head | tail]) do
      do_max(tail, head)
    end

    ## second better version

    def better_max([x]), do: x

    def better_max([head | tail]) do
      Kernel.max(head, better_max(tail))
    end

 @doc """
     3. caesar

       ## Examples

         iex>Chapter7.caesar 'ryvkve', 13
         'elixir'

  """

  ##first attempt I cheated and didn't use recursion

  def alt_caesar(chars, n) do
    for char <- chars do
      if char + n <= ?z do
       char + n
      else
        char + n - 26
      end
    end
  end

  def caesar([], _n), do: []

  ## note could have used ?z here instead of 122

  def caesar([ head | tail ], n)
    when head+n <= 122 do
    [ head + n | caesar(tail, n) ]
  end

  def caesar([ head | tail ], n \\ 0) do
    [ head + n - 26 | caesar(tail, n) ]
  end

   @doc """
     3. caesar

       ## Examples

         iex>Chapter7.span(3, 6)
         [3, 4, 5, 6]

  """
  def do_span(from, to, list) when from === to, do: Enum.reverse(list)

  def do_span(from, to, list) do
    span(from + 1, to, list)
  end

  def span(from, to, list \\ []) do
    do_span(from, to, [from | list])
  end

end