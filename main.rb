require_relative 'lexer'

def enter_lexing_loop
  forever {
    print ">"
    str = gets
    lex = lex_str str
    print_tokens lex
  }
end

def forever
  #ٌRegister an interrupt with the Kernel to terminate the process when the user presses ctrl-c
  Kernel.trap("INT") {
    puts ; puts "Goodbye Lovely Person!"
    Kernel.exit
  }
  #Keep calling the passed block of code
  while true
    yield
  end
end

def print_tokens toks
  puts "-------------"
  toks.each { |tok|
    print "lexeme<#{tok[1]}>"
    print "-"
    puts  "type<#{tok[0]}>"
    print "---"
    puts
  }
  puts "-------------"
end

if ARGV.empty?
  enter_lexing_loop
else
  ARGV.each { |str|
    lex = lex_str str
    print_tokens lex
  }
end
