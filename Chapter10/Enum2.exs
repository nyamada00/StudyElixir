defmodule Enum2 do
  # ListsAndRecursion-5
  def all?([], _) do
    true
  end

  def all?([a], f) do
    f.(a)
  end

  def all?([head | tail], f) do
    all?([head], f) && all?(tail, f)
  end

  def each([], _) do
    :ok
  end

  def each([a], f) do
    f.(a)
  end

  def each([head | tail], f) do
    each([head], f)
    each(tail, f)
  end

  def filter([], _) do
    []
  end

  def filter([a], f) do
    if(f.(a)) do
      [a]
    else
      []
    end
  end

  def filter([head | tail], f) do
    filter([head], f) ++ filter(tail, f)
  end

  def split([], _) do
    {[], []}
  end

  def split(l, 0) do
    {[], l}
  end

  def split([head | tail], n) when n > 0 do
    {left, right} = split(tail, n - 1)
    {[head | left], right}
  end

  def split(l, n) when n < 0 do
    len = _length(l)
    c = n + len

    if(c < 0) do
      split(l, 0)
    else
      split(l, c)
    end
  end

  def _length([]) do
    0
  end

  def _length([_]) do
    1
  end

  def _length([_ | tail]) do
    1 + _length(tail)
  end

  def take([], _) do
    []
  end

  def take(_, 0) do
    []
  end

  def take([head | tail], n) when n > 0 do
    [head | take(tail, n - 1)]
  end

  def take(l, n) when n < 0 do
    len = _length(l)
    c = n + len

    if(c < 0) do
      l
    else
      skip(l, c)
    end
  end

  def skip([], _) do
    []
  end

  def skip(l, 0) do
    l
  end

  def skip([_ | tail], c) when c > 0 do
    skip(tail, c - 1)
  end
end
