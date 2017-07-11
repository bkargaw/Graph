require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms
 # Khan's topological sorting algorithms
def topological_sort(vertices)
  next_vertex = Queue.new
  result = []
  vertices.each do |vertex|
    next_vertex.push(vertex) if vertex.in_edges.length < 1
  end

  while !next_vertex.empty?
    vertex = next_vertex.pop
    vertex.out_edges.each do |edge|
      new_vertex = edge.to_vertex
      next_vertex.push(new_vertex) if new_vertex.in_edges.length <= 1
    end
    vertex.out_edges.each{|edge| edge.destroy!}
    result.push(vertex)
  end
  result
end
