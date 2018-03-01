defmodule Token do
    def greet do
        receive do
            {sender, msg} ->
            send sender,{:ok,"Hello, #{msg}"}
        end
    end
end

pid1 = spawn(Token,:greet,[])
pid2 = spawn(Token,:greet,[])

send pid1,{self,"fred"}
send pid2,{self,"betty"}

receive do
    {:ok, message} ->
    IO.puts message
end

receive do
    {:ok, message} ->
    IO.puts message
end



