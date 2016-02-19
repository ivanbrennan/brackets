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
    if left_bracket?(char)
      consume_left_bracket(char, stack)
    elsif right_bracket?(char)
      consume_right_bracket(char, stack)
    end
  end

  def consume_left_bracket(char, stack)
    stack.push(char)
  end

  def consume_right_bracket(char, stack)
    if valid_right_bracket?(char, stack)
      stack.pop
    else
      raise BracketsMismatchError
    end
  end

  def left_bracket?(char)
    LEFTS.include?(char)
  end

  def right_bracket?(char)
    RIGHTS.include?(char)
  end

  def valid_right_bracket?(char, stack)
    char == PAIRS[stack.last]
  end

  class BracketsMismatchError < RuntimeError; end
end
