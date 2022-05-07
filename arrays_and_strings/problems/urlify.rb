# frozen_string_literal: true

# 1.3 Urlify
# replace all spaces in a string with %20

def urlify(string)
  string.strip.gsub(' ', '%20')
end

# wow this was way easier than in Java..
sample_string = 'mr john smith' # excpect "mr%20john%20smith"
sample_string_2 = 'bob jones           ' # expect bob%20jones
p urlify(sample_string)
p urlify(sample_string_2)
