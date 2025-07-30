ll = [0]

case ll do
  [0| _] -> IO.puts "zero_head"
  [_] -> IO.puts "single"
  _ -> IO.puts "Other"
end
