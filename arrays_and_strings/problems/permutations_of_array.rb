# all permutations of an array
# the ruby way

# https://apidock.com/ruby/Array/permutation
a = [1, 2, 3]
a.permutation.to_a     #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a  #=> [[1],[2],[3]]
a.permutation(2).to_a  #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a  #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a  #=> [[]] # one permutation of length 0
a.permutation(4).to_a  #=> []   # no permutations of length 4

# get all permutations with a length of k
# FB asked me this.
def permutations_of_array(a, k)
  a.permutation(k).to_a
end
# obviously this is too easy.
# You need to suffer more in a coding interview.
