# Subversive Serendipity 
![subversive-network](https://user-images.githubusercontent.com/111261353/215251057-2a92883b-aff6-42da-b735-61205deaa26f.png)  


---
> 🔗[Partition function (statistical mechanics) - wikipedia page](https://en.wikipedia.org/wiki/Partition_function_(statistical_mechanics)#Canonical_partition_function)  
> 🔗[Thermodynamic beta - wikipedia page](https://en.wikipedia.org/wiki/Thermodynamic_beta)      
> 🔗[Two Level Systems and more](http://home.thep.lu.se/~larsg/Site/SM2.pdf)  
> 📘[Einstein model](https://solidstate.quantumtinkerer.tudelft.nl/1_einstein_model/)

Second Law of Thermo
> 🔗[The 2nd Law of Thermodynamics -- A Probablistic Law](https://www.compadre.org/nexusph/course/view.cfm?ID=482)   

Quantum stuff
> 🔗 http://www.thomaswong.net/  
>> 🎲 https://www.thegamecrafter.com/games/qubit-touchdown   
>> 📖[Introduction to Classical and Quantum Computing](http://www.thomaswong.net/introduction-to-classical-and-quantum-computing-1e3p.pdf)

Miscellaneous 

> 🔗 https://longnow.org/  


## Brainstorming (9/2/2024)
```py
import numpy as np

# Define the sefirot
sefirot = ["Keter", "Chokhmah", "Binah", "Chesed", "Gevurah", "Tiferet", "Netzach", "Hod", "Yesod", "Malkuth"]

# Number of sefirot
n = len(sefirot)

# Assign self-energies using a Gaussian distribution
mean = 100
std_dev = 20
self_energies = np.random.normal(mean, std_dev, n)

# Define a hypothetical interaction energy matrix
# For simplicity, we'll use a symmetric matrix with small random values
interaction_energies = np.random.uniform(-10, 10, (n, n))
np.fill_diagonal(interaction_energies, 0)  # No self-interaction
interaction_energies = (interaction_energies + interaction_energies.T) / 2  # Make it symmetric

# Construct the Hamiltonian matrix
H = np.diag(self_energies) + interaction_energies

# Diagonalize the Hamiltonian
eigenvalues, eigenvectors = np.linalg.eigh(H)

# Print the results
print("Sefirot:", sefirot)
print("Self-Energies:", self_energies)
print("Interaction Energies:\n", interaction_energies)
print("Hamiltonian:\n", H)
print("Eigenvalues:", eigenvalues)
print("Eigenvectors:\n", eigenvectors)
```
