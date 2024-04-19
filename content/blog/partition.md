+++
title = 'Partition'
date = 2024-04-15T18:29:20-04:00
+++

- Partition Template
- Quick Sort
- Top K Split(Quick Selection): (n = k/1/n-k-1)
- Top Kth Smallest
- Top Kth Largest
<!--more-->

## Partition Template
```c++
int partition(vector<int>& nums, int start, int end) {
  int pivot = nums[start]; // 初始化一个待比较数据;
  int i = start, j = end;
  while (i < j) {
    // 从后往前查找，直到找到一个比pivot更小的数
    while (i < j && nums[j] >= pivot) --j;
    nums[i] = nums[j]; // 将更小的数放入左边

    // 从前往后找，直到找到一个比pivot更大的数
    while (i < j && nums[i] <= pivot) ++i;
    nums[j] = nums[i]; // 将更大的数放入右边
  }
  // 循环结束，i与j相等
  nums[i] = pivot;
  return i; // 返回待比较数据最终位置
}
```

## Quick Sort
```c++
void QuickSort(vector<int>& nums, int start, int end) {
  if (start >= end) return;

  int idx = partition(nums, start, end);
  QuickSort(nums, start, idx - 1);
  QuickSort(nums, idx + 1, end);
}
```

## Top K Split
- 将快速排序改成快速选择，即我们希望寻找到一个位置，这个位置左边是`k`个比这个位置上的数更小的数，右边是`n - k - 1`个比该位置上的数大的数，我将它命名为`TopKSplit`，找到这个位置后停止迭代，完成了一次划分。

```c++
// Quick Selection
void TopKSplit(vector<int>& nums, int k, int left, int right) {
  // 寻找到第k个数停止递归，使得nums数组中index左边是前k个小的数，index右边是后面n-k个大的数
  int idx = partition(nums, left, right);

  if (idx == k) return;
  else if (idx < k) TopKSplit(nums, k, idx + 1, right);
  else TopKSplit(nums, k, left, idx - 1);
}
```

## Usages

### Top K Smalls
```c++
vector<int> TopKSmalls(vector<int>& nums, int k) {
  TopKSplit(nums, k, 0, nums.size() - 1);
  return vector<int>(nums.begin(), nums.begin() + k);
}
```

### Kth small
```c++
int TopKthSmall(vector<int>& nums, int k) {
  TopKSplit(nums, k - 1, 0, nums.size() - 1);
  return nums[k - 1];
}
```

### Top K Larges
```c++
vector<int> TopKLarges(vector<int>& nums, int k) {
  // parttion是按从小到大划分的，如果让index左边为前n-k个小的数，则index右边为前k个大的数
  TopKSplit(nums, nums.size() - k, 0, nums.size() - 1); // change k to nums.size() - k
  return vector<int>(nums.begin() + nums.size() - k, nums.end());
}
```

### Kth large
```c++
int TopKthLarge(vector<int>& nums, int k) {
  // parttion是按从小到大划分的，如果让index左边为前n-k个小的数，则index右边为前k个大的数
  TopKSplit(nums, nums.size() - k, 0, nums.size() - 1); // change k to nums.size() - k
  return nums[nums.size() - k];
}
```

### Only Sort Top K Smalls
```c++
// 只排序前 k 个小的数
// 获得前 k 小的数 O(n)，进行快排 O(klogk)
vector<int> TopKSortLeft(vector<int>& nums, int k) {
  TopKSplit(nums, k, 0, nums.size() - 1);
  vector<int> topk = vector<int>(nums.begin(), nums.begin() + k);
  QuickSort(topk, 0, topk.size() - 1);
  topk.insert(topk.end(), nums.begin() + k, nums.end());
  return topk;
}
```

### Only Sort Top K Larges
```c++
// 只排序后 k 个大的数
// 获得前 k 小的数 O(n)，进行快排 O(klogk)
vector<int> TopKSortLeft(vector<int>& nums, int k) {
  TopKSplit(nums, nums.size() - k, 0, nums.size() - 1);
  vector<int> topk = vector<int>(nums.begin() + nums.size() - k, nums.end());
  QuickSort(topk, 0, topk.size() - 1);
  topk.insert(topk.begin(), nums.begin() + nums.size() - k, nums.end());
  return topk;
}
```
