+++
title = 'Sweep Line Algorithm'
date = 2023-11-10T20:45:48-05:00
+++

# Sweep Line Algorithm
- 使用一根假想的线，在坐标轴上水平或垂直移动
- 像扫描一样经过数据并处理的算法

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

### Approach 3: Sweep Line Algorithm
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
      if (temp_sum == 0) {
        left = v[i][0];
      }
      temp_sum += v[i][1];
      answer = std::max(answer, temp_sum); // compete the maximum number of overlap layers
      if (temp_sum == 0) {
        right = v[i][0];
      }
    }
    return answer;
  }
};
```

## Lintcode 850. Employee Free Time
- [Lintcode 850. Employee Free Time](https://www.lintcode.com/problem/850/)

```c++
/**
 * Definition of Interval:
 * class Interval {
 * public:
 *     int start, end;
 *     Interval(int start, int end) {
 *         this->start = start;
 *         this->end = end;
 *     }
 * }
 */

class Solution {
 public:
  /**
   * @param schedule: a list schedule of employees
   * @return: Return a list of finite intervals 
   */
  std::vector<Interval> employeeFreeTime(std::vector<std::vector<int>>& schedule) {
    std::vector<Interval> result;
    if (schedule.size() == 0) return result;

    std::vector<std::vector<int>> v;
    for (int i = 0; i < schedule.size(); ++i) {
      for (int j = 0; j < schedule[i].size(); ++j) {
        v.push_back({schedule[i][j], (j % 2 == 0 ? 1 : -1)});
      }
    }
    auto comp = [](const auto& left, const auto& right) {
      if (left[0] == right[0]) return left[1] < right[1];
      return left[0] < right[0];
    };
    std::sort(v.begin(), v.end(), comp);

    int left = 0xcfcfcfcf, right = 0x3f3f3f3f;
    int temp_sum = 0;
    for (int i = 0; i < v.size(); ++i) {
      if (temp_sum == 0) {
        left = v[i][0];
        if (right != 0x3f3f3f3f && left != right) { // left != right is the corner case
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

