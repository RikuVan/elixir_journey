defmodule Chapter11 do

  @moduledoc """
   Strings and binaries
"""

  @doc """
  Printable ASCII, anagram checker, string calculator, and pretty printer
     ##Examples

     iex>Chapter11.printable_ascii('&-k')
     true

     iex>Chapter11.is_anagram('listen', 'silent')
     true

     ## why does ['cat' | 'dog'] produce ['cat', 100, 111, 103] in repl?
     ## because the first is an array, not simple a series of binaries
     ## so the repl does not convert it

     iex>Chapter11.calculate('13 + 3')
     16
     iex>Chapter11.calculate('40 / 2')
     20.0

     >Chapter11.print_c ["cat", "zebra", "elephant""]
       cat
      zebra
     elephant
     :ok

"""
  def printable_ascii(chars), do: Enum.all?(chars, fn ch -> ch in ?\s..?~ end)

  def is_anagram(seq1, seq2), do: Enum.sort(seq1) === Enum.sort(seq2)

  def extract_parts(chars) do
    is_space = fn v -> v in ' ' end
    is_operator = fn v -> v in '+/-*' end
    chars
     |> Enum.reject(is_space)
     |> Enum.chunk_by(is_operator)
  end

  def chars_to_int(chars) do
   chars |> to_string |> String.to_integer
  end

  def calculate(chars) do
    [num1, operator, num2] = extract_parts(chars)

    do_calculation =
      fn
        {n1, '+', n2} -> n1 + n2
        {n1, '-', n2} -> n1 - n2
        {n1, '/', n2} -> n1 / n2
        {n1, '*', n2} -> n1 * n2
      end

    do_calculation.({chars_to_int(num1), operator, chars_to_int(num2)})
  end

  def pad_word(word, max_length) do
    len = String.length(word)
    cond do
      len == max_length -> word
      len != max_length ->
        padding = div(max_length - len, 2)
        ~s[#{String.duplicate(" ", padding)}#{word}]
    end
  end

  def pretty_print(list) do
    max_length = list |> Enum.map(fn l -> String.length(l) end) |> Enum.max
    list
     |> Enum.map(fn w -> pad_word(w, max_length) end)
     |> Enum.map(fn w -> "\n#{w}" end)
     |> IO.puts
  end

    @doc """
    Capitalize sentences

       ##Examples

       >Chapter11.capitaiize_sentences("i am TIRED! gonna SLEEP.")
       "I am tired! Gonna Sleep."

  """

  def split_sentences(str) do
    Regex.split(~r{(\.\s|\!\s|\?\s)}, str, include_captures: true)
  end

  def capitalize_sentences(string) do
    string
     |> split_sentences
     |> Enum.map(&String.downcase/1)
     |> Enum.map(&String.capitalize/1)
     |> Enum.join("")
  end

   @doc """
    Read file (shipments) and create new file with sales tax using Chapter10.orders_with_total

    """

    @shipments "shipments.txt"

    def format_sales_data([id, <<?:, state::binary>>, amount])do
      [
        id: String.to_integer(id),
        ship_to: String.to_atom(state),
        net_amount: String.to_float(amount)
      ]
    end

    def add_sales_tax(file_path \\ @shipments) do
      ##TODO: write data to a file
      file_path
       |> File.stream!
       |> Stream.drop(1)
       |> Stream.map(fn line -> line |> String.trim |> String.split(",") end)
       |> Stream.filter(fn line -> length(line) === 3 end)
       |> Stream.map(& format_sales_data(&1))
       |> Enum.to_list
       |> Chapter10.orders_with_total
    end

end