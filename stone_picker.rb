def generate_array(n, min, max) 
  array = Array.new(n.to_i)
  min = min.to_i
  max = max.to_i
  random_stock = Random.new

  array.each do |day|
    array[array.index(day)] = random_stock.rand(min..max)
  end
end

def stock_picker(array)
  best_buy = 0
  best_sell = 0
  max_profit = 0
  best_day_buy = 0
  best_day_sell = 0

  loop do 
    buy = array.min
    day_buy = array.index(buy)

    sell_array = array.slice(day_buy, array[-1]) # Only the days of when to sell remain in the array
    array.delete(buy)
    
    sell = sell_array.max
    day_sell = array.index(sell)
    profit = sell - buy 
    
    if max_profit < profit
      max_profit = profit
      best_buy = buy
      best_day_buy = day_buy
      best_sell = sell
      best_day_sell = day_sell
    end

    break if(array.empty?)
  end

  puts "Best day to buy is day #{best_day_buy + 1} with the value of #{best_buy}€\nBest day to sell is day #{best_day_sell + 1} with the value of #{best_sell}€\nThe profit is #{max_profit}€"
end

loop do
  puts "Choose how many days you want to have for the stock picking that will be generated\nIt will show you the best day to buy, to sell and the profit\nThe lowest value you can put is 10 and the highest value is 1000"
  days = gets.chomp

  until days.match?(/\A\d+\z/) && (days.to_i).between?(10, 1000) do
    puts "To choose a number of days, insert numbers only between 10 and 1000"
    days = gets.chomp
  end

  puts "Choose the minimum value that a stock can have\nThe lowest value you can put is 1 and the highest value is 100"
  min = gets.chomp

  until min.match?(/\A\d+\z/) && (min.to_i).between?(1, 100) do
    puts "Insert numbers only between 1 and 100"
    min = gets.chomp
  end

  puts "Choose the maximum value that a stock can have\nThe lowest value you can put is #{min.to_i + 20} and the highest value is 1000"
  max = gets.chomp

  until max.match?(/\A\d+\z/) && (max.to_i).between?(min.to_i + 20, 1000) do
    puts "Insert numbers only between #{min.to_i + 20} and 1000"
    max = gets.chomp
  end

  stock = generate_array(days, min, max)
  print "This show the value of the stock each day:\n#{stock}\n"

  stock_picker(stock)

  puts "Do you want to continue using the programme?\nPress any key other than 'n' or enter to continue\n'n' to close"
  again = gets.chomp.downcase

  if again === "n"
    break
  end  
end