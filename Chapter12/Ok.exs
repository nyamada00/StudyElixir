defmodule Ok do
  def ok!(n) do
    case n do
      {:ok, data} -> data
      {e, emsg} -> raise "#{e},#{emsg}"
    end
  end
end
