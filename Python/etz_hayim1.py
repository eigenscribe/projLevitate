import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

# Node names
nodes = ['Keter', 'Chochma', 'Binah', 'Chesed', 'Gevurah',
         'Tiferet', 'Hod', 'Netzach', 'Yesod', 'Malchut']

# Edges corresponding to the tarot cards
edges = [('Keter', 'Chochma'), ('Keter', 'Binah'), ('Chochma', 'Binah'),
         ('Chochma', 'Chesed'), ('Binah', 'Gevurah'), ('Chesed', 'Gevurah'),
         ('Chesed', 'Tiferet'), ('Gevurah', 'Tiferet'), ('Tiferet', 'Netzach'),
         ('Tiferet', 'Hod'), ('Tiferet', 'Yesod'), ('Netzach', 'Hod'),
         ('Netzach', 'Yesod'), ('Hod', 'Yesod'), ('Yesod', 'Malchut')]

# Tarot card names
tarot = ['the fool', 'the High Priestess', 'the magician', 'the empress',
         'the emperor', 'the Hierophant', 'the lovers', 'the chariot',
         'strength', 'the Hermit', 'the Wheel of Fortune', 'justice',
         'the hanged man', 'death', 'temperance', 'the Devil',
         'the Tower', 'the Star', 'the Moon', 'the Sun', 'judgement', 'the World']

# Create the graph
G = nx.Graph()
G.add_nodes_from(nodes)
G.add_edges_from(edges)

# Assign tarot card names to edges
for i, edge in enumerate(G.edges()):
    G.edges[edge]['Tarot'] = tarot[i]

# Assign sefirot names to nodes
for i, node in enumerate(G.nodes()):
    G.nodes[node]['Sefirot'] = nodes[i]

# Plot the graph
plt.figure(figsize=(10, 8))
pos = nx.spring_layout(G)  # positions for all nodes

# Draw nodes
nx.draw_networkx_nodes(G, pos, node_size=500, node_color='skyblue')

# Draw edges
nx.draw_networkx_edges(G, pos, width=2)

# Draw node labels
nx.draw_networkx_labels(G, pos, font_size=10, font_family='sans-serif')

# Draw edge labels
edge_labels = nx.get_edge_attributes(G, 'Tarot')
nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels, font_color='red')

# Remove axis
plt.axis('off')

# Show the graph
plt.show()
