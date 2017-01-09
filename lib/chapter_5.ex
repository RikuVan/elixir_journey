defmodule Chapter5 do

  @moduledoc """
   Anonymous functions
   Create and run the functions that do the following
  """

  @doc """
    concats two lists

  ## Examples

      ie> concat_list = fn list_a, list_b -> list_a ++ list_b end
      ie> concat_list.([:a, :b], [:c, :d])
      [:a, :b, :c, :d]

  """

  @doc """
    sums three numbers

  ## Examples

      ie> sum = fn x, y, z -> x + y + z end
      ie> sum.(1,2,3)
      6
  """

  @doc """
    sums three numbers

  ## Examples

      iex> pair_tuple_to_list = fn {a, b} -> [a, b] end
      iex> pair_tuple_to_list.({1234, 5678})
      [1234, 5678]
  """

  @doc """
     return string Fizzbuzz, Fizz, Buzz, or item based on the pattern

  ## Examples

      iex> Chapter5.do_fizzbuzz({0, 0, 3})
      FizzBuzz
      :ok


      iex> Chapter5.do_fizzbuzz({2, 0, 3})
      Buzz
      :ok


      iex> Chapter5.do_fizzbuzz({2, 1, 3})
      3
      :ok

  """

  def do_fizzbuzz nums do
    do_fb = fn
      {0, 0, _} -> IO.puts('FizzBuzz')
      {0, _, _} -> IO.puts('Fizz')
      {_, 0, _} -> IO.puts('Buzz')
      {_, _, c} -> IO.puts(c)
    end
    do_fb.(nums)
  end

  @doc """
    fizzbuzz

  ## Examples

      iex> Chapter5.fizzbuzz(3)
      Fizz
      :ok

      iex> Chapter5.fizzbuzz(5)
      Buzz
      :ok

      iex> Chapter5.fizzbuzz(2)
      2
      :ok
  """

  def fizzbuzz num do
    do_fizzbuzz({rem(num, 3), rem(num, 5), num})
  end

  @doc """
    run fizzbuzz from start param to end param

  ## Examples

      iex> Chapter5.run_fizzbuzz(10, 16)
      Buzz
      11
      Fizz
      13
      14
      FizzBuzz
      16
      [:ok, :ok, :ok, :ok, :ok, :ok, :ok]

  """

  def run_fizzbuzz(start, fin) do
    for num <- start..fin do
      fizzbuzz(num)
    end
  end

  @doc ~S"""
    prefix function which is partially applied, returning a prefixed string

  ## Examples

       iex> prefix = fn fix -> (fn name -> "#{fix} #{name}" end) end
       #Function<6.52032458/1 in :erl_eval.expr/5>
       iex> make_mr = prefix.("Mr.")
       #Function<6.52032458/1 in :erl_eval.expr/5>
       iex> make_mr.("Rogers")
       "Mr. Rogers"

    """

  @doc ~S"""
      rewrite with & syntax
      Enum.map [1, 2, 3, 4], fn x -> x + 2 end
      Enum.each [1, 2, 3, 4], fn x -> IO.inspect x end

    ## Examples

     iex> Enum.map [1, 2, 3, 4], &(&1 + 1)
     [2, 3, 4, 5]
     iex> Enum.each [1, 2, 3, 4], &IO.inspect/1
     1
     2
     3
     4
     :ok
  """

end