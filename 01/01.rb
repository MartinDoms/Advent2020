data = File.readlines("#{File.dirname(__FILE__)}/input01.txt").map(&:to_i).sort

length = data.length
i = 0
a = -1
b = -1

while i < length -1
  j = i + 1
  while j < length

    a = data[i]
    b = data[j]

    puts "comparing #{a}, #{b}"

    if a + b > 2020
      j += 1
      next
    end

    if a + b == 2020
      break
    end

    j += 1

  end
  if a + b == 2020
    break
  end
  i += 1
end

puts a * b
