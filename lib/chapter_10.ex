defmodule Chapter10 do

  @moduledoc """
   Processing collections
"""

   @doc """
     1. all, each, filter, split, take

     iex>Chapter10.all? [1, 4, 5, 10], &(rem(&1, 2) == 0)
     false

     iex>Chapter10.each [1, 4, 5, 10], &(&1)
     :ok

     iex>Chapter10.filter [1, 4, 5, 10], &(rem(&1, 2) == 0)
     [4, 10]

     iex>Chapter10.split [1, 4, 5, 10], 2
     {[1, 4], [5, 10]}

     iex>Chapter10.take [1, 4, 5, 10], 3
     [1, 4, 5]

   """

  def all?([], _), do: true
  def all?([head | tail], predicate) do
    if predicate.(head) do
      all?(tail, predicate)
    else
      false
    end
  end

  def each([], _), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def do_filter([], _, filtered_items), do: Enum.reverse(filtered_items)

  def do_filter([head | tail], predicate, filtered_items) do
    if predicate.(head) do
      do_filter(tail, predicate, [head | filtered_items])
    else
      do_filter(tail, predicate, filtered_items)
    end
  end

  def filter(items, predicate) do
    do_filter(items, predicate, [])
  end

  def do_split({head, tail}, 0), do: {Enum.reverse(tail), head}

  def do_split({[head | tail], left_over}, n) do
    do_split({tail, [head | left_over]}, n-1)
  end

  def split(items, n) do
    do_split({items, []}, n)
  end

  def do_take(_, 0, taken), do: Enum.reverse(taken)

  def do_take([], _, taken), do: Enum.reverse(taken)

  def do_take([head | tail], n, taken) do
    do_take(tail, n - 1, [head | taken])
  end

  def take(list, n) do
    do_take(list, n, [])
  end

    @doc """
      2. flatten

       iex>Chapter10.flatten [[[1]], [4, 5], [[10]]]
       [1, 4, 5, 10]


  """

  def do_flatten([], flattened), do: Enum.reverse(flattened)
  def do_flatten([ [ h | [] ] | tail], flattened) do
    do_flatten([ h | tail], flattened)
  end
  def do_flatten([ [ h | t ] | tail], flattened) do
    do_flatten([ h, t | tail], flattened)
  end
  def do_flatten([head | tail], flattened) do
    do_flatten(tail, [head | flattened])
  end
  def flatten(list) do
    do_flatten(list, [])
  end

  @doc """
    3. n primes

       iex>Chapter10.primes_to(20)
       [2, 3, 5, 7, 11, 13, 17, 19]
  """


  import Chapter7, only: [span: 2]


  def is_prime(x) do
    2..x
     |> Enum.filter(fn a -> rem(x, a) == 0 end)
     |> length
     |> (fn l -> l == 1 end).()
  end

  def primes_to(n) do
    for x <- span(2, n), is_prime(x), do: x
  end

  @doc """
    3. add totals with sales tax

       iex> orders = [
       ...>     [id: 123, ship_to: :NC, net_amount: 75.00],
       ...>     [id: 124, ship_to: :OK, net_amount: 100.00],
       ...>     [id: 125, ship_to: :TX, net_amount: 91.00],
       ...>     [id: 126, ship_to: :TX, net_amount: 90.00],
       ...>     [id: 124, ship_to: :OK, net_amount: 80.00],
       ...>     [id: 125, ship_to: :CA, net_amount: 55.00],
       ...>     [id: 126, ship_to: :MA, net_amount: 32.00]
       ...>    ]
       [[id: 123, ship_to: :NC, net_amount: 75.0],
        [id: 124, ship_to: :OK, net_amount: 100.0],
        [id: 125, ship_to: :TX, net_amount: 91.0],
        [id: 126, ship_to: :TX, net_amount: 90.0],
        [id: 124, ship_to: :OK, net_amount: 80.0],
        [id: 125, ship_to: :CA, net_amount: 55.0],
        [id: 126, ship_to: :MA, net_amount: 32.0]]
       iex> Chapter10.orders_with_total(orders)
       [[total_amount: 80.625, id: 123, ship_to: :NC, net_amount: 75.0],
        [total_amount: 100.0, id: 124, ship_to: :OK, net_amount: 100.0],
        [total_amount: 98.28, id: 125, ship_to: :TX, net_amount: 91.0],
        [total_amount: 97.2, id: 126, ship_to: :TX, net_amount: 90.0],
        [total_amount: 80.0, id: 124, ship_to: :OK, net_amount: 80.0],
        [total_amount: 55.0, id: 125, ship_to: :CA, net_amount: 55.0],
        [total_amount: 32.0, id: 126, ship_to: :MA, net_amount: 32.0]]

    """

  def orders_with_total(orders, tax_rates \\ [ NC: 0.075, TX: 0.08 ]) do
    orders |> Enum.map(&add_total_to(&1, tax_rates))
  end

  def add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax      = net*tax_rate
    total    = net+tax
    Keyword.put(order, :total_amount, total)
  end

end