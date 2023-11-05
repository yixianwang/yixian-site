+++
title = 'Draft: TT'
date = 2023-11-04T21:59:52-04:00
+++

<!--more-->

Given:
- foods: contain [start, end, cost] for food i where start is the time when food i is available & end is the time when food i is last available
- arrival_time: the arrival time of each person on the buffet
Assuming the people will take all the foods that are available during their arrivals, find the buffet cost for each person.

Example:
foods = [[1,3,5], [2,4,3]], arrival_time = [1, 3]
answer = [5, 8]

1. for each person check if it was the time between start and end
O(n * m)

n = foods.size();
1. vec = [start1, start2, ] O(m*nlogn)
   hashmap = {start, {end, cost}}

1. vec1 = [1,1]  index1 = lower_bound(1) index2 = upper_bound(1) get the indexes of the foods
   vec2 = [3,4,5,6,7] index1 = index that >= arrival time

  O(m(logn + n))

```c++
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;
vector<int> sol(vector<vector<int>>& foods, vector<int>& nums) {
  vector<int> vec1(foods.size());
  vector<int> vec2(foods.size());
  for (int i = 0; i < foods.size(); ++i) {
    vec1[i] = foods[i][0]; // start times
    vec2[i] = foods[i][1]; // end times
  }

  std::cout << "vec1" << std::endl;
  for (auto e : vec1) {
    std::cout << e << " ";
  }
  std::cout << std::endl;
  std::cout << "vec2" << std::endl;
  for (auto e : vec2) {
    std::cout << e << " ";
  }
  std::cout << std::endl;

  int idx1, idx2, idx3;
  vector<int> result(nums.size(), 0);
  for (int i = 0; i < nums.size(); ++i) {

    idx1 = std::lower_bound(vec1.begin(), vec1.end(), nums[i]) - vec1.begin();
    idx2 = std::upper_bound(vec2.begin(), vec2.end(), nums[i]) - vec2.begin(); 
    idx3 = std::lower_bound(vec2.begin(), vec2.end(), nums[i]) - vec2.begin(); 
    // [idx1 ~ idx2)
  //     std::cout << "idx2: " << idx2 << " vec2.size " << vec2.size() << "\n";
    if (idx2 >= vec2.size()) idx2 = vec2.size();
    //   std::cout << "idx2: " << idx2 << "\n";
    if (idx1 < 0) idx1 = 0;
    if (idx1 >= vec1.size()) idx1 = vec1.size() - 1;
    std::cout << "customer i: " << i << " nums[i]: " << nums[i] << "idx1: " << idx1 << " idx2 " << idx2 << "\n";
    std::cout << "idx3: " << idx3 << std::endl;
    for (int j = std::min(idx1, idx3); j <= idx2; ++j) {
      result[i] += foods[j][2];
    }
  }
  return result;

}

int main() {
  vector<vector<int>> foods{{1,3,5}, {2,4,3}};
  vector<int> nums{1, 3};

  vector<int> ans = sol(foods, nums);
  for (auto& e : ans) {
    std::cout << e << std::endl;
  }
}

```