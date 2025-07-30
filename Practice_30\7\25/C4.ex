defmodule Count do
  def cc(list) do
    c = Enum.count(list)
    IO.puts("Total Number of Elements in List: #{c}")
  end
end

ll = [1,1,2,3,4,2,5,6]
Count.cc(ll)
