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

    def start_link(init_list) do
        GenServer.start_link(__MODULE__, init_list, name: __MODULE__)
    end
    def pop do
        GenServer.call __MODULE__, :pop
    end
    def push(list) do
        GenServer.cast __MODULE__,{:push,list}
    end

    def terminate(reason, state) do
        IO.puts "reason:#{reason}, state:#{state}"
    end
end
