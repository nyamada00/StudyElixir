defmodule Excercise do
    def send_message(parent) do
        send parent, "message from child"
        #exit :boom
        raise "Error"
    end

    def receive_message() do
        receive do
            msg ->
             IO.puts "MESSAGE RECEIVED #{inspect msg}"
        end
        receive_message()
    end

    def run do
        Process.flag(:trap_exit, true)
        #spawn_link(Excercise, :send_message, [self])
        spawn_monitor(Excercise, :send_message, [self])
        :timer.sleep 500
        receive_message()
    end
end
Excercise.run
