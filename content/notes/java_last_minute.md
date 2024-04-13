+++
title = 'Java Last Minute'
date = 2024-04-11T23:30:02-04:00
+++

## Array
```java
int[] count = new int[26];
Arrays.fill(count, 0);
```

## Array <==> List
```java
return Arrays.asList(array); // from Array to List
```

### Fix-sized array
```java
List<Boolean> result = Arrays.asList(new Boolean[candies.length]);
```

## StringBuilder
```java
str.length(); // the size of string
StringBuilder result = new StringBuilder();
result.append(str); // append the string to string builder
result.toString(); // convert string builder to string
```

## String
```java
// to modify the string
char[] chars = str.toCharArray();
char temp = chars[0]; // can access by [idx]
return new String(chars) // convert back to String

for (char c : str.toCharArray()) // str is String type

s = s.trim(); // remove leading and tailing spaces
List<String> wordList = Arrays.asList(s.split("\\s+")); // split by multiple spaces
Collections.reverse(wordList);
return String.join(" ", wordList); // return a String
```

## Character
```java
Character.isLetterOrDigit(s.charAt(i)) // return boolean
Character.toLowerCase(s.charAt(i)) != Character.toLowerCase(s.charAt(j))
```

## Set
```java
Set<Integer> hs = new TreeSet<Integer>();
hs.add(right);
left = hs.iterator().next() + 1; // left = hs.begin() + 1;
hs.remove(hs.iterator().next()); // hs.erase(hs.begin());
```

## from Map<String, List> get List<List<String>>
```java
Map<String, List> ans = new HashMap<String, List>();
if (!ans.containsKey(key)) ans.put(key, new ArrayList());
return new ArrayList(ans.values()); // from Map<String, List> get List<List<String>>
return new ArrayList(); // for return empty (List<List<AnyType>>)
```

## PriorityQueue + HashMap
```java
// leetcode 347
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        // 使用字典，统计每个元素出现的次数，元素为键，元素出现的次数为值
        Map<Integer, Integer> map = new HashMap();
        for(int num : nums){
            if (map.containsKey(num)) {
                map.put(num, map.get(num) + 1);
            } else {
                map.put(num, 1);
            }
        }

        // 遍历map，用最小堆保存频率最大的k个元素
        // PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<Integer>() {
        //     @Override
        //     public int compare(Integer a, Integer b) {
        //         return map.get(a) - map.get(b);
        //     }
        // });
        PriorityQueue<Integer> pq = new PriorityQueue<>(
            (n1, n2) -> map.get(n1) - map.get(n2)
        );

        for (Integer key : map.keySet()) {
            pq.add(key);
            if (pq.size() > k) {
                pq.remove();
            }
        }

        // 取出最小堆中的元素
        List<Integer> res = new ArrayList<>();
        while (!pq.isEmpty()) {
            res.add(pq.remove());
        }

        // List 变成 Array
        int[] arrayResult = new int[res.size()];
        for (int i = 0; i < res.size(); ++i) {
            arrayResult[i] = res.get(i);
        }
        return arrayResult;
    }
}
```