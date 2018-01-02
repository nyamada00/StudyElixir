defmodule MyList do
#ListsAndRecursion-6
    def flatten([]) do
        []
    end

    def flatten([head|tail]) when is_list(head) do
        flatten(head++flatten(tail))
    end
    def flatten([head|tail]) do
        [head]++flatten(tail)
    end
#ListAndRecursion-4
    def span(from,to) when from===to do
        [from]
    end
    def span(from,to) when from<to do
        [from|span(from+1,to)]
    end
#ListAndRecursion-7
    def prime_list(n) do
        for x <- span(2,n),is_prime(x),do: x
    end    
    def is_prime(x) do
        !Enum.any?(for y<-span(2,x),y*y<=x,do: rem(x,y)===0)
    end
end