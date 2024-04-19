+++
title = 'A'
date = 2024-04-16T01:58:31-04:00
+++

## Top K(quick select)
- [Leetcode 215 Kth largest](https://leetcode.com/problems/kth-largest-element-in-an-array/description/)
```java
int partition(vector<int>& nums, int start, int end) {
  int pivot = nums[start];
  int i = start, j = end;
  while (i < j) {
    while (i < j && nums[j] >= pivot) --j;
    nums[i] = nums[j];
    while (i < j && nums[i] <= pivot) ++i;
    nums[j] = nums[i];
  }
  nums[i] = pivot;
  return i;
}

void TopKSplit(vector<int>& nums, int k, int left, int right) {
  int idx = partition(nums, left, right);
  if (idx == k) return;
  else if (idx < k) TopKSplit(nums, k, idx + 1, right);
  else TopKSplit(nums, k, left, idx - 1);
}
```

## Coding: 实现 ArrayList 的 get 方法和 add 方法(by index)
- [Reference](https://github.com/byhieg/JavaTutorial/tree/master/src/main/java/cn/byhieg/collectiontutorial/listtutorial)
```java
import java.io.Serializable;
import java.util.Arrays;
import java.util.RandomAccess;

public class SimpleArrayList<E> implements RandomAccess, Cloneable, Serializable {
    private final static int DEFAULT_CAPACITY = 10;
    private int size = 0;

    private Object[] elementData;

    public SimpleArrayList() {
        this(DEFAULT_CAPACITY);
    }

    public SimpleArrayList(int size) {
        if (size < 0) {
            throw new IllegalArgumentException("Size should be positive integer!" + size);
        } else {
            elementData = new Object[size];
        }
    }

    public void add(E e) {
        isCapacityEnough(size + 1);
        elementData[size++] = e;
    }

    public void add(int index, E e) {
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException("Please give a legal index!");
        }
        isCapacityEnough(size + 1);
        System.arraycopy(elementData, index, elementData, index + 1, size - index);
        elementData[index] = e;
        size++;
    }

    private void isCapacityEnough(int size) {
        if (size > DEFAULT_CAPACITY) {
            explicitCapacity(size);
        }
        if (size < 0) {
            throw new OutOfMemoryError();
        }
    }

    private final static int MAX_ARRAY_LENGTH = Integer.MAX_VALUE - 8;

    private void explicitCapacity(int capacity) {
        int newLength = elementData.length * 2;
        if (newLength - capacity < 0) {
            newLength = capacity;
        }
        if (newLength > (MAX_ARRAY_LENGTH)) {
            newLength = (capacity > MAX_ARRAY_LENGTH ? Integer.MAX_VALUE : MAX_ARRAY_LENGTH);
        }
        elementData = Arrays.copyOf(elementData, newLength);
    }

    public E get(int index) {
        if (index >= size || index < 0) {
            throw new IndexOutOfBoundsException("Please give a legal index");
        }
        return (E) elementData[index];
    }
}
```

## Character count
```java
String input = "ABCDCCCDAA";
HashMap<Character, Integer> hm = new HashMap<>();
for (Character c : input.toCharArray()) {
    hm.put(c, hm.getOrDefault(c, 0) + 1);
}
```

## find the largest and the second largest
```java
int first = v[0], second = v[0];
int right = 0;
while (right < v.length) {
    if (v[right] > v[first]) {
      second = first;
      first = right;
    } else if (v[right] > v[second]) second = right;
    ++right;
}
```

## find unique char in string
```java
int[] cnt = new int[26];
Arrays.fill(cnt, 0);
for (char c : s.toCharArray()) {
    ++cnt[c - 'a'];
}
```

## find unique int
```java
HashMap<Integer, Integer> hm = new HashMap<>();
for (int vi : v) {
    hm.put(vi, hm.getOrDefault(vi, 0) + 1);
}
```

## subarray sum equals to K
```java
// Approach 1
if (nums == null || nums.length == 0) return 0;
int ans = 0;
for (int i = 0; i < nums.length; ++i) {
    int sum = 0;
    for (int j = i; j < nums.length; ++j) {
        sum += nums[j];
        if (k == sum) ++ans;
    }
}
return ans;

// Approach 2
int subarraySum(int[] nums, int k) {
    if (nums == null || nums.length == 0) return 0;
    int sum = 0;
    HashMap<Integer, Integer> hm = new HashMap<>();
    int ans = 0;
    hm.put(0, 1);
    for (int i = 0; i < nums.length; ++i) {
        sum += nums[i];
        if (hm.containsKey(sum - k)) {
            ans += hm.get(sum - k);
        }
        hm.put(sum, hm.getOrDefault(sum, 0) + 1);
    }
    return ans;
}
```

## max consecutive ones
```java
int findMaxConsecutiveOnes(int[] nums) {
    int cnt = 0, ans = 0;
    for (int n : nums) {
        if (n == 1) ++cnt;
        else {
            ans = Math.max(ans, cnt);
            cnt = 0;
        }
    }
    ans = Math.max(ans, cnt);
    return ans;
}
```

## K largest element in an Array
```java
int partition(vector<int>& nums, int start, int end) {
  int pivot = nums[start];
  int i = start, j = end;
  while (i < j) {
    while (i < j && nums[j] >= pivot) --j;
    nums[i] = nums[j];
    while (i < j && nums[i] <= pivot) ++i;
    nums[j] = nums[i];
  }
  nums[i] = pivot;
  return i;
}

void TopKSplit(vector<int>& nums, int k, int left, int right) {
  int idx = partition(nums, left, right);
  if (idx == k) return;
  else if (idx < k) TopKSplit(nums, k, idx + 1, right);
  else TopKSplit(nums, k, left, idx - 1);
}
```

## String compression
```java
int compress(char[] chars) {
    if (chars.length == 0) return 0;
    int left = 0, right = 0;
    while (right < chars.length) {
        int len = 1;
        while (right + len < chars.length && chars[right] == chars[right + len]) {
            ++len;
        }
        chars[left++] = chars[right];
        if (len > 1) {
            String len_s = Integer.toString(len);
            for (Character c : len_s.toCharArray()) {
                chars[left++] = c;
            }
        }
        right += len;
    }
    return left;
}
```

## Group Anagrams
```java
public List<List<String>> groupAnagrams(String[] strs) {
    if (strs.length == 0) return new ArrayList();
    Map<String, List> ans = new HashMap<String, List>();
    int[] count = new int[26];
    for (String s : strs) {
        Arrays.fill(count, 0);
        for (char c : s.toCharArray()) count[c - 'a']++;

        StringBuilder sb = new StringBuilder("");
        for (int i = 0; i < 26; i++) {
            sb.append('#');
            sb.append(count[i]);
        }
        String key = sb.toString();
        if (!ans.containsKey(key)) ans.put(key, new ArrayList());
        ans.get(key).add(s);
    }
    return new ArrayList(ans.values());
}
```

## Fibonacci Number
```java
// Creating a hash map with 0 -> 0 and 1 -> 1 pairs
private Map<Integer, Integer> cache = new HashMap<>(Map.of(0, 0, 1, 1));

public int fib(int N) {
    if (cache.containsKey(N)) {
        return cache.get(N);
    }
    cache.put(N, fib(N - 1) + fib(N - 2));
    return cache.get(N);
}
```

```java
public int fib(int N) {
    if (N <= 1) {
        return N;
    }

    int current = 0;
    int prev1 = 1;
    int prev2 = 0;

    for (int i = 2; i <= N; i++) {
        current = prev1 + prev2;
        prev2 = prev1;
        prev1 = current;
    }
    return current;
}
```

## Get second frequently string from list of string
```java
ArrayList<String> input = new ArrayList<>();
input.add("apple");
input.add("apple");
input.add("banana");
input.add("orange");
input.add("banana");
input.add("apple");

HashMap<String, Integer> hm = new HashMap<>();
for (String s : input) {
    hm.put(s, hm.getOrDefault(s, 0) + 1);
}

hm.put("", 0);
String first = "";
String second = "";
for (String key : hm.keySet()) {
    Integer val = hm.get(key);
    if (hm.get(first) < val) {
        second = first;
        first = key;
    } else if (hm.get(second) < val) second = key;
}
```

## Valid anagram
```java
public boolean isAnagram(String s, String t) {
    if (s.length() != t.length()) {
        return false;
    }
    int[] counter = new int[26];
    for (int i = 0; i < s.length(); i++) {
        counter[s.charAt(i) - 'a']++;
        counter[t.charAt(i) - 'a']--;
    }
    for (int count : counter) {
        if (count != 0) {
            return false;
        }
    }
    return true;
}
```

## input: 1,1,2,5,5,8,9 output: 1,2,*,*,5,*,*,8,9
```java
int max_v = 0;
for (int vi : v) {
    if (vi > max_v) max_v = vi;
}
int[] ans = new int[max_v];
Arrays.fill(ans, -1);
for (int vi : v) {
    ans[vi - 1] = vi;
}
```

## subsequence sum equals to K
```java
void solution() {
    int[] input = {1,2,3,4,5,6,7};
    Arrays.sort(input);
    ArrayList<ArrayList<Integer>> combinations = new ArrayList<>();
    ArrayList<Integer> comb = new ArrayList<>();
    Helper(input, 0, combinations, comb, 0);
    System.out.println(combinations);
}

void Helper(int[] nums, int start, ArrayList<ArrayList<Integer>> combinations, ArrayList<Integer> comb, int sum) {
    if (sum == 6) {
        combinations.add(new ArrayList<>(comb));
    }
    for (int i = start; i < nums.length; i++) {
        comb.add(nums[i]);
        sum += nums[i];
        Helper(nums, i + 1, combinations, comb, sum);
        sum -= nums[i];
        comb.remove(comb.size() - 1);
    }
}
```