defmodule CliDemo.CLI do
  def main(argv) do
    parse_args(argv)
    |> process
  end
  def parse_args(argv) do
    parse = OptionParser.parse(argv,
    switches: [help: :boolean],
    aliases: [h: :help])
    case parse do
      {[help: true], _, _ }
      -> :help
      {_,message,_}
      -> message
      _-> :help
    end
  end
  def process(:help) do
    IO.puts """
    usage: cli_demo <message>
    """
    System.halt(0)
  end
  def process(message) do
    IO.puts(message)
  end
end
