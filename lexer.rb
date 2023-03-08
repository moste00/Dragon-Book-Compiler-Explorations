require_relative 'rules'

def consume_token(str,rules)
  token = nil

  str.each_char.with_index { |_,i|
    substr = str[0..i]

    no_rule_matched = true

    rules.reverse.each { |name,pattern|
        if pattern.match? substr
          no_rule_matched = false
          token = [name,substr]
        end
    }
    break if no_rule_matched
  }

  return [nil,nil] if token.nil?

  substr_len = token[1].length
  rest_of_str = str[substr_len..]
  [rest_of_str,token]
end

def lex_str(str)
  rules = Grammar::Rules.map { |name,pattern|
    [name,Regexp.new("\\A#{pattern.source}\\z")]
  }

  tokens = []
  until str.empty?
    rest_of_str,tok = consume_token(str,rules)

    unless rest_of_str.nil?
      tokens.append tok
      str = rest_of_str
    else
      tokens.append [:UNKNOWN_TOKEN,str[0]]
      str = str[1..]
    end
  end

  tokens
end
