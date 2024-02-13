# frozen_string_literal: true

# Dikstra's algorithm
# http://rosettacode.org/wiki/Dijkstra%27s_algorithm#Ruby

# class Graph
#   Vertex = Struct.new(:name, :neighbours, :dist, :prev)
#
#   def initialize(graph)
#     @verticies = Hash.new {|h,k| h[k]= Vertex.new(k, [], Float::INFINITY)}
#     @edges = {}
#     graph.each do |(v1, v2, dist)|
#       @vertices[v1].neighbours << v2
#       @vertices[v2].neighbours << v1
#       @edges[[v1, v2]] = @edges[[v2, v1]] = dist
#     end
#     @dijkstra_source = nil
#   end
#
# end
class Graph
  INFINITY = Float::INFINITY

  def initialize
    @vertices = {}
  end

  def add_vertex(name, edges)
    @vertices[name] = edges
  end

  def shortest_path(start, finish)
    maxint = INFINITY # Define the maximum distance as infinity
    distances = {} # Hash to store the minimum distance from start to each vertex
    previous = {} # Hash to store the previous vertex in the optimal path from start
    nodes = @vertices.keys # Array of all vertices in the graph

    # Initialize distances from start to all vertices as infinity and previous vertices as nil
    nodes.each do |vertex|
      distances[vertex] = maxint
      previous[vertex] = nil
    end

    distances[start] = 0 # Set the distance from start to itself as 0

    # Loop until all nodes have been visited
    until nodes.empty?
      # Find the unvisited node with the smallest distance from the start
      nearest_node = nodes.min_by { |vertex| distances[vertex] }
      # If the nearest node is at infinity, all remaining nodes are unreachable
      break if distances[nearest_node] == maxint

      nodes.delete(nearest_node) # Remove the nearest node from the list of unvisited nodes

      # Update the distances to neighboring vertices of the current node
      @vertices[nearest_node].each do |neighbor, value|
        potential_distance = distances[nearest_node] + value
        if potential_distance < distances[neighbor] # If a shorter path is found
          distances[neighbor] = potential_distance # Update the distance to this neighbor
          previous[neighbor] = nearest_node # Update the previous vertex for this neighbor
        end
      end
    end

    # Build the shortest path from start to finish
    path = []
    current = finish
    while previous[current] # Traverse from finish to start via the previous vertices
      path.unshift(current) # Prepend the current vertex to the path
      current = previous[current] # Move to the previous vertex in the path
    end
    path.unshift(start) # Prepend the start vertex to the path

    path # Return the computed shortest path
  end
end

graph = Graph.new
graph.add_vertex('A', { 'B' => 7, 'C' => 8 })
graph.add_vertex('B', { 'A' => 7, 'F' => 2 })
graph.add_vertex('C', { 'A' => 8, 'F' => 6, 'G' => 4 })
graph.add_vertex('D', { 'F' => 8 })
graph.add_vertex('E', { 'H' => 1 })
graph.add_vertex('F', { 'B' => 2, 'C' => 6, 'D' => 8, 'G' => 9, 'H' => 3 })
graph.add_vertex('G', { 'C' => 4, 'F' => 9 })
graph.add_vertex('H', { 'E' => 1, 'F' => 3 })

path = graph.shortest_path('A', 'H')
puts "Shortest path from A to H: #{path.inspect}"
