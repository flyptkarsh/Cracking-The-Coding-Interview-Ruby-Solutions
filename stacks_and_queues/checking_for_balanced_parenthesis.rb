def balanced?(s)
  return false if s.length.odd?
  return false if s =~ /[^\[\]\(\)\{\}]/
  pairs = {'{'=>'}', '['=>']', '('=>')'}
  s.chars do |bracket|
    expectation = pairs[bracket]
    if expectation
      # if you encounter an opening bracket you will need to expect a closing bracket
      stack << expectation
    else
      return false unless stack.pop == bracket
    end
  end
  stack.empty?
end
