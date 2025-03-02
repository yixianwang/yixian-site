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

1. Prefix Sum
2. Sweep Line Algorithm
3. Greedy - Prev End
4. Greedy - Simulation

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
};
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
- [Leetcode 2237. Count Positions on Street With Required Brightness](https://leetcode.com/problems/count-positions-on-street-with-required-brightness/)

### Approach 1(Failed): Sweep Line Algorithm without heap
- it's not concise compared to the prefix sum version, 
- not AC

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
- [Leetcode 1893. Check if All the Integers in a Range Are Covered](https://leetcode.com/problems/check-if-all-the-integers-in-a-range-are-covered/)

### Approach 1: Prefix Sum
```c++
class Solution {
 public:
  bool isCovered(std::vector<std::vector<int>>& ranges, int left, int right) {
    // no corner case here

    // prefix sum
    std::vector<int> ps(52, 0); // it must be at least 52 here
    for (int i = 0; i < ranges.size(); ++i) {
      int start = ranges[i][0];
      int end = ranges[i][1];
      ++ps[start];
      --ps[end + 1]; // because it's inclusive, we have to include end
    }

    for (int i = 1; i < ps.size(); ++i) {
      ps[i] += ps[i - 1];
    }

    for (int i = left; i <= right; ++i) {
      if (ps[i] < 1) return false;
    }
    return true;
  }
};
```

## Leetcode 370. Range Addition
- [Leetcode 370. Range Addition](https://leetcode.com/problems/range-addition/)

### Approach 1: Prefix Sum

```c++
class Solution {
 public:
  std::vector<int> getModifiedArray(int length, std::vector<std::vector<int>>& updates) {
    std::vector<int> nums(length + 1, 0);
    for (int i = 0; i < updates.size(); ++i) {
      int start = updates[i][0];
      int end = updates[i][1];
      int ins = updates[i][2];
      nums[start] += ins;
      nums[end + 1] -= ins;
    }

    for (int i = 1; i < nums.size(); ++i) {
      nums[i] += nums[i - 1];
    }

    return std::vector<int>(nums.begin(), nums.begin() + length);
  }
};
```

## Leetcode 452. Minimum Number of Arrows to Burst Ballons
- [Leetcode 452. Minimum Number of Arrows to Burst Ballons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

### Approach 1: Greedy - prev end
- sort based on the `end`
- use `prev_end` as a bar
- iterate

```c++
class Solution {
 public:
  int findMinArrowShots(std::vector<std::vector<int>>& points) {
    if (points.size() == 0) return 0;

    auto comp = [](const auto& left, const auto& right) {
      if (left[1] == right[1]) return left[0] < right[0];
      return left[1] < right[1];
    };
    std::sort(points.begin(), points.end(), comp);

    int prev_end = points[0][1]; // !!! initialize the prev_end
    int arrow_count = 1; // initialize the first result
    // start from the second element
    for (int i = 1; i < points.size(); ++i) {
      if (points[i][0] > prev_end) {
        ++arrow_count;
        prev_end = points[i][1];
      }
    }
    return arrow_count;
  }
};
```

## Leetcode 435. Non-overlapping Intervals
- [Leetcode 435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)

### Approach 1: Greedy - prev end - Sort by end

```c++
class Solution {
 public:
  int eraseOverlapIntervals(std::vector<std::vector<int>>& intervals) {
    if (intervals.size() == 0) return 0;

    auto comp = [](const auto& left, const auto& right) {
      if (left[1] == right[1]) return left[0] < right[0];
      return left[1] < right[1];
    };

    std::sort(intervals.begin(), intervals.end(), comp);

    int prev_end = intervals[0][1]; // !!! use prev strategy here
    int count_overlap = 0; // initialize the result

    for (int i = 1; i < intervals.size(); ++i) {
      if (intervals[i][0] < prev_end) {
        ++count_overlap;
      } else {
        prev_end = intervals[i][1];
      }
    }
    return count_overlap;
  }
};
```

### Approach 2: DP - Sort by start
```c++
class Solution {
 public:
  int eraseOverlapIntervals(std::vector<std::vector<int>>& intervals) {

  }
};
```


## Leetcode 646. Maximum Length of Pair Chain
- [Leetcode 646. Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/)

### Approach 1: Greedy - prev end
```c++
class Solution {
 public:
  int findLongestChain(std::vector<std::vector<int>>& pairs) {
    if (pairs.size() == 0) return 0;

    auto comp = [](const auto& left, const auto& right) {
      if (left[1] == right[1]) return left[0] < right[0];
      return left[1] < right[1];
    };

    std::sort(pairs.begin(), pairs.end(), comp);

    int prev_end = pairs[0][1];
    int count_chain = 1;
    for (int i = 1; i < pairs.size(); ++i) {
      if (pairs[i][0] > prev_end) {
        ++count_chain;
        prev_end = pairs[i][1];
      }
    }
    return count_chain;
  }
};
```
### Approach 2: DP - Sort by start
```c++
class Solution {
 public:
  int findLongestChain(std::vector<std::vector<int>>& pairs) {

  }
};
```

## Leetcode 252. Meeting Rooms
- [Leetcode 252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

### Approach 1: Greedy - prev end - Sorty by end

```c++
class Solution {
 public:
  bool canAttendMeetings(std::vector<std::vector<int>>& intervals) {
    if (intervals.size() == 0) return true;

    auto comp = [](const auto& left, const auto& right) {
      if (left[1] == right[1]) return left[0] < right[0];
      return left[1] < right[1];
    };
    std::sort(intervals.begin(), intervals.end(), comp);

    int prev_end = intervals[0][1];
    for (int i = 1; i < intervals.size(); ++i) {
      if (intervals[i][0] >= prev_end) {
        prev_end = intervals[i][1];
      } else {
        return false;
      }
    }
    return true;
  }
};
```

## Leetcode 1272. Remove Interval
- [Leetcode 1272. Remove Interval](https://leetcode.com/problems/remove-interval/)

### Approach 1: Simulation - Greedy

```c++
class Solution {
 public:
  std::vector<std::vector<int>> removeInterval(std::vector<std::vector<int>>& intervals, std::vector<int>& to_be_removed) {
    std::vector<std::vector<int>> result;
    if (intervals.size() == 0) return result;
    if (to_be_removed.size() == 0) return intervals;

    for (int i = 0; i < intervals.size(); ++i) {

      // case 1
      // there are no overlaps with to_be_removed
      if (intervals[i][1] < to_be_removed[0] || intervals[i][0] > to_be_removed[1]) {
        result.push_back(intervals[i]);
      } else {

        // case 2, 3, 4
        // there is left overlap
        if (intervals[i][0] < to_be_removed[0]) {
          result.push_back({intervals[i][0], to_be_removed[0]});
        } 

        // there is right overlap
        if (intervals[i][1] > to_be_removed[1]) {
          result.push_back({to_be_removed[1], intervals[i][1]});
        }
      }
    }
    return result;
  }
};
```

### Approach 2: Sweep Line Algorithm

- start of remove index is -1, end is 1
- four senarios:
    1. none overlaps
    2. left overlap
    3. right overlap
    4. left and right overlaps
- think through: decide left and then right to cover all scenarios

> handle corner case: start of interval == the start of remove. let value != 0

```c++
class Solution {
 public:
  std::vector<std::vector<int>> removeInterval(std::vector<std::vector<int>>& intervals, std::vector<int>& to_be_removed) {
    std::map<int, int> v;
  
    for (auto& i : intervals) {
      ++v[i[0]];
      --v[i[1]];
    }
    --v[to_be_removed[0]];
    ++v[to_be_removed[1]];

    std::vector<std::vector<int>> result;

    int temp_sum = 0; 
    int left, right;
    for (auto& [key, value] : v) {
      temp_sum += value;
      if (temp_sum > 0) {
        left = key;
      }
      // handle corner case: start of interval == the start of remove. let value != 0
      if (temp_sum == 0 && value != 1 && value != 0) { 
        right = key;
        result.push_back({left, right});
      }
    }
    return result;
  }
};
```


## Leetcode 57. Insert Interval
- [Leetcode 57. Insert Interval](https://leetcode.com/problems/insert-interval/)

### Approach 1: Sweep Line Algorithm

- Similar to Merge Interval
- Pay attention to the intersect point, sort strategy

```c++
class Solution {
 public:
  std::vector<std::vector<int>> insert(std::vector<std::vector<int>>& intervals, std::vector<int>& new_interval) {
    if (new_interval.size() == 0) return intervals;
    std::vector<std::vector<int>> v;
    for (int i = 0; i < intervals.size(); ++i) {
      int start = intervals[i][0];
      int end = intervals[i][1];
      v.push_back({start, 1});
      v.push_back({end, -1});
    }
    v.push_back({new_interval[0], 1});
    v.push_back({new_interval[1], -1});

    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] > right[1]; // here must be >
      return left[0] < right[0];
    };
    std::sort(v.begin(), v.end(), comp);

    std::vector<std::vector<int>> result;
    int temp_sum = 0;
    int left, right;
    for (int i = 0; i < v.size(); ++i) {
      if (temp_sum == 0) {
        left = v[i][0];
      }
      temp_sum += v[i][1];
      if (temp_sum == 0) {
        right = v[i][0];
        result.push_back({left, right});
      }
    }
    return result;
  }
};
```

## Leetcode 1589. Maximum Sum Obtained of Any Permutation

### Approach 1: Prefix Sum
```c++
#define print(x) std::copy(x.begin(), x.end(), std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl
class Solution {
 public:
  int maxSumRangeQuery(vector<int>& nums, vector<vector<int>>& requests) {
    if (requests.size() == 0) return 0;

    std::vector<int> ps(nums.size() + 1, 0);
    for (int i = 0; i < requests.size(); ++i) {
      int start = requests[i][0];
      int end = requests[i][1];
      ++ps[start]; // use accumulation instead of assign to 1
      --ps[end + 1]; // same here
    }

    // 0, 1, 2, 3, 4, 5
    // 1       -1
    //    1       -1
    //    1 -1

    for (int i = 1; i < ps.size(); ++i) {
      ps[i] += ps[i - 1];
    }

    std::sort(nums.begin(), nums.end(), std::greater<int>());
    std::sort(ps.begin(), ps.end() - 1, std::greater<int>()); // except the last element of prefix sum array

    long long mod = 1000000007;
    long long result = 0;
    for (int i = 0; i < nums.size(); ++i) {
      result += (nums[i] % mod) * (ps[i] % mod);
      result %= mod;
    }
    return result % mod;
  }
};
```

## Leetcode 1943. Describe the Painting

- [Leetcode 1943. Describe the Painting](https://leetcode.com/problems/describe-the-painting/)

### Approach 1: Prefix Sum: Failed in corner case

- Failded Corner Case:
    - Input: segments = [[1,4,5],[1,4,7],[4,7,1],[4,7,11]]
    - Output: [[1,4,12],[4,7,12]]

```c++
#define print(x) std::copy(x.begin(), x.end(), std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl
class Solution {
 public:
  std::vector<std::vector<long long>> splitPainting(std::vector<std::vector<int>>& segments) {
    std::vector<std::vector<long long>> result;
    if (segments.size() == 0) return result;

    std::vector<int> v(100001, 0);
    for (auto& s : segments) {
      int start = s[0];
      int end = s[1];
      int color = s[2];
      v[start] += color;
      v[end] -= color;
    }

    for (int i = 1; i < v.size(); ++i) {
      v[i] += v[i - 1];
    }
    print(v);

    // 0, 0, 1, 1, 2, 2, 1, 0, 0
    int left, right;
    int pre_mix = 0;
    for (int i = 0; i < v.size() - 1; ++i) {
      if (v[i] == pre_mix) { // leading 0 or unchanged mix color
        continue;
      }
      if (pre_mix == 0) {
        left = i;
      } else {
        result.push_back({left, i, v[i - 1]});
        if (v[i] != 0) {
          left = i;
        }
      }
      pre_mix = v[i];
    }
    return result;
  }
};
```

### !!! Approach 2: Sweep Line: AC
- when the **prefix sum** cannot identify the specific index, we need use **sweep line**

```c++
class Solution {
 public:
  std::vector<std::vector<long long>> splitPainting(std::vector<std::vector<int>>& A) {
    std::map<int, long long> mp;
    for (auto& a : A) {
      mp[a[0]] += a[2];
      mp[a[1]] -= a[2];
    }
    std::vector<std::vector<long long>> result;
    int prev_key = -1; // None
    long long color = 0; // temp_sum: color mix accumulation
    for (auto& [key, _] : mp) {
      // std::cout << "key: " << key << " value: " << _ << " mp[prev_key]: " << mp[prev_key] << std::endl;
      if (color != 0) { // if color == 0, means this part isn't paint
        result.push_back({prev_key, key, color});
      }
      color += mp[key];
      prev_key = key;
    }
    return result;
  }
};
```

## [Skip] Leetcode 1674. Minimum Moves to Make Array Complementary

```c++
class Solution {
 public:
  int minMoves(std::vector<int>& nums, int limit) {

  }
};
```

## Leetcode 2158. Amount of New Area Painted Each Day
- [Leetcode 2158. Amount of New Area Painted Each Day](https://leetcode.com/problems/amount-of-new-area-painted-each-day/)

```c++
class Solution {
 public:
  std::vector<int> amountPainted(std::vector<std::vector<int>>& paint) {
  }
};
```

## Advanced Approaches
### Leetcode 56. Merge Intervals
- [Leetcode 56. Merge Intervals](https://leetcode.com/problems/merge-intervals/description/?envType=study-plan-v2&envId=top-interview-150)

```c++
class Solution0 {
 public:
  std::vector<std::vector<int>> merge(std::vector<std::vector<int>>& intervals) {
    std::vector<std::vector<int>> result;
    if (intervals.size() == 0) return result;

    std::vector<std::vector<int>> boundaries;
    for (int i = 0; i < intervals.size(); ++i) {
      boundaries.push_back({intervals[i][0], 1});
      boundaries.push_back({intervals[i][1], -1});
    }

    // !!! sort on first element, then sort on second elemen
    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) {
        return left[1] > right[1];
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

class Solution {
 public:
  std::vector<std::vector<int>> merge(std::vector<std::vector<int>>& intervals) {
    vector<vector<int>> result;
    if (intervals.size() == 0) return result;
    sort(intervals.begin(), intervals.end());
    vector<int>& curr = intervals[0];
    for (int i = 1; i < intervals.size(); ++i) {
      vector<int>& inter = intervals[i];
      if (curr[1] < inter[0]) {
        result.push_back(curr);
        curr = inter;
      } else {
        curr[1] = max(curr[1], inter[1]);
      }
    }
    result.push_back(curr);
    return result;
  }
};
```


### Leetcode 57. Insert Interval
- [Leetcode 57. Insert Intervals](https://leetcode.com/problems/insert-interval/description/?envType=study-plan-v2&envId=top-interview-150)

```c++
class Solution0 {
 public:
  std::vector<std::vector<int>> insert(std::vector<std::vector<int>>& intervals, std::vector<int>& new_interval) {
    vector<vector<int>> result;
    if (intervals.size() == 0) return {new_interval};
    vector<vector<int>> boundaries;
    for (auto& v : intervals) {
      boundaries.push_back({v[0], 1});
      boundaries.push_back({v[1], -1});
    }
    boundaries.push_back({new_interval[0], 1});
    boundaries.push_back({new_interval[1], -1});
    auto comp = [](auto const& left, auto const& right) {
      if (left[0] == right[0]) return left[1] > right[1];
      return left[0] < right[0];
    };
    sort(boundaries.begin(), boundaries.end(), comp);
    int temp_sum = 0;
    int left;
    for (int i = 0; i < boundaries.size(); ++i) {
      if (temp_sum == 0) {
        left = boundaries[i][0];
      }
      temp_sum += boundaries[i][1];
      if (temp_sum == 0) {
        result.push_back({left, boundaries[i][0]});
      }
    }
    return result;
  }
};

class Solution1 {
 public:
  std::vector<std::vector<int>> insert(std::vector<std::vector<int>>& intervals, std::vector<int>& new_interval) {
    std::vector<std::vector<int>> result;
    for (auto& i : intervals) {
      if (i[1] < new_interval[0]) {
        result.push_back(i);
      } else if (new_interval[1] < i[0]){
        result.push_back(new_interval);
        new_interval = i;
      } else if (new_interval[1] >= i[0]) {
        new_interval[0] = min(new_interval[0], i[0]);
        new_interval[1] = max(new_interval[1], i[1]);
      }
    }
    result.push_back(new_interval);
    return result;
  }
};

// review better
class Solution {
 public:
  std::vector<std::vector<int>> insert(std::vector<std::vector<int>>& intervals, std::vector<int>& new_interval) {
    vector<vector<int>> result;
    // the given intervals is sorted
    bool added = false;
    for (int i = 0; i < intervals.size(); ++i) {
      vector<int>& inter = intervals[i];
      // check if exist overlapping
      int max_start = max(inter[0], new_interval[0]);
      int min_end = min(inter[1], new_interval[1]);
      if (max_start <= min_end) {
        new_interval[0] = min(new_interval[0], inter[0]);
        new_interval[1] = max(new_interval[1], inter[1]);
      } else {
        if (new_interval[1] < inter[0] && added == false) {
          result.push_back(new_interval);
          added = true;
        } 
        result.push_back(inter);
      }
    }
    if (added == false) {
      result.push_back(new_interval);
    }
    return result;
  }
};
```