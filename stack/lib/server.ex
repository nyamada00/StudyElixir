defmodule Sequence.Server do
    use GenServer

    def handle_call({:init,init_list} _,_) do
        {:reply, init_list, init_list}
    end
end
