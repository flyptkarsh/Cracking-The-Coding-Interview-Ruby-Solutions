class Node
  attr_reader :value, :next
  attr_accessor :word

  def initialize(value)
    @value  = value
    @word   = false
    @next   = []
  end
end

class Trie
  def initialize
    @root = Node.new("*")
  end

  def add_word(word)
    letters = word.chars
    base = @root
    letters.each {|letter| base = add_character(letter, base.next)}
    base.word = true
  end

  def find_word(word)
    letters = word.chars
    base = @root
    words_found = letter.all? {|letter| base = find_character(letter, base.next)}
    yield words_found, base if block_given
  end

  def add_character(character, trie)
    trie.find { |n| n.value == character } || add_node(character, trie)
  end

  def find_character(character, trie)
     trie.find {|n| n.value == character}
  end

  def add_node(character, trie)
    Node.new(character).tap {|new_node| trie << new_node}
  end

  def include?(word)
    find_word(word) { |found, base| return found && base.word }
  end
end

trie = Trie.new
trie.add_word("cat")
trie.add_word("cap")
trie.add_word("cape")
trie.add_word("camp")
