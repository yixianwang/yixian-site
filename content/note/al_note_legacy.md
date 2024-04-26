+++
title = 'Legacy Algo Note'
date = 2023-10-24T03:10:46-04:00
+++

Algorithm Template:
    1. Binary Search
    2. Two Pointers
    3. Sorting
    4. Binary Tree Divide & Conquer
    5. BST Iterator
    6. BFS
    7. DFS
    8. Dynamic Programming
    9. Heap
    10. Union Find
    11. Trie

Data structures:
    1. Array
    2. Queue
    3. Linked List
    4. Binary Tree
    5. Hash Map
        6. Stack
        7. Heap(PriorityQueue)
    8. Union Find
    9. Trie
        10. Deque
        11. Monotone Stack

Coding style:
    1. check availability of input
       java:   if (nums == null || nums.length == 0) {return -1}
       python: if not nums: # nums is None or len(nums) == 0
                  return -1
    2. variables' name
    3. space
    4. indentation


多用continue少用if和else:
    for ......
        if ...
            do something
            if ...
                do something
                do something
                do something
                do something
    //optimize:            
    for .....
        if !...
            continue
        do something
        if !...
            continue

        do something
        do something
        do something
        do something


Initialize Matirx in python:
    matrix = [[False]*3 for _ in range(3)]
    # solve the issue introduced by: matrix = [[False] * 3] *3 
    # check differences: matrix[0] = True


Python list won't overflow with unbounded index:
    something[start: infinite] # this is ok


Python for .. else..:
    for ...:
        if ...:
            break
    else:
        do something


区间型动态规划
    1. 状态转移方程
        ?? 在Longest Palindromic Substring的dynamic programming 方法里面，要创建那个叫 is_palindrome的二维数组
        Java: 
            //状态
            boolean[][] isPalindrome == new ...
            
            // 状态转移方程
            isPalindrome[i][j] = isPalindrome[i + 1][j - 1] && (
                s.charAt(i) == s.charAt(j)
            )

            // ?? why here is reverse for loop
            for (int i = n - 1; i >= 0; i--) {
                for (int j = i; j < n; j++){

                }
            }

            //初始化: i and i is single char that is Palindrome for sure
            isPalindrome[i][i] = true


Longest Palindromic Substring
    Manacher's Algorithm - O(n) //学有余力可以阅读全文并背诵
    后缀数组Suffix Array - O(n) //完全不用学
    Dynamic Programming - O(n^2) **
    Enumeration - O(n^2) **


Substring:
    for length in range(...):
        for i in range(n - length + 1):
            j = i + length - 1


Hash function:
    magic number: 31 
    Hash_size = 10^6
    

Java: String 类重写了equals方法 vs StringBuilder没有重写
    后者只判断是否是同一个实例，即内存地址是否相同


C++ vs Python: String
    前者string is changeable


Java中
    String demo = "Hello,world!";
    1.int length = demo.length(); //获取字符串的长度
    2.boolean equals = demo.equals("Hello,world"); // 比较两个字符串相等
    3.boolean contains = demo.contains("word"); // 是否包含子串
    4.String replace = demo.replace("Hello,", "Yeah@"); // 将指定字符串(或正则表达式)替换，返回替换后的结果
    5.char little = demo.charAt(5); // 查找字符串中索引为5的字符（索引从0开始）
    6.String trim = demo.trim(); // 将字符串左右空格去除，返回去除空格后的结果
    7.String concat = demo.concat("Great!"); // 拼接字符串，返回拼接结果
    8.char[] charArray = demo.toCharArray(); // 返回该字符串组成的字符数组
    9.String upperCase = demo.toUpperCase(); // 返回该字符串的大写形式
    10.String lowerCase = demo.toLowerCase(); // 返回该字符串的小写形式


Python中
    s = "Hello,World"
    1.print(s[1]) # 'e', 取出某个位置的字符
    2.print(s[1:6]) # 'ello,' ，字符串切片
    3.print(len(s)) # 11, 返回字符串的长度
    4.print("e" in s) # True, 返回字符是否在字符串中
    5.print(s.lower()) # 'hello,world', 将字符串所有元素变为小写
    6.print(s.upper()) # 'HELLO,WORLD', 将字符串所有元素变为大写
    7.s += '...' # Hello,World... ，字符串拼接，在字符串后拼接另一个字符串
    8.print(s.find('lo')) # 3, 返回第一次找到指定字符串的起始位置（从左往右找）
    9.print(s.swapcase()) # hELLO,wORLD..., 将大小写互换
    10.print(s.split(',')) # ['Hello', 'World...'], 将字符串根据目标字符分割


背诵贪心算法：
    https://www.jiuzhang.com/qa/2099/
        http://www.lintcode.com/problem/majority-number/
        http://www.lintcode.com/problem/create-maximum-number/
        http://www.lintcode.com/problem/jump-game-ii/
        http://www.lintcode.com/problem/jump-game/
        http://www.lintcode.com/problem/gas-station/
        http://www.lintcode.com/problem/delete-digits/
        http://www.lintcode.com/problem/task-scheduler/


Python: sorted(list) O(nlogn)


O(logN)的算法几乎可以确定是二分法


Quick Sort Algorithm:
    O(nlogn) vs O(n^2)


O(max(n, m)) == O(n + m):
    n + m > max(n, m) > (n + m) / 2
    O(n + m) > O(max(n, m)) > O((n + m) / 2)


O(n):
    1. 双指针算法
    2. 打擂台算法
    3. 单调栈算法
    4. 单调队列算法
    etc.


双指针算法：
    1. 相向双指针（判断回文串）
    2. 背向双指针（最长回文串）
    3. 同向双指针


相向双指针的分类：
    Reverse:
        翻转字符串
        判断回文串

    Two Sum:
        两数之和
        三数之和

    Partition:
        快速排序
        颜色排序


Python String methods:
    isdigit()
    isalpha()
    lower()
    upper()


C++ String methods:
    isdigit()
    isalpha()
    putchar(tolower(c))
    putchar(toupper(c))


Java String methods:
    isLetter(c)
    isDigit(c)
    toLowerCase(c)
    toUpperCase(c)


twoSum：
    hashmap:
        时间复杂度O(n)
        空间复杂度O(n)
    two pointers:
        O(nlogn)
        O(1)


Quick Sort Algorithm:
    平均时间复杂度O(nlogn)，最坏时间复杂度O(n^2)
    额外空间复杂度：O(1) in-place
    不稳定排序
    先整体有序，再局部有序
    <= pivot
    >= pivot 
        To divide balancely 
    ??why pivot has to balance
        


Merge Sort Algorithm:
    平均时间复杂度O(nlogn)，最好&最坏时间复杂度O(nlogn)
    额外空间复杂度：O(n) 
    稳定排序
    先局部有序，再整体有序


T(n) = 2T(n/2) + O(n)
    Quick Sort
    Merge Sort


快速选择算法的 Partition 的实质：
    快速选择/快速排序中的 partition 是 可左可右 的partition，也就是说，对于nums[i] == pivot 时，这个数字既可以放在左边，也可以放在右边。

为什么这样划分数组呢？
    原因是为了避免出现类似 [1,1,1,1,1,1] 的数组中的元素，全部被分到一边的情况。我们让 nums[i] == pivot 的情况既不属于左边也不属于右边，这样就能够让 partition 之后的结果稍微平衡一些。
    如果 quick select / quick sort 写成了nums[i] < pivot 在左侧，nums[i] >= pivot 在右侧这种形式，就会导致划分不平均，从而导致错误或者超时。

为什么问题《partition array》不能使用同样的代码？
    对于问题《partition array》来说，题目的要求是将数组划分为两个部分，一部分满足一个条件，另外一部分不满足这个条件，所以可以严格的把 nums[i] < pivot 放在左侧，把 nums[i] >= pivot 放在右侧，这样子做完一次 partition 之后，就能够将这两部分分开。

总结
    简单的说就是，quick select 和 quick sort 的 partition 目标不是将数组 严格的按照 nums[i] < pivot 和nums[i] >= pivot 去拆分开，而是只要能够让左半部分 <= 右半部分即可。这样子 nums[i] == pivot 放在哪儿都无所谓，两边都可以放。


Quick Select Algorithm:
    平均时间复杂度O(n)
    T(n) = O(n) + T(n/2)
         = O(n) + O(n/2) + O(n/4) + ... + O(1)
         = O(n)


Quick Select Algorithm:
    start~i（包含start，不包含i），一共是i-start个元素，现在要求第k大，左边已经去掉了i-start个元素，那么他在右边就是第k-(i-start)个元素了

O(1)    位运算
O(logn)	二分法，倍增法，快速幂算法，辗转相除法	
O(n)	枚举法，双指针算法，单调栈算法，KMP算法，Rabin Karp，Manacher's Algorithm	又称作线性时间复杂度
O(nlogn)	快速排序，归并排序，堆排序	
O(n^2)	枚举法，动态规划，Dijkstra	
O(n^3)	枚举法，动态规划，Floyd	
O(2^n)	与组合有关的搜索问题	
O(n!)	与排列有关的搜索问题


递归的三要素：
    public class Solution {
        // 1.递归的定义：函数接受什么样的参数，返回什么样的值，代表什么样的意思
        public int fibonacci(int n) {
            // 3.递归的出口
            if (n <= 2) {
                return n -1;
            }

            // 2.递归的拆解
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }


为了分析（二分法 + 递归）写法的空间复杂度:
    我们需要了解一下内存中，栈和堆占用了多少空间


内存中的栈空间与堆空间:
    我们通常所说的内存空间，包含了两个部分：栈空间（Stack space）和堆空间（Heap space）


Stack Space:
    当一个程序在执行的时候，操作系统为了让进程可以使用一些固定的不被其他进程侵占的空间用于进行函数调用，递归等操作，会开辟一个固定大小的空间（比如 8M）给一个进程使用。这个空间不会太大，否则内存的利用率就很低。这个空间就是我们说的栈空间，Stack space。


Stack Overflow:
    我们通常所说的栈溢出（Stack Overflow）是指在函数调用，或者递归调用的时候，开辟了过多的内存，超过了操作系统余留的那个很小的固定空间导致的。那么哪些部分的空间会被纳入栈空间呢？栈空间主要包含如下几个部分：
    1.函数的参数与返回值
    2.函数的局部变量


Java:
    public int f(int n) {
        int[] nums = new int[n];
        int sum = 0;
        for (int i = 0; i < n; i++) {
            nums[i] = i;
            sum += i;
        }
        return sum;
    }

Python:
    def f(n):
        nums = [0]*n  # 相当于Java中的new int[n]
        sum = 0
        for i in range(n):
            nums[i] = i
            sum += i
        return sum

C++:
    int f(int n) {
        int *nums = new int[n];
        int sum = 0;
        for (int i = 0; i < n; i++) {
            nums[i] = i;
            sum += i;
        }
        return sum;
    }

根据我们的定义，参数n，最后的函数返回值f，局部变量sum 都很容易的可以确认是放在栈空间里的。那么主要的难点在 nums。

这里 nums 可以理解为两个部分：
    一个名字叫做 nums 的局部变量，他存储了指向内存空间的一个地址（Reference），这个地址也就是 4 个字节（32位地址总线的计算机，地址大小为 4 字节）new 出来的，一共有 n 个位置的整数数组，int[n]。一共有 4 * n 个字节。这里 nums 这个变量本身，是存储在栈空间的，因为他是一个局部变量。但是 nums 里存储的 n 个整数，是存储在堆空间里的，Heap space。他并不占用栈空间，并不会导致栈溢出。

在大多数的编程语言中，特别是 Java, Python 这样的语言中，万物皆对象，基本上每个变量都包含了变量自己和变量所指向的内存空间两个部分的逻辑含义。


Java:
    public int[] copy(int[] nums) {
        int[] arr = new int[nums.length];
        for (int i = 0; i < nums.length; i++) {
            arr[i] = nums[i]
        }
        return arr;
    }

    public void main() {
        int[] nums = new int[10];
        nums[0] = 1;
        int[] new_nums = copy(nums);
    }

Python:
    def copy(nums):
        arr = [0]*len(nums)  # 相当于Java中的new int[nums.length]
        for i in range(len(nums)):
            arr[i] = nums[i]
        return arr
            
    # 用list comprehension实现同样功能
    def copy(nums):
        arr = [x for x in nums]
        return arr
            
    # 以下相当于Java中的main函数
    if __name__ == "__main__":
        nums = [0]*10
        nums[0] = 1
        new_nums = copy(nums)

C++:
    int* copy(int nums[], int length) {
        int *arr = new int[length];
        for (int i = 0; i < length; i++) {
            arr[i] = nums[i];
        }
        return arr;
    }

    int main() {
        int *nums = new int[10];
        nums[0] = 1;
        int *new_nums = copy(nums, 10);
        return 0;
    }

在 copy 这个函数中，arr 是一个局部变量，他在 copy 函数执行结束之后就会被销毁。但是里面 new 出来的新数组并不会被销毁。这样，在 main 函数里，new_nums 里才会有被复制后的数组。所以可以发现一个特点：
    1.栈空间里存储的内容，会在函数执行结束的时候被撤回

栈空间和堆空间的区别：
    new 出来的就放在堆空间，其他都是栈空间


什么是递归深度：
    递归函数在内存中，同时存在的最大次数。

Java:
    int factorial(int n) {
        if (n == 1) {
            return 1;
        }
        return factorial(n - 1) * n;
    }

Pyhton:
    def factorial(n):
        if n == 1:
            return 1
        return factorial(n-1) * n

C++:
    int factorial(int n) {
        if (n == 1) {
            return 1;
        }
        return factorial(n - 1) * n;
    }

当n=100时，递归深度就是100。一般来说，我们更关心递归深度的数量级，在该阶乘函数中递归深度是O(n)，而在二分查找中，递归深度是O(log(n))。在后面的教程中，我们还会学到基于递归的快速排序、归并排序、以及平衡二叉树的遍历，这些的递归深度都是(O(log(n))。注意，此处说的是递归深度，而并非时间复杂度。

太深的递归会内存溢出:
    首先，函数本身也是在内存中占空间的，主要用于存储传递的参数，以及调用代码的返回地址。
    函数的调用，会在内存的栈空间中开辟新空间，来存放子函数。递归函数更是会不断占用栈空间，例如该阶乘函数，展开到最后n=1时，内存中会存在factorial(100), factorial(99), factorial(98) ... factorial(1)这些函数，它们从栈底向栈顶方向不断扩展。
    当递归过深时，栈空间会被耗尽，这时就无法开辟新的函数，会报出stack overflow这样的错误。
    所以，在考虑空间复杂度时，递归函数的深度也是要考虑进去的。

Follow up：
    尾递归：若递归函数中，递归调用是整个函数体中最后的语句，且它的返回值不属于表达式的一部分时，这个递归调用就是尾递归。（上例factorial函数满足前者，但不满足后者，故不是尾递归函数）
    尾递归函数的特点是：在递归展开后该函数不再做任何操作，这意味着该函数可以不等子函数执行完，自己直接销毁，这样就不再占用内存。一个递归深度O(n)的尾递归函数，可以做到只占用O(1)空间。这极大的优化了栈空间的利用。
    但要注意，这种内存优化是由编译器决定是否要采取的，不过大多数现代的编译器会利用这种特点自动生成优化的代码。在实际工作当中，尽量写尾递归函数，是很好的习惯。
    而在算法题当中，计算空间复杂度时，建议还是老老实实地算空间复杂度了，尾递归这种优化提一下也是可以，但别太在意。


??尾递归


二分法vs哈希表：O(logn) vs O(1)
    二分法不限制于内存，可将数据放在磁盘上，然后进行二分操作
    哈希表依赖内存


二分查找 vs 普通查找:
    二分搜索的有点就是时间复杂度是O(logn)的，而普通的查找时间复杂度是O(n)的。但他们所消耗的空间是一样的。同时普通查找不需要数组有序，直接for循环即可，但是二分查找需要数组有一定的顺序。


二分法/Java:
public class Solution {
    /**
     * @param A an integer array sorted in ascending order
     * @param target an integer
     * @return an integer
     */
    public int findPosition(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return -1;
        }

        int start = 0, end = nums.length - 1;
        // 要点1: start + 1 < end
        while (start + 1 < end) {
            // 要点2：start + (end - start) / 2
            int mid = start + (end - start) / 2;
            // 要点3：=, <, > 分开讨论，mid 不+1也不-1
            if (nums[mid] == target) {
                return mid;
            } else if (nums[mid] < target) {
                start = mid;
            } else {
                end = mid;
            }
        }

        // 要点4: 循环结束后，单独处理start和end
        if (nums[start] == target) {
            return start;
        }
        if (nums[end] == target) {
            return end;
        }
        return -1;
    }
}

二分法/Python:
class Solution:
    # @param nums: The integer array
    # @param target: Target number to find
    # @return the first position of target in nums, position start from 0 
    def binarySearch(self, nums, target):
        if not nums:
            return -1

        start, end = 0, len(nums) - 1
        # 用 start + 1 < end 而不是 start < end 的目的是为了避免死循环
        # 在 first position of target 的情况下不会出现死循环
        # 但是在 last position of target 的情况下会出现死循环
        # 样例：nums=[1，1] target = 1
        # 为了统一模板，我们就都采用 start + 1 < end，就保证不会出现死循环
        while start + 1 < end:
            # python 没有 overflow 的问题，直接 // 2 就可以了
            # java和C++ 最好写成 mid = start + (end - start) / 2
            # 防止在 start = 2^31 - 1, end = 2^31 - 1 的情况下出现加法 overflow
            mid = (start + end) // 2

            # > , =, < 的逻辑先分开写，然后在看看 = 的情况是否能合并到其他分支里
            if nums[mid] < target:
                # or start = mid + 1
                start = mid
            elif nums[mid] == target:
                end = mid
            else: 
                # or end = mid - 1
                end = mid

        # 因为上面的循环退出条件是 start + 1 < end
        # 因此这里循环结束的时候，start 和 end 的关系是相邻关系（1和2，3和4这种）
        # 因此需要再单独判断 start 和 end 这两个数谁是我们要的答案
        # 如果是找 first position of target 就先看 start，否则就先看 end
        if nums[start] == target:
            return start
        if nums[end] == target:
            return end

        return -1


跟面试官核实：
    1.输入是否有序
    how are these numbers given, can I assume that they are kind like an array or something
    >> ok oh interesting ok
    2.有没有重复数字
    how about repeating elements, can I assume that they would be like for instance here, what if I didn't have that
    'four', could I use like the 'four' and 'four' to get that 'eight'?
    // you can't repeat the same element at the same index twice but certainly the same number may appear twice
    >> ok ok so like that would be yes
    how about these numbers are they integers or are they floating points
    // you can assume they will be always integers
    >> ok negatives positives
    // negatives can happen
    >> ok cool so well the first the simplest solution of course is just comparing every single possible pair, so I
    >> could just have two for loops, one scanning the whole thing and then the second one starting from let's say you
    >> have the 'I' loop and then the 'J' loop starting from 'I' plus one, so that I don't repeat the same value and
    >> just testing all of them if the sum is equal to the target sum.

    >> I mean that's obviously not very efficient but that would be like a way to solve it
    // that would work, it certainly would be time-consuming 
    >> yeah that would be quadratic, so, better than quadratic, Ah, well, since it's sorted, okay, I guess I need to
    >> figure out when I have a number what I'm looking for is if there's another number that sums to 'eight', so, so,
    >> if I have a 'one' what I'd need to figure out is if there's a 'seven' somewhere in the array and that's the case
    >> it's sorted then I can do binary search, I guess if I go here and I binary search for a 'seven', then I go here
    >> and I binary search for a 'six' which is the complement of that, and when I go here I binary search for a 'five',
    >> and at the end I just don't do anything, and so in this case I would solve it like that.
    >> So that's a bit better than quadratic, I guess binary search is log algorithm in a sorted list. 
    // also an answer, you're kind of slow
    // so what if you took a look at instead of doing a binary search which is unidirectional, what if you started with
    // a pair of numbers to begin with
    >> okay
    // and then work your way through in work from there
    >> let's see, so, if I, okay, let me try to bound this thing, so the, the largest possible sum, I guess would be the
    >> last two values
    // that would be a largest possible sum, yes
    >> the smallest possible sum would be the two smallest right, so, so, anything in between, WOW, okay, so the range
    >> of the possible values is that (posture) right, so there's nothing that is probably small there's nothing that
    >> can be smaller than this value
    // right
    >> there's nothing that can be larger than that value
    >> okay, so, if this sum (the first value + the last value) is 'ten' in this case([1,2,3,9], sum = 8, ans = NO) it's
    >> too large, so I need to find a smaller sum, so I could just move this one over here and if that is too small  now
    >> and I need to move that one over there, okay, so, I can I think I can just do it with with that in a, in a
    >> linear solution just moving at each iteration, I either move the high one lower if I am if my pair is too large
    >> and I move my lower highter if my pair is too small and I end whenever I either find two like in this case I need
    >> to find a pair that adds up to 'eight' or whenever they cross, so every point I'm moving one of them so they
    >> would have to at least cross and I move exactly one so that means that it's linear, yeah, so that that would be a
    >> way of solving that problem. 
    // how does that how does it make that faster than a binary search.
    >> okay so in the binary search case I was doing log for finding but I had to repeat that for every element that I
    >> was an O(nlogn) solution. In this case, I just need to do that moving scanning the one time, so it's a linear
    >> solution, so that's that's faster.
    // so before maybe you could get to coding it but we quit, before we do that maybe you could explain, so if you
    // explained it in a nonworking example, maybe you have fallen through that same process and working.
    >> okay, yeah so here I would start with this and that right. So it's five is smaller than 'eight', so I move this
    >> one here, so that's 'six' that's smaller than 'eight', so I go here, and then that's 'eight', so that's true and
    >> I return.
    // excellent
    >> yeah, I think that would work
    // okay, so what coding language would you prefer to do is it
    >> um,I prefered C++ if that's okay
    // C++ works, okay go for it
    >> ah perfect, let's see. So, okay, now I realize that I haven't figured out what I need to return. So do I want the
    >> pair, the indicies of the pair or whether I just found it or not
    // so for the purpose of the example we'll go with whether you're founder or not, but let's say you were going to
    // return the pair, how could that become a problem that there was no pair

    3.需不需要去掉重复答案


双指针的类型
    1.背向双指针
        第一节课中的Longest Palindromic Substring的中心线枚举算法
        二分法中学到的Find K Closest Elements
    2.相向双指针 O(n)
        Reverse型（题目不多）
        Two Sum型（两位数的相关变形）
        Partition型（两位数的相关变形）
    3.同向双指针
        滑动窗口类Sliding Window
        快慢指针类Fast & Slow Pointers




Binary Search:
    input is an ordered array
    time complexity is O(logn)
    space complexity is O(1)
    it is an idea of Decrease and Conquer, not of Divide and Conquer


O(1)    位运算
O(logn)	二分法，倍增法，快速幂算法，辗转相除法
O(n)	枚举法，双指针算法，单调栈算法，KMP算法，Rabin Karp，Manacher's Algorithm	又称作线性时间复杂度
O(nlogn)	快速排序，归并排序，堆排序
O(n^2)	枚举法，动态规划，Dijkstra
O(n^3)	枚举法，动态规划，Floyd
O(2^n)	与组合有关的搜索问题
O(n!)	与排列有关的搜索问题


O(logn)         二分法比较多
O(sqrt(n))      分解质因数(极少)
O(n)            双指针，单调栈，枚举法
O(nlogn)        排序, O(N * logN 的数据结构上的操作)
O(n^2), O(n^3)  动态规划等
O(2^n)          组合类(combination)的搜索问题
O(n!)           排列类(permutation)的搜索问题


二分法的四重境界：
    // 写出不会死循环的二分法
        start + 1 < end
        start + (end - start) / 2
        A[mid] ==, <, >
        A[start], A[end] ? target
    // 递归与非递归的权衡
    // 二分的三大痛点
    // 通用的二分模版

    >> 在排序的数据集上进行二分 
    >> 找到满足某个条件的第一个位置或者最后一个位置

    // 在未排序的数据集上进行二分
        根据判断保留下有解的那一半或者去掉无解的一半
    // 保留有解的一半，或者去掉无解的一半

    >> 在答案集上进行二分
        step1 确定答案范围
        step2 验证答案大小
    >> 二分答案并验证答案偏大还是偏小
        本质：
            求满足某条件的最大值或最小值
            最终结果是个有限的集合
            每个结果有一个对应的映射
            结果集合跟映射集合正相关或负相关
            可以通过在映射集合上进行二分，从而实现对结果集合的二分


def binarySearch(self, nums, target):
    if not nums:
        return -1

    start, end = 0, len(nums) - 1
    # 用start + 1 < end 而不是 start < end 的目的是为了避免死循环
    # 在first position of target 的情况下不会出现死循环
    # 但是在last position of target 的情况下会出现死循环
    # 样例：nums[1, 1] target = 1
    # 为了统一模版，我们就都采用start + 1 < end，就保证不会出现死循环
    while start + 1 < end:
        # python 没有overflow 的问题，直接// 2就可以了
        # java 和C++ 最好写成 mid = start + (end - start) / 2
        # 防止在start = 2^31 - 1, end = 2^31 - 1 的情况下出现加法overflow
        mid = (start + end) // 2

        # >, =, < 的逻辑先分开写，然后再看看 = 的情况是否能合并到其他分支里
        if nums[mid] < target:
            # 写作 start = mid + 1 也是正确的
            # 只是可以偷懒不写，因为不写也没问题，不会影响时间复杂度
            # 不写的好处是，万一你不小心写成了 mid - 1 你就错了
            start = mid
        elif nums[mid] == target:
            end = mid
        else:
            # 写作 end = mid - 1 也是正确的
            # 只是可以偷懒不写，因为不写也没问题，不会影响时间复杂度
            # 不写的好处是，万一你不小心写成了 mid + 1 你就错了
            end = mid

    # 因为上面的循环退出条件是 start + 1 < end
    # 因此这里循环结束的时候，start 和 end 的关系是相邻关系(1和2，3和4这种)
    # 因此需要再单独判断 start 和 end 这两个数谁是我们要的答案
    # 如果是找 first position of target 就先看 start, 否则就先看 end
    if nums[start] == target:
        return start
    if nums[end] == target;
        return end

    return -1


--------------------------------------------------------------------------------------------------
Index   |Value  |二分问题
--------------------------------------------------------------------------------------------------
0       |1      |
--------------------------------------------------------------------------------------------------
1       |3      |
--------------------------------------------------------------------------------------------------
2       |3      |
--------------------------------------------------------------------------------------------------
3*      |4      |小于5的最大index(或value),插入5的index |
--------------------------------------------------------------------------------------------------
4*      |5      |大于等于5的最小index(或value)          |
---------------------------------------------------------
5       |5      |任意一个出现5的index                   | 5出现的次数 = 等于5的最大index - 等于5的
--------------------------------------------------------- 最小index + 1
6*      |5      |小于等于5的最大index(或value)          |
--------------------------------------------------------------------------------------------------
7*      |7      |大于5的最小index(或value),插入5的index |
--------------------------------------------------------------------------------------------------
8       |8      |
--------------------------------------------------------------------------------------------------
9       |9      |
--------------------------------------------------------------------------------------------------


动态数组:
    (ListinPython,ArrayListinJava,vectorinC++)


倍增的时间复杂度：
    O(x) approx. O(logK)
二分的时间复杂度：
    O(log(2^x)) = O(x) approx. O(logK)


Queue
    队列（queue）是一种采用先进先出（FIFO，first in first out）策略的抽象数据结构。比如生活中排队，总是按照先来的先服务，后来的后服务。队列在数据结构中举足轻重，其在算法中应用广泛，最常用的就是在宽度优先搜索(BFS）中，记录待扩展的节点。

队列内部存储元素的方式，一般有两种，数组（array）和链表（linked list）。两者的最主要区别是：
    1.数组对随机访问有较好性能。
    2.链表对插入和删除元素有较好性能。


用数组实现队列
    在使用数组表示队列时，我们首先要创建一个长度为MAXSIZE的数组作为队列。

    因为MAXSIZE是数组的长度，那MAXSIZE-1就是队列的最大下标了。

    在队列中，除了用一组地址连续的存储单元依次存储从队首到队尾的元素外，还需要附设两个整型变量head和tail分别指示队首和队尾的位置。

    我们主要介绍三个操作：
        初始化队列
        enqueue()向队尾插入元素
        dequeue()删除并返回队首元素

    每次元素入队时，tail向后移动；每次元素出队时，head向后移动。

    我们可以将队列视作一个类，通过成员变量数组来表示一组地址连续的存储单元，再定义两个成员变量head和tail，将队列的基本操作定义成类的方法。（注意：为了将重点放在实现队列上，做了适当简化。示范队列仅支持整数类型，若想实现泛型，可用反射机制和object对象传参；此外，可多做安全检查并抛出异常）
java:
public class MyQueue {
    public int head, tail;
    public int MAXSIZE = 100000;
    public int[] queue = new int[MAXSIZE];

    public MyQueue() {
        head = tail = 0;
        // do initialize if necessary
    }

    public void enqueue(int item) {
        // 队列已满
        if(tail == MAXSIZE){
            return ;
        }

        queue[tail++] = item;
    }

    public int dequeue() {
        // 队列为空
        if (head == tail){
            return -1;
        }

        return queue[head++];
    }
}

python:
class MyQueue(object):

    def __init__(self):
        # do some intialize if necessary
        self.MAXSIZE = 4
        self.queue = [0] * self.MAXSIZE
        self.head, self.tail = 0, 0

    # @param {int} item an integer
    # @return nothing
    def enqueue(self, item):
        queue = self.queue 

        # 队列满 
        if self.tail == self.MAXSIZE:
            return 

        queue[self.tail] = item 
        self.tail += 1 


    # @return an integer
    def dequeue(self):
        queue = self.queue 

        ## 队列为空
        if self.head == self.tail:
            return -1 

        item = queue[self.head]
        self.head += 1 
        return item 


但是大家会发现，如果这样实现队列的话，我们考虑MAXSIZE为4的情况，如果我们采取下面的操作
    enqueue(1)
    enqueue(2)
    enqueue(3)
    enqueue(4)
    dequeue()
    dequeue()
    结束后数组的状态时[^, ^, 3, 4], head = 2, tail = 4。（'^'表示该位置为空，即当前元素已经出队）
    从我们之前的判断来看，tail == MAXSIZE , 当前队列已经满了，不能继续添加元素了，但是实际上我们还可以继续添加元素。因此在使用数组实现队列时，可能会出现空间未有效利用的情况，因此，我们有两种解决方法：
    使用链表来实现队列
    使用数组来实现循环队列


那么我们就先来看用链表来实现队列的方法：

用链表实现队列
    链表是由多个节点构成的，一个节点由两部分组成:一个是数据域,一个是指针域.
    链表分为:单链表(只能是父节点引用子节点),双链表(相邻的节点可相互引用),循环链表(在双链表的基础上,头尾节点可相互引用).
    实现链表,就是在链表里加入节点,使用节点的引用域使节点之间形成连接,可相互调用.
    链表队列的实现原理:首先定义一个节点类,节点类包含引用域和数据域.然后定义一个链表类,链表类形成节点间的引用关系.

我们主要介绍三个操作：
    初始化队列
    enqueue()向队尾插入元素
    dequeue()删除并返回队首元素

在队列中，我们只要用两个指针head和tail分别指向链表的头部和尾部即可实现基本队列功能

java:
class Node {
    public int val;
    public Node next;
    public Node(int _val) {
        val = _val;
        next = null;
    }
}

public class MyQueue {
    public Node head, tail;

    public MyQueue() {
        head = tail = null;
        // do initialize if necessary
    }

    public void enqueue(int item) {
        if (head == null) {
            tail = new Node(item);
            head = tail;        
        } else {
            tail.next = new Node(item);
            tail = tail.next;
        }
    }

    public int dequeue() {
        if (head != null) {
            int item = head.val;
            head = head.next;
            return item;
        }
        return -1;
    }
}

python:
class Node():
    def __init__(self, _val):
        self.next = None
        self.val = _val

class MyQueue(object):

    def __init__(self):
        # do some intialize if necessary
        self.head, self.tail = None, None

    # @param {int} item an integer
    # @return nothing
    def enqueue(self, item):
        if self.head is None:
            self.head = Node(item)
            self.tail = self.head
        else:
            self.tail.next = Node(item)
            self.tail = self.tail.next

    # @return an integer
    def dequeue(self):
        if self.head is not None:
            item = self.head.val
            self.head = self.head.next
            return item
        return -1


可以发现链表可以轻松地避免“假溢出”的问题，因为在每次需要新增元素时，只需要新建一个ListNode就可以了。 当然，我们也可以用循环队列来解决这个问题，接下来我们就来看一下循环队列如何实现队列。

如何自己用数组实现循环队列
    队列是一种先进先出的线性表，它只允许在表的一端进行插入，而在另一端删除元素。允许插入的一端称为队尾，允许删除的一端称为队首。但是我们之前也提到了，数组实现的队列会导致“虽然数组没满，但是tail已经指向了数组末尾，返回数组已满，队列溢出的错误信号”，我们称之为“假溢出”。

    为充分利用向量空间，克服"假溢出"现象的方法是：将向量空间想象为一个首尾相接的圆环，并称这种向量为循环向量。存储在其中的队列称为循环队列（Circular Queue）。循环队列是把顺序队列首尾相连，把存储队列元素的表从逻辑上看成一个环，成为循环队列。

我们主要介绍三个操作：
    初始化循环队列
    enqueue()向队尾插入元素
    dequeue()删除并返回队首元素

在循环队列中，除了用一组地址连续的存储单元依次存储从队首到队尾的元素外，还需要附设两个整型变量head和tail分别指示队首和队尾的位置。

我们可以将循环队列视作一个类，通过成员变量数组来表示一组地址连续的存储单元，再定义两个成员变量head和tail，将循环队列的基本操作定义成类的方法，循环效果则用“模”运算实现，以此来实现循环队列。

每当tail到达末尾的时候，将tail对MAXSIZE取模，使其回到队首。但是如果这样我们会发现一个问题，队列为空和队列已满的条件都成了tail == head。

为了避免这种无法判断的情况，我们规定当循环队列只剩一个空位的时候，就认为队列已满。这样队列已满的条件就成了 (tail + 1) % MAXSIZE == head。

java:
public class MyQueue {
    public int head, tail;
    public int SIZE = 4;
    public int[] queue = new int[SIZE];

    public MyQueue() {
        head = tail = 0;
        // do initialize if necessary
    }
    //压入一个元素
    public void enqueue(int item) {
        // 队列已满
        if ((tail + 1) % SIZE == head){
            return ;
        }

        queue[tail++] = item;
        tail %= SIZE;
    }
    //弹出一个元素
    public int dequeue() {
        // 队列为空
        if (head == tail){
            return -1;
        }

        int item = queue[head++];
        head %= SIZE;
        return item;

    }
}

python:
class MyQueue(object):

    def __init__(self):
        # do some intialize if necessary
        self.SIZE = 100000
        self.queue = [0] * self.SIZE
        self.head, self.tail = 0, 0

    # @param {int} item an integer
    # @return nothing
    # 压入队列
    def enqueue(self, item):
        queue = self.queue 

        # 队列满 
        if (self.tail + 1) % self.SIZE == self.head:
            return 

        queue[self.tail] = item 
        self.tail = (self.tail + 1) % self.SIZE


    # @return an integer
    # 弹出元素
    def dequeue(self):
        queue = self.queue 

        ## 队列为空
        if self.head == self.tail:
            return -1 

        item = queue[self.head]
        self.head = (self.head + 1) % self.SIZE
        return item 


BFS 的使用场景
    1.分层遍历
        一层一层的遍历一个图、树、矩阵
        简单图最短路径
            简单图的定义是，图中所有的边长都一样
    2.连通块问题
        通过图中一个点找到其他所有连通的点
        找到所有方案问题的一种非递归实现方式
    3.拓扑排序
        实现容易度远超过DFS


BFS 的使用场景（summer）
    1.Connected Component
        通过一个点找到图中连通的所有点
        非递归的方式找所有方案
    2.Level Order Traversal
        图的层次遍历
        简单图最短路径Simple Graph Shortest Path
    3.Topological Sorting
        求任意拓扑序
        求是否有拓扑序
        求字典序最小的拓扑序
        求是否唯一拓扑序


以下哪些问题BFS可以处理：
    A.二叉树的层次遍历
    B.求出边长均为5的图的最短路径
    E.求出01矩阵上最大的全0块
    F.我不会写递归，但我需要从10个数中任意拿出5个的所有方案

    非答案：
    D.二叉树的先序遍历
解析：先序遍历通常使用递归方式来实现，即使使用非递归方式，也是借助栈来实现的，所以并不适合BFS，而层次遍历因为是一层一层的遍历，所以是BFS十分擅长的；边长一致的图是简单图，所以可以用BFS，因此B可以，因为BFS只适用于简单图，所以C不可以；矩阵连通块也是BFS可以处理的问题，求出最大块只需要维护一个最大值即可；选项F属于求所有方案问题，因此可以用BFS来处理，但是并不是唯一的解决方式。


BFS 的三种实现方法
    1.单队列
    2.双队列
    3.DummyNode // The "dummy" node is used to simplify some corner cases such as a list with only one node, or removing the head of the list.


二叉树的BFS vs 图的BFS：
    二叉树中进行 BFS 和图中进行 BFS 最大的区别就是二叉树中无需使用 HashSet（C++: unordered_set, Python: set) 来存储访问过的节点（丢进过 queue 里的节点）
    因为二叉树这种数据结构，上下层关系分明，没有环（circle），所以不可能出现一个节点的儿子的儿子是自己的情况。
    但是在图中，一个节点的邻居的邻居就可能是自己了。


有很多种方法可以存储一个图，最常用的莫过于：
    1.邻接矩阵
    2.邻接表
而邻接矩阵因为耗费空间过大，我们通常在工程中都是使用邻接表作为图的存储结构。


邻接矩阵 Adjacency Matrix
    [
    [1,0,0,1],
    [0,1,1,0],
    [0,1,1,0],
    [1,0,0,1]
    ]
    例如上面的矩阵表示0号点和3号点有连边。1号点和2号点有连边。
    当然，每个点和自己也是默认有连边的。
    图中的 0 表示不连通，1 表示连通。
    我们也可以用一个更具体的整数值来表示连边的长度。
    邻接矩阵我们可以直接用一个二维数组表示，如
    int[][] matrix;
    这种数据结构因为耗费 O(n^2) 的空间，所以在稀疏图上浪费很大，因此并不常用。
    

邻接表 Adjacency List ??
    [
    [1],
    [0,2,3],
    [1],
    [1]
    ]
    这个图表示 0 和 1 之间有连边，1 和 2 之间有连边，1 和 3 之间有连边。即每个点上存储自己有哪些邻居（有哪些连通的点）。
    这种方式下，空间耗费和边数成正比，可以记做 O(m)，m代表边数。m最坏情况下虽然也是 O(n^2)，但是邻接表的存储方式大部分情况下会比邻接矩阵更省空间。
    可以用自定义的类来实现邻接表

    Java:
    class DirectedGraphNode {
        int label;
        List neighbors;
        ...
    }

    Python:
    class DirectedGraphNode:
        def init(self, label):
            self.label = label
            self.neighbors = [] # a list of DirectedGraphNode's
            ...


也可以使用 HashMap 和 HashSet 搭配的方式来存储邻接表
    Map<T, Set> = new HashMap<Integer, HashSet>();

Python:
    假设nodes为节点标签的列表:
    使用了Python中的dictionary comprehension语法
    adjacency_list = {x:set() for x in nodes}

另一种写法
    adjacency_list = {}
    for x in nodes:
    adjacency_list[x] = set()
其中 T 代表节点类型。通常可能是整数(Integer)。
这种方式虽然没有上面的方式更加直观和容易理解，但是在面试中比较节约代码量。
而自定义的方法，更加工程化，所以在面试中如果时间不紧张题目不难的情况下，推荐使用自定义邻接表的方式。


为什么 BFS 可以搜索到最短路？
    因为BFS是按照层级进行搜索，所以搜到答案时，一定是最短的一条路径。
    我们可以使用反证法进行证明：
    我们假设当前搜索到的路径 Y 不是最短的，那就说明存在一条更短的路径 X（即 X < Y）。
    令路径 X 中的所有点是 {x1,x2,...,xx}。
    那么x1是起点，且为 BFS 的第一层，x2为第二层......xx为第x层，
    此时的结果与BFS中第Y层初次遇到xx点产生矛盾。
    因此不存在任何一条比Y短的路径能找到终点。


Java:
    值传递，引用传递
Python:
    引用传递
        但是python 的不可变类型可以 认为 是值传递的
C++:
    值传递，引用传递，指针传递


不同语言中呈现值传递的场景：
    Java 的基本数据类型：
        byte, short, int, long, float, double, char, boolean
    C++:
        默认值传递
    Python:
        没有值传递


不同语言中呈现引用传递的场景：
    Java:
        除基本数据类型以外的其他数据
    C++:
        在参数列表中加地址符&修饰
    Python:
        全是引用传递


Recursion/ DFS/ Backtracking:
    递归/ 深搜/ 回溯法

Recursion:
    递归函数：程序的一种实现方式，即函数进行了自我调用
    递归算法：即大问题的结果依赖于小问题的结果，于是先用递归函数求解小问题
    一般我们说递归的时候，大部分时候都在说递归函数而不是递归算法

DFS：
    可以使用递归函数实现
    也可以不用递归函数来实现，如自己通过一个手动创建的栈Stack 进行操作
    深度优先搜索通常是指在搜索的过程中，优先搜索深度更深的点而不是按照宽度搜索同层节点

Backtracking:
    回溯法： == 深度优先搜索算法
    回溯操作：递归函数在回到上一层递归调用处的时候，一些参数需要改回到调用前的值，这个操作就是回溯，即让状态参数回到之前的值，递归调用前做了什么改动，递归调用之后都改回来


遍历法 vs 分治法：
    都可以用DFS实现
    遍历法 = 一个小人拿着一个记事本走遍所有都节点
    分治法 = 分配小弟去做子任务，自己进行结果汇总

    遍历法：通常会用到一个全局变量或者是共享参数
    分治法：通常将利用return value 记录子问题结果
    二叉树上的分治法本质上也是在做遍历（后序遍历）
        先序？中序？后序？


平衡二叉树：
    任意节点左右子树高度之差不超过1


计算深度：
     适合用分治法解决这个问题


Binary Search Tree 二叉查找树：
    一种特殊的二叉树
    定义：
        左子树节点值 < 根节点的值，右子树节点的值 >= 根节点的值
    相等的情况：值相等的点可能在右子树，或者可能在左子树，需要根面试官澄清
    中序遍历：
        中序遍历结果有序（不下降的顺序，有些相邻点可能相等）
            如果二叉树的中序遍历不是“不下降”序列，则一定不是BST
            如果二叉树的中序遍历是“不下降”序列,也未必是BST，反例：{1,1,1}
    二叉查找树的高度：
        最坏O(n), 最好O(logn), 用O(h) 表示更合适
        只有Balanced Binary Tree（平衡二叉树）才是O(logn)


BST 基本操作：
    Build: 1359.Convert Sorted Array to Binary Search Tree
        https://www.lintcode.com/problem/convert-sorted-array-to-binary-search-tree/description

    Insert: 85.Insert Node in a Binary Search Tree
        https://www.lintcode.com/problem/insert-node-in-a-binary-search-tree/description

    Search: 1524.Search in a Binary Search Tree
        https://www.lintcode.com/problem/search-in-a-binary-search-tree/description
        
    Delete: 701.Trim a Binary Search Tree
        https://www.lintcode.com/problem/trim-a-binary-search-tree/description

    Iterate: 86.Binary Search Tree Iterator
        https://www.lintcode.com/problem/binary-search-tree-iterator/description


Red-Black Tree 红黑树：
    是一种 Balanced BST
    Java: TreeMap/TreeSet
    C++: map/set

    Application:
        O(logN) 的时间内实现增删改查
        O(logN) 的时间内实现找最大找最小
        O(logN) 的时间内实现找比某个数小的最大值(upperBound)和比某个数大的最小值(lowerBound)
    
    只考红黑树的应用，不考红黑树的实现


二叉树三种遍历：
    先序遍历 Pre-order
    中序遍历 In-order
    后序遍历 Post-order（分治法）


“二叉树的中序遍历”的非递归实现
    考得最多
    通过实现 hasNext 和 next 两个方法，从而实现二叉查找树的中序遍历迭代器
    https://www.lintcode.com/problem/binary-search-tree-iterator/
        86.Binary Search Tree Iterator
            相当于 Binary Tree In-order Iterator
    实现要点：
        递归->非递归，意味着自己需要控制原来由操作系统控制的栈的进进出出
        如何找到最小的第一个点？最左边的点即是
        如何求出一个二叉树节点在中序遍历中的下一个节点？
            在stack中记录从根节点到当前节点的整条路径
            下一个点 = 右子树最小点 or 路径中最近一个通过左子树包含当前点的点
Python:
def __init__(self, root):
    self.stack = []
    while root != None:
        self.stack.append(root)
        root = root.left

def hasNext(self):
    return len(self.stack) > 0

def next(self):
    node = self.stack[-1]
    if node.right is not None:
        n = node.right
        while n != None:
            self.stack.append(n)
            n = n.left
    else:
        n = self.stack.pop()
        while self.stack and self.stack[-1].right == n:
            n = self.stack.pop()

    return node

Java:
private Stack<TreeNode> stack = new Stack<>();

public BSTIterator(TreeNode root) {
    while (root != null) {
        stack.push(root);
        root = root.left;
    }
}

public boolean hasNext() {
    return !stack.isEmpaty();
}

public TreeNode next() {
    TreeNode curt = stack.peek();
    TreeNode node = curt;

    if (node.right == null) {
        node = stack.pop();
        while (!stack.isEmpty() && stack.peek().right == node) {
            node = stack.pop();
        }
    } else {
        node = node.right;
        while (node != null) {
            stack.push(node);
            node = node.left;
        }
    }

    return curt;
}


BST中最小的节点是从根节点一直往左走遇见的叶子节点，它不一定在树的最底层；BST的特征就是中序遍历是严格递增的；如果这颗BST是一条链，那么找到最小值节点的算法是O(n)的，除非这个BST是一个满二叉树。


简单图：
    没有方向(undirected)
    没有权重(unweighted)
    两点之间最多只有一条边(no multiple edges)
    一个点没有一条边连接着自己(no graph loops, 这里的graph loop指的是自己直接指向自己的loop)


解决最短路径的算法：
    简单图：
        BFS
    复杂图：
        Floyd, Dijkstra, Bellman-ford, SPFA


time compelxity of recursive:
    一次* 次数
space：
    一次 + 深度

遇到二叉树的问题，就想想整棵树在该问题上的结果和左右孩子在该问题上的结果之间有什么联系


拓扑排序Topological Sorting:
    图 + 有依赖关系 + 有向 + 无环 = 拓扑排序

    通过拓扑排序判断是否图是否有环

    入度（in-degree）：
        有向图（Directed Graph）中指向当前节点的点的个数（或指向当前节点的边的条数）

    算法描述：
        1.统计每个点的入度
        2.将每个入度为0的点放入队列（Queue）中作为起始节点
        3.不断从队列中拿出一个点，去掉这个点的所有连边（指向其他点的边），其他点的相应的入度-1
        4.一旦发现新的入度为0的点，丢回队列中

    拓扑排序并不是传统的排序算法：
        一个图可能存在多个拓扑排序（Topological Graph），也可能不存在任何拓扑排序


拓扑排序的四种不同问法：
    求任意拓扑序
    求是否有拓扑序
    求字典序最小的拓扑序
    求是否唯一拓扑序


BFS conclusion:
    1.能用BFS的一定不要用DFS（除非面试官特别要求）
    2.BFS的三个使用场景
        连通块问题
        层级遍历问题
        拓扑排序问题
    3.是否需要层级遍历
        需要多一重循环
    4.矩阵坐标变换数组
        deltaX, deltaY
        是否在界内：isInBound/ isValid


组合类DFS
    在非二叉树上的深度优先搜索（Depth-first Search）中，90%的问题，不是求组合（Combination）就是求排列（Permutation）。特别是组合类的深度优先搜索的问题特别的多。而排列组合类的搜索问题，本质上是一个“隐式图”的搜索问题。


隐式图：
    一个问题如果没有明确的告诉你什么是点，什么是边，但是又需要你进行搜索的话，那就是一个隐式图搜索问题了


BFS vs DFS 复杂度:
    时间复杂度均为:O(V+E)，V为顶点个数，E为边个数 
    宽度优先搜索的空间复杂度取决于宽度 
    深度优先搜索的空间复杂度取决于深度


栈空间一般用于存放对象的引用，值类型变量和函数调用信息，堆空间才是用于存放对象本身的


. and [] 修改的是对象本身，不是引用


递归的三要素：Recursion
    1.递归的定义（代表什么含义，接受什么参数，返回什么值）
    2.递归的拆解（把大问题拆成小问题）
    3.递归的出口（到什么时候结束）


参数传递：值传递，引用传递


递归参考习题771, 1333


尾递归：
    尾递归的特点：
        函数中所有递归形式的调用都出现在函数的末尾
        递归调用不属于表达式的一部分
    尾递归的作用：
        尾递归的调用不会在栈中去创建一个新的
        而是覆盖当前的活动记录
    为什么可以尾递归：
        在回归过程中不用做任何操作


不是所有语言都支持尾递归优化：
    不支持：python, java, C++
    支持：kotlin(tailrec)
    以上四种语言都支持尾递归写法，但是支持尾递归优化都只有kotlin


不支持尾递归优化的语言，解决stackoverflow：
    把递归改成迭代形式
    Note：所谓的尾递归优化，就是把递归改成迭代形式。所以如果语言不支持尾递归优化，需要手动将尾递归改成迭代形式。
            支持尾递归优化的语言，是由编译器自动将尾递归的代码翻译成迭代形式的代码。
    
    如何改成迭代：
        模拟递归中调用下一层的参数传递过程:
            1.先做完本层递归的事儿
            2.再计算出下一层递归的各个参数
            3.然后把值赋给当前层的各个参数
    template:
        def functionName(parameters):
            while True:
                do something ...
                get new parameters
                parameters = new parameters


同余定理：
    x * y % z = (x % z) * (y % z) % z
   
    1. a % b = (a + b) % b
             = (a + 2 * b) % b
             ...
             = (a + k * b) % b, k 是任意整数
    2. x 和 (x % z) 取余相差了整数个z
    3. y 和 (y % z) 取余相差了整数个z


解决99%二叉树问题的算法————分治法
    第一类考察形态：二叉树上求值，求路径
        Maximum/ Minimum/ Average/ Sum/ Paths
    
    第二类考察形态：二叉树结构变化
        

记忆化搜索是动态规划的一种实现方式

记忆化搜索的缺点：
    不适合解决O(n)时间复杂度的DP问题，因为会有StackOverflow的风险


算法思想：
    动态规划，递归，分治法，减治法


递归四要素 vs 动规四要素（状态，方程，初始化，答案）：
    动规的状态 State —— 递归的定义
        用 f[i] 或者 f[i][j] 代表在某些特定条件下某个规模更小的问题的答案
        规模更小用参数 i, j 之类的来划定
    动规的方程 Function —— 递归的拆解
        大问题如何拆解为小问题
        f[i][j] = 通过规模更小的一些状态求 max/ min/ sum/ or 来进行推导
    动规的初始化 Initialize —— 递归的出口
        设定无法再拆解的极限小的状态下的值
        如 f[i][0] 或者 f[0][i]
    动规的答案 Answer —— 递归的调用
        最后要求的答案是什么
        如 f[n][m] 或者 max(f[n][0], f[n][1] ... f[n][m])


动态规划的两种实现方式：
    1.记忆化搜索（使用递归实现）
    2.多重循环（使用for循环实现）


动态规划的使用场景：
    求最值：最大值/ 最小值
    求可行性：是否存在一种方案
    求方案总数：只求总数不求具体方案
        Note: 求具体方案的话，DFS更合适


动态规划的题型：
    *坐标型：一维坐标/ 二维坐标
    *前缀型：一个字符串划分 —— 划分型/ 两个字符串匹配 —— 匹配型
    *背包型：最常考
    区间型：考较少
    博弈型：考得少
    树型：基本不考
    状态压缩性：TSP问题（作为加分项）/ 其他基本不考

不同题型的动态规划对一个的状态表示方法是不同的，如果成功的找对了题型，就能够解决DP最难的状态表示问题

求全部具体方案的问题，虽然有时可以通过动态规划减少一定的运行时间，但是时间复杂度是没法降低的。比如说word break II。因为这种类型的问题，总时间复杂度是与方案总数有关的。其他三种都可以用dp降低时间复杂度。

坐标型动态规划：
    dp[i] 表示从起点到坐标 i 的最优值/ 方案数/ 可行性
    dp[i][j] 表示从起点到坐标 i, j 的最优值/ 方案数/ 可行性
    代表题：Triangle, Unique Paths

前缀型之划分型：
    dp[i] 表示前 i 个字符的最优值/ 方案数/ 可行性
    dp[i][j] 表示前 i 个字符划分为 j 个部分的最值/ 方案数/ 可行性
    代表题：Word Break, Word Break III

前缀型之匹配型：
    dp[i][j] 表示第一个字符串的前 i 个字符匹配上第二个字符串的前 j 个字符的最优值/ 方案数/ 可行性
    代表题：Longest Common Subsequence, Wildcard Matching

区间型：
    dp[i][j] 表示区间 i ~ j 的最优值/ 方案数/ 可行性
    代表题：Stone Game, Burst Ballons

背包型：
    dp[i][j] 表示前 i 个物品里选出一些物品，组成和为 j 的大小的最优值/ 方案数/ 可行性
    两个关键点：前&和
    代表题：Backpack 系列


动态规划的题“必须”是求最优值/ 可行性/ 方案数这三种情况之一
动态规划的状态依赖必须有方向性，“不可以有循环依赖”
坐标型动态规划的状态：“坐标”
坐标型动态规划的方程：“上一步坐标”


经典的01背包问题
    给出n个物品及其大小，问是否能挑选出一些物品装满大小为m的背包
    
    每个物品要么挑0个（不挑），要么挑1个，所以叫01
    如果一个物品可以被分割，就不是01背包
    如果一个物品可以选多份，就叫多重背包

    https://www.jiuzhang.com/problem/backpack
    https://www.jiuzhang.com/solutions/backpack
        Note: 92.backpack.py
    n个物品，m大小的背包，问最多能装多满
        两种状态表示：
            dp[i][j] 表示前i个数里是否能凑出j的和，true/ false
            dp[i][j] 表示前i个数里记录凑出的<= j 的最大和

            第一种状态表示：
                状态State
                    dp[i][j] 表示前i个数里挑若干个数是否能组成和为j
                方程function
                    dp[i][j] = dp[i - 1][j] or dp[i - 1][j - A[i]] 如果 j >= A[i]
                    dp[i][j] = dp[i - 1][j] 如果 j < A[i]
                初始化initialize
                    dp[0][0] = true
                    dp[0][1...m] = false
                答案answer
                    使得dp[n][v], 0 <= v <= m 为true的最大v
                
            第二种状态表示（效率低于第一种）：
                状态State
                    dp[i][j] 表示前i个数里挑出若干个数总和 <= j 的最大和
                方程funciton
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - A[i - 1]] + A[i - 1]) 如果 j >= A[i - 1]
                    dp[i][j] = dp[i - 1][j] 如果 j < A[i - 1]
                初始化initialization
                    dp[0][0...m] = 0
                答案answer
                    dp[n][m]


def get_prefix_sum(self, nums):
    prefix_sum = [0]
    for num in nums:
        prefix_sum.append(prefix_sum[-1] + num)
    return prefix_sum

使用前缀和数组在O（1）的时间复杂度内计算子数组和
    sum from i to j = prefix_sum[j + 1] - prefix_sum[i]



#include <iostream>
#include <string>

int main() {
    std::string name = "wang";
    bool contain = name.find("ng") != std::string::npos;

    cout << contain << endl;
    return 0;
}

DFS 、动态规划、回溯法、递归之间的关系是什么？
递归就是自我调用，经常作为一种编程的实现方式，比如题主问题中的DFS 、动态规划、回溯法都可以用递归来实现，当然也可以用非递归来实现。很多时候一个概念也可以用递归的方式来定义（比如gnu）。

回溯是一种通用的算法，把问题分步解决，在每一步都试验所有的可能，当发现已经找到一种方式或者目前这种方式不可能是结果的时候，退回上一步继续尝试其他可能。很多时候每一步的处理都是一致的，这时候用递归来实现就很自然。

当回溯用于树的时候，就是深度优先搜索。当然了，几乎所有可以用回溯解决的问题都可以表示为树。那么这俩在这里就几乎同义了。如果一个问题解决的时候显式地使用了树，那么我们就叫它dfs。很多时候没有用树我们也管它叫dfs严格地说是不对的，但是dfs比回溯打字的时候好输入。别的回答里提到了砍枝，实际上这二者都可以砍枝。

至于动态规划，被题主放到这里是因为都是竞赛中经常会遇到并且学起来不容易明白吗？回溯可以用于所有用穷举法可以解决的问题，而DP只用于具有最优子结构的问题。所以不是所有问题都适合用dp来解决，比如八皇后。dp需要存贮子问题的解，回溯不需要。














                    



