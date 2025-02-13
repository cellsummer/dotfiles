## My Linux dot files

### Neovim

[How I set up my (neo)vim]( https://cellsummer.github.io/views/2022-02-05-My-NeoVim-Config.html )



### NeoMutt

### Ranger
The problem:

I have a unknown large list A consists of unique strings

there are N (say N>=1 and N<=10) known sub lists from A, a(1), a(2), a(3) ... a(N).
For each sub list, the elements have the same relative order as they were in A

Now merge these N sub lists into a new list B, elements in B should be unique and maintain the same relative order as they were in A

Example:

A (unknown):
    [m, b, x, p, d, o]

Given:
    a1: [m, p, o]
    a2: [b, x, o]

Valid answers B:
    [m, p, b, x, o]
    [m, b, x, p, o]
    [m, b, p, x, o]

```python
def merge_ordered_sublists(sublists):
    """
    Merge multiple sublists while maintaining relative ordering and uniqueness.
    Returns one valid solution.
    
    Args:
        sublists: List of sublists, where each sublist maintains relative ordering from original list
    Returns:
        List containing merged elements maintaining ordering constraints
    """
    # Step 1: Build a graph of ordering relationships
    graph = {}  # key: element, value: set of elements that must come after it
    elements = set()  # all unique elements
    
    # Process each sublist to build ordering relationships
    for sublist in sublists:
        elements.update(sublist)
        for i in range(len(sublist)):
            if sublist[i] not in graph:
                graph[sublist[i]] = set()
            # Add ordering relationships: all elements after i must come after sublist[i]
            for j in range(i + 1, len(sublist)):
                graph[sublist[i]].add(sublist[j])

    # Step 2: Topological sort to create a valid ordering
    result = []
    visited = set()
    
    def has_no_incoming_edges(element, visited):
        # Check if all elements that should come before this one are already visited
        for node in graph:
            if element in graph[node] and node not in visited:
                return False
        return True
    
    # Keep adding elements that have no incoming edges from unvisited nodes
    while len(visited) < len(elements):
        # Find an element that can be added next
        for element in elements:
            if element not in visited and has_no_incoming_edges(element, visited):
                result.append(element)
                visited.add(element)
                break
    
    return result

# Example usage
sublists = [['m', 'p', 'o'], ['b', 'x', 'o']]
result = merge_ordered_sublists(sublists)
print(result)  # One possible output: ['m', 'b', 'x', 'p', 'o']
```
