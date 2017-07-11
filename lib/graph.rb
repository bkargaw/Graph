class Vertex

  attr_reader :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def add(edge, direction)
    case direction
    when 'out'
      @out_edges.push(edge)
    when 'in'
      @in_edges.push(edge)
    end
  end
  def destroy(edge, direction)
    case direction
    when 'out'
      @out_edges.delete_if { |e| e == edge }
    when 'in'
      @in_edges.delete_if { |e| e == edge }
    end
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @from_vertex.add(self, 'out')
    @to_vertex.add(self, 'in')
  end

  def destroy!
    @from_vertex.destroy(self, 'out')
    @to_vertex.destroy(self, 'in')
    @from_vertex = nil
    @to_vertex = nil
  end
end
