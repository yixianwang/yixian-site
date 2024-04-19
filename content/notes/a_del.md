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
            throw new IllegalArgumentException("默认的大小" + size);
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
            throw new IndexOutOfBoundsException("指定的index超过界限");
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
            throw new IndexOutOfBoundsException("指定的index超过界限");
        }
        return (E) elementData[index];
    }
}
```