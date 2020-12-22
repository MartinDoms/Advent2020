data = File.readlines("#{File.dirname(__FILE__)}/input01.txt").map(&:to_i).sort

Result = Struct.new(:success, :figures)

def find_figures_that_sum_to(collection, target, start_index, accum, num_of_figures)

  # recursive case
  if num_of_figures > 1
    for i in start_index..collection.length-num_of_figures
      new_accum = accum + [collection[i]]
      result = find_figures_that_sum_to(collection, target, i, new_accum, num_of_figures - 1)

      if result.success
        return result
      end
    end
  end


  # base case - find the last figure
  if num_of_figures == 1
    for i in start_index..collection.length-1
      sum = accum.sum + collection[i]

      if sum > target
        r = Result.new
        r.success = false
        r
      end

      next if sum != target


      r = Result.new
      r.success = true
      r.figures = accum + [collection[i]]

      return r

    end

  end
  r = Result.new
  r.success = false
  r

end

result = find_figures_that_sum_to(data, 2020, 0, [], 3)
puts "Found result #{result.figures}"
puts result.figures.inject(:*)
