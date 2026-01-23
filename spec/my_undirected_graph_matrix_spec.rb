require_relative "../lib/my_undirected_graph_matrix.rb"

RSpec.describe MyUndirectedGraphMatrix do
  let(:graph) { MyUndirectedGraphMatrix.new(["A", "B", "C"]) }

  describe "#add_edge" do
    it "adds edges correctly" do
      graph.add_edge("A", "B")
      expect(graph.edge?("A", "B")).to be(true)
      expect(graph.edge?("B", "A")).to be(true)
    end
  end

  describe "#delete_edge" do
    it "removes an edge correctly" do
      graph.add_edge("A", "B")
      graph.delete_edge("A", "B")

      expect(graph.edge?("A", "B")).to be(false)
      expect(graph.edge?("B", "A")).to be(false)
    end
  end

  describe "#delete_vertex" do
    it "deletes a vertex correctly" do
      graph.add_edge("A", "B")
      graph.delete_vertex("B")

      expect(graph.show).not_to include("B")
    end
  end

  describe "#show" do
    it "displays the adjacency matrix correctly" do
      graph.add_edge("A", "B")
      output = graph.show

      expect(output).to include("A  0 1 0")
      expect(output).to include("B  1 0 0")
      expect(output).to include("C  0 0 0")
    end
  end
end
