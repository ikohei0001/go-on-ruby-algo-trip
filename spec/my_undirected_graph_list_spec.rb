require_relative "../lib/my_undirected_graph_list.rb"
require "set"

RSpec.describe MyUndirectedGraphList do
  let(:graph) { MyUndirectedGraphList.new }

  describe "#add_edge" do
    it "adds edges and vertices correctly" do
      graph.add_edge("A", "B")
        
      expect(graph.adj_list.keys).to include("A", "B")
      expect(graph.adj_list["A"]).to include("B")
      expect(graph.adj_list["B"]).to include("A")
    end
    
    it "doesn't add duplicate edge" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "B")
        
      expect(graph.adj_list["A"].count("B")).to eq(1)
      expect(graph.adj_list["B"].count("A")).to eq(1)
    end
  end

  describe "#show" do
    it "shows neighbors of vertices" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")

      expect(graph.show).to include("A")
      expect(graph.show).to include("B")
      expect(graph.show).to include("C")
    end
  end

  describe "#dfs" do
    it "visits each vertex exactly once" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      graph.add_edge("B", "C")

      expect(graph.dfs("A").sort).to eq(["A", "B", "C"])
    end
  end

  describe "#bfs" do
    it "visits each vertex exactly once" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      graph.add_edge("B", "C")

      expect(graph.bfs("A").sort).to eq(["A", "B", "C"])
    end
  end

  describe "#delete_edge" do
    it "deletes the edge correctly" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      graph.add_edge("B", "C")
      
      graph.delete_edge("A", "B")
      expect(graph.adj_list["A"]).to eq(["C"])
      expect(graph.adj_list["B"]).to eq(["C"])
    end

    it "doesn't delete the edge containing the graph" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      
      graph.delete_edge("B", "C")
      expect(graph.adj_list["C"]).to eq(["A"])
      expect(graph.adj_list["B"]).to eq(["A"])
    end
  end

  describe "#delete_vertex" do
    it "deletes the vertex correctly" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      graph.add_edge("B", "C")
      
      graph.delete_vertex("B")
      expect(graph.bfs("A").sort).to eq(["A", "C"])
      expect(graph.bfs("C").sort).to eq(["A", "C"])
    end

    it "doesn't delete the vertex containing the graph" do
      graph.add_edge("A", "B")
      graph.add_edge("A", "C")
      
      expect(graph.delete_vertex("D")).to eq(nil)
    end
  end
end
