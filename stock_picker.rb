# frozen_string_literal: true

def stock_days
  [17, 3, 6, 9, 15, 8, 6, 1, 10]
end

def filter_days(stock_days)
  higher = 0
  lower = 0
  filtered_days = {}

  stock_days.each_with_index do |price, day|
    if (higher.zero? || higher < price) && day != 0
      higher = price
      filtered_days[higher] = day
    end
    if (lower.zero? || lower > price) && day != stock_days[-1]
      lower = price
      filtered_days[lower] = day
    end
  end
  filtered_days
end

def best_days_to_buy(filtered_days)
  higher_day = 0
  lower_day = 0
  price_before = 0
  final_higher_day = 0
  final_lower_day = 0

  filtered_days.each do |price, day|
    if price > price_before && day != 0
      higher_day = price
    elsif price < price_before || price_before.zero?
      lower_day = price
    end

    price_before = price

    if !filtered_days[higher_day].nil? && filtered_days[higher_day] > filtered_days[lower_day]
      final_higher_day = higher_day
      final_lower_day = lower_day
    end
  end
  best_days_array = []
  best_days_array.push(filtered_days[final_lower_day], filtered_days[final_higher_day])
end

def stock_picker(stock_days)
  days_filtered = filter_days(stock_days)
  best_days = best_days_to_buy(days_filtered)
  pp best_days
end

stock_picker(stock_days)
