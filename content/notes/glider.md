+++
title = 'Glider'
date = 2024-07-22T12:03:13-04:00
+++

## String Segmentation
```Java
class Outcome {
  public static String solve(String s, List<String> wordDict) {
    Set<String> hs = new HashSet<>(wordDict);
    boolean[] f = new boolean[s.length() + 1];
    f[0] = true;
    for (int i = 1; i <= s.length(); i++) {
      for (int j = 0; j < i; j++) {
        if (f[j] && hs.contains(s.substring(j, i))) {
          f[i] = true;
          break;
        }
      }
    }
    return f[s.length()] ? "true" : "false"; //return type "String".
  }
}
```

## Little Brother's Factorial Challenge
```Java
class Outcome {
  public static List<Integer> solve(int m, int n) {
    if (n < m) return new ArrayList<Integer>();
    List<Integer> result = new ArrayList<Integer>();
    BigInteger[] factorials = new BigInteger[n + 1];
    factorials[0] = BigInteger.ZERO;
    factorials[1] = BigInteger.ONE;
    for (int i = 2; i <= n; i++) {
      factorials[i] = BigInteger.valueOf(i).multiply(factorials[i - 1]);
    }
    for (int i = m; i <= n; i++) {
      if (isEven(factorials[i])) result.add(i);
    }
    return result.isEmpty() ? Arrays.asList(0) : result;
  }

  private static boolean isEven(BigInteger i) {
    return (i.toString().charAt(0) - '0') % 2 == 0;
  }
}
```

## Brother's Game
```Java
class Outcome {
  public static int solve(List<Integer> nums) {
    int n = nums.size();
    int[] f1 = new int[n];
    int[] f2 = new int[n];
    int[] f3 = new int[n];
    f1[0] = nums.get(0) ^ 1;
    f2[0] = nums.get(0);
    f3[0] = nums.get(0);
    int result = 0;
    for (int i = 1; i < n; i++) {
      f1[i] = Math.max(f1[i - 1] + 
         (nums.get(i) ^ 1), f3[i - 1] + (nums.get(i) ^ 1));
      f2[i] = Math.max(f1[i - 1] + nums.get(i), f2[i - 1] + nums.get(i));
      f3[i] = f3[i - 1] + nums.get(i);
      result = Math.max(result, Math.max(f1[i], f2[i]));
    }
    return result;
  }
}
```

## Binary Addition
```Java
class Outcome {
  public static String solve(String a, String b) { //Write your code here
    StringBuilder sb = new StringBuilder();
    int i = a.length() - 1, j = b.length() - 1;
    int carry = 0;
    while (i >= 0 || j >= 0 || carry == 1) {
      if (i >= 0) {
        carry += a.charAt(i--) - '0';
      }
      if (j >= 0) {
        carry += b.charAt(j--) - '0';
      }
      sb.append(carry % 2);
      carry = carry / 2;
    }
    return sb.reverse().toString();
  }
}
```

## Biggest Rectangle
```Java
class Outcome {
  public static int maxArea(List<Integer> b) {
    Deque<Integer> q = new ArrayDeque<Integer>();
    int result = 0;
    for (int i = 0; i <= b.size(); i++) {
      int curr = i == b.size() ? 0 : b.get(i);
      while (!q.isEmpty() && b.get(q.peekLast()) > curr) {
        int h = b.get(q.pollLast());
        int l = q.isEmpty() ? 0 : q.peekLast() + 1;
        int r = i - 1;
        result = Math.max(result, (r - l + 1) * h);
      }
      q.offerLast(i);
    }
    return result;
  }
}
```

## LRU
```Java
class Outcome {
  private int capacity;
  LinkedHashMap<Integer, Integer> LRU = new LinkedHashMap<>();

  public Outcome(int capacity) {
    this.capacity = capacity;
  }

  public int get(int key) {
    if (!LRU.containsKey(key)) {
      return -1;
    }
    makeRecently(key);
    return LRU.get(key);
  }

  public void put(int key, int val) {
    if (LRU.containsKey(key)) {
      LRU.put(key, val);
      makeRecently(key);
      return;
    }
    if (LRU.size() >= this.capacity) {
      int oldestKey = LRU.keySet().iterator().next();
      LRU.remove(oldestKey);
    }
    LRU.put(key, val);
  }

  private void makeRecently(int key) {
    int val = LRU.get(key);
    LRU.remove(key);
    LRU.put(key, val);
  }

  public static List<Integer> solve(int capacity, List<String> ar) {
    Outcome LRU = new Outcome(capacity);
    List<Integer> result = new ArrayList<>();
    for (String Operation : ar) {
      String[] parts = Operation.split(",");
      if (parts[0].equals("PUT")) {
        int key = Integer.parseInt(parts[1]);
        int value = Integer.parseInt(parts[2]);
        LRU.put(key, value);
      } else if (parts[0].equals("GET")) {
        int key = Integer.parseInt(parts[1]);
        result.add(LRU.get(key));
      }
    }
    return result; //return type "List<Integer>".
  }
}
```