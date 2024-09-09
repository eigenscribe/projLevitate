# Source: https://networkx.org/documentation/stable/auto_examples/drawing/plot_w
# eighted_graph.html#sphx-glr-auto-examples-drawing-plot-weighted-graph-py
import matplotlib.pyplot as plt
import networkx as nx

G = nx.Graph()

G.add_edge("1", "2", weight=1/22)    # edge 1
G.add_edge("1", "3", weight=1/22)    # edge 2
G.add_edge("1", "6", weight=1/22)    # edge 3
G.add_edge("2", "3", weight=1/22)    # edge 4
G.add_edge("2", "5", weight=1/22)    # edge 5
G.add_edge("2", "6", weight=1/22)    # edge 6
G.add_edge("3", "4", weight=1/22)    # edge 7
G.add_edge("3", "6", weight=1/22)    # edge 8
G.add_edge("4", "5", weight=1/22)    # edge 9
G.add_edge("4", "6", weight=1/22)    # edge 10
G.add_edge("4", "7", weight=1/22)    # edge 11
G.add_edge("5", "6", weight=1/22)    # edge 12
G.add_edge("5", "8", weight=1/22)    # edge 13
G.add_edge("6", "7", weight=1/22)    # edge 14 
G.add_edge("6", "8", weight=1/22)    # edge 15
G.add_edge("6", "9", weight=1/22)    # edge 16
G.add_edge("7", "8", weight=1/22)    # edge 17
G.add_edge("7", "9", weight=1/22)    # edge 18
G.add_edge("7", "10", weight=1/22)   # edge 19
G.add_edge("8", "9", weight=1/22)    # edge 20
G.add_edge("8", "10", weight=1/22)   # edge 21
G.add_edge("9", "10", weight=1/22)   # edge 22

elarge = [(u, v) for (u, v, d) in G.edges(data=True) if d["weight"] > 0.5]
esmall = [(u, v) for (u, v, d) in G.edges(data=True) if d["weight"] <= 0.5]

pos = nx.spring_layout(G, seed=2)  # positions for all nodes - seed for reproducibility

# nodes
nx.draw_networkx_nodes(G, pos, node_size=700)

# edges
nx.draw_networkx_edges(G, pos, edgelist=elarge, width=6)
nx.draw_networkx_edges(
    G, pos, edgelist=esmall, width=7, alpha=0.5, edge_color="b", style="-"
)

# node labels
nx.draw_networkx_labels(G, pos, font_size=20, font_family="sans-serif")
# edge weight labels
edge_labels = nx.get_edge_attributes(G, "weight")
nx.draw_networkx_edge_labels(G, pos, edge_labels, font_size=4)

ax = plt.gca()
ax.margins(0.08)
plt.axis("off")
plt.tight_layout()
plt.show()
