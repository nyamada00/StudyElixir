#ListAndRecursion-8
defmodule Tax do
    def plus_total_amount(orders,tax_rates) do
        for order <- orders,do: Keyword.put order, :total_amount , calc_total_amount(order[:net_amount], order[:ship_to],tax_rates)
    end
    def calc_total_amount(net_amount,ship_to,tax_rates) do
        tax_rate=Keyword.get tax_rates,ship_to,0
        IO.puts "ship_to:#{ship_to},rate:#{tax_rate}"
        net_amount*(1+tax_rate)
    end
    def tax_rates do
        [NC: 0.075,TX: 0.08]
    end
    def orders do
        [
            [id: 123, ship_to: :NC, net_amount: 100.00],
            [id: 124, ship_to: :OK, net_amount: 35.50],
            [id: 125, ship_to: :TX, net_amount: 24]
        ]
    end
end