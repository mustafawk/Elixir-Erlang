list = ["Mustafa", "Saad", "Ali", "Ahmed"]

new = Enum.map(list, fn n ->
  "Hello " <> n<>"!"
end)

Enum.each(new, fn n ->
  IO.puts(n)
end)
