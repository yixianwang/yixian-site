+++
title = 'Sweep Line Algorithm'
date = 2023-11-10T20:45:48-05:00
+++

<!--more-->

- 使用一根假想的线，在坐标轴上水平或垂直移动
- 像扫描一样经过数据并处理的算法
- Take Aways: 
    - 注意点有交集的时候:
        - case 1(merge interval): start = -1, end = 1 (or comp: left[1] > right[1])
        - case 2(meeting room II, employee free time): start = 1, end = -1 (or comp: left[1] < right[1])
    - sort all boundary
    - sort first element first, then sort the second element
    - watch on `left == right` scenarios

## Leetcode 56. Merge Intervals
- [Leetcode 56. Merge Intervals](https://leetcode.com/problems/merge-intervals/description/)

### Approach 1: Greedy
- intervals排序，**左边界越小越优先** 
- **前一个区间的右边界在后一个区间的左边界之后 == 两区间合并**

```c++
class Solution {
 public:
  std::vector<std::vector<int>> merge(std::vector<std::vector<int>>& intervals) {
    // corner case
    std::vector<std::vector<int>> result;
    if (intervals.size() == 0) return result;

    // intervals排序，左边界越小越优先
    auto comp = [](const auto& left, const auto& right) {
      if (left[0] < right[0]) {
        return true;
      }
      return false;
    };
    std::sort(intervals.begin(), intervals.end(), comp);

    // 前一个区间的右边界在后一个区间的左边界之后 == 两区间合并
    for (int i = 0; i < intervals.size(); ++i) {
      int left = intervals[i][0];
      int right = intervals[i][1];
      if (result.size() == 0 || result[result.size() - 1][1] < left) {
        result.push_back(intervals[i]);
      } else {
        result[result.size() - 1][1] = std::max(result[result.size() - 1][1], right);
      }
    }
    return result;
  }
};
```


### Approach 2: Sweep Line Algorithm
- similar to `prefix_sum`

```c++
class Solution {
 public:
  std::vector<std::vector<int>> merge(std::vector<std::vector<int>>& intervals) {
    std::vector<std::vector<int>> result;
    if (intervals.size() == 0) return result;

    std::vector<std::vector<int>> boundaries;
    for (int i = 0; i < intervals.size(); ++i) {
      boundaries.push_back({intervals[i][0], -1});
      boundaries.push_back({intervals[i][1], 1});
    }

    // !!! sort on first element, then sort on second elemen
    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) {
        return left[1] < right[1];
      }
      return left[0] < right[0];
    };
    std::sort(boundaries.begin(), boundaries.end(), comp);

    int is_matched = 0;
    int left = 0, right = 0;
    for (int i = 0; i < boundaries.size(); ++i) {

      if (is_matched == 0) {
        left = boundaries[i][0];
      }

      is_matched += boundaries[i][1];

      if (is_matched == 0) {
        right = boundaries[i][0];
        result.push_back({left, right});
      }
    }
    return result;
  }
};
```

## Leetcode 253. Meeting Rooms II
- [Leetcode 253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

### Approach 1: Greedy
```c++
class Solution {
 public:
  int minMeetingRooms(vector<vector<int>>& logs) {
    std::vector<int> starts(logs.size(), 0);
    std::vector<int> ends(logs.size(), 0);
    for (int i = 0; i < logs.size(); ++i) {
      starts[i] = logs[i][0];
      ends[i] = logs[i][1];
    }

    std::sort(starts.begin(), starts.end());
    std::sort(ends.begin(), ends.end());

    int rooms = 0;
    int ends_itr = 0;
    for (int i = 0; i < starts.size(); ++i) {
      if (starts[i] < ends[ends_itr]) {
        ++rooms;
      } else {
        ++ends_itr;
      }
    }
    return rooms;
  }
}
```

### Approach 2: Prefix Sum
- if the absolute value between `right` and `left` is large, the performance will be bad.

```c++
// Approach 1: prefix sum
class Solution {
 public:
  int minMeetingRooms(vector<vector<int>>& logs) {
    if (logs.size() == 0) return 0;
    std::vector<int> v(1000001, 0);
    for (int i = 0; i < logs.size(); ++i) {
      int left = logs[i][0];
      int right = logs[i][1];
      ++v[left];
      --v[right];
    }
    for (int i = 1; i < v.size(); ++i) {
      v[i] = v[i - 1] + v[i];
    }
    return *max_element(v.begin(), v.end());
  }
};
```

### Approach 3: Sweep Line without Heap
```c++
class Solution {
 public:
  int minMeetingRooms(std::vector<std::vector<int>>& logs) {
    if (logs.size() == 0) return 0;
    std::vector<std::vector<int>> v;
    for (int i = 0; i < logs.size(); ++i) {
      v.push_back({logs[i][0], 1});
      v.push_back({logs[i][1], -1});
    }
    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) {
        return left[1] < right[1];
      }
      return left[0] < right[0];
    };
    std::sort(v.begin(), v.end(), comp);

    int left, right;
    int temp_sum = 0;
    int answer = -1;
    for (int i = 0; i < v.size(); ++i) {
      // if (temp_sum == 0) {
      //   left = v[i][0];
      // }
      temp_sum += v[i][1];
      answer = std::max(answer, temp_sum); // compete the maximum number of overlap layers
      // if (temp_sum == 0) {
      //   right = v[i][0];
      // }
    }
    return answer;
  }
};
```

### Approach 4: Sweep Line with Heap
- use `multiset` to handle same key inserted
```c++
class Solution {
 public:
  int minMeetingRooms(std::vector<std::vector<int>>& logs) {
    if (logs.size() == 0) return 0;

    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] < right[1];
      return left[0] < right[0];
    };
    std::multiset<std::vector<int>, decltype(comp)> heap(comp); // multiset, to handle same key

    for (int i = 0; i < logs.size(); ++i) {
      heap.insert({logs[i][0], 1});
      heap.insert({logs[i][1], -1});
    }

    int result = 0;
    int temp_sum = 0;
    for (auto it = heap.begin(); it != heap.end(); ++it) {
      temp_sum += it->at(1); // it->at(index)
      result = std::max(result, temp_sum);
    }
    return result;
  }
};
```

## Leetcode 759. Employee Free Time
- [Leetcode 759. Employee Free Time](https://leetcode.com/problems/employee-free-time/)

### Approach 1: Sweep Line: without heap
```c++
class Solution {
 public:
  std::vector<Interval> employeeFreeTime(std::vector<std::vector<Interval>> schedule) {
    std::vector<Interval> result;
    if (schedule.size() == 0) return result;
    std::vector<std::vector<int>> v;
    for (int i = 0; i < schedule.size(); ++i) {
      for (int j = 0; j < schedule[i].size(); ++j) {
        v.push_back({schedule[i][j].start, 1});
        v.push_back({schedule[i][j].end, -1});
      }
    }

    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] < right[1];
      return left[0] < right[0];
    };

    std::sort(v.begin(), v.end(), comp);

    int temp_sum = 0;
    int left = INT_MIN, right = INT_MAX;
    for (int i = 0; i < v.size(); ++i) {
      if (temp_sum == 0) {
        left = v[i][0];
        if (right != INT_MAX && left != right) { // left != right is the corner case
          result.push_back(Interval(right, left)); // right, left
        }
      }
      temp_sum += v[i][1];
      if (temp_sum == 0) {
        right = v[i][0];
      }
    }
    return result;
  }
};
```

### Approach 2: Sweep Line: with heap
```c++
class Solution {
 public:
  std::vector<Interval> employeeFreeTime(std::vector<std::vector<Interval>> schedule) {
    std::vector<Interval> result;
    if (schedule.size() == 0) return result;

    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] < right[1];
      return left[0] < right[0];
    };
    std::multiset<std::vector<int>, decltype(comp)> heap(comp);

    for (int i = 0; i < schedule.size(); ++i) {
      for (int j = 0; j < schedule[i].size(); ++j) {
        heap.insert({schedule[i][j].start, 1});
        heap.insert({schedule[i][j].end, -1});
      }
    }

    int count = 0;
    while (heap.size() > 1) {
      std::vector<int> left = *heap.begin();
      heap.erase(heap.begin());
      std::vector<int> right = *heap.begin();
      count += left[1];
      if (left[1] == -1 && right[1] == 1 && count == 0 && left[0] != right[0]) {
        result.push_back(Interval(left[0], right[0]));
      }
    }
    return result;
  }
};
```


## Leetcode Discuss: Study Guide:
- [Leetcode discuss/study guide](https://leetcode.com/discuss/study-guide/2166045/line-sweep-algorithms)

## Leetcode 731. My Calendar II
- [Leetcode 731. My Calendar II](https://leetcode.com/problems/my-calendar-ii/description/)

### Approach: Sweep Line with heap
```c++
#define print(x) std::copy(x.begin(), x.end(), std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl
class MyCalendarTwo {
 public:
  MyCalendarTwo() {}
    
  bool book(int start, int end) {
    v.insert({start, 1});
    v.insert({end, -1});

    // std::cout << "start: " << start << " end: " << end << std::endl;
    // for (auto e : v) {
    //     std::cout << e[0] << " " << e[1] << std::endl;
    // }

    if (IsValid()) {
      return true;
    } else {

      // Approach 1: with find_if
      //   auto index = std::find_if(v.begin(), v.end(), [&start](const auto& first) {
      //     return first[0] == start && first[1] == 1;
      //   });
      //   v.erase(index);
      //   index = std::find_if(v.begin(), v.end(), [&end](const auto& first) {
      //     return first[0] == end && first[1] == -1;
      //   });
      //   v.erase(index);

      // Approach 2: with find
      v.erase(v.find({start, 1}));
      v.erase(v.find({end, -1}));
      return false;

    }
  }

  bool IsValid() {
    // check if there is triple booking
    int count = 0;
    for (auto it = v.begin(); it != v.end(); ++it) {
      count += it->at(1);
      if (count >= 3) return false;
    }
    return true;
  }
  
  std::multiset<std::vector<int>> v;
}
```

## Leetcode 2237. Count Positions on Street With Required Brightness

### Approach 1(Failed): Sweep Line Algorithm without heap
- it's not concise compared to the prefix sum version

```c++
class Solution {
 public:
  int meetRequirement(int n, std::vector<std::vector<int>>& lights, std::vector<int>& requirement) {
    // no corner case

    std::vector<std::vector<int>> v;
    for (int i = 0; i < lights.size(); ++i) {
      int position = lights[i][0];
      int range = lights[i][1];
      v.push_back({std::max(0, position - range), 1});
      v.push_back({std::min(n - 1, position + range), -1});
    }

    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] > right[1];
      return left[0] < right[0]; // the intersection point should be inclusive
    };
    std::sort(v.begin(), v.end(), comp);

    for (int i = 0; i < v.size(); ++i) {
      std::cout << "point: " << v[i][0] << " type: " << v[i][1] << std::endl;
    }
    std::cout << std::endl;

    int temp_sum = 0;
    int left, right;
    std::vector<int> light_sum(requirement.size(), 0);
    for (int i = 0; i < v.size(); ++i) {
      if (temp_sum == 0) {
        left = v[i][0];
      }
      temp_sum += v[i][1];
      light_sum[v[i][0]] = std::max(light_sum[v[i][0]], temp_sum);
      if (temp_sum == 0) {
        right = v[i][0];
      }
    }

    for (auto e : light_sum) {
      std::cout << e << " ";
    }
    std::cout << std::endl;

    int result = 0;
    for (int i = 0; i < requirement.size(); ++i) {
      if (light_sum[i] >= requirement[i]) ++result;
    }
    return result;
  }
};
```

### Approach 2: Prefix Sum

```c++
class Solution {
 public:
  int meetRequirement(int n, std::vector<std::vector<int>>& lights, std::vector<int>& requirement) {
    // no coner case here

    // prefix sum
    std::vector<int> nums(n + 1, 0); // size has to be n + 1
    for (int i = 0; i < lights.size(); ++i) {
      int position = lights[i][0];
      int range = lights[i][1];
      ++nums[std::max(0, position - range)];
      --nums[std::min(n - 1, position + range) + 1]; // add 1 for the ending index
    }

    for (int i = 1; i < nums.size(); ++i) {
      nums[i] = nums[i - 1] + nums[i]; // this version of prefix sum doens't need to have a leading 0
    }

    int result = 0;
    for (int i = 0; i < requirement.size(); ++i) {
      if (nums[i] >= requirement[i]) {
        ++result;
      }
    }
    return result;
  }
};
```

## Leetcode 1893. Check if All the Integers in a Range Are Covered

```c++
class Solution {
 public:
  bool isCovered(std::vector<std::vector<int>>& ranges, int left, int right) {

  }
};
```
