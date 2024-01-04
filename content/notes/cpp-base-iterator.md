+++
title = 'Cpp Base Iterator'
date = 2024-01-02T02:27:50-05:00
draft = true
+++

- The base() method returns a copy of the underlying base iterator. The base iterator is the iterator that the reverse iterator was originally constructed from.

## concepts
```c++
#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <algorithm>
#include <queue>
#include <unordered_set>

#define print(x)                                                    \
  std::ranges::copy(x, std::ostream_iterator<int>(std::cout, " ")); \
  std::cout << std::endl

using namespace std;

int main() {
  std::vector<int> v = {0, 1, 2, 3, 4, 5};

  using RevIt = std::reverse_iterator<std::vector<int>::iterator>;

  const auto it = v.begin() + 3;
  RevIt r_it{it};

  std::cout << "*it == " << *it << '\n'
            << "*r_it == " << *r_it << '\n'
            << "*r_it.base() == " << *r_it.base() << '\n'
            << "*(r_it.base()-1) == " << *(r_it.base() - 1) << '\n';

  RevIt r_end{v.begin()};
  RevIt r_begin{v.end()};

  for (auto it = r_end.base(); it != r_begin.base(); ++it)
    std::cout << *it << ' ';
  std::cout << '\n';

  for (auto it = r_end - 1; it != r_begin; --it)
    std::cout << *it << ' ';
  std::cout << '\n';

  for (auto it = r_begin; it != r_end; ++it) 
    std::cout << *it << ' ';
  std::cout << '\n';
}

```

## Leetcode 151. Reverse Words in a String
- [leetcode 151](https://leetcode.com/problems/reverse-words-in-a-string/)
```c++
class Solution {
 public:
  std::string reverseWords(std::string s) {
    // Remove leading and trailing spaces
    s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](unsigned char ch) {
              return !std::isspace(ch);
            }));

    s.erase(std::find_if(s.rbegin(), s.rend(),
                         [](unsigned char ch) { return !std::isspace(ch); })
                .base(),
            s.end());

    // Split by multiple spaces
    std::istringstream iss(s);
    std::vector<std::string> wordList(std::istream_iterator<std::string>{iss},
                                      std::istream_iterator<std::string>());

    // Reverse the words
    std::reverse(wordList.begin(), wordList.end());

    // Join the words with a single space
    return std::accumulate(wordList.begin(), wordList.end(), std::string(),
                           [](const std::string& acc, const std::string& word) {
                             return acc + (acc.empty() ? "" : " ") + word;
                           });
  }
};
```