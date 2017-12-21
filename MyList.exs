defmodule MyList do
    #ListAndRecursion-1
    def mapsum(l,f) do
        _mapsum(l,f,0)
    end
    defp _mapsum([],_,n) do
        n
    end
    defp _mapsum([head|tail],f,n) do
        _mapsum(tail,f,n+f.(head))
    end
    #ListAndRecursion-2
    def max(list) do
        _max(list,0)
    end
    defp _max([],m) do
        m
    end
    defp _max([head|tail],m) when head<m do
        _max(tail,m)
    end
    defp _max([head|tail],m) when head>=m do
        _max(tail,head)
    end
    #ListAndRecursion-3
    def ceaser(list,n) do
        _ceaser(list,n,[])
    end
    defp _ceaser([],_,l) do
        l
    end
    defp _ceaser([head|tail],n,l) do
        #英小文字は26周期なのでmod26で考える
        a=_shift(head+rem(n,26))
        _ceaser(tail,n,l++[a])
    end
    #122は'z'のこと
    defp _shift(c) when c<=122 do
        c
    end
    defp _shift(c) when c>122 do
        _shift(c-26)
    end
    #ListAndRecursion-4
    def span(from,to) when from===to do
        [from]
    end
    def span(from,to) when from<to do
        [from|span(from+1,to)]
    end
end