#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'rack/mount/regexp/tokenizer'

module Rack
  module Mount
    class RegexpParser < Racc::Parser


class Node < Struct.new(:left, :right)
  def flatten
    if left.is_a?(Node)
      left.flatten + [right]
    else
      [left, right]
    end
  end
end

class Expression < Array
  def initialize(ary)
    if ary.is_a?(Node)
      super(ary.flatten)
    else
      super([ary])
    end
  end
end

class Group < Struct.new(:value)
  attr_accessor :quantifier, :capture, :name

  def initialize(*args)
    @capture = true
    super
  end

  def capture?
    capture
  end

  def ==(other)
    self.value == other.value &&
      self.quantifier == other.quantifier &&
      self.capture == other.capture &&
      self.name == other.name
  end
end

class CharacterRange < Struct.new(:value)
  attr_accessor :negate, :quantifier

  def ==(other)
    self.value == other.value &&
      self.negate == other.negate &&
      self.quantifier == other.quantifier
  end
end

class Character < Struct.new(:value)
  attr_accessor :quantifier

  def ==(other)
    self.value == other.value &&
      self.quantifier == other.quantifier
  end
end
##### State transition tables begin ###

racc_action_table = [
     5,    15,    16,     6,     7,     5,    18,     5,     6,     7,
     6,     7,    13,    16,     5,    11,    12,     6,     7,    13,
    19,     5,    11,    12,     6,     7,    27,    21,    22,    22,
    25,    26,    24,     8,    30,    31 ]

racc_action_check = [
     7,     5,     5,     7,     7,    25,     7,     2,    25,    25,
     2,     2,     3,    15,    26,     3,     3,    26,    26,     9,
     8,     0,     9,     9,     0,     0,    23,    14,    23,    14,
    18,    18,    17,     1,    28,    29 ]

racc_action_pointer = [
    19,    33,     5,     4,   nil,    -3,   nil,    -2,    20,    11,
   nil,   nil,   nil,   nil,    24,     8,   nil,    25,    21,   nil,
   nil,   nil,   nil,    23,   nil,     3,    12,   nil,    27,    28,
   nil,   nil ]

racc_action_default = [
   -18,   -18,    -1,    -5,    -6,   -18,    -9,   -18,   -18,    -3,
    -4,   -15,   -16,   -17,   -18,   -18,   -11,   -18,   -18,    32,
    -2,    -7,   -10,   -18,   -12,   -18,   -18,    -8,   -18,   -18,
   -13,   -14 ]

racc_goto_table = [
     1,    14,    10,     9,   nil,   nil,   nil,    17,    20,   nil,
   nil,    23,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    28,    29 ]

racc_goto_check = [
     1,     6,     4,     3,   nil,   nil,   nil,     1,     4,   nil,
   nil,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     1,     1 ]

racc_goto_pointer = [
   nil,     0,   nil,     1,    -1,   nil,    -4 ]

racc_goto_default = [
   nil,   nil,     2,     3,   nil,     4,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 14, :_reduce_1,
  3, 15, :_reduce_2,
  2, 15, :_reduce_3,
  2, 15, :_reduce_4,
  1, 15, :_reduce_none,
  1, 16, :_reduce_none,
  3, 16, :_reduce_7,
  4, 16, :_reduce_8,
  1, 16, :_reduce_9,
  2, 19, :_reduce_10,
  1, 19, :_reduce_none,
  3, 18, :_reduce_12,
  5, 18, :_reduce_13,
  5, 18, :_reduce_14,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none ]

racc_reduce_n = 18

racc_shift_n = 32

racc_token_table = {
  false => 0,
  :error => 1,
  :LBRACK => 2,
  :RBRACK => 3,
  :L_ANCHOR => 4,
  :CHAR => 5,
  :LPAREN => 6,
  :RPAREN => 7,
  :QMARK => 8,
  :COLON => 9,
  :NAME => 10,
  :STAR => 11,
  :PLUS => 12 }

racc_nt_base = 13

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "LBRACK",
  "RBRACK",
  "L_ANCHOR",
  "CHAR",
  "LPAREN",
  "RPAREN",
  "QMARK",
  "COLON",
  "NAME",
  "STAR",
  "PLUS",
  "$start",
  "expression",
  "branch",
  "atom",
  "quantifier",
  "group",
  "bracket_expression" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = Expression.new(val[0]) 
    result
end

def _reduce_2(val, _values, result)
            val[1].quantifier = val[2]
            result = Node.new(val[0], val[1])
          
    result
end

def _reduce_3(val, _values, result)
 result = Node.new(val[0], val[1]) 
    result
end

def _reduce_4(val, _values, result)
            val[0].quantifier = val[1]
            result = val[0]
          
    result
end

# reduce 5 omitted

# reduce 6 omitted

def _reduce_7(val, _values, result)
 result = CharacterRange.new(val[1]) 
    result
end

def _reduce_8(val, _values, result)
 result = CharacterRange.new(val[2]); result.negate = true 
    result
end

def _reduce_9(val, _values, result)
 result = Character.new(val[0]) 
    result
end

def _reduce_10(val, _values, result)
 result = val.join 
    result
end

# reduce 11 omitted

def _reduce_12(val, _values, result)
 result = Group.new(val[1]) 
    result
end

def _reduce_13(val, _values, result)
 result = Group.new(val[3]); result.capture = false 
    result
end

def _reduce_14(val, _values, result)
 result = Group.new(val[3]); result.name = val[2] 
    result
end

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

def _reduce_none(val, _values, result)
  val[0]
end

    end   # class RegexpParser
    end   # module Mount
  end   # module Rack
