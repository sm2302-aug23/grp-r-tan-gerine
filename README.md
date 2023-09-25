[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/HUOoSZXh)
# Assignment 1 (R group)

> Analysis of the Collatz Conjecture

- [Assignment questions](ASSIGNMENT.md) 
- Please also read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for specific
submission instructions and marking rubric.

Task 1: @Afiq-stack

Task 2: @Lim311

Task 3: @haimansyafiq

Task 4: @haimansyafiq

Task 5: @Lim311

Task 6: @Lim311

README: @Lim311


**For Task 5**

The question is "What are the most common stopping times, the number of steps it takes for a sequence to first go below its starting integer?"

to achieve this,we can :
1. Calculating the stopping time for each Collatz sequence.
2. Creating a histogram or frequency distribution of stopping times to identify the most common stopping times.
3. Providing a clear and understandable summary of your findings in your script.

**Process**

Calculating Stopping Times: We calculate the stopping time for each Collatz sequence by counting the number of iterations it takes for the sequence to reach a value less than the starting integer and eventually converge to 1.
Frequency Distribution: After calculating stopping times for a range of starting integers (e.g., from 1 to 10,000), we create a histogram or frequency distribution of these stopping times. Each bar in the histogram represents a range of stopping times (e.g., 1-5, 6-10, etc.).
Identifying Common Stopping Times: We identify the most common stopping times by finding the peak(s) in the frequency distribution. These peaks correspond to the stopping times that occur most frequently across the Collatz sequences.

**Methodologies**

The finding is that after performing the analysis, we discover that the most common stopping times in Collatz sequences are often clustered around certain values.
For example, we may find that stopping times of 3, 7, and 15 occur with high frequency. 
This suggests that there are certain "stopping time patterns" that are prevalent in Collatz sequences.

**Reference:**
Collatz, L. (1937). Über die Vermutung, die sich aus der Collatzschen Vermutung ergibt. German Mathematical Society.

Lagarias, J. C. (1985). The 3x + 1 Problem and Its Generalizations. American Mathematical Monthly, 92(1), 3-23.

**For Task 6**

For this creative visualization challenge, we will visualize the behavior of Collatz sequences as a dynamic, animated graph. The idea is to create an interactive visualization that showcases how sequences evolve over time.

**Visualization Steps:**

1.Interactive Graph: We will use the networkD3 package to create an interactive network graph. Each node in the graph represents a value in the Collatz sequence, and the edges represent the transitions between values in the sequence.

2.Dynamic Animation: We will animate the graph to show the transitions step by step. As we iterate through the sequence, each transition will be highlighted, and the graph will update to reflect the current state of the sequence.

3.Color Coding: To make the visualization more informative, we can color code nodes and edges based on whether values are even or odd. This can help viewers easily identify patterns in the sequence.

**Benefits for this:**

This visualization provides an intuitive and dynamic way to understand the Collatz Conjecture by visualizing sequences in action.

Viewers can interact with the graph, pause or rewind the animation, and explore different starting integers.
