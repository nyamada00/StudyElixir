defmodule Ticker do
  @interval 2000
  @name :ticker
  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients) do
    receive do
      {:register, pid} ->
        idx = length(clients)
        IO.puts("registering #{inspect(idx)}, #{inspect(pid)}")
        generator([pid | clients], idx)
    end
  end

  def generator(clients, index) do
    receive do
      {:register, pid} ->
        idx = length(clients)
        IO.puts("registering #{inspect(idx)}, #{inspect(pid)}")
        generator([pid | clients], idx)
    after
      @interval ->
        IO.puts("tick")
        index = rem(index + 1, length(clients))
        client = Enum.at(clients, index)
        IO.puts("send to #{inspect(index)},#{inspect(client)}")
        send(client, {:tick})
        generator(clients)
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts("tock in client")
        receiver
    end
  end
end
