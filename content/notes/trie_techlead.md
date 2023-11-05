+++
title = 'Trie Techlead'
date = 2023-11-03T17:51:02-04:00
+++

```python
#! python

class Node:
  def __init__(self, children, is_word):
    self.children = children
    self.is_word = is_word

class Solution:
  def __init__(self):
    self.trie = None

  def build(self, words):
    self.trie = Node({}, False)
    for word in words:
      current = self.trie
      for char in word:
        if not char in current.children:
          current.children[char] = Node({}, False)
        current = current.children[char]
      current.is_word = True

  def autocomplete(self, prefix):
    current = self.trie
    for char in prefix:
      if not char in current.children:
        return []
      current = current.children[char]
    return self._dfs_helper(current, prefix)
  
  def _dfs_helper(self, node, prefix):
    result = []
    if node.is_word:
      result += [prefix]
    for char in node.children:
      result += self._dfs_helper(node.children[char], prefix + char) 
    return result

s = Solution()
s.build(['dog', 'dark', 'cat', 'door', 'dodge', 'doddddd'])
print(s.autocomplete('do'))
# ['dog', 'door', ''dodge]
````