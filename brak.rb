def check_braces(expressions)
    # Write your code here
    # To print results to the standard output you can use puts
    # Example puts "Hello world!"
    expressions.each do |exp|
        matched?(exp) ? value = 1 : value = 0
        puts value
    end
end

def matched?(expression)
   has_opening = false
   expression.each_char do |char|
      return false if !char_matched?(char, expression)
      has_opening = true if opening?(char)
   end

  has_opening
end

def char_matched?(char, expression)
   opening?(char) ? match_opening(char, expression) : match_closing(char, expression)
end

def match_opening(char, expression)
  char == '[' ? match_opening_square(char, expression) : match_opening_not_square(char, expression)
end

def match_opening_not_square(char, expression)
    first = expression.index(char)
    new_expression = expression[first..-1]
    target = bracket_map[char]
    repeat = new_expression.index(char)
    second = new_expression.index(target)
    (second && repeat) ? (second < repeat) : second
end

def match_opening_square(char, expression)
  first = expression.index(char)
  expression[first + 1] == ']'
end

def match_closing(char, expression)
  char == ']' ? match_closing_square(char, expression) : match_closing_not_square(char, expression)
end

def match_closing_square(char, expression)
  first = expression.index(char)
  return false if first == 0
  expression[first - 1] == '['
end


def match_closing_not_square(char, expression)
    first = expression.index(char)
    new_expression = expression[0..first]
    target = closings_map[char]
    second = new_expression.index(target)
    repeat = new_expression.index(char)
    second = new_expression.index(target)
    (second && repeat) ? (second > repeat) : second
end


def bracket_map
   matches = {
       '{' => '}',
       '(' => ')',
       '[' => ']'
   }
end

def closings_map
  bracket_map.invert
end

def opening?(char)
   bracket_map.has_key?(char)
end

def find_match(char)
   bracket_map[char]
end

def square_bracket?(char)
   char == '[' || char == ']'
end

def square_bracket?(char)
   char == '[' || char == ']'
end
