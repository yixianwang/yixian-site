+++
title = 'Glider'
date = 2024-07-22T12:03:13-04:00
+++

## String segmentation
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

## Little Brother's Factorial Challenge
```Java
import java.util.*;
import java.math.*;

class Outcome {
  public static List<Integer> solve(int m,int n){
    List<Integer> result = new ArrayList<>();
    for(int i = m; i <= n; i++){
      BigInteger factorial = factorial(i);
      if(startsWithEvenDigit(factorial)){
        result.add(i);
      }
    }
    if(result.isEmpty()){
      result.add(0);
    }
    return result; //return type "List<Integer>".
  }
  private static BigInteger factorial(int num){
    BigInteger fact = BigInteger.ONE;
    for(int i = 2; i<=num; i++){
      fact = fact.multiply(BigInteger.valueOf(i));
    }
    return fact;
  }
  private static boolean startsWithEvenDigit(BigInteger number){
    String str = number.toString();
    char firstDigit = str.charAt(0);
    return (firstDigit -'0')%2 ==0;
  }
}
```

```Java
public class Outcome {
  public static List<Integer> solve(int m, int n) {
    if (m > n) return new ArrayList<Integer>();
    List<Integer> res = new ArrayList<Integer>();
    BigInteger[] facs = new BigInteger[n + 1];
    facs[0] = BigInteger.ZERO;
    facs[1] = BigInteger.ONE;
    for (int i = 2; i <= n; i++) {
      facs[i] = BigInteger.valueOf(i).multiply(facs[i - 1]);
    }
    for (int i = m; i <= n; i++) {
      if (even(facs[i])) res.add(i);
    }
    return res.isEmpty() ? Arrays.asList(0) : res;
  }

  private static boolean even(BigInteger i) {
    return (i.toString().charAt(0) - '0') % 2 == 0;
  }
}
```

## Brother's Game
```Java
class Outcome {
  public static int solve(List<Integer> ar) {
    int n = ar.size();
    int[] dp1 = new int[n];
    int[] dp2 = new int[n];
    int[] dp3 = new int[n];
    dp1[0] = ar.get(0) ^ 1;
    dp2[0] = ar.get(0);
    dp3[0] = ar.get(0);
    int max = 0;
    for (int i = 1; i < n; i++) {
      dp1[i] = Math.max(dp1[i - 1] + (ar.get(i) ^ 1), dp3[i - 1] + (ar.get(i) ^ 1));
      dp2[i] = Math.max(dp1[i - 1] + ar.get(i), dp2[i - 1] + ar.get(i));
      dp3[i] = dp3[i - 1] + ar.get(i);
      max = Math.max(max, Math.max(dp1[i], dp2[i]));
    }
    return max; //return type "int".
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
    return sb.reverse().toString(); //return type "String".
  }
}
```

## Biggest Rectangle
```Java
public class Outcome {
  public static int maxArea(List<Integer> b) {
    Deque<Integer> q = new ArrayDeque<Integer>();
    int max = 0;
    for (int i = 0; i < b.size() + 1; i++) {
      int cur = i == b.size() ? 0 : b.get(i);
      while (!q.isEmpty() && b.get(q.peekLast()) > cur) {
        int h = b.get(q.pollLast());
        int l = q.isEmpty() ? 0 : q.peekLast() + 1;
        int r = i - 1;
        max = Math.max(max, (r - l + 1) * h);
      }
      q.offerLast(i);
    }
    return max;
  }
}
```