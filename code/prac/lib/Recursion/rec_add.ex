defmodule RecAdd do
  def upto(0) do
    0
  end
  def upto(n) do
    upto(n-1)
    IO.puts(n)
  end
end
