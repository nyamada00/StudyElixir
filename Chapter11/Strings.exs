defmodule Strings do
#StringsAndBinaries-1
    def printable?(l) do
        Enum.all? l,&(&1 in ?\s..?~)
    end
#StringsAndBinaries-2
    def anagram?(w1,w2) do
        w1--w2===[] and w2--w1===[]
    end
#StringsAndBinaries-4
    def calc(s) do
        [d1,o,d2]=to_string(s)|>String.split
        [n1,n2]=[d1,d2]|>Enum.map(&String.to_integer/1)
        _calc(n1,o,n2)
    end
    defp _calc(n1,o,n2) when o==="+" do
        n1+n2
    end
    defp _calc(n1,o,n2) when o==="-" do
        n1-n2
    end
    defp _calc(n1,o,n2) when o==="*" do
        n1*n2
    end
    defp _calc(n1,o,n2) when o==="/" do
        n1/n2
    end
#StringsAndBinaries-5
    def pyramid(s) do
        max_len=s |> Enum.map(&String.length/1) |> Enum.max
        Enum.each s, fn str->
            IO.puts String.rjust str, div(max_len+String.length(str),2)
        end
    end
#StringsAndBinaries-6
 def capitalize_sentences(string) do
    string
    |> String.split(". ")
    |> Enum.map_join(". ", &String.capitalize(&1))
  end
end