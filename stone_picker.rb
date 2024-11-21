stock = [17, 3, 6, 9, 15, 8, 6, 1, 10]

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
  puts "Choose how many days you want to have for the stock picking that will be generated\nIt will show you the best day to buy, to sell and the profit"
  days = gets.chomp

  until days.match?(/\A\d+\z/) do
    puts "To choose a number of days, insert numbers only"
    days = gets.chomp
  end

  stock_picker(stock)

  puts "Do you want to continue using the programme?\nPress any key other than 'n' or enter to continue\n'n' to close"
  again = gets.chomp.downcase

  if again === "n"
    break
  end  
end