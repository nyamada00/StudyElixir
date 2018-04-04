defmodule Stack.Server do
    use GenServer

    def handle_call({:init,init_list}, _,_) do
        {:reply, init_list, init_list}
    end
    def handle_call(:pop, _, [head|tail]) do
        {:reply, head, tail}
    end
    def handle_cast({:push, v}, list) do
        {:noreply, [v|list] }
    end
end
