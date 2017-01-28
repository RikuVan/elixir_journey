defmodule Chapter_2 do

  @moduledoc """
   Pattern matching
"""

  @doc """
  ##1. Which of the following will match?
      1. a = [1, 2, 3]
      2. a = 4
      3. 4 = a
      4. [a, b] = [ 1, 2, 3 ]
      5. a = [ [ 1, 2, 3 ] ]
      6. [a] = [ [ 1, 2, 3 ] ]
      7. [[a]] = [ [ 1, 2, 3 ] ]

      Answer: 1,2,3,5,6
  """

  @doc """
  ##2. Which of the following will match?
      1. [ a, b, a ] = [ 1, 2, 3 ]
      2. [ a, b, a ] = [ 1, 1, 2 ]
      3. [ a, b, a ] = [ 1, 2, 1 ]

      Answer: 3
  """


 @doc """
  ##2. Which of the following will match?
      1. [ a, b, a ] = [ 1, 2, 3 ]
      2. [ a, b, a ] = [ 1, 1, 2 ]
      3. a = 1
      4. ^a = 2
      5. ^a = 1
      6. ^a = 2 - a

      Answer: 3, 5, 6
  """

end