module Brackets
  extend self

  LEFTS  = ['(', '[', '{']
  RIGHTS = [')', ']', '}']

  PAIRS = Hash[LEFTS.zip(RIGHTS)]

  def balanced?(str, stack = [])
    return stack.empty? if str.empty?

    consume_char(str[0], stack)

    balanced?(str[1..-1], stack)
  rescue BracketsMismatchError
    false
  end

  private

  def consume_char(char, stack)
    if left?(char)
      stack.push(char)
    elsif right?(char)
      pop_if_valid(char, stack)
    end
  end

  def left?(char)
    LEFTS.include?(char)
  end

  def right?(char)
    RIGHTS.include?(char)
  end

  def pop_if_valid(char, stack)
    if valid_right?(char, stack)
      stack.pop
    else
      raise BracketsMismatchError
    end
  end

  def valid_right?(char, stack)
    char == PAIRS[stack.last]
  end

  class BracketsMismatchError < RuntimeError; end
end
