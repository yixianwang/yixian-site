+++
title = 'Algorithms Notebook'
date = 2023-10-24T03:10:46-04:00
+++

# Contents

- [Contents](#contents)
- [1. Notes](#1-notes)
  - [Templates](#templates)
    - [Binary Search 二分法](#binary-search-二分法)
    - [Two Pointers 双指针](#two-pointers-双指针)
    - [Sorting 排序算法](# -排序算法)
    - [Binary Tree Divide & Conquer 二叉树分治](#binary-tree-divide--conquer-二叉树分治)
    - [BST Iterator 二叉搜索树非递归](#bst-iterator-二叉搜索树非递归)
    - [BFS 宽度优先搜索](#bfs-宽度优先搜索)
    - [DFS 深度优先搜索](#dfs-深度优先搜索)
    - [Dynamic Programming 动态规划](#dynamic-programming-动态规划)
    - [Heap 堆](#heap-堆)
    - [Union Find 并查集](#union-find-并查集)
    - [Trie 字典树](#trie-字典树)
  - [Data Structure Implementations](#data-structure-implementations)
    - [LRU implementation](#lru-implementation)
    - [HashMap Implementation](#hashmap-implementation)
  - [Other Notes](#other-notes)
    - [通过数据范围推测算法](#通过数据范围推测算法)
- [2. Algorithms](#2-algorithms)
  - [Google](#google)
    - [new 200.最长回文子串](#new-200最长回文子串)
    - [new 575.字符串解码](#new-575字符串解码)
    - [new 1082.员工的重要度](#new-1082员工的重要度)
    - [new 257.最长字符串链](#new-257最长字符串链)
    - [new 1001.小行星的碰撞](#new-1001小行星的碰撞)
    - [new 984.等差切片 II-子序列](#new-984等差切片ii-子序列)
    - [new 890.最短的唯一单词缩写](#new-890最短的唯一单词缩写)
    - [new 1869.统计全为 1 的正方形子矩阵](#new-1869统计全为1的正方形子矩阵)
    - [new 1024.满足要求的子串个数](#new-1024满足要求的子串个数)
    - [new 978.基础计算器](#new-978基础计算器)
    - [new 300.会议室 4](#new-300会议室4)
    - [new 919.会议室 II](#new-919会议室ii)
    - [new 1897.会议室 3](#new-1897会议室3)
    - [new 1281.前 K 个高频元素](#new-1281前k个高频元素)
    - [new 1844.子数组和为 KII](#new-1844子数组和为kii)
    - [new 1240.路径总和 III](#new-1240路径总和iii)
    - [new 804.不同岛屿的数量 II](#new-804不同岛屿的数量ii)
    - [new 1361·文字并排](#new-1361文字并排)
    - [156.合并区间](#156合并区间)
    - [122.直方图最大矩形覆盖](#122直方图最大矩形覆盖)
    - [1370.赛车](#1370赛车)
    - [615.课程表](#615课程表)
    - [1299.猜数字游戏](#1299猜数字游戏)
    - [137.克隆图](#137克隆图)
    - [134.LRU 缓存策略](#134lru缓存策略)
    - [53.翻转字符串](#53翻转字符串)
    - [941.滑动拼图](#941滑动拼图)
    - [257.最长字符串链](#257最长字符串链)
    - [669.换硬币](#669换硬币)
    - [914.翻转游戏](#914翻转游戏)
    - [888.有效单词方阵](#888有效单词方阵)
    - [514.栅栏染色](#514栅栏染色)
    - [407.加一](#407加一)
    - [1871.最大时刻](#1871最大时刻)
    - [1432.新 21 点](#1432新21点)
    - [1723.网格中的最短路径](#1723网格中的最短路径)
    - [802.数独](#802数独)
    - [1506.二叉树中所有距离为 K 的结点](#1506二叉树中所有距离为k的结点)
    - [1704.二叉搜索树的范围和](#1704二叉搜索树的范围和)
    - [86.二叉查找树迭代器](#86二叉查找树迭代器)
    - [362.滑动窗口的最大值](#362滑动窗口的最大值)
    - [653.添加运算符](#653添加运算符)
    - [780.删除无效的括号](#780删除无效的括号)
  - [Facebook](#facebook)
    - [new 1507.和至少为 K 的最短子数组](#new-1507和至少为k的最短子数组)
    - [new 163.不同的二叉查找树](#new-163不同的二叉查找树)
    - [new 52.下一个排列](#new-52下一个排列)
    - [new 1025.自定义字符串排序](#new-1025自定义字符串排序)
    - [new 1450.矩形面积](#new-1450矩形面积)
    - [new 641.丢失的间隔](#new-641丢失的间隔)
    - [new 831.三数之和 II](#new-831三数之和ii)
    - [new 428.x 的 n 次幂](#new-428x的n次幂)
    - [new 114.不同的路径](#new-114不同的路径)
    - [new 32.最小子串覆盖](#new-32最小子串覆盖)
    - [new 64.合并排序数组](#new-64合并排序数组)
    - [new 17.子集](#new-17子集)
    - [new 123.单词搜索](#new-123单词搜索)
    - [new 137.克隆图](#new-137克隆图)
    - [new 104.合并 k 个排序链表](#new-104合并k个排序链表)
    - [new 1353.根节点到叶节点求和](#new-1353根节点到叶节点求和)
    - [new 187.加油站](#new-187加油站)
    - [new 134.LRU 缓存策略](#new-134lru缓存策略)
    - [new 1304.H 指数](#new-1304h指数)
    - [new 54.转换字符串到整数](#new-54转换字符串到整数)
    - [new 425.电话号码的字母组合](#new-425电话号码的字母组合)
    - [new 1311.二叉搜索树的最近公共祖先](#new-1311二叉搜索树的最近公共祖先)
    - [new 88.最近公共祖先](#new-88最近公共祖先)
    - [new 891.有效回文 II](#new-891有效回文ii)
    - [new 1889.区间合并](#new-1889区间合并)
    - [new 52.二叉树垂直遍历](#new-52二叉树垂直遍历)
    - [new 1205.对角线遍历](#new-1205对角线遍历)
    - [new 838.子数组和为 K](#new-838子数组和为k)
    - [new 165.合并两个排序链表](#new-165合并两个排序链表)
    - [new 363.接雨水](#new-363接雨水)
    - [new 105.复制带随机指针的链表](#new-105复制带随机指针的链表)
    - [new 665.平面范围求和-不可变矩阵](#new-665平面范围求和-不可变矩阵)
    - [135.数字组合](#135数字组合)
    - [153.数字组合 II](#153数字组合ii)
    - [34.N 皇后问题（二）](#34n皇后问题二)
    - [156.合并区间](#156合并区间-1)
    - [30.插入区间](#30插入区间)
    - [408.二进制求和](#408二进制求和)
    - [141.对 x 开根](#141对x开根)
    - [36.翻转链表（二）](#36翻转链表二)
    - [95.验证二叉查找树](#95验证二叉查找树)
    - [453.将二叉树拆成链表](#453将二叉树拆成链表)
    - [94.二叉树中的最大路径和](#94二叉树中的最大路径和)
    - [415.有效回文串](#415有效回文串)
    - [121.单词接龙 II](#121单词接龙ii)
    - [120.单词接龙](#120单词接龙)
    - [477.被围绕的区域](#477被围绕的区域)
    - [82.落单的数](#82落单的数)
    - [107.单词拆分（一）](#107单词拆分一)
    - [582.单词拆分 II](#582单词拆分ii)
    - [160.寻找旋转排序数组中的最小值 II](#160寻找旋转排序数组中的最小值ii)
    - [12.带最小值操作的栈](#12带最小值操作的栈)
    - [660.用 Read4 从文件中读取 N 个字符 II-多次调用](#660用read4从文件中读取n个字符ii-多次调用)
    - [86.二叉查找树迭代器](#86二叉查找树迭代器-1)
    - [760.二叉树的右视图](#760二叉树的右视图)
    - [433.岛屿的个数](#433岛屿的个数)
    - [616.课程表 II](#616课程表ii)
    - [2314.列表修改、添加和删除元素](#2314列表修改添加和删除元素)
    - [606.第 K 大的元素 II](#606第k大的元素ii)
    - [980.基础计算器 II](#980基础计算器ii)
    - [362.滑动窗口的最大值](#362滑动窗口的最大值-1)
    - [468.对称二叉树](#468对称二叉树)
    - [1212.最大连续 1 的个数](#1212最大连续1的个数)
    - [1310.数组除了自身的乘积](#1310数组除了自身的乘积)
    - [74.第一个错误的代码版本](#74第一个错误的代码版本)
    - [418.整数转罗马数字](#418整数转罗马数字)
    - [653.添加运算符](#653添加运算符-1)
    - [7.二叉树的序列化和反序列化](#7二叉树的序列化和反序列化)
    - [780.删除无效的括号](#780删除无效的括号-1)
    - [669.换硬币](#669换硬币-1)
    - [910.最大二叉搜索子树](#910最大二叉搜索子树)
    - [551.嵌套列表的加权和](#551嵌套列表的加权和)
    - [746.设计井字棋](#746设计井字棋)
    - [1272.有序矩阵中的第 K 小元素](#1272有序矩阵中的第k小元素)
    - [1263.是子序列吗？](#1263是子序列吗)
    - [639.单词缩写](#639单词缩写)
    - [655.大整数加法](#655大整数加法)
    - [647.子串字谜](#647子串字谜)
    - [1222.检验 IP 地址](#1222检验ip地址)
    - [1212.最大连续 1 的个数](#1212最大连续1的个数-1)
    - [707.最优账户结余](#707最优账户结余)
    - [1183.排序数组中的单个元素](#1183排序数组中的单个元素)
    - [945.任务计划](#945任务计划)
    - [1115.二叉树每层的平均数](#1115二叉树每层的平均数)
    - [397.最长上升连续子序列](#397最长上升连续子序列)
    - [1042.托普利兹矩阵](#1042托普利兹矩阵)
    - [810.水位上升的泳池中游泳](#810水位上升的泳池中游泳)
    - [1031.图可以被二分么？](#1031图可以被二分么)
    - [1394.山羊拉丁文](#1394山羊拉丁文)
    - [1721.使括号有效的最少添加](#1721使括号有效的最少添加)
    - [1704.二叉搜索树的范围和](#1704二叉搜索树的范围和-1)
    - [1702.不同的子序列 II](#1702不同的子序列ii)
    - [1876.外星人字典（简单）](#1876外星人字典简单)
    - [1901.有序数组的平方](#1901有序数组的平方)
    - [149.买卖股票的最佳时机](#149买卖股票的最佳时机)
    - [402.连续子数组求和](#402连续子数组求和)
    - [412.分糖果](#412分糖果)
    - [920.会议室](#920会议室)
    - [57.三数之和](#57三数之和)
    - [148.颜色挑选](#148颜色挑选)
    - [919.会议室 Ⅱ](#919会议室ⅱ)
    - [1393.适龄的朋友](#1393适龄的朋友)
    - [1465.任务顺序](#1465任务顺序)
    - [1506.二叉树中所有距离为 K 的结点](#1506二叉树中所有距离为k的结点-1)
    - [41.最大子数组](#41最大子数组)
    - [172.删除元素](#172删除元素)
    - [397.最长上升连续子序列](#397最长上升连续子序列-1)
    - [539.移动零](#539移动零)
    - [647.子串字谜](#647子串字谜-1)
    - [767.翻转数组](#767翻转数组)
    - [1745.单调数列](#1745单调数列)
    - [52.下一个排列](#52下一个排列)
    - [62.搜索旋转排序数组](#62搜索旋转排序数组)
    - [200.最长回文子串](#200最长回文子串)
    - [154.正则表达式匹配](#154正则表达式匹配)
    - [172.删除元素](#172删除元素-1)
    - [414.两个整数相除](#414两个整数相除)
    - [193.最长有效括号](#193最长有效括号)
    - [420.报数](#420报数)
  - [Amazon](#amazon)
    - [new 209.第一个只出现一次的字符](#new-209第一个只出现一次的字符)
    - [new 36.翻转链表（二）](#new-36翻转链表二)
    - [new 149.买卖股票的最佳时机](#new-149买卖股票的最佳时机)
    - [new 209.第一个只出现一次的字符](#new-209第一个只出现一次的字符-1)
    - [new 859.最大栈](#new-859最大栈)
    - [new 1234.删除二叉搜索树中的节点](#new-1234删除二叉搜索树中的节点)
    - [new 980.基础计算器 II](#new-980基础计算器ii)
    - [new 158.两个字符串是变位词](#new-158两个字符串是变位词)
    - [new 120.单词接龙](#new-120单词接龙)
    - [28.搜索二维矩阵](#28搜索二维矩阵)
    - [56.两数之和](#56两数之和)
    - [69.二叉树的层次遍历](#69二叉树的层次遍历)
    - [165.合并两个排序链表](#165合并两个排序链表)
    - [193.最长有效括号](#193最长有效括号-1)
    - [423.有效的括号序列](#423有效的括号序列)
    - [433.岛屿的个数](#433岛屿的个数-1)
    - [488.快乐数](#488快乐数)
    - [597.具有最大平均数的子树](#597具有最大平均数的子树)
    - [1181.二叉树的直径](#1181二叉树的直径)
    - [38.搜索二维矩阵（二）](#38搜索二维矩阵二)
    - [34.N 皇后问题（二）](#34n皇后问题二-1)
    - [94.二叉树中的最大路径和](#94二叉树中的最大路径和-1)
    - [105.复制带随机指针的链表](#105复制带随机指针的链表)
    - [107.单词拆分（一）](#107单词拆分一-1)
    - [200.最长回文子串](#200最长回文子串-1)
    - [363.接雨水](#363接雨水)
    - [382.三角形计数](#382三角形计数)
    - [460.在排序数组中找最接近的 K 个数](#460在排序数组中找最接近的k个数)
    - [471.最高频的 K 个单词](#471最高频的k个单词)
    - [563.背包问题 V](#563背包问题v)
    - [564.组合总和 IV](#564组合总和iv)
    - [54.转换字符串到整数](#54转换字符串到整数)
    - [121.单词接龙 II](#121单词接龙ii-1)
    - [1221.连接词](#1221连接词)
  - [Microsoft](#microsoft)
    - [new 88.最近公共祖先](#new-88最近公共祖先-1)
    - [new 372.在 O(1)时间复杂度删除链表节点](#new-372在o1时间复杂度删除链表节点)
    - [new 1301.生命游戏](#new-1301生命游戏)
    - [new 1281.前 K 个高频元素](#new-1281前k个高频元素-1)
    - [new 374.螺旋矩阵](#new-374螺旋矩阵)
    - [new 24.LFU 缓存](#new-24lfu缓存)
    - [new 28.搜索二维矩阵](#new-28搜索二维矩阵)
    - [new 491.回文数](#new-491回文数)
    - [new 93.平衡二叉树](#new-93平衡二叉树)
    - [new 300.会议室 4](#new-300会议室4-1)
    - [new 919.会议室 II](#new-919会议室ii-1)
    - [new 1897.会议室 3](#new-1897会议室3-1)
    - [new 1844.子数组和为 KII](#new-1844子数组和为kii-1)
    - [new 46.主元素](#new-46主元素)
    - [new 1360.对称树](#new-1360对称树)
    - [new 556.标准型布隆过滤器](#new-556标准型布隆过滤器)
    - [new 173.链表插入排序](#new-173链表插入排序)
    - [new 804.不同岛屿的数量 II](#new-804不同岛屿的数量ii-1)
    - [new 573.邮局的建立 II](#new-573邮局的建立ii)
    - [new 1273.最长上升字符串](#new-1273最长上升字符串)
    - [new 156.合并区间](#new-156合并区间)
    - [new 121.单词接龙 II](#new-121单词接龙ii)
    - [new 1361.文字并排](#new-1361文字并排-1)
    - [156.合并区间](#156合并区间-2)
    - [646.第一个独特字符位置](#646第一个独特字符位置)
    - [693.移掉 K 位数字](#693移掉k位数字)
    - [756.两数相乘](#756两数相乘)
    - [1311.二叉搜索树的最近公共祖先](#1311二叉搜索树的最近公共祖先)
    - [1324.质数的个数](#1324质数的个数)
    - [62.搜索旋转排序数组](#62搜索旋转排序数组-1)
    - [102.带环链表](#102带环链表)
    - [221.链表求和 II](#221链表求和ii)
    - [915.BST 的中序前驱节点](#915bst的中序前驱节点)
    - [927.翻转字符串 II](#927翻转字符串ii)
    - [86.二叉查找树迭代器](#86二叉查找树迭代器-2)
    - [103.带环链表 II](#103带环链表ii)
    - [450.K 组翻转链表](#450k组翻转链表)
    - [849.基础计算器 III](#849基础计算器iii)
    - [131.大楼轮廓](#131大楼轮廓)
  - [Linkedin](#linkedin)
    - [new 451.两两交换链表中的节点](#new-451两两交换链表中的节点)
    - [new 433.岛屿的个数](#new-433岛屿的个数)
    - [new 1790.旋转字符串 II](#new-1790旋转字符串ii)
    - [new 924.单词最短距离](#new-924单词最短距离)
    - [new 551.嵌套列表的加权和](#new-551嵌套列表的加权和)
    - [new 1489.最大矩阵边界和](#new-1489最大矩阵边界和)
    - [new 1360.对称树](#new-1360对称树-1)
    - [new 926.最短单词距离 III](#new-926最短单词距离iii)
    - [new 578.最近公共祖先 III](#new-578最近公共祖先iii)
    - [new 859.最大栈](#new-859最大栈-1)
    - [41.最大子数组](#41最大子数组-1)
    - [56.数之和](#56数之和)
    - [69.叉树的层次遍历](#69叉树的层次遍历)
    - [16.合并两个排序链表](#16合并两个排序链表)
    - [423.有效的括号序列](#423有效的括号序列-1)
    - [15.全排列](#15全排列)
    - [1534.将二叉搜索树转换为已排序的双向链接列表](#1534将二叉搜索树转换为已排序的双向链接列表)
    - [104.合并 k 个排序链表](#104合并k个排序链表)
    - [189.丢失的第一个正整数](#189丢失的第一个正整数)
    - [191.乘积最大子序列](#191乘积最大子序列)
    - [392.打劫房屋](#392打劫房屋)
    - [415.有效回文串](#415有效回文串-1)
    - [424.逆波兰表达式求值](#424逆波兰表达式求值)
    - [578.最近公共祖先 III](#578最近公共祖先iii)
    - [612.K 个最近的点](#612k个最近的点)
    - [652.因式分解](#652因式分解)
    - [926.最短单词距离 III](#926最短单词距离iii)
    - [933.数组乘积](#933数组乘积)
    - [934.开锁问题](#934开锁问题)
    - [935.笛卡尔积](#935笛卡尔积)
    - [86.二叉查找树迭代器](#86二叉查找树迭代器-3)
    - [738.计数回文子序列](#738计数回文子序列)
    - [859.最大栈](#859最大栈)
    - [985.我能赢吗](#985我能赢吗)
    - [1361.文字并排](#1361文字并排)
  - [Others](#others)
    - [476.Stone Game 石子归并](#476stone-game-石子归并)
- [3. ML](#3-ml)
  - [Linear regression](#linear-regression)
  - [Logistic regression](#logistic-regression)
  - [Decision tree](#decision-tree)
  - [SVM algorithm](#svm-algorithm)
  - [Naive Bayes algorithm](#naive-bayes-algorithm)
  - [KNN algorithm](#knn-algorithm)
  - [K-means](#k-means)
  - [Random forest algorithm](#random-forest-algorithm)
  - [Dimensionality reduction algorithms](#dimensionality-reduction-algorithms)
  - [Gradient boosting algorithm and AdaBoosting algorithm](#gradient-boosting-algorithm-and-adaboosting-algorithm)
- [4. Projects](#4-projects)
  - [Pthread Prefix Sum](#pthread-prefix-sum)
  - [GPU K-means](#gpu-k-means)
  - [Tree Comparison](#tree-comparison)
  - [Two Phase Commit Protocol](#two-phase-commit-protocol)
  - [MPI Barnes-hut](#mpi-barnes-hut)

# 1. Notes

## Templates

### Binary Search 二分法

**_使用条件_**

1. 排序数组(30-40%)
2. 当面试官要求找一个比`O(n)`更小的时间复杂度算法的时候(99%)
3. 找到数组中的一个分割位置，使得左半部分满足某个条件，右边部分不满足(100%)
4. 找到一个最大/最小的值使得某个条件被满足(90%)

**_复杂度_**

- 时间复杂度`O(logn)`
- 空间复杂度`O(1)`

**_例题_**

- [LintCode 14.二分查找(在排序的数据集上进行二分)](https://www.lintcode.com/problem/14/?utm_source=sc-github-thx)
  - [C++](legacy/14.binary_search.cpp)
- [LintCode 460.在排序数组中找最接近的 K 个数(在排序的数据集上进行二分)](https://www.lintcode.com/problem/460/?utm_source=sc-github-thx)
  - [Python](./legacy/460.k_closest_numbers.py)
- [LintCode 437.书籍复印(在答案集上进行二分)](https://www.lintcode.com/problem/437/?utm_source=sc-github-thx)
  - [Python](./legacy/437.copy_books.py)

```python
# Python
def binary_search(self, nums, target):
    # corner case 处理

    # 这里等价于nums is None or len(nums) == 0
    if not nums:
      return -1

    start, end = 0, len(nums) - 1

    # 用start + 1 < end而不是start < end的目的是为了避免死循环
      # 在first position of target的情况下不会出现死循环
      # 但是在last position of target的情况下会出现死循环
    # 样例：nums = [1, 1] target = 1
    # 为了统一模版，我们就都采用start + 1 < end，就保证不会出现死循环
    while start + 1 < end:

      # python 没有overflow的问题，直接 // 2 就可以
      # C++ 和 Java 最好写成mid = start + (end - start) / 2
      # 防止在start = 2^31 - 1, end = 2^31 - 1的情况下出现加法overflow
      mid = (start + end) // 2

      # >, =, < 的逻辑先分开写，然后再看看=的情况是否能合并到其他分支里
      if nums[mid] < target:
        start = mid
      elif nums[mid] == target:
        end = mid
      else:
        end = mid

  # 因为上面的循环退出条件是start + 1 < end
  # 因此这里循环结束的时候，start和end的关系是相邻关系
  # 因此需要再单独判断start和end这两个位置的数哪个是我们要的答案
  # 如果是找first position of target就先看start，否则就先看end
  if nums[start] == target:
    return start
  if nums[end] == target:
    return end
  return -1
```

### Two Pointers 双指针

**_双指针的类型_**

1. 背向双指针

- 第一节课中的 Longest Palindromic Substring 的中心线枚举算法
- 二分法中学到的 Find K Closest Elements

2. 相向双指针 O(n)

- Reverse 型（题目不多）
- Two Sum 型（两位数的相关变形）
- Partition 型（两位数的相关变形）

3. 同向双指针

- 滑动窗口类 Sliding Window
- 快慢指针类 Fast & Slow Pointers

**_使用条件_**

1. 滑动窗口(90%)
2. 时间复杂度要求 O(n)(80%)
3. 要求原地操作，只可以使用交换，不能使用额外空间(80%)
4. 有子数组`subarray` / 子字符串`substring`的关键词(50%)
5. 有回文`Palindrome`关键词(50%)

**_复杂度_**

- 时间复杂度`O(n)`
  - 时间复杂度与最内层循环主体的执行次数有关
  - 与有多少重循环无关
- 空间复杂度`O(1)`
  - 只需要分配两个指针的额外内存

**_例题_**

- [LintCode 1879.两数之和 VII(同向双指针)](https://www.lintcode.com/problem/1879/?utm_source=sc-github-thx)
  - [C++](legacy/1879.two_sum_vii.cpp)
- [LintCode 1712.和相同的二元子数组(相向双指针)](https://www.lintcode.com/problem/1712/?utm_source=sc-github-thx)
- [LintCode 627.最长回文串(背向双指针)](https://www.lintcode.com/problem/627/?utm_source=sc-github-thx)
- [LintCode 64.合并有序数组](https://www.lintcode.com/problem/64/)

```python
# Python
# 相向双指针(partition in quicksort)
def partition(self, A, start, end) {
  if start >= end:
    return

  left, right = start, end

  # key point 1: pivot is the value, not the index
  pivot = A[(start + end) // 2]

  # key point 2: every time compare left with right, it should be
  # left <= right not left < right
  while left <= right:
    while left <= right and A[left] < pivot:
      left += 1
    while left <= right and A[right] > pivot:
      right -= 1
    if left <= right:
      A[left], A[right] = A[right], A[left]
      left += 1
      right -= 1
}

# 背向双指针
  left = position
  right = position + 1

  while left >= 0 and right < len(s):
    if left 和 right 可以停下来了:
      break
    left -= 1
    right += 1

# 同向双指针
  end = 0
  for start in range(len):
    # 不满足则循环到满足搭配为止
    while end < len and (start 到 end 之间不满足条件):
      end += 1
    if start 到 end 之间满足条件:
      处理 start 到 end 这段区间(处理start, end这次搭配)

# 合并双指针
def merge(list1, list2):
  new_list = []
  i, j = 0, 0

  # 合并的过程只能操作i, j的移动，不要去用list1.pop(0)之类的操作
  # 因为pop(0)是O(n)的时间复杂度
  while i < len(list1) and j < len(list2):
    if list1[i] < list2[j]:
      new_list.append(list1[i])
      i += 1
    else:
      new_list.append(list2[j])
      j += 1

  # 合并剩下的数到new_list里
  # 不要用new_list.extend(list[i:])之类的方法
  # 因为list1[i:]会产生额外空间消耗
  while i < len(list1):
    new_list.append(list1[i])
    i += 1

  while j < len(list2):
    new_list.append(list2[j])
    j += 1

  return new_list
```

### Sorting 排序算法

**_复杂度_**

- 时间复杂度
  - 快速排序(期望复杂度)：`O(nlogn)`
  - 归并排序(最坏复杂度)：`O(nlogn)`
- 空间复杂度
  - 快速排序：`O(1)`
  - 归并排序：`O(n)`

**_例题_**

- [LintCode 463.整数排序](https://www.lintcode.com/problem/463/?utm_source=sc-github-thx)
- [LintCode 464.整数排序 II](https://www.lintcode.com/problem/464/?utm_source=sc-github-thx)

```python
# Python
# quick sort
class Solution:
  def sortIntegers(self, A):
    self.quickSort(A, 0, len(A) - 1)

  def quickSort(self, A, start, end):
    if start >= end:
      return

    left, right = start, end

    # key point 1: pivot is the value, not the index
    pivot = A[(start + end) // 2]

    # key point 2: every time you compare left with right, it should be
    # left <= right not left < right
    while left <= right:
      while left <= right and A[left] < pivot:
        left += 1

      while left <= right and A[right] > pivot:
        right -= 1

      if left <= right:
        A[left], A[right] = A[right], A[left]

        left += 1
        right -= 1

    self.quickSort(A, start, right)
    self.quickSort(A, left, end)
```

```python
# Python
# merge sort
class Solution:
  def sortIntegers(self, A):
    if not A:
      return A

    tmp = [0] * len(A)
    self.merge_sort(A, 0, len(A) - 1, temp)

  def merge_sort(self, A, start, end, temp):
    if start >= end:
      return

    # 处理左半区间
    self.merge_sort(A, start, (start + end) // 2, temp)

    # 处理右半区间
    self.merge_sort(A, (start + end) // 2 + 1, end, temp)

    # 合并排序数组
    self.merge(A, start, end, temp)

  def merge(self, A, start, end, temp):
    middle = (start + end) // 2
    left_index = start
    right_index = middle + 1
    index = start

    while left_index <= middle and right_index <= end:
      if A[left_index] < A[right_index]:
        temp[index] = A[left_index]
        index += 1
        left_index += 1
      else:
        temp[index] = A[right_index]
        index += 1
        right_index += 1

    while left_index <= middle:
      temp[index] = A[left_index]
      index += 1
      left_index += 1

    while right_index <= end:
      temp[index] = A[right_index]
      index += 1
      right_index += 1

    for i in range(start, end + 1):
      A[i] = temp[i]
```

> Simple sort: O(n^2): insert sort  

> Better sort: O(nlogn): merge sort, quick sort, heap sort  
> Lower Bound for comparison-based sort is Omega(nlogn) ---> based on comparison

> Radix sort: O(n) ---> based on indexing  
> 



### Binary Tree Divide & Conquer 二叉树分治

**_使用条件_**

1. 二叉树相关的问题(99%)
2. 可以一分为二去分别处理之后再合并结果(100%)
3. 数组相关的问题(10%)

**_复杂度_**

- 时间复杂度`O(n)`
- 空间复杂度`O(n)`(含递归调用的栈空间最大耗费)

**_例题_**

- [LintCode 1534.将二叉搜索树转换为已排序的双向链接列表](https://www.lintcode.com/problem/1534/?utm_source=sc-github-thx)
- [LintCode 94.二叉树中的最大路径和](https://www.lintcode.com/problem/94/?utm_source=sc-github-thx)
- [LintCode 95.验证二叉查找树](https://www.lintcode.com/problem/95/?utm_source=sc-github-thx)

```python
# Python
def divide_conquer(root):

  # 递归出口
  # 一般处理 node == null 就够了
  # 大部分情况下不需要处理 node == leaf
  if root is None:
    return ...

  # 处理左子树
  left_result = divide_conquer(node.left)

  # 处理右子树
  right_result = divide_conquer(node.right)

  # 合并答案
  result = merge left_result and right_result to get merge result

  return result
```

### BST Iterator 二叉搜索树非递归

**_使用条件_**

1. 用非递归的方式`(Non-recursion / Iteration)`实现二叉树的中序遍历
2. 常用于`BST`但不仅仅可以用于`BST`

**_复杂度_**

- 时间复杂度`O(n)`
- 空间复杂度`O(n)`

**_例题_**

- [LintCode 67.二叉树的中序遍历](https://www.lintcode.com/problem/67/?utm_source=sc-github-thx)
- [LintCode 902.二叉搜索树的第 k 大元素](https://www.lintcode.com/problem/902/?utm_source=sc-github-thx)

```python
# Python
def inorder_traversal(root):
  if root is None:
    return []

  # 创建一个dummy node，右指针指向root
  # 并放到stack里，此时stack的栈顶dymmy是iterator的当前位置
  dummy = TreeNode(0)
  dummy.right = root
  stack = [dummy]
  inorder = []

  # 每次将iterator挪到下一个点
  # 也就是调整stack使得栈顶到下一个点
  while stack:
    node = stack.pop()
    if node.right:
      node = node.right
      while node:
        stack.append(node)
        node = node.left

    if stack:
      inorder.append(stack[-1])

  return inorder

```

### BFS 宽度优先搜索

**_使用条件_**

1. 分层遍历(100%)
   - 一层一层的遍历一个图、树、矩阵
   - 简单图最短路径(100%)
     - 简单图的定义是，图中所有的边长都一样
1. 出现`连通块`的关键词(100%)
   - 通过图中一个点找到其他所有连通的点
   - 找到所有方案问题的一种非递归实现方式
1. 拓扑排序(100%)
   - 实现容易度远超`DFS`
1. 给定一个变换规则，从初始状态变到终止状态最少几步(100%)

**_复杂度_**

- 时间复杂度`O(n + m)`
  - `n`是点数，`m`是边数
- 空间复杂度`O(n)`

**_例题_**

- [LintCode 974.01 矩阵(分层遍历)](https://www.lintcode.com/problem/974/?utm_source=sc-github-thx)
- [LintCode 431.找无向图的连通块](https://www.lintcode.com/problem/431/?utm_source=sc-github-thx)
- [LintCode 127.拓扑排序](https://www.lintcode.com/problem/127/?utm_source=sc-github-thx)

```python
# Python
def bfs(start_node):

  # BFS必须要用队列queue，别用栈stack！
  # distance(dict) 有两个作用，一个是记录一个点是否被丢进过队列了，避免重复访问
  # 另外一个是记录start_node到其他所有节点的最短距离
  # 如果只求连通性的话，可以换成set就行
  # node做key的时候比较的是内存地址
  queue = collections.deque([start_node])
  distance = {start_node: 0}

  # while 队列不空，不停地从队列里拿出一个点，拓展邻居节点放到队列中
  while queue:
    node = queue.popleft()

    # 如果有明确的终点可以在这里加终点的判断
    if node 是终点:
      break or return something
    for neighbor in node.get_neighbors():
      if neighbor in distance:
        continue
      queue.append(neighbor)
      distance[neighbor] = distance[node] + 1

  # 如果需要返回所有点离起点的距离，就return hashmap
  return distance

  # 如果需要返回所有连通的节点，就return HashMap里的所有点
  return distance.keys()

  # 如果需要返回离终点的最短距离
  return distance[end_node]
```

```python
# Python
# topological sort
def get_indegrees(nodes):
  counter = {node: 0 for node in nodes}

  for node in nodes:
    for neighbor in node.get_neighbors():
      counter[neighbor] += 1

  return counter

def topological_sort(nodes):
  # 统计入度
  indegrees = get_indegrees(nodes)

  # 所有入度为 0 的点都放到队列里
  queue = collections.deque([node for node in nodes if indegrees[node] == 0])

  # 用BFS算法一个个把点从图里挖出来
  topo_order = []

  while queue:
    node = queue.popleft()
    topo_order.append(node)
    for neighbor in node.get_neighbors():
      indegrees[neighbor] -= 1
      if indegrees[neighbor] == 0:
        queue.append(neighbor)

  # 判断是否有循环依赖
  if len(topo_order) != len(nodes):
    return 有循环依赖（环），没有拓扑排序

  return topo_order
```

### DFS 深度优先搜索

**_使用条件_**

1. 找满足某个条件的所有方案(99%)
2. 二叉树 Binary Tree 的问题(90%)
3. 组合问题(95%)

- 问题模型：求出所有满足条件的“组合”
- 判断条件：组合中的元素是顺序“无关”的

4. 排列问题(95%)

- 问题模型：求出所有满足条件的“排列”
- 判断条件：组合中的元素是顺序“相关”的

**_不要使用 DFS 的场景_**

1. 连通块问题(一定要用 BFS，否则 StackOverflow)
2. 拓扑排序(一定要用 BFS，否则 StackOverflow)
3. 一切 BFS 可以解决的问题

**_复杂度_**

- 时间复杂度`O(方案个数 * 构造每个方案的时间)`
  - 树的遍历：`O(n)`
  - 排列问题：`O(n! * n)`
  - 组合问题：`O(2^n * n)`

**_BFS vs DFS 复杂度_**

- 时间复杂度均为:O(V+E)，V 为顶点个数，E 为边个数
- 宽度优先搜索的空间复杂度取决于宽度
- 深度优先搜索的空间复杂度取决于深度

**_例题_**

- [LintCode 67.二叉树的中序遍历(遍历树)](https://www.lintcode.com/problem/67/?utm_source=sc-github-thx)
- [LintCode 652.因式分解(枚举所有情况)](https://www.lintcode.com/problem/652/?utm_source=sc-github-thx)

```python
# Python
def dfs(参数列表):
  if 递归出口：
    记录答案
    return

  for 所有的拆解可能性:
    修改所有的参数
    dfs(参数列表)
    还原所有被修改过的参数

  return something 如果需要的话，很多时候不需要return值，除了分治的写法
```

### Dynamic Programming 动态规划

**_使用场景_**

1. 求方案总数(90%) Note: 求具体方案的话，DFS 更合适
2. 求最值(80%)
3. 求可行性(80%)

**_不适用场景_**

1. 找所有具体的方案(准确率 99%)
2. 输入数据无序(除了背包问题外，准确率 60-70%)
3. 暴力算法已经是多项式时间复杂度(准确率 80%)

**_动态规划四要素（对比递归的四要素）_**

1. 状态(State)--递归的定义
2. 方程(Function)--递归的拆解
3. 初始化(Initialization)--递归的出口
4. 答案(Answer)--递归的调用

**_动态规划的两种实现方式_**

1. 记忆化搜索（使用递归实现）
2. 多重循环（使用 for 循环实现）

**_常见的动态规划_**

- **_背包型_**

  - 给出`n`个物品及其大小，问是否能挑选出一些物品装满大小为`m`的背包
  - 通常是二维的状态数组，`前i个`组成`和为j`状态数组的大小需要开`(n + 1) * (m + 1)`
    - 两个关键点：`前 & 和`
  - 题目中通常有“和”与“差”的概念，数值会被放到状态中
  - 每个物品要么`挑0个`（不挑），要么`挑1个`， 所以叫 01

    - 如果一个物品可以被分割，就不是`01背包`
    - 如果一个物品可以选多份，就叫`多重背包`

    1. **_01 背包_**

    ```bash
    状态 state
    dp[i][j] 表示前 i 个数里挑若干个数是否能组成和为 j

    方程 function
    dp[i][j] = dp[i - 1][j] or dp[i - 1][j - A[i - 1]] 如果 j >= A[i - 1]
    dp[i][j] = dp[i - 1][j] 如果 j < A[i - 1]
    第 i 个数的下标是 i - 1，所以用的是 A[i - 1] 而不是 A[i]

    初始化 initialization
    dp[0][0] = true
    dp[0][1...m] = false

    答案 answer
    使得 dp[n][v], 0 s <= v <= m 为 true 的最大 v
    ```

    ```bash
    dp[i][j] 表示前 i 个物体，在容量 j 的情况下，能取到的最大价值
    如果**取**第 i 个物体，价值为 dp[i - 1][j - A[i - 1]] + V[i]  **(j - A[i - 1] >= 0)**
    如果**不取**第 i 个物体，价值为 dp[i - 1][j]
    状态转移：dp[i][j] = max(dp[i - 1][j - A[i]] + V[i], dp[i - 1][j])
    ```

    1.1 Brute Force Searching

    ```c++
    class Solution {
     public:
      int backPackII(int m, std::vector<int>& A, std::vector<int>& V) {
        int result = 0;
        dfs(A, V, 0, 0, 0, m, result);
        return result;
      }

      void dfs(std::vector<int>& A, std::vector<int>& V, int current, int current_sum_weight, int current_sum_value, int m, int& result) {
        int a_size = A.size();
        if (current > a_size || current_sum_weight > m) {
          return;
        } else {
          result = std::max(current_sum_value, result);
        }

        for (int i = current; i < a_size; ++i) {
          dfs(A, V, i + 1, current_sum_weight + A[i], current_sum_value + V[i], m, result);
        }
      }
    };
    ```

    > To avoid error, in the main function, we has to take 0 as input for both current_sum_weight and current_sum_value.

    1.2 DP: Backpack: version 1

    ```c++
    class Solution {
     public:
      int backPackII(int m, std::vector<int>& A, std::vector<int>& V) {
        int n = A.size();
        std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));
        // for (int i = 0; i < n + 1; ++i) {
        //   if (i == 0) {
        //     for (auto& elem : dp[0]) {
        //       elem = 0;
        //     }
        //   } else {
        //     dp[i][0] = 0;
        //   }
        // }

        for (int i = 1; i < n + 1; ++i) {
          for (int j = 1; j < m + 1; ++j) {
            if (j - A[i - 1] >= 0) {
              dp[i][j] = std::max(dp[i - 1][j], V[i - 1] + dp[i - 1][j - A[i - 1]]);
            } else {
              dp[i][j] = dp[i - 1][j];
            }
          }
        }

        return dp[n][m];
      }
    };
    ```

    1.3 DP: Backpack: version 2

    ```c++
    class Solution {
     public:
      int backPackII(int m, std::vector<int>& A, std::vector<int>& V) {
        int n = A.size();
        std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1));

        for (int i = 0; i <= n; ++i) {
          for (int j = 0; j <= m; ++j) {
            if (i == 0 || j == 0) {
              dp[i][j] = 0;
            } else if (j - A[i - 1] >= 0) {
              dp[i][j] = std::max(dp[i - 1][j], V[i - 1] + dp[i - 1][j - A[i - 1]]);
            } else {
              dp[i][j] = dp[i - 1][j];
            }
          }
        }

        return dp[n][m];
      }
    };
    ```


    2. ***多重背包***
      ```bash
      状态 state
      dp[i][j] 表示前 i 个物品挑出一些放到 j 的背包里的最大价值和

      方程 function
      dp[i][j] = max(dp[i - 1][j - count * A[i - 1]] + count * V[i - 1]) 其中 0 <= count <= j / A[i - 1]

      初始化 initialization
      dp[0][0..m] = 0

      答案 answer
      dp[n][m]
      ```

    3. ***Improvement with binary trick***
    ```bash
    把每种物品转化成一定的物品来进行优化
    m = 8
    A = [2, 3, 4, 5]
    V = [30, 50, 100, 200]
    第 0 个物品：A[0] = 2, V[0] = 30, 最多取 4 个
      100->拆分为 1, 10, 100 个
    第 1 个物品：最多取 2 个
      10->拆分为 1, 10 个
    第 i 个物品：最多取 x 个 (2^n <= x)
      拆分为 1, 2, 4, 8 .. 2^n
    ```

    4. ***Summary***
    ```bash
    0-1: `dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - A[i] + V[i]])`
          Optimization: rolling array or one dimensional array
    complete: 枚举每件物品取0, 1, 2, 3 ... m / A[i] 件
         `dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - k * A[i]] + k * V[i])`
          转化成 0-1 背包
          Improvement with binary trick:
          最优化完全背包的做法：正序更新(相较于0-1的倒序更新)
    multiple: 枚举每件物品取0, 1, 2, 3 ... amounts[i] 件
         `dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - k * A[i]] + k * V[i])`
          每个物品都当作是一个物品，然后进行 0-1 背包来做
    ```

- **_区间型_**

  - 题目中有`subarray`/`substring`的信息
  - 大区间依赖小区间

  ```bash
  状态 state
  用dp[i][j]表示数组/字符串中 i, j 这一段区间的最优值/可行性/方案总数

  方程 function
  dp[i][j] = max/min/sum/or(dp[i,j 之内更小的若干区间])
  ```

- **_匹配型_**

  - 通常给出两个字符串
  - 两个字符串的匹配值依赖于两个字符串前缀的匹配值
  - 字符串长度为`n`, `m`则需要开`(n + 1) * (m + 1)`的状态数组
  - 要初始化`dp[i][0]`与`dp[0][i]`
  - 通常都可以用滚动数组进行空间优化

  ```bash
  状态 state
  dp[i][j] 表示第一个字符串的前 i 个字符与第二个字符串的前 j 个字符怎么样怎么样 (max/min/sum/or)
  ```

- **_划分型_**

  - 是前缀型动态规划的一种，有前缀的思想

  ```bash
  状态 state
  - 如果指定了要划分为几个部分：
    - dp[i][j] 表示前 i 个数/字符划分为 j 个部分的最优值/方案数/可行性
  - 如果没有指定划分为几个部分：
    - dp[i] 表示前 i 个数/字符划分为若干个部分的最优值/方案数/可行性
  ```

- **_接龙型_**

  - 通常会给一个接龙规则，问你最长的龙有多长
  - 状态表示通常为：`dp[i]`表示以坐标为`i`的元素结尾的最长龙的长度
  - 方程通常是：`dp[i] = max{dp[j] + 1}`, `j`的后面可以接上`i`
  - LIS 的二分做法选择性的掌握，但并不是所有的接龙型 DP 都可以用二分来优化

  ```bash
  状态 state
  状态表示通常为: dp[i] 表示以坐标为 i 的元素结尾的最长龙的长度

  方程 function
  dp[i] = max{dp[i], dp[j] + 1}, j 的后面可以接上 i
  ```

**_复杂度_**

- 时间复杂度
  - `O(状态总数 * 每个状态的处理耗费)`
  - 等于`O(状态总数 * 决策数)`
- 空间复杂度
  - `O(状态总数)`(不使用滚动数组优化)
  - `O(状态总数 / n)`(使用滚动数组优化，n 是被滚动掉的那一个维度)

**_例题_**

- [LintCode 563.背包问题 V(背包型)](https://www.lintcode.com/problem/563/?utm_source=sc-github-thx)
- [LintCode 476.石子归并 V(区间型)](https://www.lintcode.com/problem/476/?utm_source=sc-github-thx)
- [LintCode 192.通配符匹配(匹配型)](https://www.lintcode.com/problem/192/?utm_source=sc-github-thx)
- [LintCode 107.单词拆分(划分型)](https://www.lintcode.com/problem/107/?utm_source=sc-github-thx)
- [LintCode 76.最长上升子序列(接龙型)](https://www.lintcode.com/problem/76/?utm_source=sc-github-thx)

### Heap 堆

**_使用条件_**

1. 找最大值或最小值(60%)
2. 找第`k`大(`pop k`次复杂度`O(nlogk)`)(50%)
3. 要求`logn`时间对数据进行操作(40%)

**_不能解决的问题_**

1. 查找比某个数大的最小值/最接近的值(平衡排序二叉树`Balanced BST`才可以解决)
2. 找某段区间的最大值最小值(线段树`SegmentTree`可以解决)
3. O(n)找第`k`大(使用`QuickSort`中的`partition`操作)

**_例题_**

- [LintCode 1274.查找和最小的 K 对数字](https://www.lintcode.com/problem/1274/?utm_source=sc-github-thx)
- [LintCode 919.会议室 II](https://www.lintcode.com/problem/919/?utm_source=sc-github-thx)
- [LintCode 1512.雇佣 K 个人的最低费用](https://www.lintcode.com/problem/1512/?utm_source=sc-github-thx)

```python
# Python
# 带删除特定元素功能的堆
from heapq import heappush, heappop

class Heap:
  def __int__(self):
    self.minheap = []
    self.deleted_set = set()

  def push(self, index, val):
    heappush(self.minheap, (val, index))

  def _lazy_deletion(self):
    while self.minheap and self.minheap[0][1] in self.deleted_set:
      heappop(self.minheap)

  def top(self):
    self._lazy_deletion()
    return self.minheap[0]

  def pop(self):
    self._lazy_deletion()
    heappop(self.minheap)

  def delete(self, index):
    self.deleted_set.add(index)

  def is_empty(self):
    return not bool(self.minheap)
```

#### Prioirty Queue:
- unsorted array
- sorted array
- Balanced BST(AVL)
- Binary Heap(We can create a Binary Heap with O(n))
  - can be used for implementing Priority Queue, HeapSort(not stable), MinHeap, MaxHeap


### Union Find 并查集

**_使用条件_**

1. 需要查询图的连通状况的问题
2. 需要支持快速合并两个集合的问题

**_复杂度_**

- 时间复杂度`union O(1), find O(1)`
- 空间复杂度`O(n)`

**_例题_**

- [LintCode 1070.账号合并](https://www.lintcode.com/problem/1070/?utm_source=sc-github-thx)
- [LintCode 1014.打砖块](https://www.lintcode.com/problem/1014/?utm_source=sc-github-thx)
- [LintCode 1813.构造二叉树??]()

```python
# Python
class UnionFind:
  def __init__(self):
    # 初始化父指针，集合大小，集合数量
    self.father = {}
    self.size_of_set = {}
    self.num_of_set = 0

  def add(self, x):
    # 点如果已经出现，操作无效
    if x in self.father:
      return

    # 初始化点的父亲为 空对象 None
    # 初始化该点所在集合大小为 1
    # 集合数量增加 1
    self.father[x] = None
    self.num_of_set += 1
    self.size_of_set[x] = 1

  def merge(self, x, y):
    # 找到两个节点的根
    root_x, root_y = self.find(x), self.find(y)

    # 如果根不是同一个则连接
    if root_x != root_y:
      # 将一个点的根变成新的根
      # 集合数量减少 1
      # 计算新的根所在集合大小
      self.father[root_x] = root_y
      self.num_of_set -= 1
      self.size_of_set[root_y] += self.size_of_set[root_x]

  def find(self, x):
    # 指针 root 指向被查找的点x
    # 不断找到 root 的父亲
    # 直到 root 指向 x 的根节点
    root = x
    while self.father[root] != None:
      root = self.father[root]

    # 将路径上所有点指向根节点 root
    while x != root:

      # 暂存 x 原本的父亲
      # 将 x 指向根节点
      # x 指针上移至 x 的父节点
      original_father = self.father[x]
      self.father[x] = root
      x = original_father
    return root

  # 两个节点连通 等价于 两个节点的根相同
  def is_connected(self, x, y):
    return self.find(x) == self.find(y)

  # 获取集合数量
  def get_num_of_set(self):
    return self.num_of_set

  # 获取某个点所在集合大小
  def get_size_of_set(self, x):
    return self.size_of_set[self.find(x)]
```

### Trie 字典树

**_使用条件_**

1. 需要查询包含某个前阵的单词/字符串是否存在
2. 字符矩阵中找单词的问题

**_复杂度_**

- 时间复杂度`O(L) 增删查改`
- 空间复杂度`O(N * L) N 是单词数，L 是单词长度`

**_例题_**

- [LintCode 1221.连接词](https://www.lintcode.com/problem/1221/?utm_source=sc-github-thx)
- [LintCode 1624.最大距离](https://www.lintcode.com/problem/1624/?utm_source=sc-github-thx)
- [LintCode 1090.映射配对之和](https://www.lintcode.com/problem/1090/?utm_source=sc-github-thx)

```c++
// Let me try to re-implement java solution with C++
class TrieNode {
 public:
  TrieNode()
    : children(), is_word(), word() {}

  // 儿子节点
  std::unordered_map<char, TrieNode*> children;

  // 根节点到该节点是否是一个单词
  bool is_word;

  // 根节点到该节点的单词是什么
  std::string word;
};

class Trie {
 public:
  Trie()
    : root_(new TrieNode()) {}
  TrieNode* GetRoot() {
    return root_;
  }

  // 插入单词
  void Insert(std::string word) {
    TrieNode* node = root_;
    for (int i = 0; i < word.size(); ++i) {
      char c = word[i];
      if (!node->children.count(c)) {
        node->children[c] = new TrieNode();
      }
      node = node->children[c];
    }
    node->is_word = true;
    node->word = word;
  }

  // 判断单词 word 是不是在字典树中
  bool HasWord(std::string word) {
    TrieNode* node = root_;
    for (int i = 0; i < word.size(); ++i) {
      char c = word[i];
      if (!node->children.count(c)) {
        return false;
      }
      node = node->children[c];
    }
    return node->is_word;
  }

  // 判断前缀 prefix 是不是在字典树中
  bool HasPrefix(std::string prefix) {
    TreeNode* node = root_;
    for (int i = 0; i < prefix.size(); ++i) {
      char c = prefix[i];
      if (!node->children.count(c)) {
        return false;
      }
      node = node->children[c];
    }
    return true; // this is the only difference with the HasWord function
  }
 private:
  TrieNode* root_;
}
```

```java
// Java
class TrieNode {
  // 儿子节点
  public Map<Character, TrieNode> children;

  // 根节点到该节点是否是一个单词
  public boolean isWord;

  // 根节点到该节点的单词是什么
  public String word;

  public TrieNode() {
    children = new HashMap<Character, TrieNode>();
    isWord = false;
    word = null;
  }
}

public class Trie {
  private TrieNode root;

  public Trie() {
    root = new TrieNode();
  }

  public TrieNode getRoot() {
    return root;
  }

  // 插入单词
  public void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length(); i++) {
      char letter = word.charAt(i);
      if (!node.children.containsKey(letter)) {
        node.children.put(letter, new TrieNode());
      }
      node = node.children.get(letter);
    }

    node.isWord = true;
    node.word = word;
  }

  // 判断单词 word 是不是在字典树中
  public boolean hasWord(String word) {
    int L = word.length();
    TrieNode node = root;
    for (int i = 0; i < L; i++) {
      char letter = word.charAt(i);
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children.get(letter);
    }
    return node.isWord;
  }

  // 判断前缀 prefix 是不是在字典树中
  public boolean hasPrefix(String prefix) {
    int L = prefix.length();
    TrieNode node = root;
    for (int i = 0; i < L; i++) {
      char letter = prefix.charAt(i);
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children.get(letter);
    }
    return true;
  }
}
```

### Red-Black Tree

#### Basics

Balanced search trees, guaranteed height of O(logn) for n items.
A Red-Black Tree is a BST with the following structure properties:

1. Every node is colored red or black
2. The root is black
3. A red node does not have a red child.
  - red rule: red nodes give us flexibility, otherwise, if all black node the tree must be a perfect tree
4. For any node, every path from that node to a null reference has the same # of black nodes
  - path rule: define the balance

Each node has its own black-height.
Extra notes:

1. Nodes require one storage bit to keep track of color.
2. The longest path(root to farthest NIL) is no more than twice the length of the shortest path (root to nearest NIL).
   - Shortest path: all black nodes
   - Longest path: alternating red and black

Operations:

- Search(O(logn))
- Insert(O(logn)): require rotation
- Remove(O(logn)): require rotation

Space complexity: O(n)

#### Rotations: O(1)

An important operation when inserting and deleting items from a red-black tree.

1. alters the structure of a tree by rearranging subtrees
2. goal is to decrease the height of the tree
   - red-black trees: maximum height of O(logn)
   - larger subtrees up, smaller subtrees down
3. does not affect the order of elements

- left-rotate
- right-rotate

```python
def left-rotate(T, x):
 1   y = x.right          # set y
 2   x.right = y.left     # turn y's left subtree into x's right subtree
 3   if y.left != T.nil
 4     y.left.p = x
 5   y.p = x.p            # link x's parent to y
 6   if x.p == T.nil
 7     T.root = y
 8   elif x == x.p.left
 9     x.p.left = y
10   else x.p.right = y
11   y.left = x           # put x on y's left
12   x.p = y
```

#### Insertions(strategy)
1. insert Z and color it red
2. recolor and rotate nodes to fix violation

Four scenarios:
1. Z == root
    - solution: color black
2. Z.uncle == red
    - solution: recolor (parent, grandparent, uncle)
3. Z.uncle == black(triangle)
    - solution: rotate Z.parent
4. Z.uncle == black(line)
    - solution: rotate Z.grandparent & recolor(parent, grandparent)

![pseudo code of RB](./mdimage/rb_strategy.png)



## Data Structure Implementations

### LIS LCS LCA TSP MST

#### LIS: Longest Increasing Subsequence

- Dynamic Programming
- O(nlogn) recite binary search

#### LCS: Longest Commen Subsequence

- 两个字符串前缀型中的匹配型动态规划

#### LCA: Lowest Common Ancestor

- 一般会问一次查询，多次查询不太会问

##### Example: Lintcode 88 LCA
- [Lintcode 88 LCA](https://www.lintcode.com/problem/88)

```c++
class Solution {
 public:
  TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* A, TreeNode* B) {
    if (root == nullptr) return nullptr;

    // !!! 如果root为A或B，立即返回，无需继续向下寻找
    if (root == A || root == B) return root;

    // 分别去左右子树寻找A和B
    TreeNode* left = lowestCommonAncestor(root->left, A, B);
    TreeNode* right = lowestCommonAncestor(root->right, A, B);

    // !!! 如果A，B分别存在于两棵子树，root为LCA，返回root(return answer)
    if (left != nullptr && right != nullptr) return root;

    // 左子树有一个点或者左子树有LCA
    if (left != nullptr) return left;

    // 右子树有一个点或者右子树有LCA
    if (right != nullptr) return right;

    // 左右子树啥都没有
    return nullptr;
  }
};
```


#### TSP:

- 随机化
- 二进制压缩，状态压缩型动态规划，最难

#### MST: Minimon Spinning Tree

- 最小生成树
- Microsoft & Amazon

### [LRU implementation](https://www.lintcode.com/problem/134/)

```c++
// C++
#include <unordered_map>

struct LinkedNode {
  LinkedNode(int key, int value, LinkedNode* next)
    : key(key), value(value), next(next) {}

  int key;
  int value;
  LinkedNode* next;
};

class LRUCache {
 public:
  LRUCache(int capacity)
    : capacity_(capacity), dummy_(new LinkedNode(0, 0, nullptr)), tail_(dummy_) {}

  // Google style: Get
  int Get(int key) {
    if (key_to_previous_.find(key) == key_to_previous_.end()) {
      return -1;
    }
    LinkedNode* previous = key_to_previous_.at(key);
    LinkedNode* current = previous->next;

    Kick(previous);
    return current->value;
  }

  // Google style: Set
  void Set(int key, int value) {
    if (key_to_previous_.find(key) != key_to_previous_.end()) {
      Kick(key_to_previous_.at(key));
      tail_->value = value;
      return;
    }

    PushBack(new LinkedNode(key, value, nullptr)); // 如果key不存在，则存入新节点
    if (key_to_previous_.size() > capacity_) { // 如果缓存超出上限
      PopFront();
    }
  }

 private:
  void PushBack(LinkedNode* node) {
    key_to_previous_[node->key] = tail_;
    tail_->next = node;
    tail_ = node;
  }

  void PopFront() { // 删除头部
    LinkedNode* head = dummy_->next;
    key_to_previous_.erase(head->key);
    dummy_->next = head->next;
    key_to_previous_[head->next->key] = dummy_;
  }

  // change "previous->node->next->...->tail_"
  // to "previous->next->...->tail_->node"
  void Kick(LinkedNode* previous) { // 将数据移至尾部
    LinkedNode* node = previous->next;
    if (node == tail_) {
      return;
    }

    // update the current node from linked list
    previous->next = node->next;

    // update the previous node in hash map
    key_to_previous_[node->next->key] = previous;
    node->next = nullptr;
    PushBack(node);
  }

  int capacity_;
  LinkedNode* dummy_;
  LinkedNode* tail_;

  std::unordered_map<int, LinkedNode*> key_to_previous_;
};
```

### [LIS Longest Increasing Subsequence](https://www.jiuzhang.com/problem/longest-increasing-subsequence/)

- 接龙规则：从左到右一个比一个大，该问题简称 LIS
- 状态表示：
  - A：`dp[i]` 表示前`i`个数的 LIS 是多长(前缀型, do not choose this)
  - B：`dp[i]` 表示以第`i`个数结尾的 LIS 是多长(坐标型)

#### LIS 的动态规划四要素

- `state:` `dp[i]`表示以第`i`个数为龙尾的最长的龙有多长
- `function:` `dp[i] = max{dp[j] + 1}, j < i && nums[j] < nums[i]`
- `initialization:` `dp[0..n-1] = 1`
- `answer:` `max{dp[0..n-1]}`

```python
def longestIncreasingSubsequence(self, nums):
  if nums is None or not nums:
    return 0

  # state: dp[i] 表示以第i个数结尾的LIS的长度
  # initialization：dp[0..n-1] = 1
  dp = [1] * len(nums)

  # function: dp[i] = max(dp[i] + 1), j < i && nums[j] < nums[i]
  for i in range(len(nums)):
    for j in range(i):
      if nums[j] < nums[i]:
        dp[i] = max(dp[i], dp[j] + 1)

  # answer, 任意一个位置都可能是LIS的结尾
  return max(dp)
```

- 改动要点(返回最优方案)
  1. prev 数组记录前继最优状态
  2. max() 的写法要改为 if 的写法
  3. 找到最长龙的结尾，从结尾倒推出整条龙

```python
def longestIncreasingSubsequence(self, nums):
  if nums is None or not nums:
    return 0

  # state: dp[i] 表示以第i个数结尾的LIS的长度
  # initialization：dp[0..n-1] = 1
  dp = [1] * len(nums)

  # prev[i]代表dp[i]的最优值是从哪个dp[j]算过来的
  prev = [-1] * len(nums)

  # function dp[i] = max{dp[j] + 1}, j < i and nums[j] < nums[i]
  for i in range(len(nums)):
    for j in range(i):
      if nums[j] < nums[i] and dp[i] < dp[j] + 1:
        dp[i] = dp[j] + 1
        prev[i] = j

  # answer: max(dp[0..n-1])
  longest, last = 0, -1
  for i in range(len(nums)):
    if dp[i] > longest:
      longest = dp[i]
      last = i

  path = []
  while last != -1
    path.append(nums[last])
    last = prev[last]
  print(path[::-1])

  return longest
```

### [LIS2 Longest Continuous Increasing Subsequence 2](https://www.jiuzhang.com/problem/longest-continuous-increasing-subsequence-ii/)

```python
class Solution:
    """
    @param A: An integer matrix
    @return: an integer
    """
    def longestContinuousIncreasingSubsequence2(self, A):
        if not A or not A[0]:
            return 0

        n, m = len(A), len(A[0])
        points = []
        for i in range(n):
            for j in range(m):
                points.append((A[i][j], i, j))

        points.sort()

        longest_hash = {}
        for i in range(len(points)):
            key = (points[i][1], points[i][2])
            longest_hash[key] = 1
            for dx, dy in [(1, 0), (0, -1), (-1, 0), (0, 1)]:
                x, y = points[i][1] + dx, points[i][2] + dy
                if x < 0 or x >= n or y < 0 or y >= m:
                    continue
                if (x, y) in longest_hash and A[x][y] < points[i][0]:
                    longest_hash[key] = max(longest_hash[key], longest_hash[(x, y)] + 1)

        return max(longest_hash.values())
```

### [Largest Divisible Subset](https://www.jiuzhang.com/problem/largest-divisible-subset/)

```python
class Solution:
    def largestDivisibleSubset(self, nums):
        if not nums:
            return []

        nums = sorted(nums)
        n = len(nums)
        dp, prev = {}, {}
        for num in nums:
            dp[num] = 1
            prev[num] = -1

        last_num = nums[0]
        for num in nums:
            for factor in self.get_smaller_factors(num):
                if factor not in dp:
                    continue
                if dp[num] < dp[factor] + 1:
                    dp[num] = dp[factor] + 1
                    prev[num] = factor
            if dp[num] > dp[last_num]:
                last_num = num

        return self.get_path(prev, last_num)

    def get_smaller_factors(self, num):
        if num == 1:
            return []
        factor = 1
        factors = []
        while factor * factor <= num:
            if num % factor == 0:
                factors.append(factor)
                if factor * factor != num and factor != 1:
                    factors.append(num // factor)
            factor += 1
        return factors

    def get_path(self, prev, last_num):
        path = []
        while last_num != -1:
            path.append(last_num)
            last_num = prev[last_num]
        return path[::-1]
```

### HashMap Implementation
- [leetcode 705 design hashset](https://leetcode.com/problems/design-hashset/description/)

```c++
// C++


```

## Other Notes

### sort lambda
```c++
    auto sortRuleLambda = [](const Skyscraper& s1, const Skyscraper& s2) -> bool {
      return s1.height() < s2.height();
    };
    std::sort(skyscrapers.begin(), skyscrapers.end(), sortRuleLambda);
```

### customized hash for unordered_map or unordered_set
```c++
struct pair_hash {
    template <class T1, class T2>
    std::size_t operator () (const std::pair<T1,T2> &p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);

        // Mainly for demonstration purposes, i.e. works but is overly simple
        // In the real world, use sth. like boost.hash_combine
        return h1 ^ (h2 << 1);
    }
};

int main() {
  std::unordered_map<std::pair<int, int>, int, pair_hash> pos_index_map;
  return 0;
}
```

### function pointer in c++
```c++
int sum(int a, int b) {
  return a + b;
}

int prod(int a,  int b) {
  return a * b;
}

int shouldNotBeChanged(int (*operation)(int, int)) {
  srand(time(nullptr));
  int a = rand() % 100;
  int b = rand() % 100;
  printf("The result of the operation between %d and %d is %d\n",
         a, b, operation(a, b));
  return 0;
}

int main() {
  shouldNotBeChanged(&sum);
  return 0;
}
```

### element wise comparison of two structs
```c++
struct Point {
  float x;
  float y;
  Point(int x = 0, int y = 0) : x(x), y(y) {}
};

int main() {
  Point p1 = Point(1, 2);
  Point p2 = Point(2, 1);
  
  // std::tie can have any many parameters as it wants
  if (std::tie(p1.x, p2.x) == std::tie(p2.y, p1.y)) {
    std::cout << "haha" << std::endl;
  } else {
    std::cout << "nono" << std::endl;
  }
}
```

### how to use c++ build-in hash function
```c++
  size_t h1 = std::hash<char>()('a');
  size_t h2 = std::hash<char>()('b');
```

```c++
  std::unordered_map<std::string, int> myhash;
  std::unordered_map<std::string, int>::hasher fn = myhash.hash_function();
  std::cout << fn("apple") << std::endl;
```

### c++ const
- [link](https://www.geeksforgeeks.org/const-keyword-in-cpp/)

```c++
  // value of x and y can be altered
  // x = 9; y = 'A';
  // value of i and j can be altered
  // i = &m; j = &n;
  // !!! value of *i and *j cannot be altered
  // *i = 6; *j = 7; // read-only variable is not assignable
  const int* i = &x;
  const char* j = &y;

  // value of x and y can be altered
  // x = 9; y = 'A';
  // !!! value of i and j cannot be altered
  // i = &m; j = &n; // variable 'i' and 'j' declared const here
  // value of *i and *j can be altered
  // *i = 6; *j = 'A';
  int* const i = &x;
  char* const j = &y;

  // value of x and y can be altered
  // x = 9; y = 'A';
  // !!! value of i and j cannot be altered
  // i = &m; j = &n;
  // !!! value of *i and *j cannot be altered
  // *i = 6; *j = 7;
  const int* const i = &x;
  const char* const j = &y;
```

The compile-time error that will appear as if const value is passed to any non-const argument of the function
```c++
int foo(int* y) {
  return *y;
}
 
int main() {
  int z = 8;
  const int* x = &z;
  std::cout << foo(x) << std::endl;
  return 0;
}
```
+
```c++
// error: no matching function for call to 'foo'
// candidate function not viable: 1st argument ('const int *') would lose const qualifier
const int foo(int* y) {
  return *y;
}
 
int main() {
  int z = 8;
  const int* x = &z;
  std::cout << foo(x) << std::endl;
  return 0;
}
```
+
```c++
// Function foo() with variable
// const int
void foo(const int y) {
  // y = 6; const value
  // can't be change
  cout << y;
}
 
// Function foo() with variable int
void foo1(int y) {
  // Non-const value can be change
  y = 5;
  cout << '\n'
       << y;
}
 
// Driver Code
int main() {
  int x = 9;
  const int z = 10;

  foo(z);
  foo1(x);

  return 0;
}
```

const return
```c++
// int foo(int y) { // no error
// const int foo(int y) { // no error
const int foo(const int y) { // error: cannot assign to variable 'y' with const-qualified type 'const int'
  --y; 
  return y;
}
 
int main() {
  int x = 9;
  const int z = 10;
  std::cout << foo(x) << '\n'
            << foo(z);

  return 0;
}
```

An object declared as const cannot be modified and hence, can invoke only const member functions as these functions ensure not to modify the object.

When a function is declared as const, it can be called on any type of object, const object as well as non-const objects.
```c++
class Test {
 public:
  // Constructor
  Test(int v = 0) {
    value = v;
  }

  // this const means cannot modify class members, e.g. value
  // We get compiler error if we add a line like "value = 100;"
  // in this function.
  int getValue() const {
    return value;
  }
   
  // a nonconst function trying to modify value
  void setValue(int val) {
    value = val;
  }
 private:
  int value;
};
 
// Driver Code
int main() {
  // Object of the class T
  Test t(20);

  // non-const object invoking const function, no error
  cout << t.getValue() << endl;
   
  // const object
  const Test t_const(10);
 
  // const object invoking const function, no error
  cout << t_const.getValue() << endl;
 
  // const object invoking non-const function, CTE
  // t_const.setValue(15);
   
  // non-const object invoking non-const function, no error
  t.setValue(12);
   
  cout << t.getValue() << endl;

  return 0;
}
```


### random seed
`3407`

### C++20 comparison operator
```c++
struct Point {
   int x;
   int y;
   Point() : x(0), y(0) {}
   Point(int a, int b) : x(a), y(b) {}

   // !!! have to write it this way:
   inline bool operator== (const Point& other) const {
     return x == other.x && y == other.y;
   }

};
```

### To initialize two dimentional array
```c++
#include<iostream>

int main() {
    int** secondStore;
    secondStore = new int*[10];
    for (int i = 0; i < 10; ++i) {
      secondStore[i] = new int[32];
    }
    std::cout << secondStore[0][0] << std::endl;
    return 0;
}
```

### 通过数据范围推测算法

- `n = 10^4 ～ 10^5`
  - O(n) ==> 双指针？前缀和？遍历？DP？
  - O(nlogn) ==> 排序？二分？
- `n = 10^3`
  - O(n^2) ==> 二维数组？双重循环？二维 DP？
- `n = 10^2`
  - O(n^3) ==> 三重循环？
- `n = 10`
  - O(2^n), O(n!) ==> dfs 暴力？
- `n = 10^9`
  - 别打算开数组存或 O(n)复杂度

### 背诵贪心算法

- [552.创建最大数](http://www.lintcode.com/problem/create-maximum-number/)
- [117.跳跃游戏 II](http://www.lintcode.com/problem/jump-game-ii/)
- [116.跳跃游戏](http://www.lintcode.com/problem/jump-game/)
- [187.加油站](http://www.lintcode.com/problem/gas-station/)
- [182.删除数字](http://www.lintcode.com/problem/delete-digits/)
- [945.任务计划](http://www.lintcode.com/problem/task-scheduler/)
- [LintCode 437.书籍复印(在答案集上进行二分)](https://www.lintcode.com/problem/437/?utm_source=sc-github-thx)

### Python String methods

- `isdigit()`
- `isalpha()`
- `lower()`
- `upper()`

### C++ string methods

- `isdigit(c)`
- `isalpha(c)`
- `putchar(tolower(c))`
- `putchar(toupper(c))`

### 时间复杂度算法列表

- `O(1)` 位运算
- `O(logn)` 二分法，倍增法，快速幂算法，辗转相除法
- `O(n)` 枚举法，双指针算法，单调栈算法，KMP 算法，Rabin Karp，Manacher's Algorithm 又称作线性时间复杂度
- `O(nlogn)` 快速排序，归并排序，堆排序
- `O(n^2)` 枚举法，动态规划，Dijkstra
- `O(n^3)` 枚举法，动态规划，Floyd
- `O(2^n)` 与组合有关的搜索问题
- `O(n!)` 与排列有关的搜索问题

### 跟面试官核实

```bash
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
```

### BFS 的使用场景

1. 分层遍历

- 一层一层的遍历一个图、树、矩阵
- 简单图最短路径
  - 简单图的定义是，图中所有的边长都一样

2. 连通块问题

- 通过图中一个点找到其他所有连通的点
- 找到所有方案问题的一种非递归实现方式

3. 拓扑排序

- 实现容易度远超过 DFS

### BFS 的使用场景（summer）

1. Connected Component

- 通过一个点找到图中连通的所有点
- 非递归的方式找所有方案

2. Level Order Traversal

- 图的层次遍历
- 简单图最短路径 Simple Graph Shortest Path

3. Topological Sorting

- 求任意拓扑序
- 求是否有拓扑序
- 求字典序最小的拓扑序
- 求是否唯一拓扑序

### 以下哪些问题 BFS 可以处理：

- 答案：

  - A. 二叉树的层次遍历
  - B. 求出边长均为 5 的图的最短路径
  - E. 求出 01 矩阵上最大的全 0 块
  - F. 我不会写递归，但我需要从 10 个数中任意拿出 5 个的所有方案

- 非答案：

  - D. 二叉树的先序遍历

- 解析：先序遍历通常使用递归方式来实现，即使使用非递归方式，也是借助栈来实现的，所以并不适合 BFS，而层次遍历因为是一层一层的遍历，所以是 BFS 十分擅长的；边长一致的图是简单图，所以可以用 BFS，因此 B 可以，因为 BFS 只适用于简单图，所以 C 不可以；矩阵连通块也是 BFS 可以处理的问题，求出最大块只需要维护一个最大值即可；选项 F 属于求所有方案问题，因此可以用 BFS 来处理，但是并不是唯一的解决方式。

### BFS 的三种实现方法

1. 单队列
2. 双队列
3. DummyNode // The "dummy" node is used to simplify some corner cases such as a list with only one node, or removing the head of the list.

### 二叉树的 BFS vs 图的 BFS：

- 二叉树中进行 BFS 和图中进行 BFS 最大的区别就是二叉树中无需使用 HashSet（C++: unordered_set, Python: set) 来存储访问过的节点（丢进过 queue 里的节点）
- 因为二叉树这种数据结构，上下层关系分明，没有环（circle），所以不可能出现一个节点的儿子的儿子是自己的情况。
- 但是在图中，一个节点的邻居的邻居就可能是自己了。

### Recursion/ DFS/ Backtracking:

**_Recursion_**

- `递归函数` 程序的一种实现方式，即函数进行了自我调用
- `递归算法` 即大问题的结果依赖于小问题的结果，于是先用递归函数求解小问题
- 一般我们说递归的时候，大部分时候都在说递归函数而不是递归算法

**_DFS_**

- 可以使用递归函数实现
- 也可以不用递归函数来实现，如自己通过一个手动创建的栈 Stack 进行操作
- 深度优先搜索通常是指在搜索的过程中，优先搜索深度更深的点而不是按照宽度搜索同层节点

**_Backtracking_**

- 回溯法： == 深度优先搜索算法
- 回溯操作：递归函数在回到上一层递归调用处的时候，一些参数需要改回到调用前的值，这个操作就是回溯，即让状态参数回到之前的值，递归调用前做了什么改动，递归调用之后都改回来

### 遍历法 vs 分治法：

**都可以用 DFS 实现**

- `遍历法` = 一个小人拿着一个记事本走遍所有都节点
- `分治法` = 分配小弟去做子任务，自己进行结果汇总

- `遍历法`：通常会用到一个全局变量或者是共享参数
- `分治法`：通常将利用 return value 记录子问题结果
  二叉树上的分治法本质上也是在做遍历（后序遍历）
  先序？中序？后序?

```c++
// 二叉树上的分治法模版
// 实际上是后序遍历
public:
  返回结果类型 divideConquer(TreeNode* root) {
    if (root == nullptr) {
      处理空树应该返回的结果
    }
    // if (root->left == nullptr && root->right == nullptr) {
    //   处理叶子应该返回的结果
    //   如果叶子的返回结果可以通过两个空节点的返回结果得到
    //   就可以省略这一段代码
    // }
    左子树返回结果 = divideConquer(root->left);
    右子树返回结果 = divideConquer(root->right);
    整棵树的结果 = 按照一定方法合并左右子树的结果
    return 整棵树的结果
  }
```

### 平衡二叉树

- 任意节点左右子树高度之差不超过 1

### 计算深度

- 适合用分治法解决这个问题

### Binary Search Tree 二叉查找树：

- 一种特殊的二叉树
- 定义：
  - 左子树节点值 < 根节点的值，右子树节点的值 >= 根节点的值
- 相等的情况：值相等的点可能在右子树，或者可能在左子树，需要根面试官澄清
- 中序遍历：
  - 中序遍历结果有序（不下降的顺序，有些相邻点可能相等）
    - 如果二叉树的中序遍历不是“不下降”序列，则一定不是 BST
    - 如果二叉树的中序遍历是“不下降”序列,也未必是 BST，反例：{1,1,1}
- 二叉查找树的高度：
  - 最坏 O(n), 最好 O(logn), 用 O(h) 表示更合适
  - 只有 Balanced Binary Tree（平衡二叉树）才是 O(logn)

### BST 基本操作：

- [Build: 1359.Convert Sorted Array to Binary Search Tree](https://www.lintcode.com/problem/convert-sorted-array-to-binary-search-tree/description)

- [Insert: 85.Insert Node in a Binary Search Tree](https://www.lintcode.com/problem/insert-node-in-a-binary-search-tree/description)

- [Search: 1524.Search in a Binary Search Tree](https://www.lintcode.com/problem/search-in-a-binary-search-tree/description)
- [Delete: 701.Trim a Binary Search Tree](https://www.lintcode.com/problem/trim-a-binary-search-tree/description)

- [Iterate: 86.Binary Search Tree Iterator](https://www.lintcode.com/problem/binary-search-tree-iterator/description)

### Red-Black Tree 红黑树：

- 是一种 Balanced BST
- Java: TreeMap/TreeSet
- C++: map/set

- Application:
  - `O(logN)` 的时间内实现增删改查
  - `O(logN)` 的时间内实现找最大找最小
  - `O(logN)` (wrong!!!???)的时间内实现找比某个数小的最大值(upperBound)和比某个数大的最小值(lowerBound)

    - C++【用途】針對「已經排序」的資料進行binary search。
      vector <int> v;
      sort(v.begin(), v.end());
      - lower_bound：找出vector中「大於或等於」val的「最小值」的位置：
        auto it = lower_bound(v.begin(), v.end(), val);
      - upper_bound：找出vector中「大於」val的「最小值」的位置：
        auto it = upper_bound(v.begin(), v.end(), val);

  - 只考红黑树的应用，不考红黑树的实现

### 二叉树三种遍历：

    - `先序遍历` Pre-order
    - `中序遍历` In-order
    - `后序遍历` Post-order（分治法）

### “二叉树的中序遍历”的非递归实现

- 考得最多
- 通过实现 hasNext 和 next 两个方法，从而实现二叉查找树的中序遍历迭代器
- [86.Binary Search Tree Iterator 相当于 Binary Tree In-order Iterator](https://www.lintcode.com/problem/binary-search-tree-iterator/)
- 实现要点：
  - 递归->非递归，意味着自己需要控制原来由操作系统控制的栈的进进出出
  - 如何找到最小的第一个点？最左边的点即是
  - 如何求出一个二叉树节点在中序遍历中的下一个节点？
    - 在 stack 中记录从根节点到当前节点的整条路径
    - 下一个点 = 右子树最小点 or 路径中最近一个通过左子树包含当前点的点

```c++
class BSTIterator {
 public:
  BSTIterator(TreeNode * root) {
    while (root != nullptr) {
      stack_.push(root);
      root = root->left;
    }
  }

  bool HasNext() {
    return !stack_.empty();
  }

  TreeNode* Next() {
    TreeNode* node = stack_.top();
    TreeNode* n = node;
    if (node->right != nullptr) {
      n = node->right;
      while (n != nullptr) {
        stack_.push(n);
        n = n->left;
      }
    } else {
      stack_.pop();
      while (!stack_.empty() && stack_.top()->right == n) {
        n = stack_.top();
        stack_.pop();
      }
    }
    return node;
  }
 private:
  std::stack<TreeNode*> stack_;
};

简单的实现方式代码：
class BSTIterator {
 public:
  BSTIterator(TreeNode * root) {
    find_most_left(root);
  }

  void find_most_left(TreeNode* node) {
    while (node != nullptr) {
      stack.push(node);
      node = node->left;
    }
  }

  bool hasNext() {
    return !stack.empty();
  }

  TreeNode* next() {
    TreeNode* node = stack.top();
    stack.pop();
    if (node->right != nullptr) {
      find_most_left(node->right);
    }
    return node;
  }
 private:
  std::stack<TreeNode*> stack;
};
```

```python
# Python
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

简单的实现方式代码：
Pyhton：
class BSTIterator:
    def __init__(self, root):
        self.stack = []
        self.find_most_left(root)

    def find_most_left(self, node):
        while node:
            self.stack.append(node)
            node = node.left

    def hasNext(self):
        return bool(self.stack)

    def next(self):
        node = self.stack.pop()
        if node.right:
            self.find_most_left(node.right)
        return node
```

- BST 中最小的节点是从根节点一直往左走遇见的叶子节点，它不一定在树的最底层；BST 的特征就是中序遍历是严格递增的；如果这颗 BST 是一条链，那么找到最小值节点的算法是 O(n)的，除非这个 BST 是一个满二叉树。

### Prefix Sum

```c++
// C++
void get_prefix_sum(std::vector<int>& prefix_sum, std::vector<int>& nums) {
  for (int i = 0; i < nums.size(); i++) {
    prefix_sum.push_back(prefix_sum[i] + nums[i]);
  }
}
```

```python
# Python
def get_prefix_sum(self, nums):
    prefix_sum = [0]
    for num in nums:
        prefix_sum.append(prefix_sum[-1] + num)
    return prefix_sum
```

### 使用前缀和数组在 O(1)的时间复杂度内计算子数组和

- `sum from i to j = prefix_sum[j + 1] - prefix_sum[i]`

### 解决最短路径的算法：

- 简单图：
  - BFS
- 复杂图：
  - Floyd, Dijkstra, Bellman-ford, SPFA

### time & space compelxity of recursive:

- time: 一次\* 次数
- space： 一次 + 深度

### 遇到二叉树的问题，就想想整棵树在该问题上的结果和左右孩子在该问题上的结果之间有什么联系

### 拓扑排序 Topological Sorting:

- 图 + 有依赖关系 + 有向 + 无环 = 拓扑排序

- 通过拓扑排序判断是否图是否有环

- 入度（in-degree）：

  - 有向图（Directed Graph）中指向当前节点的点的个数（或指向当前节点的边的条数）

- 算法描述：

  - 统计每个点的入度
  - 将每个入度为 0 的点放入队列（Queue）中作为起始节点
  - 不断从队列中拿出一个点，去掉这个点的所有连边（指向其他点的边），其他点的相应的入度-1
  - 一旦发现新的入度为 0 的点，丢回队列中

- 拓扑排序并不是传统的排序算法：
  - 一个图可能存在多个拓扑排序（Topological Graph），也可能不存在任何拓扑排序

### 拓扑排序的四种不同问法：

- 求任意拓扑序
- 求是否有拓扑序
- 求字典序最小的拓扑序
- 求是否唯一拓扑序

# 2. Algorithms

## Google

### [new 200.最长回文子串](https://www.lintcode.com/problem/200/?utm_source=sc-libao-zyq)

### [new 575.字符串解码](https://www.lintcode.com/problem/575/?utm_source=sc-libao-zyq)

### [new 1082.员工的重要度](https://www.lintcode.com/problem/1082/?utm_source=sc-libao-zyq)

### [new 257.最长字符串链](https://www.lintcode.com/problem/257/?utm_source=sc-libao-zyq)

### [new 1001.小行星的碰撞](https://www.lintcode.com/problem/1001/?utm_source=sc-libao-zyq)

### [new 984.等差切片 II-子序列](https://www.lintcode.com/problem/984/?utm_source=sc-libao-zyq)

### [new 890.最短的唯一单词缩写](https://www.lintcode.com/problem/890/?utm_source=sc-libao-zyq)

### [new 1869.统计全为 1 的正方形子矩阵](https://www.lintcode.com/problem/1869/?utm_source=sc-libao-zyq)

### [new 1024.满足要求的子串个数](https://www.lintcode.com/problem/1024/?utm_source=sc-libao-zyq)

### [new 978.基础计算器](https://www.lintcode.com/problem/978/?utm_source=sc-libao-zyq)

### [new 300.会议室 4](https://www.lintcode.com/problem/300/?utm_source=sc-libao-zyq)

### [new 919.会议室 II](https://www.lintcode.com/problem/919/?utm_source=sc-libao-zyq)

### [new 1897.会议室 3](https://www.lintcode.com/problem/1897/?utm_source=sc-libao-zyq)

### [new 1281.前 K 个高频元素](https://www.lintcode.com/problem/1281/?utm_source=sc-libao-zyq)

### [new 1844.子数组和为 KII](https://www.lintcode.com/problem/1844/?utm_source=sc-libao-zyq)

### [new 1240.路径总和 III](https://www.lintcode.com/problem/1240/?utm_source=sc-libao-zyq)

### [new 804.不同岛屿的数量 II](https://www.lintcode.com/problem/804/?utm_source=sc-libao-zyq)

### [new 1361·文字并排](https://www.lintcode.com/problem/1361/?utm_source=sc-libao-zyq)

### [156.合并区间](https://www.lintcode.com/problem/156/?utm_source=sc-libao-zyq)

### [122.直方图最大矩形覆盖](https://www.lintcode.com/problem/122/?utm_source=sc-libao-zyq)

### [1370.赛车](https://www.lintcode.com/problem/1370/?utm_source=sc-libao-zyq)

### [615.课程表](https://www.lintcode.com/problem/615/?utm_source=sc-libao-zyq)

### [1299.猜数字游戏](https://www.lintcode.com/problem/1299/?utm_source=sc-libao-zyq)

### [137.克隆图](https://www.lintcode.com/problem/137/?utm_source=sc-libao-zyq)

### [134.LRU 缓存策略](https://www.lintcode.com/problem/134/?utm_source=sc-libao-zyq)

### [53.翻转字符串](https://www.lintcode.com/problem/53/?utm_source=sc-libao-zyq)

### [941.滑动拼图](https://www.lintcode.com/problem/941/?utm_source=sc-libao-zyq)

### [257.最长字符串链](https://www.lintcode.com/problem/257/?utm_source=sc-libao-zyq)

### [669.换硬币](https://www.lintcode.com/problem/669/?utm_source=sc-libao-zyq)

### [914.翻转游戏](https://www.lintcode.com/problem/914/?utm_source=sc-libao-zyq)

### [888.有效单词方阵](https://www.lintcode.com/problem/888/?utm_source=sc-libao-zyq)

### [514.栅栏染色](https://www.lintcode.com/problem/514/?utm_source=sc-libao-zyq)

### [407.加一](https://www.lintcode.com/problem/407/?utm_source=sc-libao-zyq)

### [1871.最大时刻](https://www.lintcode.com/problem/1871/?utm_source=sc-libao-zyq)

### [1432.新 21 点](https://www.lintcode.com/problem/1432/?utm_source=sc-libao-zyq)

### [1723.网格中的最短路径](https://www.lintcode.com/problem/1723/?utm_source=sc-libao-zyq)

### [802.数独](https://www.lintcode.com/problem/802/?utm_source=sc-libao-zyq)

### [1506.二叉树中所有距离为 K 的结点](https://www.lintcode.com/problem/all-nodes-distance-k-in-binary-tree/description/?utm_source=sc-libao-zyq)

### [1704.二叉搜索树的范围和](https://www.lintcode.com/problem/range-sum-of-bst/description/?utm_source=sc-libao-zyq)

### [86.二叉查找树迭代器](https://www.lintcode.com/problem/binary-search-tree-iterator/description/?utm_source=sc-libao-zyq)

### [362.滑动窗口的最大值](https://www.lintcode.com/problem/sliding-window-maximum/description/?utm_source=sc-libao-zyq)

### [653.添加运算符](https://www.lintcode.com/problem/expression-add-operators/description/?utm_source=sc-libao-zyq)

### [780.删除无效的括号](https://www.lintcode.com/problem/remove-invalid-parentheses/description/?utm_source=sc-libao-zyq)

## Facebook

### [new 1507.和至少为 K 的最短子数组](https://www.lintcode.com/problem/1507/?utm_source=sc-libao-zyq)

### [new 163.不同的二叉查找树](https://www.lintcode.com/problem/163/?utm_source=sc-libao-zyq)

### [new 52.下一个排列](https://www.lintcode.com/problem/52/?utm_source=sc-libao-zyq)

### [new 1025.自定义字符串排序](https://www.lintcode.com/problem/1025/?utm_source=sc-libao-zyq)

### [new 1450.矩形面积](https://www.lintcode.com/problem/1450/?utm_source=sc-libao-zyq)

- 扫描线:一般用线段树来做

```c++
// 扫描线，非线段树
class Solution {
 public:
  const int MOD = 1e9+7;
  int rectangleArea(vector<vector<int>>& rectangles) {
    std::map<int, std::vector<std::vector<int>> > mp;
    for (int i = 0; i < rectangles.size(); ++i) {
      int x1 = rectangles[i][0];
      int y1 = rectangles[i][1];
      int x2 = rectangles[i][2];
      int y2 = rectangles[i][3];
      mp[x1].push_back({y1, y2, 1});
      mp[x2].push_back({y1, y2, -1});
    }

    std::map<int, int> vis;
    int last = -1;
    long long ans = 0;
    for (auto& it : mp) {
      if (last != -1) {
        int w = it.first - last;
        int h = 0;
        int sum = 0;
        int x = -1;
        for (auto& i : vis) {
          sum += i.second;
          if (sum > 0 && x == -1) {
            x = i.first;
          }
          if (sum == 0 && x != -1) {
            h += i.first - x;
            x = -1;
          }
        }
        ans += 1LL * h * w;
        ans %= MOD;
      }
    }

    last = it->first;
    for (std::vector<int>& p : it->second) {
      if (p[2] == 1) {
        vis[p[0]]++;
        vis[p[1]]--;
      } else {
        vis[p[0]]--;
        vis[p[1]]++;
      }
    }

    return ans;
  }
};
```

### [new 641.丢失的间隔](https://www.lintcode.com/problem/641/?utm_source=sc-libao-zyq)

### [new 831.三数之和 II](https://www.lintcode.com/problem/831/?utm_source=sc-libao-zyq)

### [new 428.x 的 n 次幂](https://www.lintcode.com/problem/428/?utm_source=sc-libao-zyq)

### [new 114.不同的路径](https://www.lintcode.com/problem/114/?utm_source=sc-libao-zyq)

### [new 32.最小子串覆盖](https://www.lintcode.com/problem/32/?utm_source=sc-libao-zyq)

### [new 64.合并排序数组](https://www.lintcode.com/problem/64/?utm_source=sc-libao-zyq)

### [new 17.子集](https://www.lintcode.com/problem/17/?utm_source=sc-libao-zyq)

### [new 123.单词搜索](https://www.lintcode.com/problem/123/?utm_source=sc-libao-zyq)

### [new 137.克隆图](https://www.lintcode.com/problem/137/?utm_source=sc-libao-zyq)

### [new 104.合并 k 个排序链表](https://www.lintcode.com/problem/104/?utm_source=sc-libao-zyq)

### [new 1353.根节点到叶节点求和](https://www.lintcode.com/problem/1353/?utm_source=sc-libao-zyq)

### [new 187.加油站](https://www.lintcode.com/problem/187/?utm_source=sc-libao-zyq)

### [new 134.LRU 缓存策略](https://www.lintcode.com/problem/134/?utm_source=sc-libao-zyq)

### [new 1304.H 指数](https://www.lintcode.com/problem/1304/?utm_source=sc-libao-zyq)

### [new 54.转换字符串到整数](https://www.lintcode.com/problem/54/?utm_source=sc-libao-zyq)

### [new 425.电话号码的字母组合](https://www.lintcode.com/problem/425/?utm_source=sc-libao-zyq)

### [new 1311.二叉搜索树的最近公共祖先](https://www.lintcode.com/problem/1311/?utm_source=sc-libao-zyq)

### [new 88.最近公共祖先](https://www.lintcode.com/problem/88/?utm_source=sc-libao-zyq)

### [new 891.有效回文 II](https://www.lintcode.com/problem/891/?utm_source=sc-libao-zyq)

### [new 1889.区间合并](https://www.lintcode.com/problem/1889/?utm_source=sc-libao-zyq)

### [new 52.二叉树垂直遍历](https://www.lintcode.com/problem/651/?utm_source=sc-libao-zyq)

### [new 1205.对角线遍历](https://www.lintcode.com/problem/1205/?utm_source=sc-libao-zyq)

### [new 838.子数组和为 K](https://www.lintcode.com/problem/838/?utm_source=sc-libao-zyq)

### [new 165.合并两个排序链表](https://www.lintcode.com/problem/165/?utm_source=sc-libao-zyq)

### [new 363.接雨水](https://www.lintcode.com/problem/363/?utm_source=sc-libao-zyq)

### [new 105.复制带随机指针的链表](https://www.lintcode.com/problem/105/?utm_source=sc-libao-zyq)

### [new 665.平面范围求和-不可变矩阵](https://www.lintcode.com/problem/665/?utm_source=sc-libao-zyq)

### [135.数字组合](https://www.lintcode.com/problem/135/?utm_source=sc-libao-zyq)

### [153.数字组合 II](https://www.lintcode.com/problem/153/?utm_source=sc-libao-zyq)

### [34.N 皇后问题（二）](https://www.lintcode.com/problem/34/?utm_source=sc-libao-zyq)

### [156.合并区间](https://www.lintcode.com/problem/156/?utm_source=sc-libao-zyq)

### [30.插入区间](https://www.lintcode.com/problem/30/?utm_source=sc-libao-zyq)

### [408.二进制求和](https://www.lintcode.com/problem/408/?utm_source=sc-libao-zyq)

### [141.对 x 开根](https://www.lintcode.com/problem/141/?utm_source=sc-libao-zyq)

### [36.翻转链表（二）](https://www.lintcode.com/problem/36/?utm_source=sc-libao-zyq)

### [95.验证二叉查找树](https://www.lintcode.com/problem/95/?utm_source=sc-libao-zyq)

### [453.将二叉树拆成链表](https://www.lintcode.com/problem/453/?utm_source=sc-libao-zyq)

### [94.二叉树中的最大路径和](https://www.lintcode.com/problem/94/?utm_source=sc-libao-zyq)

### [415.有效回文串](https://www.lintcode.com/problem/415/?utm_source=sc-libao-zyq)

### [121.单词接龙 II](https://www.lintcode.com/problem/121/?utm_source=sc-libao-zyq)

### [120.单词接龙](https://www.lintcode.com/problem/120/?utm_source=sc-libao-zyq)

### [477.被围绕的区域](https://www.lintcode.com/problem/477/?utm_source=sc-libao-zyq)

### [82.落单的数](https://www.lintcode.com/problem/82/?utm_source=sc-libao-zyq)

### [107.单词拆分（一）](https://www.lintcode.com/problem/107/?utm_source=sc-libao-zyq)

### [582.单词拆分 II](https://www.lintcode.com/problem/582/?utm_source=sc-libao-zyq)

### [160.寻找旋转排序数组中的最小值 II](https://www.lintcode.com/problem/160/?utm_source=sc-libao-zyq)

### [12.带最小值操作的栈](https://www.lintcode.com/problem/12/?utm_source=sc-libao-zyq)

### [660.用 Read4 从文件中读取 N 个字符 II-多次调用](https://www.lintcode.com/problem/660/?utm_source=sc-libao-zyq)

### [86.二叉查找树迭代器](https://www.lintcode.com/problem/86/?utm_source=sc-libao-zyq)

### [760.二叉树的右视图](https://www.lintcode.com/problem/760/?utm_source=sc-libao-zyq)

### [433.岛屿的个数](https://www.lintcode.com/problem/433/?utm_source=sc-libao-zyq)

### [616.课程表 II](https://www.lintcode.com/problem/616/?utm_source=sc-libao-zyq)

### [2314.列表修改、添加和删除元素](https://www.lintcode.com/problem/2314/?utm_source=sc-libao-zyq)

### [606.第 K 大的元素 II](https://www.lintcode.com/problem/606/?utm_source=sc-libao-zyq)

### [980.基础计算器 II](https://www.lintcode.com/problem/980/?utm_source=sc-libao-zyq)

### [362.滑动窗口的最大值](https://www.lintcode.com/problem/362/?utm_source=sc-libao-zyq)

### [468.对称二叉树](https://www.lintcode.com/problem/468/?utm_source=sc-libao-zyq)

### [1212.最大连续 1 的个数](https://www.lintcode.com/problem/1212/?utm_source=sc-libao-zyq)

### [1310.数组除了自身的乘积](https://www.lintcode.com/problem/1310/?utm_source=sc-libao-zyq)

### [74.第一个错误的代码版本](https://www.lintcode.com/problem/74/?utm_source=sc-libao-zyq)

### [418.整数转罗马数字](https://www.lintcode.com/problem/418/?utm_source=sc-libao-zyq)

### [653.添加运算符](https://www.lintcode.com/problem/653/?utm_source=sc-libao-zyq)

### [7.二叉树的序列化和反序列化](https://www.lintcode.com/problem/7/?utm_source=sc-libao-zyq)

### [780.删除无效的括号](https://www.lintcode.com/problem/780/?utm_source=sc-libao-zyq)

### [669.换硬币](https://www.lintcode.com/problem/669/?utm_source=sc-libao-zyq)

### [910.最大二叉搜索子树](https://www.lintcode.com/problem/910/?utm_source=sc-libao-zyq)

### [551.嵌套列表的加权和](https://www.lintcode.com/problem/551/?utm_source=sc-libao-zyq)

### [746.设计井字棋](https://www.lintcode.com/problem/746/?utm_source=sc-libao-zyq)

### [1272.有序矩阵中的第 K 小元素](https://www.lintcode.com/problem/1272/?utm_source=sc-libao-zyq)

### [1263.是子序列吗？](https://www.lintcode.com/problem/1263/?utm_source=sc-libao-zyq)

### [639.单词缩写](https://www.lintcode.com/problem/639/?utm_source=sc-libao-zyq)

### [655.大整数加法](https://www.lintcode.com/problem/655/?utm_source=sc-libao-zyq)

### [647.子串字谜](https://www.lintcode.com/problem/647/?utm_source=sc-libao-zyq)

### [1222.检验 IP 地址](https://www.lintcode.com/problem/1222/?utm_source=sc-libao-zyq)

### [1212.最大连续 1 的个数](https://www.lintcode.com/problem/1212/?utm_source=sc-libao-zyq)

### [707.最优账户结余](https://www.lintcode.com/problem/707/?utm_source=sc-libao-zyq)

### [1183.排序数组中的单个元素](https://www.lintcode.com/problem/1183/?utm_source=sc-libao-zyq)

### [945.任务计划](https://www.lintcode.com/problem/945/?utm_source=sc-libao-zyq)

### [1115.二叉树每层的平均数](https://www.lintcode.com/problem/1115/?utm_source=sc-libao-zyq)

### [397.最长上升连续子序列](https://www.lintcode.com/problem/397/?utm_source=sc-libao-zyq)

### [1042.托普利兹矩阵](https://www.lintcode.com/problem/1042/?utm_source=sc-libao-zyq)

### [810.水位上升的泳池中游泳](https://www.lintcode.com/problem/810/?utm_source=sc-libao-zyq)

### [1031.图可以被二分么？](https://www.lintcode.com/problem/1031/?utm_source=sc-libao-zyq)

### [1394.山羊拉丁文](https://www.lintcode.com/problem/1394/?utm_source=sc-libao-zyq)

### [1721.使括号有效的最少添加](https://www.lintcode.com/problem/1721/?utm_source=sc-libao-zyq)

### [1704.二叉搜索树的范围和](https://www.lintcode.com/problem/1704/?utm_source=sc-libao-zyq)

### [1702.不同的子序列 II](https://www.lintcode.com/problem/1702/?utm_source=sc-libao-zyq)

### [1876.外星人字典（简单）](https://www.lintcode.com/problem/1876/?utm_source=sc-libao-zyq)

### [1901.有序数组的平方](https://www.lintcode.com/problem/1901/?utm_source=sc-libao-zyq)

### [149.买卖股票的最佳时机](https://www.lintcode.com/problem/149/?utm_source=sc-libao-zyq)

### [402.连续子数组求和](https://www.lintcode.com/problem/402/?utm_source=sc-libao-zyq)

### [412.分糖果](https://www.lintcode.com/problem/412/?utm_source=sc-libao-zyq)

### [920.会议室](https://www.lintcode.com/problem/920/?utm_source=sc-libao-zyq)

### [57.三数之和](https://www.lintcode.com/problem/57/?utm_source=sc-libao-zyq)

### [148.颜色挑选](https://www.lintcode.com/problem/1393/?utm_source=sc-libao-zyq)

### [919.会议室 Ⅱ](https://www.lintcode.com/problem/148/?utm_source=sc-libao-zyq)

### [1393.适龄的朋友](https://www.lintcode.com/problem/1506/?utm_source=sc-libao-zyq)

### [1465.任务顺序](https://www.lintcode.com/problem/1465/?utm_source=sc-libao-zyq)

### [1506.二叉树中所有距离为 K 的结点](https://www.lintcode.com/problem/919/?utm_source=sc-libao-zyq)

### [41.最大子数组](https://www.lintcode.com/problem/41/?utm_source=sc-libao-zyq)

### [172.删除元素](https://www.lintcode.com/problem/172/?utm_source=sc-libao-zyq)

### [397.最长上升连续子序列](https://www.lintcode.com/problem/397/?utm_source=sc-libao-zyq)

### [539.移动零](https://www.lintcode.com/problem/539/?utm_source=sc-libao-zyq)

### [647.子串字谜](https://www.lintcode.com/problem/647/?utm_source=sc-libao-zyq)

### [767.翻转数组](https://www.lintcode.com/problem/767/?utm_source=sc-libao-zyq)

### [1745.单调数列](https://www.lintcode.com/problem/1745/?utm_source=sc-libao-zyq)

### [52.下一个排列](https://www.lintcode.com/problem/52/?utm_source=sc-libao-zyq)

### [62.搜索旋转排序数组](https://www.lintcode.com/problem/62/?utm_source=sc-libao-zyq)

### [200.最长回文子串](https://www.lintcode.com/problem/200/?utm_source=sc-libao-zyq)

### [154.正则表达式匹配](https://www.lintcode.com/problem/154/?utm_source=sc-libao-zyq)

### [172.删除元素](https://www.lintcode.com/problem/172/?utm_source=sc-libao-zyq)

### [414.两个整数相除](https://www.lintcode.com/problem/414/?utm_source=sc-libao-zyq)

### [193.最长有效括号](https://www.lintcode.com/problem/193/?utm_source=sc-libao-zyq)

### [420.报数](https://www.lintcode.com/problem/420/?utm_source=sc-libao-zyq)

## Amazon

### [new 209.第一个只出现一次的字符](https://www.lintcode.com/problem/209/?utm_source=sc-libao-zyq)

### [new 36.翻转链表（二）](https://www.lintcode.com/problem/36/?utm_source=sc-libao-zyq)

### [new 149.买卖股票的最佳时机](https://www.lintcode.com/problem/149/?utm_source=sc-libao-zyq)

### [new 209.第一个只出现一次的字符](https://www.lintcode.com/problem/209/?utm_source=sc-libao-zyq)

### [new 859.最大栈](https://www.lintcode.com/problem/859/?utm_source=sc-libao-zyq)

### [new 1234.删除二叉搜索树中的节点](https://www.lintcode.com/problem/1234/?utm_source=sc-libao-zyq)

### [new 980.基础计算器 II](https://www.lintcode.com/problem/980/?utm_source=sc-libao-zyq)

### [new 158.两个字符串是变位词](https://www.lintcode.com/problem/158/?utm_source=sc-libao-zyq)

### [new 120.单词接龙](https://www.lintcode.com/problem/120/?utm_source=sc-libao-zyq)

### [28.搜索二维矩阵](https://www.lintcode.com/problem/28/?utm_source=sc-libao-zyq)

### [56.两数之和](https://www.lintcode.com/problem/56/?utm_source=sc-libao-zyq)

### [69.二叉树的层次遍历](https://www.lintcode.com/problem/69/?utm_source=sc-libao-zyq)

### [165.合并两个排序链表](https://www.lintcode.com/problem/165/?utm_source=sc-libao-zyq)

### [193.最长有效括号](https://www.lintcode.com/problem/193/?utm_source=sc-libao-zyq)

### [423.有效的括号序列](https://www.lintcode.com/problem/423/?utm_source=sc-libao-zyq)

### [433.岛屿的个数](https://www.lintcode.com/problem/433/?utm_source=sc-libao-zyq)

### [488.快乐数](https://www.lintcode.com/problem/488/?utm_source=sc-libao-zyq)

### [597.具有最大平均数的子树](https://www.lintcode.com/problem/597/?utm_source=sc-libao-zyq)

### [1181.二叉树的直径](https://www.lintcode.com/problem/1181/?utm_source=sc-libao-zyq)

### [38.搜索二维矩阵（二）](https://www.lintcode.com/problem/38/?utm_source=sc-libao-zyq)

### [34.N 皇后问题（二）](https://www.lintcode.com/problem/34/?utm_source=sc-libao-zyq)

### [94.二叉树中的最大路径和](https://www.lintcode.com/problem/94/?utm_source=sc-libao-zyq)

### [105.复制带随机指针的链表](https://www.lintcode.com/problem/105/?utm_source=sc-libao-zyq)

### [107.单词拆分（一）](https://www.lintcode.com/problem/107/?utm_source=sc-libao-zyq)

### [200.最长回文子串](https://www.lintcode.com/problem/200/?utm_source=sc-libao-zyq)

### [363.接雨水](https://www.lintcode.com/problem/363/?utm_source=sc-libao-zyq)

### [382.三角形计数](https://www.lintcode.com/problem/382/?utm_source=sc-libao-zyq)

### [460.在排序数组中找最接近的 K 个数](https://www.lintcode.com/problem/460/?utm_source=sc-libao-zyq)

### [471.最高频的 K 个单词](https://www.lintcode.com/problem/471/?utm_source=sc-libao-zyq)

### [563.背包问题 V](https://www.lintcode.com/problem/563/?utm_source=sc-libao-zyq)

### [564.组合总和 IV](https://www.lintcode.com/problem/564/?utm_source=sc-libao-zyq)

### [54.转换字符串到整数](https://www.lintcode.com/problem/54/?utm_source=sc-libao-zyq)

### [121.单词接龙 II](https://www.lintcode.com/problem/121/?utm_source=sc-libao-zyq)

### [1221.连接词](https://www.lintcode.com/problem/1221/?utm_source=sc-libao-zyq)

## Microsoft

### [new 88.最近公共祖先](https://www.lintcode.com/problem/88/?utm_source=sc-libao-zyq)

### [new 372.在 O(1)时间复杂度删除链表节点](https://www.lintcode.com/problem/372/?utm_source=sc-libao-zyq)

### [new 1301.生命游戏](https://www.lintcode.com/problem/1301/?utm_source=sc-libao-zyq)

### [new 1281.前 K 个高频元素](https://www.lintcode.com/problem/1281/?utm_source=sc-libao-zyq)

### [new 374.螺旋矩阵](https://www.lintcode.com/problem/374/?utm_source=sc-libao-zyq)

### [new 24.LFU 缓存](https://www.lintcode.com/problem/24/?utm_source=sc-libao-zyq)

### [new 28.搜索二维矩阵](https://www.lintcode.com/problem/28/?utm_source=sc-libao-zyq)

### [new 491.回文数](https://www.lintcode.com/problem/491/?utm_source=sc-libao-zyq)

### [new 93.平衡二叉树](https://www.lintcode.com/problem/93/?utm_source=sc-libao-zyq)

### [new 300.会议室 4](https://www.lintcode.com/problem/300/?utm_source=sc-libao-zyq)

### [new 919.会议室 II](https://www.lintcode.com/problem/919/?utm_source=sc-libao-zyq)

### [new 1897.会议室 3](https://www.lintcode.com/problem/1897/?utm_source=sc-libao-zyq)

### [new 1844.子数组和为 KII](https://www.lintcode.com/problem/1844/?utm_source=sc-libao-zyq)

### [new 46.主元素](https://www.lintcode.com/problem/46/?utm_source=sc-libao-zyq)

### [new 1360.对称树](https://www.lintcode.com/problem/1360/?utm_source=sc-libao-zyq)

### [new 556.标准型布隆过滤器](https://www.lintcode.com/problem/556/?utm_source=sc-libao-hyp)

### [new 173.链表插入排序](https://www.lintcode.com/problem/173/?utm_source=sc-libao-hyp)

### [new 804.不同岛屿的数量 II](https://www.lintcode.com/problem/804/?utm_source=sc-libao-hyp)

### [new 573.邮局的建立 II](https://www.lintcode.com/problem/573/?utm_source=sc-libao-hyp)

### [new 1273.最长上升字符串](https://www.lintcode.com/problem/1273/?utm_source=sc-libao-hyp)

### [new 156.合并区间](https://www.lintcode.com/problem/156/?utm_source=sc-libao-hyp)

### [new 121.单词接龙 II](https://www.lintcode.com/problem/121/?utm_source=sc-libao-hyp)

### [new 1361.文字并排](https://www.lintcode.com/problem/1361/?utm_source=sc-libao-zyq)

### [156.合并区间](https://www.lintcode.com/problem/156/?utm_source=sc-libao-zyq)

### [646.第一个独特字符位置](https://www.lintcode.com/problem/646/?utm_source=sc-libao-zyq)

### [693.移掉 K 位数字](https://www.lintcode.com/problem/693/?utm_source=sc-libao-zyq)

### [756.两数相乘](https://www.lintcode.com/problem/756/?utm_source=sc-libao-zyq)

### [1311.二叉搜索树的最近公共祖先](https://www.lintcode.com/problem/1311/?utm_source=sc-libao-zyq)

### [1324.质数的个数](https://www.lintcode.com/problem/1324/?utm_source=sc-libao-zyq)

### [62.搜索旋转排序数组](https://www.lintcode.com/problem/62/?utm_source=sc-libao-zyq)

### [102.带环链表](https://www.lintcode.com/problem/102/?utm_source=sc-libao-zyq)

### [221.链表求和 II](https://www.lintcode.com/problem/221/?utm_source=sc-libao-zyq)

### [915.BST 的中序前驱节点](https://www.lintcode.com/problem/915/?utm_source=sc-libao-zyq)

### [927.翻转字符串 II](https://www.lintcode.com/problem/927/?utm_source=sc-libao-zyq)

### [86.二叉查找树迭代器](https://www.lintcode.com/problem/86/?utm_source=sc-libao-zyq)

### [103.带环链表 II](https://www.lintcode.com/problem/103/?utm_source=sc-libao-zyq)

### [450.K 组翻转链表](https://www.lintcode.com/problem/450/?utm_source=sc-libao-zyq)

### [849.基础计算器 III](https://www.lintcode.com/problem/849/?utm_source=sc-libao-zyq)

### [131.大楼轮廓](https://www.lintcode.com/problem/131/?utm_source=sc-libao-zyq)

## Linkedin

### [new 451.两两交换链表中的节点](https://www.lintcode.com/problem/451/?utm_source=sc-libao-zyq)

### [new 433.岛屿的个数](https://www.lintcode.com/problem/433/?utm_source=sc-libao-zyq)

### [new 1790.旋转字符串 II](https://www.lintcode.com/problem/1790/?utm_source=sc-libao-zyq)

### [new 924.单词最短距离](https://www.lintcode.com/problem/924?utm_source=sc-libao-zyq)

### [new 551.嵌套列表的加权和](https://www.lintcode.com/problem/551/?utm_source=sc-libao-zyq)

### [new 1489.最大矩阵边界和](https://www.lintcode.com/problem/1489/?utm_source=sc-libao-zyq)

### [new 1360.对称树](https://www.lintcode.com/problem/1360/?utm_source=sc-libao-zyq)

### [new 926.最短单词距离 III](https://www.lintcode.com/problem/926/?utm_source=sc-libao-zyq)

### [new 578.最近公共祖先 III](https://www.lintcode.com/problem/578/?utm_source=sc-libao-zyq)

### [new 859.最大栈](https://www.lintcode.com/problem/859/?utm_source=sc-libao-zyq)

### [41.最大子数组](https://www.lintcode.com/problem/41/?utm_source=sc-libao-zyq)

### [56.数之和](https://www.lintcode.com/problem/56/?utm_source=sc-libao-zyq)

### [69.叉树的层次遍历](https://www.lintcode.com/problem/69/?utm_source=sc-libao-zyq)

### [16.合并两个排序链表](https://www.lintcode.com/problem/165/?utm_source=sc-libao-zyq)

### [423.有效的括号序列](https://www.lintcode.com/problem/423/?utm_source=sc-libao-zyq)

### [15.全排列](https://www.lintcode.com/problem/15/?utm_source=sc-libao-zyq)

### [1534.将二叉搜索树转换为已排序的双向链接列表](https://www.lintcode.com/problem/1534/?utm_source=sc-libao-zyq)

### [104.合并 k 个排序链表](https://www.lintcode.com/problem/104/?utm_source=sc-libao-zyq)

### [189.丢失的第一个正整数](https://www.lintcode.com/problem/189/?utm_source=sc-libao-zyq)

### [191.乘积最大子序列](https://www.lintcode.com/problem/191/?utm_source=sc-libao-zyq)

### [392.打劫房屋](https://www.lintcode.com/problem/392/?utm_source=sc-libao-zyq)

### [415.有效回文串](https://www.lintcode.com/problem/415/?utm_source=sc-libao-zyq)

### [424.逆波兰表达式求值](https://www.lintcode.com/problem/424/?utm_source=sc-libao-zyq)

### [578.最近公共祖先 III](https://www.lintcode.com/problem/578/?utm_source=sc-libao-zyq)

### [612.K 个最近的点](https://www.lintcode.com/problem/612/?utm_source=sc-libao-zyq)

### [652.因式分解](https://www.lintcode.com/problem/652/?utm_source=sc-libao-zyq)

### [926.最短单词距离 III](https://www.lintcode.com/problem/926/?utm_source=sc-libao-zyq)

### [933.数组乘积](https://www.lintcode.com/problem/933/?utm_source=sc-libao-zyq)

### [934.开锁问题](https://www.lintcode.com/problem/934/?utm_source=sc-libao-zyq)

### [935.笛卡尔积](https://www.lintcode.com/problem/935/?utm_source=sc-libao-zyq)

### [86.二叉查找树迭代器](https://www.lintcode.com/problem/86/?utm_source=sc-libao-zyq)

### [738.计数回文子序列](https://www.lintcode.com/problem/738/?utm_source=sc-libao-zyq)

### [859.最大栈](https://www.lintcode.com/problem/859/?utm_source=sc-libao-zyq)

### [985.我能赢吗](https://www.lintcode.com/problem/985/?utm_source=sc-libao-zyq)

### [1361.文字并排](https://www.lintcode.com/problem/1361/?utm_source=sc-libao-zyq)


## Others

### [476.Stone Game 石子归并](https://www.lintcode.com/problem/476/)

- [Answer](https://www.jiuzhang.com/problem/stone-game/)

**_区间 DP_**

这是一道区间 DP 问题，我们需要用区间表示状态来递推。设 s 是表示石头重量的数组，设`f[i][j]`是将`s[i,...,j]`的石头合并成一个所需的最少能量，那么这个最少能量按照最后一步合并的分界线可以分为以下几种情况：

1. 最后一步是`s[i]`和`s[i+1,...,j]`合并，此时需要的最少能量是`f[i+1][j]+sum(s[i]...s[j])`,第一项是合并后者需要的能量，第二项是最后一次合并所需要的能量。`s[i]`自己只有一个石头，不需要合并

1. 最后一步是`s[i,i+1]`和`s[i+2,...,j]`合并，此时需要的最少能量是`f[i][i+1]+f[i+2][j]+sum(s[i]...s[j])`，第一项是合并前两个石头需要的能量，第二项是合并后半区间石头需要的能量，最后一项是最后一次合并需要的能量；

从上面我们可以看出一个规律，`f[i][j]`应该是所有区间分法中前一半区间的石头合并需要的总能量加上后半区间的总能量再加上最后一次合并需要的能量

- 求得 A 的前缀和
- 区间长度从 2 开始枚举，
- 根据上诉思路可得递推式
- `dp[l][r] =min(dp[l][r], dp[l][j] + dp[j + 1][r] + sum_a[r + 1] - sum_a[l])`
- 记得初始化`dp[l][r]`为一个较大值
- 结果存在`dp[0][size-1]`中

**_复杂度分析_**

- 时间复杂度`O(n^3)`
  - 区间 dp 的复杂度
- 空间复杂度`O(n^2)`
  - dp 数组的大小

```c++
// C++
class Solution {
 public:
  int stoneGame(vector<int> &A) {
    int _size = A.size();
    if (_size == 0) {
      return 0;
    }
    int dp[_size][_size];
    int sum_a[_size+1];
    //c++记得初始化
    memset(sum_a, 0, sizeof(sum_a));
    memset(dp, 0, sizeof(dp));
    //前缀和
    for (int i = 0; i < _size; i++) {
      sum_a[i + 1] = sum_a[i] + A[i];
    }
    // 长度从2开始即可，因为长度为1的时候结果是0
    for (int len = 2; len <= _size; len++) {
      // i枚举的是正在枚举的区间的左端点
      for (int i = 0; i + len - 1 < _size; i++) {
        // 正在枚举的区间左端点是i，右端点是i + size - 1
        int l = i, r = i + len - 1;
        // 在求最小的时候，需要初始化成一个很大的数，然后不断更新
        dp[l][r] = INT_MAX;
        for (int j = l; j < r; j++) {
          //递推式
          dp[l][r] = min(dp[l][r], dp[l][j] + dp[j + 1][r] + sum_a[r + 1] - sum_a[l]);
        }
      }
    }
    return dp[0][_size - 1];
  }
};
```

```python
# Python
class Solution:
    def stoneGame(self, A):
        import sys
        size = len(A)
        if size == 0:
            return 0;
        dp = [[0 for _ in range(size)] for _ in range(size)]
        sum_a = [0] * (size + 1)
        #前缀和
        for i in range(size):
            sum_a[i + 1] = sum_a[i] + A[i]
        #长度从2开始即可，因为长度为1的时候结果是0，dp初始化的时候默认就是0，没必要赋值
        for _len in range(2,size + 1):
            #i枚举的是正在枚举的区间的左端点
            for i in range(size + 1 - _len):
                #正在枚举的区间左端点是i，右端点是i + size - 1
                l,r = i,i + _len - 1
                #在求最小的时候，需要初始化成一个很大的数，然后不断更新
                dp[l][r] = sys.maxsize
                for j in range(l, r):
                    #递推式
                    dp[l][r] = min(dp[l][r], dp[l][j] + dp[j + 1][r] + sum_a[r + 1] - sum_a[l])
        return dp[0][size - 1]
```
### How to use heap in c++
```cpp
#include <iostream>
#include <set>

#define assertm(exp, msg) assert(((void)msg, exp))
#define print(input) for (auto& elem : input) std::cout << elem << std::endl

int main() {

  auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) {return a.second < b.second;};

  std::set<std::pair<int, int>, decltype(cmp)> heap;

  heap.insert(std::make_pair(1, 3));
  heap.insert(std::make_pair(31, 1));
  heap.insert(std::make_pair(4, 4));
  heap.insert(std::make_pair(2, 2));
  heap.insert(std::make_pair(5, 5));


  auto it = heap.begin();
  it = std::next(it, 2);
  it = std::prev(it, 1);
  std::cout << it->first << " " << it->second << std::endl;
  std::cout << "size: " << heap.size() << std::endl;

  int index = 31;
  auto it2 = std::find_if(heap.begin(), heap.end(), [&index](const std::pair<int, int>& a) {return a.first == index;});
  heap.erase(it2);

  it = heap.begin();
  std::cout << it->first << " " << it->second << std::endl;
  std::cout << "size: " << heap.size() << std::endl;

  return 0;
}
```

### 1507 Shortest Subarray with Sum at Least K 和至少为 K 的最短子数组

[[https://www.lintcode.com/problem/1507/][Lintcode 1507 Shortest Subarray with Sum at Least K]]

#### Binary search on answer + priority_queue
```c++
class Solution {
 public:
  int shortestSubarray(std::vector<int>& A, int K) {
    std::vector<int> prefix_sum = GetPrefixSum(A);
    int left = 1;
    int right = A.size();
    while (left + 1 < right) {
      int mid = left + (right - left) / 2;
      if (IsValid(prefix_sum, mid, K)) {
        right = mid;
      } else {
        left = mid;
      }
    }

    if (IsValid(prefix_sum, left, K)) {
      return left;
    }
    if (IsValid(prefix_sum, right, K)) {
      return right;
    }
    return -1;
  }
 private:
  std::vector<int> GetPrefixSum(std::vector<int>& nums) {
    std::vector<int> answer(nums.size() + 1, 0);
    for (int i = 0; i < nums.size(); ++i) {
      answer[i + 1] = answer[i] + nums[i];
    }
    return answer;
  }

  bool IsValid(std::vector<int>& prefix_sum, int length, int K) {
    auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) { return a.second > b.second; };
    std::set<std::pair<int, int>, decltype(cmp)> pq(cmp); // c++20 pq; c++11 pq(cmp)
    for (int end = 0; end < prefix_sum.size(); ++end) {
      int index = end - length - 1;
      if (index >= 0) {
        pq.erase(std::find_if(pq.begin(), pq.end(), [&index](const std::pair<int, int>& a) {
          return a.first == index;
        }));
      }
      if (!pq.empty() && prefix_sum[end] - pq.rbegin()->second >= K) {
        return true;
      }
      pq.insert(std::make_pair(end, prefix_sum[end]));
    }
    return false;
  }
};
```

`auto cmp` has to be `>`
Do binary search on answer, and then checking validation of the current answer on prefixsum vector
to speed up the runnint time we can use lazy deletion to change delete operation of heap into an O(logn) operation
Time Complexity of binary search + heap is O(n(logn)^2)

#### Leetcode 1337.The K Weakest Rows in a Matrix
```c++
class Solution {
 public:
  std::vector<int> kWeakestRows(std::vector<vector<int>>& mat, int k) {
    auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) {
      if (a.second == b.second) {
        return a.first < b.first;
      }
      return a.second < b.second;
    };
    std::set<std::pair<int, int>, decltype(cmp)> pq(cmp);
    for (int i = 0; i < mat.size(); ++i) {
      pq.insert(
        std::make_pair(
          i, std::accumulate(mat[i].begin(), mat[i].end(), 0)
        )
      );
    }

    std::vector<int> answer;
    auto it = pq.begin();
    while (k--) {
      answer.push_back(it->first);
      it = std::next(it, 1);
    }
    return answer;
  }
};
```

### multiset in C++
Unlike sets, multisets can store duplicate elements in a sorted manner. The elements inside the multiset cannot be changed, once they are added to the multiset, they can only be inserted or deleted. A multiset is present in #include<set> header file. The elements inside the multiset can be accessed using iterators. 
```c++
// example
multiset <int> s; //initializes a multiset of size 0 which stores integer values arranged in non-decreasing order
multiset <int> s = { 10, 20, 30 }; //initializes a multiset having initial values as 10,20,30
multiset <int, greater <int>> s; //initializes a multiset of size 0 which stores integer values arranged in non-increasing order
```

```
begin(): Returns an iterator to the first element of the multiset.
Parameters: None
Return type: iterator
 
end(): Returns an iterator to the element past the last element of the multiset.
Parameters: None
Return type: iterator
 
size(): It tells us the size of the multiset.
Parameters: None
Return type: integer - total number of elements in the multiset
 
insert(element): Inserts an element in the multiset.
Time Complexity: O(logN) where N is the size of the multiset
Parameters: the element to be inserted
Return type: void
 
erase(value) or erase(start_iterator,end_iterator): Delete elements from the multiset.
Time Complexity: O(logN) where N is the size of the multiset
Parameters: the value to be removed or iterators pointing to the position between which the value needs to be deleted
Return type: void
 
find(element): Returns an iterator pointing to the element, if the element is found else returns an iterator pointing to the end of the multiset.
Parameters: the element which needs to be found
Return type: iterator
 
clear(): It deletes all the elements from the multiset
Parameters: None
Return type: void
 
empty(): It tells us whether the multiset is empty or not.
Parameters: None
Return type: Boolean, true if a multiset is empty else false
```

```c++
#include<iostream>
#include<set>
using namespace std;

int main() {
  multiset <int> s1;
  multiset <int, greater<int>> s2;
  for (int i = 0; i < 5; i++) {
    s1.insert(i + 1);
  }
  for (int i = 0; i < 5; i++) {
    s1.insert(i + 1);
  }
  for (int i = 0; i < 5; i++) {
    s2.insert((i + 1) * 10);
  }
  for (int i = 0; i < 5; i++) {
    s2.insert((i + 1) * 10);
  }
  set <int> ::iterator it;
  for (it = s1.begin(); it != s1.end(); it++)
    cout << * it << " ";
  cout << '\n';
  for (it = s2.begin(); it != s2.end(); it++)
    cout << * it << " ";
  cout << '\n';

  s1.erase(1);
  s2.erase(s2.begin(), s2.find(10));
  cout << "After erasing element, size of set1 is " << s1.size() << '\n';
  int val = 4;
  if (s1.find(val) != s1.end())
    cout << "The set1 contains " << val << endl;
  else
    cout << "The set1 does not contains " << val << endl;
  cout << "New elements of set1 are ";
  for (it = s1.begin(); it != s1.end(); it++)
    cout << * it << " ";
  cout << '\n';

  s1.clear();
  if (s1.empty() == true) {
    cout << "set1 is empty!";
  }
  return 0;
}

/*
1 1 2 2 3 3 4 4 5 5 
50 50 40 40 30 30 20 20 10 10 
After erasing element, size of set1 is 8
The set1 contains 4
New elements of set1 are 2 2 3 3 4 4 5 5 
set1 is empty!
*/
```

### C++ isalnum, isalpha, isdigit
- `isalnum` checks whether c is either a decimal digit or an uppercase or lowercase letter.
- The result is true if either isalpha or isdigit would also return true.

# 3. ML

## Linear regression

## Logistic regression

## Decision tree

## SVM algorithm

## Naive Bayes algorithm

## KNN algorithm

## K-means

## Random forest algorithm

## Dimensionality reduction algorithms

## Gradient boosting algorithm and AdaBoosting algorithm

# 4. Projects

## Pthread Prefix Sum

## GPU K-means

## Tree Comparison

## Two Phase Commit Protocol

## MPI Barnes-hut
```c++
https://www.youtube.com/watch?v=m9f6CoToIGU
```