defmodule Functions do
    #ModulesAndFunctions-4
    def sum(0) do
        0
    end
    def sum(n) when n>=1 do
        n+sum(n-1)
    end
    #ModulesAndFunctions-5
    def gcd(x,y) when y===0 do
        x
    end
    def gcd(x,y) do
        gcd(y,rem(x,y))
    end
end