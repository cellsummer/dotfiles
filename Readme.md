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
