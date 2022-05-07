# frozen_string_literal: true

module BinaryTree
  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(v)
      @value = v
    end
  end
end

tree = BinaryTree::Node.new(10)
tree.left = BinaryTree::Node.new(5)
tree.right = BinaryTree::Node.new(15)

# https://leetcode.com/articles/binary-tree-level-order-traversal/
