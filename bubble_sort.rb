# frozen_string_literal: true

def create_array
  [4, 3, 78, 2, 0, 2]
end

def sort(array)
  array.each_with_index do |current_value, index|
    next_index = index + 1
    next_value = if next_index < array.length
                   array[next_index]
                 else
                   current_value
                 end
    if current_value > next_value
      array[index] = next_value
      array[index + 1] = current_value
    end
  end
end

def bubble_sort(array)
  new_array = Marshal.load(Marshal.dump(array))
  sort(array)

  while new_array != array
    new_array = Marshal.load(Marshal.dump(array))
    sort(array)
  end
  pp array
end

bubble_sort(create_array)
