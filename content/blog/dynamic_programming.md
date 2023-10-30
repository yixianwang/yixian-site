+++
title = 'Dynamic Programming'
date = 2023-10-30T10:36:13-04:00
+++


<!-- vim-markdown-toc GFM -->

* [Chapter 1: DP 入门](#chapter-1-dp-入门)
  * [DP题目特点](#dp题目特点)
  * [最值型动态规划 && DP组成部分一：确定状态](#最值型动态规划--dp组成部分一确定状态)
  * [递归写法的不可行性](#递归写法的不可行性)
    * [递归写法](#递归写法)
    * [递归写法的问题](#递归写法的问题)
  * [DP组成部分二：转移方程（到此对了一半，比确定状态简单一些）](#dp组成部分二转移方程到此对了一半比确定状态简单一些)
  * [DP组成部分三：初始条件和边界情况](#dp组成部分三初始条件和边界情况)
  * [DP组成部分四：计算顺序](#dp组成部分四计算顺序)
  * [Time Complexity](#time-complexity)
  * [Coding 669](#coding-669)
  * [计数型动态规划](#计数型动态规划)
    * [DP组成部分一：确定状态](#dp组成部分一确定状态)
    * [DP组成部分二：转移方程](#dp组成部分二转移方程)
    * [DP组成部分三：初始条件和边界情况](#dp组成部分三初始条件和边界情况-1)
    * [DP组成部分四：计算顺序](#dp组成部分四计算顺序-1)
    * [Coding](#coding)
  * [存在型动态规划](#存在型动态规划)
    * [DP组成部分一：确定状态](#dp组成部分一确定状态-1)
    * [DP组成部分二：转移方程](#dp组成部分二转移方程-1)
    * [DP组成部分三：初始条件和边界情况](#dp组成部分三初始条件和边界情况-2)
    * [DP组成部分四：计算顺序](#dp组成部分四计算顺序-2)
    * [Coding](#coding-1)
  * [In summary](#in-summary)
  * [Exercise1: 金字塔](#exercise1-金字塔)
  * [Exercise2: 乘积最大子序列](#exercise2-乘积最大子序列)
* [Chapter 2: 动态规划初探 + 坐标型动态规划 + 位操作型动态规划](#chapter-2-动态规划初探--坐标型动态规划--位操作型动态规划)
  * [初探 坐标型动态规划](#初探-坐标型动态规划)
    * [题目分析](#题目分析)
    * [初始条件和边界情况](#初始条件和边界情况)
    * [Coding](#coding-2)
  * [初探 序列型动态规划](#初探-序列型动态规划)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态)
    * [子问题](#子问题)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序)
    * [Coding](#coding-3)
    * [In summary: seq-type](#in-summary-seq-type)
  * [初探 划分型动态规划](#初探-划分型动态规划)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-1)
    * [子问题](#子问题-1)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-1)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-1)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-1)
    * [Coding](#coding-4)
  * [坐标型动态规划：最小路径和](#坐标型动态规划最小路径和)
  * [坐标型动态规划：最小路径和--路径打印](#坐标型动态规划最小路径和--路径打印)
  * [坐标型动态规划：最小路径和--空间优化](#坐标型动态规划最小路径和--空间优化)
  * [坐标型动态规划：炸弹袭击](#坐标型动态规划炸弹袭击)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-2)
    * [子问题](#子问题-2)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-2)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-2)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-2)
    * [四个方向](#四个方向)
    * [Coding](#coding-5)
    * [坐标型动态规划 总结](#坐标型动态规划-总结)
  * [位操作型动态规划：Counting Bits](#位操作型动态规划counting-bits)
    * [题目分析](#题目分析-1)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-3)
    * [子问题](#子问题-3)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-3)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-3)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-3)
    * [Coding](#coding-6)
  * [Exercise: 最长上升子序列](#exercise-最长上升子序列)
* [Chapter 3: 打劫房屋: 坐标型，前缀型](#chapter-3-打劫房屋-坐标型前缀型)
  * [坐标型](#坐标型)
    * [动态规划](#动态规划)
    * [代码思路](#代码思路)
  * [前缀型](#前缀型)
* [Chapter 4: 最大矩形 && 最大直方图：坐标型](#chapter-4-最大矩形--最大直方图坐标型)
  * [最大矩形](#最大矩形)
  * [直方图最大矩形覆盖](#直方图最大矩形覆盖)
* [Chapter 5: 最短假期：坐标型](#chapter-5-最短假期坐标型)
  * [Exercise: 相关题目](#exercise-相关题目)
* [Chapter 6: 最小调整代价：背包型](#chapter-6-最小调整代价背包型)
  * [状态](#状态)
  * [转移方程](#转移方程)
  * [思路](#思路)
    * [1.临界值：](#1临界值)
    * [2.状态转移方程：](#2状态转移方程)
  * [Coding](#coding-7)
* [Chapter 7: 香槟塔：坐标型](#chapter-7-香槟塔坐标型)
  * [Step 1 : 如何定义状态？](#step-1--如何定义状态)
  * [Step 2 : 临界值是什么？](#step-2--临界值是什么)
  * [Step 3 : 状态转移方程怎么写？](#step-3--状态转移方程怎么写)
  * [Step 4 : DP结果是什么？](#step-4--dp结果是什么)
  * [空间优化：](#空间优化)
    * [Soluton 1: row % 2](#soluton-1-row--2)
    * [Soluton 2: 一维数组](#soluton-2-一维数组)
* [Chapter 8: 飞行棋I](#chapter-8-飞行棋i)
  * [Step 1 : 如何定义状态？](#step-1--如何定义状态-1)
  * [Step 2 : 临界值是什么？](#step-2--临界值是什么-1)
  * [Step 3 : 状态转移方程怎么写？](#step-3--状态转移方程怎么写-1)
  * [Step 4 : DP结果是什么？](#step-4--dp结果是什么-1)
  * [DP Solution](#dp-solution)
* [Chapter 9: 序列型动态规划](#chapter-9-序列型动态规划)
  * [序列型动态规划--简介](#序列型动态规划--简介)
  * [序列型动态规划--数字翻转](#序列型动态规划--数字翻转)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-4)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-4)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-4)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-4)
    * [Coding](#coding-8)
      * [Mine Correct Solution](#mine-correct-solution)
      * [Official Solution](#official-solution)
  * [序列型动态规划的时间优化--房屋染色II](#序列型动态规划的时间优化--房屋染色ii)
    * [Mine Correct Answer O(nk^2)](#mine-correct-answer-onk2)
    * [时间优化](#时间优化)
      * [Mine correct time optimized solution](#mine-correct-time-optimized-solution)
      * [Official time optimized solution](#official-time-optimized-solution)
  * [序列型动态规划--买卖股票1](#序列型动态规划--买卖股票1)
    * [动态规划解法](#动态规划解法)
      * [Mine correct solution](#mine-correct-solution-1)
      * [Official solution: Better](#official-solution-better)
  * [序列型动态规划--买卖股票2](#序列型动态规划--买卖股票2)
    * [题目分析](#题目分析-2)
    * [Official solution](#official-solution-1)
  * [序列型动态规划--买卖股票3: 序列型](#序列型动态规划--买卖股票3-序列型)
    * [题目分析](#题目分析-3)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-5)
      * [记录阶段](#记录阶段)
    * [动态规划组成部分一：确定状态 continued](#动态规划组成部分一确定状态-continued)
    * [子问题](#子问题-4)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-5)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-5)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-5)
    * [Official Solution](#official-solution-2)
  * [序列型动态规划--买卖股票4](#序列型动态规划--买卖股票4)
    * [题目分析](#题目分析-4)
    * [记录阶段](#记录阶段-1)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-6)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-6)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-6)
    * [Official Solution](#official-solution-3)
    * [Official Solution : rolling array optimization](#official-solution--rolling-array-optimization)
  * [序列型动态规划--小结](#序列型动态规划--小结)
  * [初探 最长上升子序列(LIS)](#初探-最长上升子序列lis)
    * [最长序列型动态规划](#最长序列型动态规划)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-6)
    * [子问题](#子问题-5)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-7)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-7)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-7)
    * [思考：如何做到时间复杂度O(nlogn)](#思考如何做到时间复杂度onlogn)
    * [Official Solution: O(n^2)](#official-solution-on2)
  * [phone interview](#phone-interview)
  * [Exercise 602 俄罗斯套娃信封](#exercise-602-俄罗斯套娃信封)
    * [Mine first solution: Time Limit Exceeded: dp](#mine-first-solution-time-limit-exceeded-dp)
    * [Mine second solution: Time Limit Exceeded: dfs](#mine-second-solution-time-limit-exceeded-dfs)
    * [Correct forum official solution](#correct-forum-official-solution)
  * [课后习题](#课后习题)
* [Chapter 10: 骰子求和：背包型](#chapter-10-骰子求和背包型)
  * [背包型](#背包型)
* [Chapter 11: 最长有效括号：后缀型(与前缀型只区别与计算顺序)](#chapter-11-最长有效括号后缀型与前缀型只区别与计算顺序)
* [Chapter 12: 最大子数组差](#chapter-12-最大子数组差)
  * [Mine solution](#mine-solution)
  * [Official Solution: with some Greedy idea](#official-solution-with-some-greedy-idea)
  * [相关题目](#相关题目)
* [Chapter 13: 工作安排：坐标型](#chapter-13-工作安排坐标型)
* [Chapter 14: 染色问题：坐标型](#chapter-14-染色问题坐标型)
* [Chapter 15: 最小的窗口子序列：匹配型](#chapter-15-最小的窗口子序列匹配型)
  * [The first solution with O(n^2 * (n + m)) approximate to O(n^3)](#the-first-solution-with-on2--n--m-approximate-to-on3)
  * [The second solution with O(n * (n + m)) approximate to O(n^2), we should let time less than 10^8, if n is 20000, then it becomes 4 * 10^8 > 10^8, which is not good](#the-second-solution-with-on--n--m-approximate-to-on2-we-should-let-time-less-than-108-if-n-is-20000-then-it-becomes-4--108--108-which-is-not-good)
  * [The thrid solution: Dynamic Programming: Time O(n * m) Space O(n * m)](#the-thrid-solution-dynamic-programming-time-on--m-space-on--m)
  * [Relative Problems](#relative-problems)
* [Chapter 16: 划分型、博弈型 和 背包型 动态规划](#chapter-16-划分型博弈型-和-背包型-动态规划)
  * [划分型动态规划](#划分型动态规划)
    * [Example: Lintcode 513 Perfect Square：划分型](#example-lintcode-513-perfect-square划分型)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-7)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-8)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-8)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-8)
      * [Coding Solution](#coding-solution)
      * [Follow up](#follow-up)
    * [Example: Lintcode 108 Palindrome Partitioning II](#example-lintcode-108-palindrome-partitioning-ii)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-8)
      * [子问题](#子问题-6)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-9)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-9)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-9)
      * [回文串判断](#回文串判断)
        * [回文串种类](#回文串种类)
        * [生成回文串](#生成回文串)
        * [在字符串中找到所有回文串](#在字符串中找到所有回文串)
        * [记录回文串](#记录回文串)
      * [回到原题](#回到原题)
    * [Example: Lintcode 437 Copy Books](#example-lintcode-437-copy-books)
      * [题目分析](#题目分析-5)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-9)
      * [子问题](#子问题-7)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-10)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-10)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-10)
      * [Coding: The First Solution with DP](#coding-the-first-solution-with-dp)
      * [Coding: The Second Solution with Binary Search](#coding-the-second-solution-with-binary-search)
    * [Summary](#summary)
  * [博弈型动态规划](#博弈型动态规划)
    * [Example: Lintcode 394 Coins in a Line](#example-lintcode-394-coins-in-a-line)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-10)
    * [博弈型动态规划：必胜 vs 必败](#博弈型动态规划必胜-vs-必败)
    * [子问题](#子问题-8)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-11)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-11)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-11)
    * [Official Solution](#official-solution-4)
    * [The Second Solution with Time O(1) Space O(1)](#the-second-solution-with-time-o1-space-o1)
  * [背包型动态规划](#背包型动态规划)
    * [直觉](#直觉)
    * [Example: Lintcode 92 Backpack](#example-lintcode-92-backpack)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-11)
      * [子问题](#子问题-9)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-12)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-12)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-12)
      * [DP Official Solution](#dp-official-solution)
      * [Backpack Official Solution](#backpack-official-solution)
      * [Summary](#summary-1)
    * [Example: Lintcode 563 Backpack V](#example-lintcode-563-backpack-v)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-12)
      * [子问题](#子问题-10)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-13)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-13)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-13)
      * [Official Solution](#official-solution-5)
      * [进一步空间优化](#进一步空间优化)
      * [My Correct Solution](#my-correct-solution)
    * [Exercise: Lintcode 564 BackPack IV (组合总和 IV)](#exercise-lintcode-564-backpack-iv-组合总和-iv)
      * [题目分析](#题目分析-6)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-13)
      * [子问题](#子问题-11)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-14)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-14)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-14)
      * [Offical Solution](#offical-solution)
  * [Summary](#summary-2)
    * [Exercise: Single Choice](#exercise-single-choice)
* [Chapter 17: 背包型 和 区间型 动态规划](#chapter-17-背包型-和-区间型-动态规划)
  * [01 backpack](#01-backpack)
    * [打印路径](#打印路径)
  * [complete backpack](#complete-backpack)
  * [multiple backpack](#multiple-backpack)
  * [区间型动态规划](#区间型动态规划)
    * [Example: Lintcode 667 Longest Palindrome Subsequence](#example-lintcode-667-longest-palindrome-subsequence)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-14)
      * [子问题](#子问题-12)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-15)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-15)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-15)
      * [Official Solution](#official-solution-6)
    * [记忆化搜索方法](#记忆化搜索方法)
      * [与递推方法比较](#与递推方法比较)
      * [Coding with Template (important)](#coding-with-template-important)
    * [Example: Lintcode 396 Coins in A Line III （区间型动态规划—博弈问题）](#example-lintcode-396-coins-in-a-line-iii-区间型动态规划博弈问题)
      * [博弈](#博弈)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-15)
      * [博弈子问题](#博弈子问题)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-16)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-16)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-16)
    * [Example: Lintcode 430 Scramble String](#example-lintcode-430-scramble-string)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-16)
      * [子问题](#子问题-13)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-17)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-17)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-17)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-17)
      * [记忆化搜索](#记忆化搜索)
    * [Example: Lintcode 168 吹气球 (消去型 --> 区间型)](#example-lintcode-168-吹气球-消去型----区间型)
      * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-18)
      * [子问题](#子问题-14)
      * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-18)
      * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-18)
      * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-18)
    * [Summary](#summary-3)
* [Chapter 18: 石头碰撞：背包型](#chapter-18-石头碰撞背包型)
* [Chapter 19: 合并金币：区间型](#chapter-19-合并金币区间型)
* [Chapter 20: 外卖满减：01背包](#chapter-20-外卖满减01背包)
  * [Exercise Lintcode 92 backpack](#exercise-lintcode-92-backpack)
  * [Exercise Lintcode 125 backpack II](#exercise-lintcode-125-backpack-ii)
  * [Exercise Lintcode 563 backpack V](#exercise-lintcode-563-backpack-v)
* [Chapter 21: 考试策略：0/0.5/1背包](#chapter-21-考试策略0051背包)
  * [Exercise Lintcode 1538 卡牌游戏 II](#exercise-lintcode-1538-卡牌游戏-ii)
  * [Exercise Lintcode 700 杆子分割](#exercise-lintcode-700-杆子分割)
* [Chapter 22: 双序列动态规划](#chapter-22-双序列动态规划)
  * [Example: Lintcode 77 最长公共子序列](#example-lintcode-77-最长公共子序列)
    * [题目分析](#题目分析-7)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-19)
    * [子问题](#子问题-15)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-19)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-19)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-19)
    * [打印最长公共子序列](#打印最长公共子序列)
  * [Example: Lintcode 29 交叉字符串](#example-lintcode-29-交叉字符串)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-20)
    * [子问题](#子问题-16)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-20)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-20)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-20)
    * [滚动数组优化](#滚动数组优化)
  * [Example: Lintcode 119 编辑距离](#example-lintcode-119-编辑距离)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-21)
    * [子问题](#子问题-17)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-21)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-21)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-21)
    * [滚动数组优化](#滚动数组优化-1)
    * [编辑距离的实际用途](#编辑距离的实际用途)
  * [Example: Lintcode 154 Regular Expression Matching](#example-lintcode-154-regular-expression-matching)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-22)
    * [子问题](#子问题-18)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-22)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-22)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-22)
  * [Example: Lintcode 192 Wildcard Matching](#example-lintcode-192-wildcard-matching)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-23)
    * [子问题](#子问题-19)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-23)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-23)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-23)
  * [Example: Lintcode 668 Ones and Zeroes：双背包](#example-lintcode-668-ones-and-zeroes双背包)
    * [动态规划组成部分一：确定状态](#动态规划组成部分一确定状态-24)
    * [动态规划组成部分二：转移方程](#动态规划组成部分二转移方程-24)
    * [动态规划组成部分三：初始条件和边界情况](#动态规划组成部分三初始条件和边界情况-24)
    * [动态规划组成部分四：计算顺序](#动态规划组成部分四计算顺序-24)
  * [Example: Lintcode 118 Distinct Subsequences](#example-lintcode-118-distinct-subsequences)
* [Chapter 23: 毕业旅行](#chapter-23-毕业旅行)
  * [分析](#分析)
* [Chapter 24: 双色塔](#chapter-24-双色塔)
* [Chapter 25: 编辑距离](#chapter-25-编辑距离)
* [Others Note](#others-note)
  * [动态规划的题型](#动态规划的题型)
  * [简历: 最好一页](#简历-最好一页)
  * [How to use heap in c++](#how-to-use-heap-in-c)

<!-- vim-markdown-toc -->

## Chapter 1: DP 入门

- 常见DP类型：
  - 坐标型（20%）
  - 序列型（20%）
  - 划分型（20%）
  - 区间型（15%）
  - 背包型（10%）
  - 最长序列型（5%）
  - 博弈型（5%）
  - 综合型（5%）

- DP时间空间优化
  - FollowUp 常考：滚动数组 或者 降维

- DP打印路径

### DP题目特点

1. 计数(求方案数)
    - 有多少种方式走到右下角
    - 有多少种方法选出`k`个数使得和是sum
    - How many ways (can you / does it)?
2. 求最大最小值(求最值)
    - 从左上角走到右下角路径的最大数字和
    - 最长上升子序列长度
    - Maximum/ Minimum/ Longest/ Shortest/ Minimum Cost ...
3. 存在性(判断可行性)
    - 取石子游戏，先手是否必胜
    - 能不能选出`k`个数使得和是sum
    - Yes/No, True/False, 0/1

> DP都有方向性：数组顺序固定或不可变(方向性: 从头到尾或者从尾到头)  

> 状态：把你觉得会影响结果的信息，全部放到数组的下标中去: 觉得有两个信息影响结果，就弄成二维数组；觉得有三个信息影响结果，就弄成三位数组  

> 状态转移：永远考虑最后一次干了什么事情，最后一步从哪儿来，最后一次做了什么操作  

> 初始条件：其实就是 用转移方程算不出来，但又需要它的定义，此时需要手工定义
> 初始条件和边界情况 ***(人话)***：最小的值搞定一下和不要数组越界

> 计算顺序：的确定只有一个原则，当你要算`f[X]`等式左边的时候，右边用到的状态都已经算过了


### 最值型动态规划 && DP组成部分一：确定状态
- [Lintcode 669: Coin Change](https://www.lintcode.com/problem/669/)

1. DP组成部分一：确定状态
    - 状态在DP中的作用属于定海神针
    - 简单的说，解DP的时候需要开一个数组，数组的每个元素`f[i]`或者`f[i][j]`代表什么 
      - 类似于解数学题中 X, Y, Z 代表什么
    - 确定状态需要两个意识：
      1. 最后一步：最优策略中的最后一个决策  
          - 当前问题：
          - 虽然我们不知道最优策略是什么，但是最优策略肯定是`K`枚硬币`a1, a2, ..., ak`面值加起来是`27`
          - 所以一定有一枚**最后的**硬币：`ak`
          - 除掉这枚硬币，前面硬币的面值加起来是`27 - ak`
          - ***Key 1***: 我们不关心前面的`K - 1`枚硬币是怎么拼出`27 - ak`的（可能有`1`种拼法，可能有`100`种拼法），而且我们现在甚至还不知道`ak`和`K`，但是我们确定前面的硬币拼出了`27 - ak`
          - ***Key 2***: 因为是最优策略，所以拼出`27 - ak`的硬币数一定要最少，否则这就不是最优策略了
      2. 子问题
          - 所以我们就要求：**最少用多少枚硬币拼出`27 - ak`**
          - 愿问题是 **最少用多少枚硬币拼出`27`**
          - 我们将原问题转化成了一个子问题，而且规模更小：`27 - ak`
          - 为了简化定义，我们设状态`f(X) = `**最少用多少枚硬币拼出X**

### 递归写法的不可行性
![1.1.png](images/1.1.png)

#### 递归写法
```c++
int f(int X) { // f(X)=最少用多少枚硬币拼出X
  if (X == 0) { // 0元钱只要0枚硬币
    return 0;
  }
  int result = 0x3f3f3f3f; // INT_MAX; // 初始化用无穷大
  if (X >= 2) { // 最后一枚硬币是2元
    result = std::max(f(X - 2) + 1, result);
  }
  if (X >= 5) { // 最后一枚硬币是5元
    result = std::max(f(X - 5) + 1, result);
  }
  if (X >= 7) { // 最后一枚硬币是7元
    result = std::max(f(X - 7) + 1, result);
  }
  return result;
}
```

#### 递归写法的问题
- 做了很多重复计算，效率低下
- 如何避免？
  - DP：将计算结果保存下来，并改变计算顺序 

### DP组成部分二：转移方程（到此对了一半，比确定状态简单一些）
2. DP组成部分二：转移方程
    - 设状态`f[X]=`**最少用多少枚硬币拼出X**
    - 对于任意`X`, $f[X] = min{f[X - 2] + 1, f[X - 5] + 1, f[X - 7] + 1}$

| f[X]                  | f[X - 2] + 1                               | f[X - 5] + 1                               | f[X - 7] + 1                               |
|-----------------------|--------------------------------------------|--------------------------------------------|--------------------------------------------|
| 拼出X所需最少的硬币数 | 拼出X-2所需最少的硬币数，加上最后一枚硬币2 | 拼出X-5所需最少的硬币数，加上最后一枚硬币5 | 拼出X-7所需最少的硬币数，加上最后一枚硬币7 |



### DP组成部分三：初始条件和边界情况
3. DP组成部分三：初始条件和边界情况
    - $f[X] = min{f[X - 2] + 1, f[X - 5] + 1, f[X - 7] + 1}$
    - 两个问题：
      1. `X - 2, X - 5 或者 X - 7`小于0怎么办？
      2. 什么时候停下来？
    - 如果不能拼出Y，就定义`f[Y]=`**正无穷**
        - 例如`f[-1] = f[-2] = ... =`**正无穷**
    - 所以`f[1] = min{f[-1] + 1, f[-4] + 1, f[-6] + 1} = `**正无穷**，表示拼不出来`1`
    - 这道题里初始条件为：`f[0] = 0`
      - 初始条件其实就是 用转移方程算不出来，但又需要它的定义，此时需要手工定义
    - 初始条件和边界情况 ***(人话)***：最小的值搞定一下和不要数组越界



### DP组成部分四：计算顺序
4. DP组成部分四：计算顺序
    - **拼出X所需的最少硬币数**: `f[X] = min{f[X - 2] + 1, f[X - 5] + 1, f[X - 7] + 1}`
    - 初始条件：`f[0] = 0`
    - 然后计算`f[1], f[2], ..., f[27]`
    - 当我们计算到f[x]时，`f[X - 2], f[X - 5], f[X - 7]`都已经得到结果了
    - ***Key***: 计算顺序的确定只有一个原则，当你要算`f[X]`等式左边的时候，右边用到的状态都已经算过了

### Time Complexity
- 每一步尝试三种硬币，一共27步
- 与递归算法相比，没有任何重复计算
- 算法时间复杂度（即需要进行的步数）：`时间复杂度 = 27 * 3`
  - 如果这道题是：拼出`n`块钱，有`m`枚硬币：`时间复杂度 = n * m`
- 递归时间复杂读为指数级别

### Coding 669
- [Lintcode 669: Coin Change](https://www.lintcode.com/problem/669/)

```c++
class Solution {
 public:
                        // coins       // amount
                        // {2, 5, 7}   // 27
  int coinChange(std::vector<int>& A, int M) {
    // 0....n: [n+1]
    // 0...n-1: [n]
    std::vector<int> f(M + 1);
    int n = A.size(); // number of kinds of coins

    // initialization
    f[0] = 0;

    int i, j;
    // f[1], f[2], ..., f[27]
    for (i = 1; i <= M; ++i) {
      f[i] = INT_MAX;
      // last coin A[j]
      // f[i] = min{f[i - A[0]] + 1, ..., f[i - A[n - 1]] + 1}
      for (j = 0; j < n; ++j) {
        if (i >= A[j] && f[i - A[j]] != INT_MAX) {
          f[i] = std::min(f[i - A[j]] + 1, f[i]);
        }
      }
    }

    if (f[M] == INT_MAX) {
      f[M] = -1;
    }

    return f[M];
  }
};
```

### 计数型动态规划
- [Lintcode 114 Unique Paths](https://www.lintcode.com/problem/114)

#### DP组成部分一：确定状态
- **最后一步**：无论机器人用何种方式到达右下角，总有最后挪动的一步：
  - 向右 或者 向下
- 右下角坐标设为`(m - 1, n - 1)`
- 那么前一步（倒数第二步）一定是在`(m - 2, n - 1)`或者`(m - 1, n - 2)`

- **子问题**：那么，如果机器人有`X`种方式从左上角走到`(m - 2, n - 1)`，有`Y`种方式从左上角走到`(m - 1, n - 2)`，则机器人有`X + Y`种方式走到`(m - 1, n - 1)`
  - 求总方式数的计数型动态规划经常用到**加法原理: 无重复&无遗漏**
- 问题转化为，机器人有多少种方式从左上角走到`(m - 2, n - 1)`和`(m - 1, n - 2)`
- 原题要求有多少种方式从左上角走到`(m - 1, n - 1)`
- 子问题
- 状态：设`f[i][j]`为机器人有多少种方式从左上角走到`(i, j)`

#### DP组成部分二：转移方程
- 对于任意一个格子`(i, j)`, $f[i][j] = f[i - 1][j] + f[i][j - 1]$

| f[i][j]                        | f[i - 1][j]                        | f[i][j - 1]                        |
|--------------------------------|------------------------------------|------------------------------------|
| 机器人有多少种方式走到`(i, j)` | 机器人有多少种方式走到`(i - 1, j)` | 机器人有多少种方式走到`(i, j - 1)` |

#### DP组成部分三：初始条件和边界情况
- 初始条件：`f[0][0] = 1`，因为机器人只有一种方式到左上角
- 边界情况：`i = 0`或`j = 0`，则前一步只能有一个方向过来 --> `f[i][j] = 1` 
  - 即第一行和第一列都是`1`

#### DP组成部分四：计算顺序
- `f[0][0] = 1`
- 计算第0行：`f[0][0], f[0][1], ..., f[0][n - 1]`
- 计算第1行：`f[1][0], f[1][1], ..., f[1][n - 1]`
- ...
- 计算第m-1行：`f[m - 1][0], f[m - 1][1], ..., f[m - 1][n - 1]`
  - 顺序的定义，不是为写for循环，而是为了转移方程，`f[i][j]`要用到`f[i - 1][j]`和`f[i][j - 1]`
- 答案是`f[m - 1][n - 1]`
- 时间复杂度（计算步数）：`O(MN)`, 空间复杂度（数组大小）：`O(MN)`

#### Coding
```c++
class Solution {
 public:
  int uniquePaths(int m, int n) {
    std::vector<std::vector<int>> f(m, std::vector<int>(n));
    int i, j;
    for (i = 0; i < m; ++i) { // row: top to bottom
      for (j = 0; j < n; ++j) { // column: left to right
        if (i == 0 || j == 0) {
          f[i][j] = 1;
        } else {
          f[i][j] = f[i - 1][j] + f[i][j - 1];
        }
      }
    }
    return f[m - 1][n - 1];
  }
};
```

### 存在型动态规划
- [Lintcode 116 Jump Game](https://www.lintcode.com/problem/116)

#### DP组成部分一：确定状态
- **最后一步**：如果🐸能跳到最后一块石头`n - 1`，我们考虑它跳的最后一步
- 这一步是从(`n - 1`之前的)石头`i`跳过来，`i < n - 1`
- 这需要两个条件同时满足：
  - 🐸可以跳到石头`i`(青蛙可以跳到`i`)
  - 最后一步不超过跳跃的最大距离(`i`和`n - 1`的距离不能超过`a_i`)(即青蛙可以从`i`跳过来)：`n - 1 - i <= a_i`

- **子问题**：那么我们需要知道青蛙能不能跳到石头`i (i < n - 1)`
- 而我们原来要求青蛙能不能跳到石头`n - 1`
- 子问题
- 状态：设`f[j]`表示青蛙能不能跳到石头`j`

#### DP组成部分二：转移方程
- 设`f[j]`表示青蛙能不能跳到石头`j`, $f[j] = OR_{0 <= i < j}(f[i]\ AND\ i + a[i] >= j)$

| f[j]          | 青蛙能不能跳到石头`j`         |
|---------------|-------------------------------|
| OR_{0<=i<j}   | 枚举上一个跳到的石头(编号)`i` |
| f[i]          | 青蛙能不能跳到石头`i`         |
| i + a[i] >= j | 最后一步的距离不能超过$a_i$   |

#### DP组成部分三：初始条件和边界情况
- 设`f[j]`表示青蛙能不能跳到石头`j`
- 初始条件：`f[0] = true`，因为青蛙一开始就在石头0 
- 这道题没有边界情况，因为枚举的`i`不会越界

#### DP组成部分四：计算顺序
- 设`f[j]`表示青蛙能不能跳到石头`j`
- $f[j] = OR_{0 <= i < j}(f[i]\ AND\ i + a[i] >= j)$
- 初始化`f[0] = true`
- 计算`f[1], f[2], ..., f[n - 1]`
- 答案是`f[n - 1]`
- 时间复杂度：`O(N^2)`，空间复杂度（数组大小）：`O(N)`

#### Coding
```c++
class Solution {
 public:
  bool canJump(std::vector<int>& A) {
    int n = A.size();
    std::vector<bool> f(n);
    f[0] = true; // initialization

    for (int j = 1; j < n; ++j) {
      f[j] = false;
      // previous stone i
      // last jump is from i to j
      for (int i = 0; i < j; ++i) {
        if (f[i] && i + A[i] >= j) {
          f[j] = true;
          break;
        }
      }
    }

    return f[n - 1];
  }
};
```

### In summary
- 四个组成部分：
  - 确定状态：确定要开的数组的意义定下来：
    - 研究最优策略的**最后一步**
    - 化为子问题（把公共的汉字抽出来，有几个变量就是几维数组）

  - 转移方程
    - 根据子问题定义直接得到

  - 初始条件和边界情况
    - 细心，考虑周全（验证初值对不对，`f[3]`或`f[4]`的正确性）（边界情况数组不能越界）

  - 计算顺序
    - 根本原理：利用之前的计算结果（大部分都是从小到达，二维的话就是从上到下然后从左到右）

### Exercise1: 金字塔
$dp[i][j] = max\(dp[i - 1][j - 1], dp[i - 1][j]\) + array[i][j]$


### Exercise2: 乘积最大子序列
- [Lintcode 191 Maximum Product Subarray](https://www.lintcode.com/problem/191/)

- Maximum Product Subarray
- 因为负数乘法的原因，需要记录到每个位置为止最大和最小的乘积
- 状态：设`f[j] =`以`a[j]`结尾的连续子序列的**最大**乘积，设`g[j] = `以`a[j]`结尾的连续子序列的**最小**乘积
- `f[j] = max{a[j], max{a[j] * f[j - 1], a[j] * g[j - 1]} | j > 0}`
- `g[j] = min{a[j], min{a[j] * f[j - 1], a[j] * g[j - 1]} | j > 0}`


## Chapter 2: 动态规划初探 + 坐标型动态规划 + 位操作型动态规划

### 初探 坐标型动态规划

- [Lintcode 115 Unique Paths II](https://www.lintcode.com/problem/115)

#### 题目分析

- 最后一步一定是从左边`(i, j - 1)`或上边`(i - 1, j)`过来
- 状态`f[i][j]`表示从左上角有多少种方式走到格子`(i, j)`
- **坐标型动态规划**：数组下标`[i][j]`即坐标`(i, j)`
  - 开的数组不需要加1
- `f[i][j] = f[i - 1][j] + f[i][j - 1]`

#### 初始条件和边界情况 

- `f[i][j] = `机器人有多少种方式从左上角走到`(i, j)`
- 如果左上角`(0, 0)`格或者右下角`(m - 1, n - 1)`格有障碍，直接输出`0`
- 如果`(i, j)`格有障碍，`f[i][j] = 0`，表示机器人不能到达此格(0种方式)
- 初始条件：`f[0][0] = 1`，`f[i][j] = `：
  - `0`, 如果`(i, j)`格有障碍
  - `1`, `i == 0 && j == 0`
  - `f[i - 1][j]`, 如果`j == 0`，即第一列
  - `f[i][j - 1]`, 如果`i == 0`，即第一行
  - `f[i - 1][j] + f[i][j - 1]`，其他

#### Coding

```c++
class Solution {
 public:
  int uniquePathsWithObstacles(std::vector<std::vector<int>>& A) {
    if (A.size() == 0 || A[0].size() == 0) {
      return 0;
    }

    int m = A.size();
    int n = A[0].size();
    std::vector<std::vector<int>> f(m, std::vector<int>(n));
    int i, j;
    for (i = 0; i < m; ++i) {
      for (j = 0; j < n; ++j) {
        if (A[i][j] == 1) {
          //obstacle
          f[i][j] = 0;
          continue;
        }

        if (i == 0 && j == 0) {
          f[i][j] = 1;
          continue;
        }

        f[i][j] = 0;
        // if it is not on 0-th row
        if (i > 0) {
          f[i][j] += f[i - 1][j];
        }

        // if it is not on 0-th column
        if (j > 0) {
          f[i][j] += f[i][j - 1];
        }
      }
    }

    return f[m - 1][n - 1];
  }
};
```

### 初探 序列型动态规划

- [Lintcode 515 Paint House](https://www.lintcode.com/problem/515)

- 动态规划里，如果你需要知道一个信息，而状态无法体现这个信息，就把这个信息记录下来  
- 序列型特点：状态里出现了**前**这个字 
- 序列型`f[i]`代表前`i`个：`0, 1, 2, ..., i - 1`
  - 相较于坐标型：在开初始状态与转移方程的时候序列型有很好的作用

- 坐标型`f[i]`代表到`i`为止：`0, 1, 2, ..., i`

#### 动态规划组成部分一：确定状态
- 最优策略是花费最小的策略
- 最后一步：最优策略中房子`N - 1`一定染成了 红、蓝、绿 中的一种
- 但是相邻两栋房子不能漆成一种颜色
- 所成如果最优策略中房子`N - 1`是红色，房子`N - 2`只能是蓝色或绿色
- 所成如果最优策略中房子`N - 1`是蓝色，房子`N - 2`只能是红色或绿色
- 所成如果最优策略中房子`N - 1`是绿色，房子`N - 2`只能是红色或蓝色

> !!!太复杂，如何优化：

* 如果直接套用以前的思路，记录油漆前`N`栋房子的最小花费 
* 根据套路，也需要记录油漆前`N - 1`栋房子的最小花费
* 但是，前`N - 1`栋房子的最小花费的最优策略中，不知道房子`N - 2`是什么颜色，所以有可能和房子`N - 1`撞色

> !!!错误，正确做法：

- **不知道房子`N - 2`是什么颜色，就把它记录下来**
  - 方法：放到状态里
- 分别记录油漆前`N - 1`栋房子**并且**房子`N - 2`是红色、蓝色、绿色的最小花费

![2.1.png](images/2.1.png)

#### 子问题
- 求油漆前`N`栋房子**并且**房子`N - 1`是红色、蓝色、绿色的最小花费
- 需要知道油漆前`N - 1`栋房子**并且**房子`N - 2`是红色、蓝色、绿色的最小花费
- 子问题
- 状态：设油漆前`i`栋房子**并且**房子`i - 1`是红色、蓝色、绿色的最小花费分别为`f[i][0], f[i][1], f[i][2]`
  - `f = new int[n + 1][3]`

#### 动态规划组成部分二：转移方程
- 设油漆前`i`栋房子**并且**房子`i - 1`是红色、蓝色、绿色的最小花费分别为`f[i][0], f[i][1], f[i][2]`

* `f[i][0] = min{f[i - 1][1] + cost[i - 1][0], f[i - 1][2] + cost[i - 1][0]}`
* `f[i][1] = min{f[i - 1][0] + cost[i - 1][1], f[i - 1][2] + cost[i - 1][1]}`
* `f[i][2] = min{f[i - 1][0] + cost[i - 1][2], f[i - 1][1] + cost[i - 1][2]}`

#### 动态规划组成部分三：初始条件和边界情况
- 设油漆前`i`栋房子**并且**房子`i - 1`是红色、蓝色、绿色的最小花费分别为`f[i][0], f[i][1], f[i][2]`

* 初始条件：`f[0][0] = f[0][1] = f[0][2] = 0`
  * 即不油漆任何房子的花费
* 无边界情况 

#### 动态规划组成部分四：计算顺序
- 设油漆前`i`栋房子**并且**房子`i - 1`是红色、蓝色、绿色的最小花费分别为`f[i][0], f[i][1], f[i][2]`

* 初始化`f[0][0], f[0][1], f[0][2]`
* 计算`f[1][0], f[1][1], f[1][2]`
* ...
* 计算`f[N][0], f[N][1], f[N][2]`
* 答案是`min{f[N][0], f[N][1], f[N][2]}`时间复杂度O(N)，空间复杂度O(N)


#### Coding

```c++
// Version 1
class Solution {
 public:
  int minCost(std::vector<std::vector<int>>& costs) {
    int n = costs.size();
    if (n == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(n + 1, std::vector<int>(3)); // seq-type
    f[0][0] = f[0][1] = f[0][2] = 0; // initialization
    // first i houses 前i栋
    for (int i = 1; i <= n; ++i) {

      // house i - 1's color is j
      for (int j = 0; j < 3; ++j) {
        f[i][j] = 0x3f3f3f3f;

        // house i - 2's color is k
        for (int k = 0; k < 3; ++k) {
          if (j == k) {
            continue;
          }

          f[i][j] = std::min(f[i][j], f[i - 1][k] + costs[i - 1][j]);
        }
      }
    }

    return std::min(f[n][0], std::min(f[n][1], f[n][2]));
  }
};
```

```c++
// Version 2
class Solution {
 public:
  int minCost(std::vector<std::vector<int>>& costs) {
    int n = costs.size();
    if (n == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(n + 1, std::vector<int>(3)); // seq-type
    f[0][0] = f[0][1] = f[0][2] = 0; // initialization
    // first i houses
    for (int i = 1; i <= n; ++i) {
        f[i][0] = std::min(f[i - 1][1] + costs[i - 1][0], f[i - 1][2] + costs[i - 1][0]);
        f[i][1] = std::min(f[i - 1][0] + costs[i - 1][1], f[i - 1][2] + costs[i - 1][1]);
        f[i][2] = std::min(f[i - 1][0] + costs[i - 1][2], f[i - 1][1] + costs[i - 1][2]);
    }

    return std::min(f[n][0], std::min(f[n][1], f[n][2]));
  }
};
```

#### In summary: seq-type

- 序列型动态规划：...***前`i`个***...最小/方式数/可行性
  - `f[i]` 代表**前`i`个**：`f[0], f[1], ..., f[i - 1]`
- 在设计动态规划的过程中，发现需要知道油漆前`N - 1`栋房子的最优策略中，房子`N - 2`的颜色
- 如果只用`f[N - 1]`，将无法区分
- 解决方法：记录下房子`N - 2`的颜色
  - 在房子`N - 2`是 红/蓝/绿 色的情况下，油漆前`N - 1`栋房子的最小花费
- 问题迎刃而解
- **序列+状态**



### 初探 划分型动态规划

- [Lintcode 512 Decode Ways](https://www.lintcode.com/problem/512)

#### 动态规划组成部分一：确定状态

- 解密数字串即**划分**成若干段数字，每段数字对应一个字母
- 最后一步（最后一段）：对应一个字母
  - A, B, ..., Z
- 这个字母加密时变成1, 2, ..., 26

![2.2](images/2.2.png)
![2.3](images/2.3.png)
![2.4](images/2.4.png)

#### 子问题
- 设数字串长度为`N`
- 要求数字串前`N`个字符的解密方式数
- 需要知道数字串前`N - 1`和`N - 2`个字符的解密方式数
- 子问题
- 状态：设数字串`S`前`i`个数字解密成字母串有`f[i]`种方式

#### 动态规划组成部分二：转移方程
- 设数字串`S`前`i`个数字解密成字母串有`f[i]`种方式

* `f[i] = f[i - 1] | S[i - 1]对应一个字母 + f[i - 2] | S[i - 2]S[i - 1]对应一个字母`
  * `f[i]`: 数字串`S`前`i`个数字解密成字母串的方式数
  * `f[i - 1] | S[i - 1]对应一个字母`: 数字串`S`前`i - 1`个数字解密成字母串的方式数
  * `f[i - 2] | S[i - 2]S[i - 1]对应一个字母`: 数字串`S`前`i - 2`个数字解密成字母串的方式数

#### 动态规划组成部分三：初始条件和边界情况
- 设数字串`S`前`i`个数字解密成字母串有`f[i]`种方式

- 初始条件：`f[0] = 1`，即空串有`1`种方式解密
  - 解密成空串
- 边界情况：如果`i = 1`，只看最后一个数字

#### 动态规划组成部分四：计算顺序
- `f[0], f[1], ..., f[N]`
- 答案是`f[N]`
- 时间复杂度O(N)，空间复杂度O(N)


#### Coding

```c++
class Solution {
 public:
  int numDecodings(std::string& s) {
    int n = s.size();
    if (n == 0) {
      return 0;
    }
    std::vector<int> f(n + 1, 0);
    int i;
    f[0] = 1; // initialization; 当物理意义不明确的时候，推断当前的初始化是否能得到正确的结果
    // first i digits: s[0], ..., s[i - 1]
    for (i = 1; i <= n; ++i) {
      f[i] = 0;
      // last one digit --> letter
      if (s[i - 1] != '0') {
        f[i] += f[i - 1];
      }

      // last two digits --> letter
      // s[i - 2]s[i - 1]
      if (i >= 2 && (s[i - 2] == '1' || (s[i - 2] == '2' && s[i - 1] <= '6'))) {
        f[i] += f[i - 2];
      }
    }

    return f[n];
  }
};
```

### 坐标型动态规划：最小路径和

![2.5](images/2.5.png)

- [Lintcode 110 Minimum Path Sum](https://www.lintcode.com/problem/110)

```c++
// Mine correct version
class Solution {
 public:
  int minPathSum(std::vector<std::vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    if (n == 0 || m == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(n, std::vector<int>(m));
    f[0][0] = grid[0][0];
    for (int i = 1; i < m; ++i) {
      f[0][i] = f[0][i - 1] + grid[0][i];
    }

    for (int i = 1; i < n; ++i) {
      f[i][0] = f[i - 1][0] + grid[i][0];
    }

    for (int i = 1; i < n; ++i) {
      for (int j = 1; j < m; ++j) {
        f[i][j] = std::min(f[i - 1][j], f[i][j - 1]) + grid[i][j];
      }
    }

    return f[n - 1][m - 1];
  }
};
```

```c++
// Official correct version
class Solution {
 public:
  int minPathSum(std::vector<std::vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    if (n == 0 || m == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(n, std::vector<int>(m));
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = grid[i][j];
          continue;
        }
        f[i][j] = INT_MAX;
        // if it has a grid above
        if (i > 0) {
          f[i][j] = std::min(f[i][j], f[i - 1][j] + grid[i][j]);
        }

        // if it has a grid to the left
        if (j > 0) {
          f[i][j] = std::min(f[i][j], f[i][j - 1] + grid[i][j]);
        }
      }
    }

    return f[n - 1][m - 1];
  }
};
```

### 坐标型动态规划：最小路径和--路径打印

- **最值**和**可行性**都可以打印方案，但**存在数**不行

```c++
class Solution {
 public:
  int minPathSum(std::vector<std::vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    if (n == 0 || m == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(n, std::vector<int>(m));
    std::vector<std::vector<int>> pi(n, std::vector<int>(m));
    // if f[i][j] depends on f[i - 1][j], pi[i][j] = 0
    // if f[i][j] depends on f[i][j - 1], pi[i][j] = 1

    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = grid[i][j];
          continue;
        }

        f[i][j] = INT_MAX;
        // if it has a grid above
        if (i > 0) {
          f[i][j] = std::min(f[i][j], f[i - 1][j] + grid[i][j]);
          if (f[i][j] == f[i - 1][j] + grid[i][j]) {
            pi[i][j] = 0;
          }
        }

        // if it has a grid to the left
        if (j > 0) {
          f[i][j] = std::min(f[i][j], f[i][j - 1] + grid[i][j]);
          if (f[i][j] == f[i][j - 1] + grid[i][j]) {
            pi[i][j] = 1;
          }
        }
      }
    }

    // (n - 1, m - 1)
    std::vector<std::vector<int>> path(n + m - 1, std::vector<int>(2));
    int p;
    int i = n - 1;
    int j = m - 1;
    // infer the path backward from (n - 1, m - 1)
    for (p = n + m - 2; p >= 0; --p) {
      path[p][0] = i;
      path[p][1] = j;
      if (p == 0) {
        break;
      }
      if (pi[i][j] == 0) {
        --i;
      } else {
        --j;
      }
    }

    for (p = 0; p < n + m - 1; ++p) {
      std::cout << "(" << path[p][0] << ", " << path[p][1] << "): " << grid[path[p][0]][path[p][1]] << std::endl;
    }

    return f[n - 1][m - 1];
  }
};
```


```bash
# expected result from the test case: [[1,5,7,6,8],[4,7,4,4,9],[10,3,2,3,2]]
(0, 0): 1
(1, 0): 4
(1, 1): 7
(2, 1): 3
(2, 2): 2
(2, 3): 3
(2, 4): 2
```
![2.6.png](images/2.6.png)



### 坐标型动态规划：最小路径和--空间优化

- `f[i][j] = std::min{f[i - 1][j], f[i][j - 1]} + A[i][j]`
- 计算第`i`行时，只需要第`i`行和第`i - 1`行的`f`
- 所以，只需要保存两行的`f`值：`f[i][0 ... n - 1]`和`f[i - 1][0 ... n - 1]`
- 用滚动数组实现
- 开数组时，只开`f[0][0 ... n - 1]`和`f[1][0 ... n - 1]`
- 计算`f[0][0], ..., f[0][n - 1]`，计算`f[1][0], ..., f[1][n - 1]`
- 计算`f[2][0 ... n - 1]`时，开`f[2][0 ... n - 1]`，**删掉`f[0][0 ... n - 1]`，因为已经不需要`f[0][0 ... n - 1]`的值了** 
- 计算`f[3][0 ... n - 1]`时，开`f[3][0 ... n - 1]`，**删掉`f[1][0 ... n - 1]`，因为已经不需要`f[1][0 ... n - 1]`的值了** 

* 实际操作时，可以不用每次开数组，而是用滚动法
* 计算`f[0][0], ..., f[0][n - 1]`，计算`f[1][0], ..., f[1][n - 1]`
* 计算`f[2][0 ... n - 1]`时，把值写在`f[0][0 ... n - 1]`的**数组**里
* 同理，`f[3][0 ... n - 1]`写在`f[1][0 ... n - 1]`的**数组**里
* 最后`f[m - 1][n - 1]`存储在`f[0][n - 1]`（或者`f[1][n - 1]`）里，直接输出

> 对于网格上的动态规划，如果`f[i][j]`只依赖于本行的`f[i][x]`与前一行的`f[i - 1][y]`，那么就可以采用滚动数组的方法压缩空间。空间复杂度`O(n)`  

![2.7.png](images/2.7.png)

> 如果网格行数少列数多（大胖子网格），那么就可以逐列计算，滚动数组的长度为行数，空间复杂度`O(M)`  

![2.8.png](images/2.8.png)


```c++
class Solution {
 public:
  int minPathSum(std::vector<std::vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    if (n == 0 || m == 0) {
      return 0;
    }

    std::vector<std::vector<int>> f(2, std::vector<int>(m));

    int old, now = 0;
    // old: f[old][...] is holding f[i - 1][...]
    // now: f[now][...] is holding f[i][...]

    for (int i = 0; i < n; ++i) {
      // swap old and now
      old = now;
      now = 1 - now; // 0-->1, 1-->0

      // 将所有的 f[i] 变成 f[now]； f[i - 1] 变成 f[old]
      for (int j = 0; j < m; ++j) {
        if (i == 0 && j == 0) {
          f[now][j] = grid[i][j];
          continue;
        }
        f[now][j] = INT_MAX;
        // if it has a grid above
        if (i > 0) {
          f[now][j] = std::min(f[now][j], f[old][j] + grid[i][j]);
        }

        // if it has a grid to the left
        if (j > 0) {
          f[now][j] = std::min(f[now][j], f[now][j - 1] + grid[i][j]);
        }
      }
    }

    return f[now][m - 1];
  }
};
```

> 取模运算(%) 会比这个稍微慢一些


### 坐标型动态规划：炸弹袭击

- [Lintcode 553 Bomb Enemy](https://www.lintcode.com/problem/553)

#### 动态规划组成部分一：确定状态
- 我们假设有敌人或有墙的格子也能放炸弹
  - 有敌人的格子：格子里的敌人被炸死，并继续向上爆炸
  - 有墙的格子：炸弹不能炸死任何敌人

* 在`(i, j)`格放一个炸弹，它向上能炸死的敌人数是：
  * `(i, j)`格为空地：`(i - 1, j)`格向上能炸死的敌人数
  * `(i, j)`格为敌人：`(i - 1, j)`格向上能炸死的敌人数 **+ 1**
  * `(i, j)`格为墙：0

#### 子问题

- 需要知道`(i - 1, j)`格放一个炸弹向上能炸死的敌人数
- 原来要求`(i, j)`格放一个炸弹向上能炸死的敌人数 
- 子问题
- 状态：
  - `Up[i][j]`表示`(i, j)`格放一个炸弹向上能炸死的敌人数

#### 动态规划组成部分二：转移方程

- 设`Up[i][j]`表示`(i, j)`格放一个炸弹向上能炸死的敌人数

* `Up[i][j]`:
  * `Up[i - 1][j]`，如果`(i, j)`格是空地
  * `Up[i - 1][j] + 1`，如果`(i, j)`格是敌人
  * 0，如果`(i, j)`格是墙

#### 动态规划组成部分三：初始条件和边界情况 

- 设`Up[i][j]`表示`(i, j)`格放一个炸弹向上能炸死的敌人数

- 初始条件： 第`0`行的`Up`值和格子内容相关
  - `Up[0][j] = 0`，如果`(0, j)`格不是敌人
  - `Up[0][j] = 1`，如果`(0, j)`格是敌人

#### 动态规划组成部分四：计算顺序

- 逐行计算
- `Up[0][0], Up[0][1], ..., Up[0][n - 1]`
- `Up[1][0], Up[1][1], ..., Up[1][n - 1]`
- ...
- `Up[m - 1][0], Up[m - 1][1], ..., Up[m - 1][n - 1]`
- 时间复杂度O(MN)，空间复杂度O(MN)

#### 四个方向

- `Up[i][j]`表示如果`(i, j)`放一个炸弹向上可以最多炸死多少敌人
- 一共四个方向
- 可以类似地计算`Down[i][j], Left[i][j], Right[i][j]`，注意计算顺序会有改变

![四个方向](images/2.9.png)

- `(i, j)`如果是空地，放一个炸弹最多炸死的敌人数是：
  - `Up[i][j] + Down[i][j] + Left[i][j] + Right[i][j]`
- 取最大值即可
- 时间复杂度和空间复杂度依然为O(MN)

#### Coding

```c++
class Solution {
 public:
  int maxKilledEnemies(std::vector<std::vector<char>>& grid) {
    if (grid.size() == 0 || grid[0].size() == 0) {
      return 0;
    }

    int n = grid.size();
    int m = grid[0].size();

    std::vector<std::vector<int>> up(n, std::vector<int>(m));
    std::vector<std::vector<int>> down(n, std::vector<int>(m));
    std::vector<std::vector<int>> left(n, std::vector<int>(m));
    std::vector<std::vector<int>> right(n, std::vector<int>(m));

    // up
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) {
        up[i][j] = 0;
        if (grid[i][j] != 'W') {
          if (grid[i][j] == 'E') {
            ++up[i][j];
          }

          if (i > 0) {
            up[i][j] += up[i - 1][j];
          }
        }
      }
    }

    // down 
    for (int i = n - 1; i >= 0; --i) {
      for (int j = 0; j < m; ++j) {
        down[i][j] = 0;
        if (grid[i][j] != 'W') {
          if (grid[i][j] == 'E') {
            ++down[i][j];
          }

          if (i < n - 1) {
            down[i][j] += down[i + 1][j];
          }
        }
      }
    }

    // left
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) {
        left[i][j] = 0;
        if (grid[i][j] != 'W') {
          if (grid[i][j] == 'E') {
            ++left[i][j];
          }

          if (j > 0) {
            left[i][j] += left[i][j - 1];
          }
        }
      }
    }

    // right
    for (int i = 0; i < n; ++i) {
      for (int j = m - 1; j >= 0; --j) {
        right[i][j] = 0;
        if (grid[i][j] != 'W') {
          if (grid[i][j] == 'E') {
            ++right[i][j];
          }

          if (j < m - 1) {
            right[i][j] += right[i][j + 1];
          }
        }
      }
    }

    int result = 0;
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) {
        if (grid[i][j] == '0') { // empty
          result = std::max(result, up[i][j] + down[i][j] + left[i][j] + right[i][j]);
        }
      }
    }

    return result;
  }
};
```

#### 坐标型动态规划 总结
- 给定输入为序列或者网格/矩阵
- 动态规划状态下标为序列下标`i`或者网格坐标`(i, j)`
  - `f[i]`：以第`i`个元素结尾的某种性质
  - `f[i][j]`：到格子`(i, j)`的路径的性质
- 初始化设置`f[0]`的值 / `f[0][0 ... n - 1]`的值
- 二维空间优化：如果`f[i][j]`的值只依赖于当前行和前一行，则可以用滚动数组节省空间


### 位操作型动态规划：Counting Bits

- 位操作（二进制）
- &与，|或，^异或，!非

![binary operation](images/2.10.png)

- 逐位操作

![binary operation](images/2.11.png)

- [Lintcode 664 Counting Bits](https://www.lintcode.com/problem/664)

#### 题目分析

- 对于每个数`0 <= i <= N`，直接求`i`的二进制表示里有多少个`1`
- 二进制表示算法：（十进制转二进制算法）
  - 第一步：`i mod 2`是最低位的bit
  - 第二步：`i <- floor(i / 2)`，如果`i = 0`，结束，否则回到第一步
- 时间复杂度：O(NlogN)
  - 2个数有1位二进制(0 and 1)
  - 2个数有2位二进制(2 and 3)
  - 4个数有3位二进制(3, 4, 5 and 6)
  - 8个数有4位二进制(7, 8, 9, 10, 11, 12, 13 and 14)
  - ...
  - 大约`N / 2`个数有`log{2}N`位二进制
- 用动态规划的话会比上面快一些

#### 动态规划组成部分一：确定状态

- 观察一个数的二进制位
  - $(170)_{10} = (10101010)_2$

- 最后一步：观察这个数最后一个二进制位（最低位），去掉它，看剩下多少个1
  - $(170)_{10} = (10101010)_2$
  - $(85)_{10} = (1010101)_2$
  - 85 的二进制表示里有4个1
  - 170 的二进制表示里有4个1

#### 子问题

- 要求`N`的二进制表示中有多少1
- 在`N`的二进制去掉最后一位`N mod 2`（有两种方法：>> and floor(/)），设新的数是`Y = (N >> 1)`（右移一位）
- 要知道`Y`的二进制表示中有多少1
- 子问题
- 状态：设`f[i]`表示`i`的二进制表示中有多少个1

> 知识点：和位操作相关的动态规划一般用值作状态

#### 动态规划组成部分二：转移方程

- 设`f[i]`表示`i`的二进制表示中有多少个1

- `f[i] = f[i >> 1] + (i mod 2)`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i]`表示`i`的二进制表示中有多少个1

- `f[i] = f[i >> 1] + (i mod 2)`

- 初始条件：`f[0] = 0`

#### 动态规划组成部分四：计算顺序

- `f[0], f[1], f[2], ..., f[N]`
- 时间复杂度O(N)
- 空间复杂度O(N)

#### Coding

```c++
class Solution {
 public:
  std::vector<int> countBits(int num) {
    std::vector<int> f(num + 1);
    f[0] = 0;
    for (int i = 1; i <= num; ++i) {
      f[i] = f[i >> 1] + (i % 2);
    }

    return f;
  }
};
```

### Exercise: 最长上升子序列

- [Lintcode Longest Increasing Continuous Subsequence](https://www.lintcode.com/problem/397/)

```c++
class Solution {
 public:
  int longestIncreasingContinuousSubsequence(std::vector<int>& a) {

  }
};
```


## Chapter 3: 打劫房屋: 坐标型，前缀型
- [Lintcode 392 打劫房屋](https://www.lintcode.com/problem/392/)

### 坐标型
dp[坐标] = 行走到这个坐标的最优值

转移：上一个坐标从哪里来，比如：上一次打劫了哪个房屋，或上一次行走了那个坐标

#### 动态规划
- 由抢房屋的性质可以看出，抢前`i`个房屋能得到的最大值，与后面如何抢的方案无关，只与前`i - 1`个房屋的最优方案有关。这满足了动态规划的*无后效性*和*最优子结构*
- 同时，由于题目不能抢相邻房屋，那么如果抢了第`i`个房屋，就不能抢第`i - 1`个房屋，可以得出前`i`个的最优方案也与前`i - 2`个的最优方案有关

#### 代码思路
将要不要打劫的这个决策，记录到状态当中去(每走到一个坐标(房子)，都有两种情况:打劫/不打劫):
- 可以设`dp[i][0]`为如果不抢第`i`个房屋，前`i`个房屋的最优方案为多少
- 设`dp[i][1]`为如果抢第`i`个房屋，前`i`个房屋的最优方案为多少
- 可以得出一下的状态转移方程式：
  - $dp[i][0] = max(dp[i - 1][0], dp[i - 1][1])$ 因为如果不打劫当前的房子，从前一个位置选择一个最大值
  - $dp[i][1] = A[i] + dp[i - 1][0]$ 因为如果打劫当前的房子，之前的房子只能选择不打劫

```c++
class Solution {
 public:
  long long houseRobber(std::vector<int>& A) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }
    std::vector<std::vector<long long>> dp(n, std::vector<long long>(2, 0));

    dp[0][0] = 0;
    dp[0][1] = A[0];

    for (int i = 1; i < n; ++i) {
      // 如果不抢第i个，取前i - 1个位置dp较大值
      dp[i][0] = std::max(dp[i - 1][0], dp[i - 1][1]);
      // 如果抢第i个，前一个不抢，考虑从前i - 2个位置的dp值转移，即i - 1选择不打劫
      dp[i][1] = A[i] + dp[i - 1][0];
    }

    long long result = std::max(dp[n - 1][0], dp[n - 1][1]);
    return result;
  }
};
```

```python
from typing import (
    List,
)
class Solution:
  def house_robber(self, a: List[int]) -> int:

```

### 前缀型
坐标型关心走到哪儿，前缀型不关心  
前缀型永远是用前缀来表示子状态: 看前`i`个数怎样怎样，和前`j`个数或前`i - 1`个数的怎样怎样，之间的关系  

```
$$\begin{align}
dp[i] &= 前`i`个数取出的最大和(不关心第`i`个取或者不取) \\ 
      &= max(dp[i - 2] + a[i], dp[i - 1]) 以此来避免取相邻的两个房子 \\
优化：dp[i \% 3] &= 前`i`个数取出的最大和(不关心第`i`个取或者不取) \\ 
      &= max(dp[(i - 2) \% 3] + a[i], dp[(i - 1) \% 3]) 以此来避免取相邻的两个房子 
\end{align}$$
```


## Chapter 4: 最大矩形 && 最大直方图：坐标型

> 单调栈：求一个位置往左看或者往右看，第一个小于等于它的数的时候，用单调栈

![4.1.png](images/4.1.png)

### 最大矩形

- [Lintcode 510 最大矩形](https://www.lintcode.com/problem/510/)

- 这题和`Lintcode 122 直方图最大矩形覆盖`很相似，只需要求出以每一行作为底最大的矩形是多少，每一行都有一个`height`数组，利用单调栈，每次更新`height`数组，`height`数组代表的是这一列上面有多少个连续的`1`，即矩形的高度，以每一行作为底（直方图最下面）时最大矩形面积，然后记录最大值即可。

- 初始化`dp`数组，用`dp`数组记录当前位置上方有多少个连续`1`。对于每一行作为底，利用单调栈求高度，寻找最大的底乘高。
- 注意这个栈是 从栈底到栈顶依次是从小到大的。如果栈中的数比当前的数大（或着等于）就要处理栈顶的（记录左右两边的比它小的第一个数）。
- 然后如果遍历完之后，单独处理栈，此时所有元素右边都不存在比它小的`height[j]`表示目前的底上（第`1`行），`j`位置往上（包括`j`位置）有多少连续的`1`。
- 不断更新最大面积。

* 时间复杂度O(mn): dp的O(nm)和单调栈的O(n)
* 空间复杂度O(mn): dp的大小（下面的代码的空间复杂度可以优化成O(n)）

```c++
class Solution {
 public:
  int maximalRectangle(std::vector<std::vector<bool>>& matrix) {
    if (matrix.size() == 0 || matrix[0].size() == 0) {
      return 0;
    }

    int ans = 0;
    int n = matrix.size();
    int m = matrix[0].size();
    std::vector<std::vector<int>> dp(n, std::vector<int>(m + 1));
    for (int i = 0; i < n; ++i) { // 每个位置上方有多少连续的1
      for (int j = 0; j < m; ++j) {
        if (i == 0 && matrix[i][j]) {
          dp[i][j] = 1;
          continue;
        }
        if (matrix[i][j]) {
          dp[i][j] = dp[i - 1][j] + 1;
        }
      }
    }

    for (int i = 0; i < n; ++i) { // 把每一行作为底找最大矩形
      ans = std::max(ans, largestRectangleArea(dp[i]));
    }
    return ans;
  }

 private:
  int largestRectangleArea(std::vector<int>& heights) {
    std::deque<int> S;
    heights[heights.size() - 1] = 0;
    int sum = 0;
    for (int i = 0; i < heights.size(); ++i) {
      if (S.empty() || heights[i] > heights[S.back()]) {
        S.push_back(i);
      } else {
        int temp = S.back();
        S.pop_back();
        sum = std::max(sum, heights[temp] * (S.empty() ? i : i - S.back() - 1));
        --i; // 拿着右边界，寻找左边界
      }
    }
    return sum;
  }
};
```


### 直方图最大矩形覆盖

- [Lintcode 122 直方图最大矩形覆盖](https://www.lintcode.com/problem/122/)

```c++
// LHC version: Monotonic-stack answer
class Solution {
 public:
  int largestRectangleArea(std::vector<int>& height) {
    std::deque<int> S;

    std::vector<int> heights = height;
    heights.push_back(-1);

    int sum = 0;
    for (int i = 0; i < heights.size(); ++i) {
      if (S.empty() || heights[i] > heights[S.back()]) {
        S.push_back(i);
      } else {
        int temp = S.back();
        S.pop_back();
        sum = std::max(sum, heights[temp] * (S.empty() ? i : i - S.back() - 1));
        --i; // 拿着右边界，寻找左边界
      }
    }
    return sum;
  }
};
```

```c++
// Correct Monotonic-stack answer from other students
class Solution {
 public:
  int largestRectangleArea(std::vector<int>& heights) {
    if (heights.size() == 0) {
      return 0;
    }

    std::deque<int> stack;
    int sum = 0;
    for (int i = 0; i <= heights.size(); ++i) {
      int curt = (i == heights.size()) ? -1 : heights[i];
      while (!stack.empty() && curt <= heights[stack.back()]) {
        int h = heights[stack.back()];
        stack.pop_back();
        int w = stack.empty() ? i : i - stack.back() - 1;
        sum = std::max(sum, h * w);
      }
      stack.push_back(i);
    }

    return sum;
  }
};
```


## Chapter 5: 最短假期：坐标型

- [Lintcode 267 最短假期](https://www.lintcode.com/problem/267/)

- 转移方程：
  - 如果今天工作（运动），那么只能由昨天运动（工作）或休息转移而来
  - 如果今天休息，那么可以由昨天三种状态（工作，运动，休息）转移

- 状态：`dp[i][j]`第`i`天干了`j`这个事情(j: 工作，健身，休息) 的最小休息天数
  - `dp[i][0], dp[i][1], dp[i][2]`分别表示去公司工作、去健身房锻炼、去休息
  - 状态转移方程：
    - `dp[i][0] = min(dp[i - 1][1], dp[i - 1][2])`
    - `dp[i][1] = min(dp[i - 1][0], dp[i - 1][2])`
    - `dp[i][2] = min(dp[i - 1][0], min(dp[i - 1][1], dp[i - 1][2])) + 1`

* 设假期天数为n
* 时间复杂度：从左至右扫描数组，每次由三个`DP`方程进行转移。时间复杂度为`O(n)`
* 空间复杂度：`DP`数组规模为`3*n`。空间复杂度`O(n)`

```c++
class Solution {
 public:
  int minimumRestDays(std::vector<int>& company, std::vector<int>& gym) {
    int n = company.size();

    // dp[i][0]表示第i天工作的最小休息天数，dp[i][1]表示锻炼，dp[i][2]表示休息
    std::vector<std::vector<int>> dp(n, std::vector<int>(3));
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < 3; ++j) {
        dp[i][j] = 0x3f3f3f3f;
      }
    }
    // 临界值第一天
    dp[0][0] = dp[0][1] = 0;
    if (company[0] == 0) {
      dp[0][0] = 1;
    }
    if (gym[0] == 0) {
      dp[0][1] = 1;
    }
    dp[0][2] = 1;
    for (int i = 1; i < n; ++i) {
      if (company[i] == 1) {
        dp[i][0] = std::min(dp[i - 1][1], dp[i - 1][2]);
      }
      if (gym[i] == 1) {
        dp[i][1] = std::min(dp[i - 1][0], dp[i - 1][2]);
      }
      dp[i][2] = std::min(dp[i - 1][0], std::min(dp[i - 1][1], dp[i - 1][2])) + 1;
    }

    return std::min(dp[n - 1][0], std::min(dp[n - 1][1], dp[n - 1][2]));
  }
};
```


### Exercise: 相关题目

- [Lintcode 151 买卖股票的最佳时机III](https://www.lintcode.com/problem/151/)

- [Lintcode 515 房屋染色](https://www.lintcode.com/problem/515/)


## Chapter 6: 最小调整代价：背包型

- [Lintcode 91 最小调整代价](https://www.lintcode.com/problem/91)
- [Solution](https://www.lintcode.com/problem/91/solution/24300)

### 状态

令`dp[i][j]`表示从左到右调整到前`i`个数时，将第`i`个数的数值调整为`j`所需要付出的最小代价。
整个调整的过程中要满足相邻两数之差不超过`target`

### 转移方程
- `dp[i][j] = min(dp[i][j], dp[i - 1][k] + abs(j - A[i]))`
- `k`是把第`i - 1`个数调整为`k`
- `k`和`j`差值不超过`target`
- `j - target <= k <= j + target`


### 思路
- 已知每个整数范围`[1,100]`，那么对于每个元素，为了调整到该元素和与之相邻的元素的差不大于target，该元素调整的范围就在`[1,100]`。所以对于数组`A[]`的每一位元素，我们都需要进行`[1,100]`范围内的可能状态的转移。

- 令`dp[i][j]`表示元素`A[i]=j`时，`A[i]`与`A[i-1]`差值不大于target所需要付出的最小代价。

- 当`A[i]=j`时，可行的`A[i-1]`的范围为`[max(1, j - target)，min(100, j + target)]`。而`dp[i][j]`为所有可行的`A[i-1]`中，花费代价最小的一种可能，再加上`A[i]`调整到 `j` 所需花费`abs(j - A[i])`。

- 当`A[i]=j`时，`k`在`[max(1, j - target)，min(100, j + target)]`范围内时，我们可以写出以下式子：

#### 1.临界值：
`dp[0][j] = abs(j - A[0])`

#### 2.状态转移方程：
- `dp[i][j] = min(dp[i][j], dp[i - 1][k] + abs(j - A[i]))`
  - 最后在所有最后一位的可能解`dp[n-1][i]`中的最小值，就是我们所求的最小代价。

* 假设数组长度为`n`
* 空间复杂度`O(10000*n)`
* 时间复杂度`O(n^2)`

### Coding

```c++
class Solution {
 public:
  int minAdjustmentCost(std::vector<int>& A, int target) {
    int n = A.size();

    // dp[i][j]表示元素A[i]=j时，A[i]与A[i-1]差值不大于target所需要付出的最小代价
    int dp[n][101];
    for (int i = 0; i < n; ++i) {
      for (int j = 1; j <= 100; ++j) {
        // 初始化为极大值
        dp[i][j] = 0x3f3f3f3f;
      }
    }
    for (int i = 0; i < n; ++i) {
      for (int j = 1; j <= 100; ++j) {
        if (i == 0) {
          // 临界值：第一个元素A[0]调整为j的代价 
          dp[0][j] = abs(j - A[0]);
        } else {
          // left为A[i]=j时，A[i-1]与A[i]差值不大于target的A[i-1]最小值
          // right为A[i]=j时，A[i-1]与A[i]差值不大于target的A[i-1]最大值
          int left = max(1, j - target);  
          int right = min(100, j + target);  
          for (int k = left; k <= right; ++k) {
            // 当A[i-1]=k时，答案为A[i-1]=k的代价dp[i-1][k]，加上A[i]=j的调整代价abs(j-A[i])
            dp[i][j] = std::min(dp[i][j], dp[i - 1][k] + abs(j - A[i])); 
          }
        }
      }
    }
    int mincost = 0x3f3f3f3f;
    for (int i = 1; i <= 100; ++i) {
      mincost = min(mincost, dp[n - 1][i]);
    }
    return mincost;
  }
};
```


## Chapter 7: 香槟塔：坐标型

- [Lintcode 1018 香槟塔](https://www.lintcode.com/problem/1018/)

状态：`dp[i][j]`流入多少水，至于剩下多少水是根据流入的量算出来的

### Step 1 : 如何定义状态？
令`dp[i][j]`为`(i, j)`位置的杯子的**流入**香槟总体积占比

### Step 2 : 临界值是什么？
- `dp[0][0] = poured`
- 将所有的香槟都倒在顶端

### Step 3 : 状态转移方程怎么写？
- `(i, j)`的杯子流入的香槟总体积 = (`(i - 1, j - 1)香槟体积 - 1` + `(i - 1, j)香槟体积 - 1`) / 2.0
- 状态转移方程为：`dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j] - 2) / 2.0`

### Step 4 : DP结果是什么？
- `min(dp[query_row][query_glass], 1)`
- 这个杯子能装的香槟永远不会超过一杯

```c++
class Solution {
 public:
  double champagneTower(int poured, int query_row, int query_glass) {
    double dp[101][101];
    dp[0][0] = poured;
    for (int row = 1; row <= query_row; ++row) {
      for (int i = 0; i <= row; ++i) {
        if (i == 0) {
          dp[row][i] = std::max(0.0, (dp[row - 1][i] - 1) / 2.0);
        } else if (i == row) {
          dp[row][i] = std::max(0.0, (dp[row - 1][i - 1] - 1) / 2.0);
        } else {
          dp[row][i] = std::max(0.0, (dp[row - 1][i - 1] + dp[row - 1][i] - 2) / 2.0); // here is wrong, we should compare both left and right with the 0
        }
      }
    }

    return std::min(dp[query_row][query_glass], 1.0);
  }
};
```

> don't forget to minus one  
> the reason we use `std::max` there is that to keep volume of each cup to be positive  

### 空间优化：

#### Soluton 1: row % 2  
```c++
class Solution {
 public:
  double champagneTower(int poured, int query_row, int query_glass) {
    double dp[2][101];
    dp[0][0] = poured;
    for (int row = 1; row <= query_row; ++row) {
      for (int i = 0; i <= row; ++i) {
        if (i == 0) {
          dp[row % 2][i] = std::max(0.0, (dp[(row - 1) % 2][i] - 1) / 2.0);
        } else if (i == row) {
          dp[row % 2][i] = std::max(0.0, (dp[(row - 1) % 2][i - 1] - 1) / 2.0);
        } else {
          dp[row % 2][i] = std::max(0.0, (dp[(row - 1) % 2][i - 1] + dp[(row - 1) % 2][i] - 2) / 2.0); // here is wrong, we should compare both left and right with the 0
        }
      }
    }

    return std::min(dp[query_row % 2][query_glass], 1.0);
  }
};
```

#### Soluton 2: 一维数组  
```c++
// Solution 2
class Solution {
 public:
  double champagneTower(int poured, int query_row, int query_glass) {
    double dp[101];
    dp[0] = poured;
    for (int row = 1; row <= query_row; ++row) {
      for (int i = row; i >= 0; --i) {
        if (i == 0) {
          dp[i] = std::max(0.0, (dp[i] - 1) / 2.0);
        } else if (i == row) {
          dp[i] = std::max(0.0, (dp[i - 1] - 1) / 2.0);
        } else {
          dp[i] = std::max(0.0, (dp[i - 1] + dp[i] - 2) / 2.0); // here is wrong, we should compare both left and right with the 0
        }
      }
    }

    return std::min(dp[query_glass], 1.0);
  }
};
```


## Chapter 8: 飞行棋I

- [Lintcode 1565 飞行棋I](https://www.lintcode.com/problem/1565/)

- 只能向右走，有方向性所以可以用动态规划

* Other notes:
  * 拓扑排序的一个功能就是检测图里是否有`循环依赖`

- 拓扑排序与动态规划的关系：
  - 一个题目能够被动态规划，那么把状态看作点，把状态的依赖关系看作边的话，那所构成的图当中一定可以被拓扑排序
  - 有循环依赖就不能产生拓扑排序，有循环依赖就不能使用动态规划

### Step 1 : 如何定义状态？ 
- 令`dp[i]`表示从位置`1`到位置`i`的最小投掷骰子次数

### Step 2 : 临界值是什么？
- 当位置`i 属于 [2, 7]`的时候，可以通过投掷一次骰子抵达，即`dp[i] = 1`。
- 并且`dp[1] = 0`

### Step 3 : 状态转移方程怎么写？
- 如果投掷骰子：`dp[i] = min(dp[i], dp[i - j] + 1), j 属于 [1, 6]`
- 当前位置投掷一次骰子所能走到的位置的`dp`值是当前`dp`值加一。
- 如果有另外相连的位置：`dp[相连的位置] = min(dp[相连的位置], dp[i])`，这里实际上是更新后面的结果
- 可以不需要投掷骰子直接向前走

### Step 4 : DP结果是什么？
- 棋盘的长度 length 的 dp 值即为答案: `dp[length]`

### DP Solution

Time Complexity O(n)  
Space Complexity O(n)  

```cpp
class Solution {
 public:
  int modernLudo(int length, std::vector<std::vector<int>>& connections) {
    if (length == 1) {
      return 0;
    }
    if (length <= 7) {
      return 1;
    }

    // connected[i] = j 表示i与j相连
    std::vector<int> connected(length + 1);
    std::vector<int> dp(length + 1);
    // initialization
    for (int i = 1; i <= length; ++i) {
      connected[i] = i;
      dp[i] = 0x3f3f3f3f;
    }
    dp[1] = 0;
    for (int i = 0; i < connections.size(); ++i) {
      connected[connections[i][0]] = connections[i][1];
    }
    for (int i = 2; i <= length; ++i) {
      if (i - 6 < 1) {
        dp[i] = 1;
      } else {
        for (int j = 1; j <= 6; ++j) {
          dp[i] = std::min(dp[i], dp[i - j] + 1);
        }
      }
      dp[connected[i]] = std::min(dp[connected[i]], dp[i]);
    }
    return dp[length];
  }
};
```

***
## Chapter 9: 序列型动态规划

***
### 序列型动态规划--简介
- 给定一个序列
- 动态规划方程`f[i]`中的下标`i`表示前`i`个元素`a[0], a[1], ..., a[i - 1]`的某种性质
  - 坐标型的`f[i]`表示以`a[i]`为结尾的某种性质
- 初始化中，`f[0]`表示空序列的性质
  - 坐标型动态规划的初始条件`f[0]`就是指以`a_0`为结尾的子序列的性质

***
### 序列型动态规划--数字翻转
- [Lintcode 843 数字翻转](https://www.lintcode.com/problem/843/)

#### 动态规划组成部分一：确定状态
- 最后一步：最优策略中，最后一位数是否翻转
- 但需要知道前一位数已经变成0还是1
- 并且前`N - 1`位数最少翻转多少次，满足要求（无01子串）
- **不知道的信息加入状态里**
- 状态
- 用`f[i][0]`表示`A[i - 1]`变成0的情况下，前`i`位最少翻转多少个能满足要求
- 用`f[i][1]`表示`A[i - 1]`变成1的情况下，前`i`位最少翻转多少个能满足要求

#### 动态规划组成部分二：转移方程
- 用`f[i][0]`表示`A[i - 1]`变成0的情况下，前`i`位最少翻转多少个能满足要求
- 用`f[i][1]`表示`A[i - 1]`变成1的情况下，前`i`位最少翻转多少个能满足要求
- $f[i][j] = min_{(k, j) ≠ (0, 1)}(f[i - 1][k] + 1_{A[i - 1] ≠ j})$

![9.1.img](images/9.1.png)

#### 动态规划组成部分三：初始条件和边界情况
- 用`f[i][0]`表示`A[i - 1]`变成0的情况下，前`i`位最少翻转多少个能满足要求
- 用`f[i][1]`表示`A[i - 1]`变成1的情况下，前`i`位最少翻转多少个能满足要求
- $f[i][j] = min_{(k, j) ≠ (0, 1)}(f[i - 1][k] + 1_{A[i - 1] ≠ j})$
- 初始条件：
  - `f[0][0] = f[0][1] = 0`

#### 动态规划组成部分四：计算顺序
- 用`f[i][0]`表示`A[i - 1]`变成0的情况下，前`i`位最少翻转多少个能满足要求
- 用`f[i][1]`表示`A[i - 1]`变成1的情况下，前`i`位最少翻转多少个能满足要求
- $f[i][j] = min_{(k, j) ≠ (0, 1)}(f[i - 1][k] + 1_{A[i - 1] ≠ j})$
- 答案是`min(f[N][0], f[N][1])`
- 算法时间复杂度O(N)，空间复杂度O(N)，可以用滚动数组优化至O(1)

#### Coding

##### Mine Correct Solution

```cpp
class Solution {
 public:
  int flipDigit(std::vector<int>& nums) {
    int n = nums.size();
    if (n <= 1) {
      return 0;
    }
    int f[n + 1][2];
    f[0][0] = 0;
    f[0][1] = 0;
    for (int i = 1; i <= n; ++i) {
      if (nums[i - 1] == 1) {
        f[i][0] = std::min(f[i - 1][1] + 1, f[i - 1][0] + 1);
        f[i][1] = f[i - 1][1];
      } else {
        f[i][0] = std::min(f[i - 1][0], f[i - 1][1]);
        f[i][1] = f[i - 1][1] + 1;
      }
    }
    return std::min(f[n][0], f[n][1]);
  }
};
```
> index in nums should minus 1  
> I think my solution is better than offical  

##### Official Solution

```cpp
class Solution {
 public:
  int flipDigit(std::vector<int>& nums) {
    int n = nums.size();
    if (n <= 1) {
      return 0;
    }
    int f[n + 1][2];
    f[0][0] = 0;
    f[0][1] = 0;
    // first i digits: nums[0, ..., i - 1]
    for (int i = 1; i <= n; ++i) {
      for (int j = 0; j < 2; ++j) {
        f[i][j] = 0x3f3f3f3f;
        // nums[i - 1]-->j, should I flip?
        int t = 0;
        if (nums[i - 1] != j) {
          t = 1;
        }

        // nums[i - 2]-->k
        for (int k = 0; k < 2; ++k) {
          if (k == 0 && j == 1) {
            continue;
          }
          f[i][j] = std::min(f[i][j], f[i - 1][k] + t);
        }
      }
    }
    return std::min(f[n][0], f[n][1]);
  }
};
```

***
### 序列型动态规划的时间优化--房屋染色II
- [Lintcode 516 房屋染色II](https://www.lintcode.com/problem/516)

- 时间优化有三个可以做的事情：
  1. 看式子，并展开(也许会发现里面有重复)
  2. 画图
  3. 小例子


#### Mine Correct Answer O(nk^2)

```cpp
class Solution {
 public:
  int minCostII(std::vector<std::vector<int>>& costs) {
    if (costs.size() == 0) {
      return 0;
    }
    int n = costs.size();
    int m = costs[0].size();
    if (n == 1 && m == 1) {
      return costs[0][0];
    }
    int dp[n + 1][m];
    for (int i = 0; i < m; ++i) {
      dp[0][i] = 0;
    }
    for (int i = 1; i <= n; ++i) {
      for (int j = 0; j < m; ++j) {
        dp[i][j] = costs[i - 1][j];
        int min_cost = 0x3f3f3f3f;
        for (int k = 0; k < m; ++k) {
          if (k == j) {
            continue;
          }
          min_cost = std::min(min_cost, dp[i][j] + dp[i - 1][k]);
        }
        dp[i][j] = min_cost;
      }
    }
    int ans = 0x3f3f3f3f;
    for (int i = 0; i < m; ++i) {
      ans = std::min(ans, dp[n][i]);
    }
    return ans;
  }
};
```

> follow up: can you make it faster?  
> Mine solution is O(nk^2), how to make it faster

#### 时间优化
- 优化方法
  - 记录下最小值`f[i - 1][a]`和次小值`f[i - 1][b]`
  - 如果去掉的是最小值，则`f[i][a] = f[i - 1][b] + cost[i - 1][a]`
  - 如果去掉的不是最小值，则`f[i][j] = f[i - 1][a] + cost[i - 1][j]`
  - 时间复杂度降为O(nk)

##### Mine correct time optimized solution
```cpp
class Solution {
 public:
  int minCostII(std::vector<std::vector<int>>& costs) {
    if (costs.size() == 0) {
      return 0;
    }
    int n = costs.size();
    int m = costs[0].size();
    if (n == 1 && m == 1) {
      return costs[0][0];
    }
    int dp[n + 1][m];
    for (int i = 0; i < m; ++i) {
      dp[0][i] = 0;
    }

    // record min and second_minimum number
    std::vector<std::vector<int>> min_secondmin(2, std::vector<int>(2, 0x3f3f3f3f));

    for (int i = 1; i <= n; ++i) {
      int index_min = min_secondmin[0][0];
      int first_min = min_secondmin[0][1];
      int second_min = min_secondmin[1][1];
      min_secondmin[0][1] = min_secondmin[1][1] = 0x3f3f3f3f;
      for (int j = 0; j < m; ++j) {
        dp[i][j] = costs[i - 1][j];
        if (i == 1 && dp[i][j] < min_secondmin[0][1]) {
          min_secondmin[1][1] = min_secondmin[0][1];
          min_secondmin[1][0] = min_secondmin[0][0];
          min_secondmin[0][1] = dp[i][j];
          min_secondmin[0][0] = j;
          continue;
        }
        if (i == 1 && dp[i][j] < min_secondmin[1][1]) {
          min_secondmin[1][1] = dp[i][j];
          min_secondmin[1][0] = j;
        }

        if (i == 1) {
          continue;
        }

        if (j == index_min) {
          // j is the smallest and choose the second smallest
          dp[i][j] += second_min;
        } else {
          // j is not the smallest one and choose the smallest
          dp[i][j] += first_min;
        }
        if (dp[i][j] < min_secondmin[0][1]) {
          min_secondmin[1][1] = min_secondmin[0][1];
          min_secondmin[1][0] = min_secondmin[0][0];
          min_secondmin[0][1] = dp[i][j];
          min_secondmin[0][0] = j;
          continue;
        }
        if (dp[i][j] < min_secondmin[1][1]) {
          min_secondmin[1][1] = dp[i][j];
          min_secondmin[1][0] = j;
        }
      }
    }
    int ans = 0x3f3f3f3f;
    for (int i = 0; i < m; ++i) {
      ans = std::min(ans, dp[n][i]);
    }
    return ans;
  }
};
```

##### Official time optimized solution
```cpp
class Solution {
 public:
  int minCostII(std::vector<std::vector<int>>& costs) {
    int n = costs.size();
    if (n == 0) {
      return 0;
    }

    int m = costs[0].size();
    if (m == 0) {
      return 0;
    }

    if (n == 1 && m == 1) {
      return costs[0][0];
    }

    int dp[n + 1][m];
    int f[n + 1][m];
    int i, j, k, a, b;
    for (int i = 0; i < m; ++i) {
      f[0][i] = 0;
    }

    // first i houses: 0 ... i - 1
    for (i = 1; i <= n; ++i) {
      // find minimum and 2nd minimum among
      // f[i - 1][0], ..., f[i - 1][m - 1]
      a = b = -1; // this is index
      for (k = 0; k < m; ++k) {
        if (a == -1 || f[i - 1][k] < f[i - 1][a]) { // new minimum is f[i - 1][k]
          b = a; // old minimum becomes now the 2nd minimum
          a = k; // new minimum is f[i - 1][k]
        } else {
          if (b == -1 || f[i - 1][k] < f[i - 1][b]) {
            b = k;
          }
        }
      }

      for (j = 0; j < m; ++j) {
        if (j != a) {
          // remove an element which is NOT the minimum
          f[i][j] = f[i - 1][a] + costs[i - 1][j];
        } else {
          // remove an element which IS the minimum
          f[i][j] = f[i - 1][b] + costs[i - 1][j];
        }
      }
    }
    int ans = 0x3f3f3f3f;
    for (int i = 0; i < m; ++i) {
      ans = std::min(ans, f[n][i]);
    }
    return ans;
  }
};
```

> remember the strategy to calculate minimum and the 2nd minimum with one time iteration  
> `a == -1 || f[a] ....`

***
### 序列型动态规划--买卖股票1

- [Lintcode 149 买卖股票1](https://www.lintcode.com/problem/149/)

#### 动态规划解法
- 从 0 到 N - 1 枚举 `j`, 即第几天卖
- 时刻保存当前为止（即 0 ~ j - 1 天）的最低加个`P_i`
- 最大的`P_j - P_i` 即为答案

##### Mine correct solution
```cpp
class Solution {
 public:
  int maxProfit(std::vector<int>& prices) {
    int n = prices.size();
    if (n <= 1) {
      return 0;
    }
    int min_index = 0;
    int max_profit = 0;
    for (int j = 1; j < n; ++j) {
      if (prices[j] < prices[min_index]) {
        min_index = j;
        continue;
      }
      if (max_profit < prices[j] - prices[min_index]) {
        max_profit = prices[j] - prices[min_index];
      }
    }
    return max_profit;
  }
};
```

##### Official solution: Better
```cpp
class Solution {
 public:
  int maxProfit(std::vector<int>& prices) {
    int n = prices.size();
    if (n <= 1) {
      return 0;
    }
    int min = prices[0];
    int res = 0;
    for (int j = 1; j < n; ++j) {
      // The minimum among prices[0] ... prices[j - 1] is stored in min
      res = std::max(res, prices[j] - min);
      min = std::min(min, prices[j]);
    }
    return res;
  }
};
```

***
### 序列型动态规划--买卖股票2

- [Lintcode 150 买卖股票2](https://www.lintcode.com/problem/150/)

#### 题目分析
- 买卖任意多次
- 最优策略是如果今天的价格比明天的价格低，就今天买，明天卖（**贪心**）

* 凡事我们自己想出来的贪心算法都需要证明一下：
  * 所有的贪心的证明都是：假设最优策略不是这样，可以改成这样，且不会更差

- 正确性证明可以从这里下手：
  - 如果最优策略第10天买，第15天卖，我们可以把它分解成5天(即改成这样)，结果不会变差

#### Official solution
```cpp
// 贪心
class Solution {
 public:
  int maxProfit(std::vector<int>& prices) {
    if (prices.size() == 0) {
      return 0;
    }
    int res = 0;
    for (int i = 0; i < prices.size() - 1; ++i) {
      if (prices[i + 1] > prices[i]) {
        res += prices[i + 1] - prices[i];
      }
      // res += std::max(prices[i + 1] - prices[i], 0)
    }
    return res;
  }
};
```


### 序列型动态规划--买卖股票3: 序列型

- [Lintcode 151 买卖股票3](https://www.lintcode.com/problem/151/)

e.g. 输入：[4,4,6,1,1,4,2,5]
     输出：6（4买入，6卖出，1买入，5卖出，收益为(6 - 4) + (5 - 1) = 6)

#### 题目分析
- 题目大意和 I, II 基本相似
- 只能最多两次买卖
- 所以需要记录已经买卖了多少次

#### 动态规划组成部分一：确定状态
- 最后一步：最优策略中，最后一次卖发生在第 j 天
- 枚举最后一次买发生在第几天
- 但是不知道之前有没有买卖过

##### 记录阶段
- **不知道有没有买过，就记录下来**
- 阶段可以保持：即不进行买卖操作
  - 在阶段2，继续持有，获利为当天价格减昨天价格（当天获利，当天结算）
- 阶段可以变化：买或卖
  - 在阶段2，卖了一股后，进入阶段3
![9.2](images/9.2.png)

#### 动态规划组成部分一：确定状态 continued
- 最优策略一定是前 N 天（第 N - 1 天）结束后，处于
  - 阶段1: 没买卖过；阶段3: 买卖过一次；阶段5: 买卖过两次
- 状态：`f[i][j]`表示前`i`天（第 `i - 1`天）结束后，在阶段`j`的最大获利

- 例如，如果要求前 N 天（第 N - 1 天）结束后，在阶段5的最大获利，设为`f[N][5]`
  - 情况1: 第 N - 2 天就在阶段5 --- `f[N - 1][5]`
  - 情况2: 第 N - 2 天还在阶段4（第二次持有股票），第 N - 1 天卖掉
    - `f[N - 1][4] + (P_{N - 1} - P_{N - 2})`

- 例如，如果要求前 N 天（第 N - 1 天）结束后，在阶段4的最大获利，设为`f[N][4]`
  - 情况1: 第 N - 2 天就在阶段4 --- `f[N - 1][4] + (P_{N - 1} - P_{N - 2})`
  - 情况2: 第 N - 2 天还在阶段3 --- `f[N - 1][3]`

#### 子问题
- 要求`f[N][1], ..., f[N][5]`
- 需要知道`f[N - 1][1], ..., f[N - 1][5]`
- 子问题

#### 动态规划组成部分二：转移方程
- `f[i][j]`: 前`i`天（第 `i - 1`天）结束后，处在阶段`j`，最大获利

![9.3](images/9.3.png)

#### 动态规划组成部分三：初始条件和边界情况
- 刚开始（前 0 天）处于阶段1
  - `f[0][1] = 0`
  - `f[0][2] = f[0][3] = f[0][4] = f[0][5] = -inf`
- 阶段 1, 3, 5: `f[i][j] = max(f[i - 1][j], f[i - 1][j - 1] + P_{i - 1} - P_{i - 2})`
- 阶段 2, 4: `f[i][j] = max(f[i - 1][j] + P_{i - 1} - P_{i - 2}, f[i - 1][j - 1])`
- 如果 `j - 1 < 1` 或 `i - 2 < 0`，对应项不计入 max
- 因为**最多**买卖两次，所以答案是`max(f[N][1], f[N][3], f[N][5])`，即清仓状态下最后一天最大获利

#### 动态规划组成部分四：计算顺序
- 初始化`f[0][1], ..., f[0][5]`
- `f[1][1], ..., f[1][5]`
- ...
- `f[N][1], ..., f[N][5]`
- 时间复杂度：O(N), 空间复杂度：O(N), 优化后可以O(1), 因为`f[i][1..5]`只依赖于`f[i - 1][1..5]`


#### Official Solution
```cpp
class Solution {
 public:
  int maxProfit(std::vector<int>& prices) {
    int n = prices.size();
    if (n == 0) {
      return 0;
    }
    int f[n + 1][5 + 1];
    int i, j, k;
    for (k = 1; k <= 5; ++k) {
      f[0][k] = 0xcfcfcfcf; // impossible
    }

    f[0][1] = 0;
    for (i = 1; i <= n; ++i) {
      // 阶段 1, 3, 5：f[i][j] = max(f[i - 1][j], f[i - 1][j - 1] + prices[i - 1] - prices[i - 2])
      for (j = 1; j <= 5; j += 2) {
        // keep state
        f[i][j] = f[i - 1][j];

        // sell today
        if (j > 1 && i > 1 && f[i - 1][j - 1] != 0xcfcfcfcf) {
          f[i][j] = std::max(f[i][j], f[i - 1][j - 1] + prices[i - 1] - prices[i - 2]);
        }
      }

      // 阶段 2, 4：f[i][j] = max(f[i - 1][j] + prices[i - 1] - prices[i - 2], f[i - 1][j - 1])
      for (j = 2; j <= 5; j += 2) {
        // buy today
        f[i][j] = f[i - 1][j - 1];

        // keep state, calculate profit today
        if (i > 1 && f[i - 1][j] != 0xcfcfcfcf) {
          f[i][j] = std::max(f[i][j], f[i - 1][j] + prices[i - 1] - prices[i - 2]);
        }
      }
    }

    int res = 0;
    for (j = 1; j <= 5; j += 2) {
      res = std::max(res, f[n][j]);
    }
    return res;
  }
};
```

***
### 序列型动态规划--买卖股票4

- [Lintcode 393 买卖股票4](https://www.lintcode.com/problem/393/)

#### 题目分析
- 首先，如果 K 很大，`K > N / 2`，则题目可以化简成为Best Time to Buy and Sell Stock II, 每天买入当且仅当价格比下一天低
- Best Time to Buy and Sell Stock III 相当于这题中`K = 2`
- 所以我们可以借鉴之前的解法

#### 记录阶段
![9.4](images/9.4.png)

- 阶段1: 没买卖过
- 阶段3: 买卖过一次，现在空仓
- 阶段5: 买卖过两次，现在空仓
- ...
- 阶段2K + 1: 买卖过K次，现在空仓

* 阶段2: 第一次持有，还没有卖
* 阶段4: 第二次持有，还没有卖
* 阶段6: 第三次持有，还没有卖
* ...
* 阶段2K: 第K次持有，还没有卖

#### 动态规划组成部分二：转移方程
- `f[i][j]`: 前`i`天（第`i - 1`天）结束后，处在阶段`j`，最大获利

![9.5](images/9.5.png)


#### 动态规划组成部分三：初始条件和边界情况
- 刚开始（前 0 天）处于阶段1
  - `f[0][1] = 0`
  - `f[0][2] = f[0][3] = f[0][4] = f[0][**2K + 1**] = -inf`
- 阶段 1, 3, 5, ..., **2K + 1**: `f[i][j] = max(f[i - 1][j], f[i - 1][j - 1] + P_{i - 1} - P_{i - 2})`
- 阶段 2, 4, ..., **2K**: `f[i][j] = max(f[i - 1][j] + P_{i - 1} - P_{i - 2}, f[i - 1][j - 1])`
- 如果 `j - 1 < 1` 或 `i - 2 < 0`，对应项不计入 max
- 因为**最多**买卖**K**次，所以答案是`max(f[N][1], f[N][3], ..., f[N][**2K + 1**])`，即清仓状态下最后一天最大获利


#### 动态规划组成部分四：计算顺序
- 初始化`f[0][1], ..., f[0][**2K + 1**]`
- `f[1][1], ..., f[1][**2K + 1**]`
- ...
- `f[N][1], ..., f[N][**2K + 1**]`
- 时间复杂度：O(NK), 空间复杂度：O(NK), 优化后可以O(1), 因为`f[i][1..**2K + 1**]`只依赖于`f[i - 1][1..**2K + 1**]`


#### Official Solution
```cpp
class Solution {
 public:
  int maxProfit(int K, std::vector<int>& prices) {
    int n = prices.size();
    if (n == 0) {
      return 0;
    }

    int i, j, k;
    if (K > n / 2) {
      int ans = 0;
      for (i = 0; i < n - 1; ++i) {
        if (prices[i + 1] - prices[i] > 0) {
          ans += prices[i + 1] - prices[i];
        }
      }
      return ans;
    }

    int f[n + 1][2 * K + 1 + 1];
    for (k = 1; k <= 2 * K + 1; ++k) {
      f[0][k] = 0xcfcfcfcf; // impossible
    }

    f[0][1] = 0;
    for (i = 1; i <= n; ++i) {
      // 阶段 1, 3, 2 * K + 1：f[i][j] = max(f[i - 1][j], f[i - 1][j - 1] + prices[i - 1] - prices[i - 2])
      for (j = 1; j <= 2 * K + 1; j += 2) {
        // keep state
        f[i][j] = f[i - 1][j];

        // sell today
        if (j > 1 && i > 1 && f[i - 1][j - 1] != 0xcfcfcfcf) {
          f[i][j] = std::max(f[i][j], f[i - 1][j - 1] + prices[i - 1] - prices[i - 2]);
        }
      }

      // 阶段 2, 2 * K：f[i][j] = max(f[i - 1][j] + prices[i - 1] - prices[i - 2], f[i - 1][j - 1])
      for (j = 2; j <= 2 * K; j += 2) {
        // buy today
        f[i][j] = f[i - 1][j - 1];

        // keep state, calculate profit today
        if (i > 1 && f[i - 1][j] != 0xcfcfcfcf) {
          f[i][j] = std::max(f[i][j], f[i - 1][j] + prices[i - 1] - prices[i - 2]);
        }
      }
    }

    int res = 0;
    for (j = 1; j <= 2 * K + 1; j += 2) {
      res = std::max(res, f[n][j]);
    }
    return res;
  }
};
```

#### Official Solution : rolling array optimization

```cpp
class Solution {
 public:
  int maxProfit(int K, std::vector<int>& prices) {
    int n = prices.size();
    if (n == 0) {
      return 0;
    }

    int i, j, k;
    if (K > n / 2) {
      int ans = 0;
      for (i = 0; i < n - 1; ++i) {
        if (prices[i + 1] - prices[i] > 0) {
          ans += prices[i + 1] - prices[i];
        }
      }
      return ans;
    }

    // rolling array optimization
    int f[2][2 * K + 1 + 1];
    int old, now = 0;

    for (k = 1; k <= 2 * K + 1; ++k) {
      f[now][k] = 0xcfcfcfcf; // impossible
    }

    f[now][1] = 0;
    for (i = 1; i <= n; ++i) {
      // 先交换old, now
      old = now;
      now = 1 - now;

      // 阶段 1, 3, 2 * K + 1：f[i][j] = max(f[i - 1][j], f[i - 1][j - 1] + prices[i - 1] - prices[i - 2])
      for (j = 1; j <= 2 * K + 1; j += 2) {
        // keep state
        f[now][j] = f[old][j];

        // sell today
        if (j > 1 && i > 1 && f[old][j - 1] != 0xcfcfcfcf) {
          f[now][j] = std::max(f[now][j], f[old][j - 1] + prices[i - 1] - prices[i - 2]);
        }
      }

      // 阶段 2, 2 * K：f[i][j] = max(f[i - 1][j] + prices[i - 1] - prices[i - 2], f[i - 1][j - 1])
      for (j = 2; j <= 2 * K; j += 2) {
        // buy today
        f[now][j] = f[old][j - 1];

        // keep state, calculate profit today
        if (i > 1 && f[old][j] != 0xcfcfcfcf) {
          f[now][j] = std::max(f[now][j], f[old][j] + prices[i - 1] - prices[i - 2]);
        }
      }
    }

    int res = 0;
    for (j = 1; j <= 2 * K + 1; j += 2) {
      res = std::max(res, f[now][j]);
    }
    return res;
  }
};
```

***
### 序列型动态规划--小结
- 当思考**序列型**动态规划最后一步时，这一步的选择依赖于前一步的某种状态

| 题目                                | 最后一步需要知道的信息                                                 | 序列 + 状态                                                                                                   |
|-------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| Paint House                         | 房子N - 1 油漆成红色，则房子N - 2不能油漆成红色                        | 记录油漆前N - 1栋房子**并且**房子N - 2是红、蓝、绿色的最小花费                                                |
| Digital Flip                        | 翻转A[i]时，A[i - 1]A[i]不能是01                                       | 记录翻转前N - 1位**并且**第N - 2位是0/1的最小翻转次数                                                         |
| Best Time to Buy and Sell Stock III | 第j天卖股票，第i天买股票(i < j)时，需要知道第i天之前是不是已经买了股票 | 记录前N天买卖股票最大获利，**并且**第N - 1天：1.未买卖股票；2.买了第一次股票还没卖；...；5.已经第二次卖了股票 |


* 初始化时，`f[0]`代表前0个元素/前0天当情况
  * 与坐标型动态规划区别
* 计算时，`f[i]`代表前`i`个元素（即元素`0~i-1`）的某种性质

***
### 初探 最长上升子序列(LIS)

#### 最长序列型动态规划
- 题目给定一个序列
- 要求找出符合条件的最长子序列
- 方法
  - 记录以每个元素`i`结尾的最长子序列的长度
  - 计算时，在`i`之前枚举子序列上一个元素是哪个
- 为**坐标型**动态规划

- [Lintcode 76 Longest Increasing Subsequence](https://www.lintcode.com/problem/76/)
#### 动态规划组成部分一：确定状态
- 最后一步：对于最优的策略，一定有最后一个元素`a[j]`
- 第一种情况：最优策略种最长上升子序列就是{a[j]}，答案是1
- 第二种情况：子序列长度大于1，那么最优策略中`a[j]`前一个元素是`a[i]`，并且`a[i] < a[j]`（不一定是连续的）
- 因为是最优策略，那么它选中的以`a[i]`结尾的上升子序列一定是最长的

#### 子问题
- 因为不确定最优策略中`a[j]`前一个元素`a[i]`是哪个，需要枚举每个`i`
- 求以`a[i]`结尾的最长上升子序列
- 本来是求以`a[j]`结尾的最长上升子序列
- **化为子问题：i<j**
- 状态：设`f[j] = `**以`a[j]`结尾**的最长上升子序列的长度

#### 动态规划组成部分二：转移方程
- `f[j] = `以`a[j]`结尾的最长上升子序列的长度
- `f[j] = max(1, f[i] + 1 | i < j and a[i] < a[j])`

![9.6](images/9.6.png)

#### 动态规划组成部分三：初始条件和边界情况
- 情况2必须满足：
  - `i >= 0`
  - `a[j] > a[i]`，满足单调性
- 初始条件：空

#### 动态规划组成部分四：计算顺序
- `f[j] = 以a[j]结尾的最长上升子序列的长度`
- 计算`f[0], f[1], f[2], ..., f[n - 1]`
- 答案是max(f[0], f[1], f[2], ..., f[n - 1])
- 算法时间复杂度O(n^2), 空间复杂度O(n)

#### 思考：如何做到时间复杂度O(nlogn)

#### Official Solution: O(n^2)
```cpp
class Solution {
 public:
  int longestIncreasingSubsequence(std::vector<int>& nums) {
    int n = nums.size();
    int f[n];

    int max = 0;
    for (int j = 0; j < n; ++j) {
      f[j] = 1;
      // previous element `nums[i]`
      for (int i = 0; i < j; ++i) {
        if (nums[i] < nums[j]) {
          f[j] = std::max(f[j], f[i] + 1);
        }
      }
      max = std::max(f[j], max);
    }
    return max;
  }
};
```

***
### phone interview
- 组里做什么
- 下一步什么时候

***
### Exercise 602 俄罗斯套娃信封

- [Lintcode 602 俄罗斯套娃信封](https://www.lintcode.com/problem/602/)

- 信封按照**长度**从小到大排序后（相同长度按照**宽度**从大到小），找宽度的 Longest Increasing Subsequence

- normal: O(n^2)
- challenge: O(nlogn) （后面再介绍）

#### Mine first solution: Time Limit Exceeded: dp
```cpp
class Solution {
 public:
  int maxEnvelopes(std::vector<std::vector<int>>& envelopes) {
    int n = envelopes.size();
    if (n <= 1) {
      return n;
    }
    int f[n];
    std::sort(envelopes.begin(),
              envelopes.end(),
              [](const auto& l, const auto& r) {
                return (l[0] == r[0]) ? l[1] > r[1] : l[0] < r[0];
              }
    );
    int max = 0;
    for (int j = 0; j < n; ++j) {
      f[j] = 1;
      for (int i = 0; i < j; ++i) {
        if (envelopes[i][1] < envelopes[j][1]) {
          f[j] = std::max(f[j], f[i] + 1);
        }
      }
      max = std::max(f[j], max);
    }
    return max;
  }
};
```

#### Mine second solution: Time Limit Exceeded: dfs
```cpp
class Solution {
 public:
  int maxEnvelopes(std::vector<std::vector<int>>& envelopes) {
    int n = envelopes.size();
    if (n <= 1) {
      return n;
    }
    std::sort(envelopes.begin(), envelopes.end());
    int ans = 0;
    dfs(envelopes, 0, 0, ans);
    return ans;
  }
 private:
  void dfs(std::vector<std::vector<int>>& envelopes, int current, int num, int& ans) {
    ans = std::max(ans, num);

    for (int i = current; i < envelopes.size(); ++i) {
      if (current == 0 ||
          envelopes[i][0] > envelopes[current - 1][0] &&
          envelopes[i][1] > envelopes[current - 1][1]) {
        dfs(envelopes, i + 1, num + 1, ans);
      }
    }
  }
};
```

#### Correct forum official solution

- 此处使用二分优化最长上升子序列，在`dp`数组中二分查找第一个大于等于当前数的位置，然后`dp[i]=k`，即第`i`处的最长上升子序列长度为`k`。

```cpp
class Solution {
 public:
  int maxEnvelopes(std::vector<std::vector<int>>& envelopes) {
    int n = envelopes.size();
    if (n == 0) {
      return 0;
    }

    auto cmp = [](const auto& x, const auto& y) {
      return x[0] == y[0] ? x[1] > y[1] : x[0] < y[0];
    };
    std::sort(envelopes.begin(), envelopes.end(), cmp);

    std::vector<int> dp(n), height(n+1, INT_MAX);
    for (int i = 0; i < n; ++i) {
      int k = std::lower_bound(height.begin(), height.end(), envelopes[i][1]) - height.begin();
      dp[i] = k;
      height[k] = envelopes[i][1];
    }

    int ans = 0;
    for (int i = 0; i < n; ++i) {
      ans = std::max(ans, dp[i]);
    }
    return ans + 1;
  }
};
```

***
### 课后习题
![9.7](images/9.7.png)
![9.8](images/9.8.png)
![9.9](images/9.9.png)


***
## Chapter 10: 骰子求和：背包型
- [Lintcode 20 骰子求和](https://www.lintcode.com/problem/20/)

本质上这道题是求方案数

核心的是看状态是什么：
  - 状态：用来表示一个子问题的一些参数凑在一起
  - 这道题的状态：

***
### 背包型

- `f[i][j]` 表示前`i`次骰子（掷`i`次骰子）我能够凑出和为`j`的概率是多少
  - 能想出这个的原因：
    1. 影响到状态，影响到每个计算结果的是*掷多少次*
    2. 我们要求的*和*，求的和是1，求的和是2，的概率也不一样
    3. 将以上两个信息全部放到状态当中去

```c++
class Solution {
 public:
  std::vector<std::pair<int, double>> dicesSum(int n) {
    std::vector<std::pair<int, double>> result;

    std::vector<std::vector<double>> f(n + 1, std::vector<double>(6 * n + 1, 0)); // has to be double
    for (int i = 1; i <= 6; ++i) {
      f[1][i] = 1.0 / 6;
    }

    for (int i = 2; i <= n; ++i) {
      for (int j = i; j <= 6 * n; ++j) { // n or i, both work
        for (int k = 1; k <= 6; ++k) {
          if (j > k) {
            f[i][j] += f[i - 1][j - k];
          }
        }
        f[i][j] /= 6.0;
      }
    }

    for (int j = n; j <= 6 * n; ++j) {
      result.push_back(std::make_pair(j, f[n][j]));
    }

    return result;
  }
};
```

***
## Chapter 11: 最长有效括号：后缀型(与前缀型只区别与计算顺序)
- [Lintcode 193 最长有效括号](https://www.lintcode.com/problem/193/)

- 字符串的题目特别多的题目都是**前缀型 或 后缀型**

* 设状态`dp[i]`为从`i`到`len - 1`中，以`i`开头的最长合法子串长度
* 初始化：`dp[len - 1] = 0`
* 如果`s[i] = ')'`，则跳过，因为不可能有由`'('`开头的串
* 如果`s[i] = '('`, 则需要找到右括号和它匹配。可以跳过以`i + 1`开头的合法子串，看`j = i + dp[i + 1] + 1`的位置是否为右括号。
  * 如果位置`i`没越界且为右括号，那么有`dp[i] = dp[i + 1] + 2`，此外在这个基础上还要将`j + 1`开头的子串加进来（只要不越界）。

```c++
class Solution {
 public:
  int longestValidParentheses(std::string& s) {
    int n = s.size();
    if (n < 2) {
      return 0;
    }
    int result = 0;
    // int dp[n] should have an additional step to initialize all elements to zero
    std::vector<int> dp(n, 0);
    for (int i = n - 2; i >= 0; --i) {
      if (s[i] == '(') {
        int j = i + dp[i + 1] + 1;
        // 如果没越界且为右括号
        if (j < n && s[j] == ')') {
          dp[i] = dp[i + 1] + 2;
          // 还要将j + 1开头的子串加进来
          if (j + 1 < n) {
            dp[i] += dp[j + 1];
          }
        }
        result = std::max(result, dp[i]);
      }
    }
    return result;
  }
};
```

***
## Chapter 12: 最大子数组差
- [Lintcode 45 最大子数组差](https://www.lintcode.com/problem/45/)

- 关键字**不重叠**，应该想到**隔板法**
- 因为区间不重合，那么他们肯定会被一个隔板隔开，我们枚举隔板，再去算左右两边的 最大区间和 和 最小区间和

### Mine solution

```c++
class Solution {
 public:
  int maxDiffSubArrays(std::vector<int>& nums) {
    int n = nums.size();
    if (n < 2) {
      return 0;
    }
    std::vector<int> prefix_sum(n + 1, 0);
    for (int i = 1; i < n + 1; ++i) {
      prefix_sum[i] = prefix_sum[i - 1] + nums[i - 1];
    }
    std::vector<int> left_max(n, nums[0]);
    
std::vector<int> right_max(n, nums[n - 1]);
    std::vector<int> left_min(n, nums[0]);
    std::vector<int> right_min(n, nums[n - 1]);
    int temp_min = nums[0];
    int temp_max = nums[0];
    for (int i = 1; i < n; ++i) {
      
    }

  }
};
```

### Official Solution: with some Greedy idea

```c++
class Solution {
 public:
  int maxDiffSubArrays(std::vector<int>& nums) {
    int n = nums.size();
    if (n < 2) {
      return 0;
    }
    // max_sum_of_left[i], min_sum_of_left[i]分别表示从左到i的范围内的子数组最大/最小和
    int max_sum_of_left[n];
    int min_sum_of_left[n];
    // max_sum_of_right[i], min_sum_of_right[i]分别表示从右到i的范围内的子数组最大/最小和
    int max_sum_of_right[n];
    int min_sum_of_right[n];
    // 求从左到i的范围内的子数组最大和
    max_sum_of_left[0] = nums[0];
    for (int i = 1, now = nums[0]; i < n; ++i) {
      now = std::max(nums[i], now + nums[i]);
      max_sum_of_left[i] = std::max(max_sum_of_left[i - 1], now);
    }
    // 求从右到i的范围内的子数组最大和
    max_sum_of_right[n - 1] = nums[n - 1];
    for (int i = n - 2, now = nums[n - 1]; i >= 0; --i) {
      now = std::max(nums[i], now + nums[i]);
      max_sum_of_right[i] = std::max(max_sum_of_right[i + 1], now);
    }
    // 求从左到i的范围内的子数组最小和
    min_sum_of_left[0] = nums[0];
    for (int i = 1, now = nums[0]; i < n; ++i) {
      now = std::min(nums[i], now + nums[i]);
      min_sum_of_left[i] = std::min(min_sum_of_left[i - 1], now);
    }
    // 求从右到i的范围内的子数组最小和
    min_sum_of_right[n - 1] = nums[n - 1];
    for (int i = n - 2, now = nums[n - 1]; i >= 0; --i) {
      now = std::min(nums[i], now + nums[i]);
      min_sum_of_right[i] = std::min(min_sum_of_right[i + 1], now);
    }
    int ans = 0xcfcfcfcf;
    for (int i = 0; i < n - 1; ++i) {
      // max(左大右小的差值，左小右大的差值)
      ans = std::max(ans, std::max(std::abs(max_sum_of_left[i] - min_sum_of_right[i + 1]),
                                   std::abs(min_sum_of_left[i] - max_sum_of_right[i + 1])));
    }
    return ans;
  }
};
```

### 相关题目

- [Lintcode 1833 钢笔盒](https://www.lintcode.com/problem/1833/)

- [Lintcode 1850 捡苹果](https://www.lintcode.com/problem/1850/)


## Chapter 13: 工作安排：坐标型

- [Lintcode 1147 工作安排](https://www.lintcode.com/problem/1147/)

Compared to the question of **house robbers**, not only do we have to decide whether to pick the task(whether to rob the current house)
but also we have to determine what task we will choose(simple or complex)

- 状态：令`dp[i]`表示前`i`周可完成的最大价值
- 状态转移：`dp[i] = max(dp[i - 1] + low[i], dp[i - 2] + high[i])`
- 临界值：第一周只能选择简单任务

```c++
class Solution {
 public:
  int workPlan(std::vector<int>& low, std::vector<int>& high) {
    int n = low.size();
    int dp[n];
    if (n == 0) {
     return 0;
    }
    dp[0] = low[0];
    for (int i = 1; i < n; ++i) {
      if (i < 2) {
        dp[i] = std::max(dp[i - 1] + low[i], high[i]);
        continue;
      }
      dp[i] = std::max(dp[i - 1] + low[i], dp[i - 2] + high[i]);
    }
    return dp[n - 1];
  }
};
```

> 思考：如果有负数怎么办？


## Chapter 14: 染色问题：坐标型

- [Lintcode 1444 染色问题](https://www.lintcode.com/problem/1444/)

- State: let `dp[i]` represents **the total number of plans** when circle is divided into `i` sectors
- Initialization:
  - when `i == 1`, we can use at least 1 color, `A(m, 1) : dp[1] = m`
  - when `i % 2 == 0`, we can use at least 2 color, `A(m, 2) : dp[2] = m * (m - 1)`
  - when `i % 2 == 1 && i >= 3`, we can use at least 3 color, `A(m, 3) : dp[3] = m * (m - 1) * (m - 2)`
- Function:
  - the `n` sectors problem can be derived from `n - 1` sectors sub-problem and `n - 2` sectors sub-problem
  - Regarding to `n - 1` sectors sub-problem, it has `dp[n - 1]` color plans.
    - Due to the colors of adjacent sectors cannot be the same, when we insert a new sector between two sectors, the number of plans is `m - 2`, and then the total number of color plans is `dp[n - 1] * (m - 2)`
    - function 1: `dp[i] += dp[i - 1] * (m - 2)`
  - Regarding to `n - 2` sectors sub-problem, it has `dp[n - 2]` color plans
    - We just choose one sector and then split it into two sectors with the same colors, and then insert a new sector between these two same color sectors. Then we have `dp[n - 2] * (m - 1)` the number of color plans
    - function 2: `dp[i] += dp[i - 2] * (m - 1)`
- Answer:
  - When calculating the result, we should add `module operation` within calculation to avoid overflowing
  - `dp[n]` is the final answer

Time Complexity: O(n)
Space Complexity: O(n)

```c++
class Solution {
 public:
  int getCount(int n, int m) {
    long long MOD = 1000000007;

    // long long dp[n + 3]; // ERROR: each value has to be initialized to zero
    // dp[i] represent number of color plans when we have i sectors and m colors
    std::vector<long long> dp(n + 3, 0);

    // one sector has m color plans
    dp[1] = m % MOD;
    // two sectors have m * (m - 1) color plans
    dp[2] = (long long)m * (m - 1) % MOD;
    // three sectors have m * (m - 1) * (m - 2) color plans
    dp[3] = (long long)m * (m - 1) * (m - 2) % MOD;

    for (int i = 4; i <= n; ++i) {
      dp[i] += dp[i - 1] * (m - 2) % MOD;
      dp[i] += dp[i - 2] * (m - 1) % MOD;
      dp[i] %= MOD;
      // dp[i] = (dp[i - 1] * (m - 2) + dp[i - 2] * (m - 1)) % MOD; // alternative
    }
    return (int)dp[n];
  }
};
```

Note:
long long dp[n + 5]; // each value has to be initialized to zero
we can also optimize space with rolling array


## Chapter 15: 最小的窗口子序列：匹配型

- [Lintcode 857 MinWindow](https://www.lintcode.com/problem/857/)

This problem is very similar to **The Problem of LCS** and **The Problem of Edit Distance**, given **two strings** which means 匹配型动态规划

- **匹配型动态规划开(n + 1)(m + 1)的数组， 类似于背包型动态规划**

这个题的题目名看起来和很多题目有相似之处，如“滑动窗口的最小值”等，那里我们使用单调队列进行求解，不要弄混

### The first solution with O(n^2 * (n + m)) approximate to O(n^3)
- The first solution we should come up with is brute force: use `O(n^2)` to find all **sub-string** of a string, and then check each **sub-string** whether they include the sub-sequence of string `T`. The total time cost O(n^2 * (n + m))

### The second solution with O(n * (n + m)) approximate to O(n^2), we should let time less than 10^8, if n is 20000, then it becomes 4 * 10^8 > 10^8, which is not good
- Then to optimize time complexity, we should consider **which part** can be optimized.
  - The first part which is to find the sub-string. We just enumerate **left** of sub-string and ignore **right** of sub-string.
  - Then the total time becomes O(n * (n + m))

### The thrid solution: Dynamic Programming: Time O(n * m) Space O(n * m)
- State: let `dp[i][j]` represent the left start pointer which successfully have **previous j characters of string T** is the sub-sequence of **previous i characters of string S**
- 状态：令`dp[i][j]`表示成功匹配**T串的前j个字符**为**S中前i个字符**的子序列时的**匹配起点**（即第几个字符）

- Function:
  - `S[i] == T[j] && j == 1 : dp[i][j] = i`
  - `S[i] == T[j] && j != 1 : dp[i][j] = dp[i - 1][j - 1]`
  - `S[i] != T[j] : dp[i][j] = dp[i - 1][j]`

- Initialization: `dp[i][0] = 0` represents the left start pointer of pairation of **an empty string** and **previous i characters of string S**.
  - Explanation: it equals to 0 means 0th character, not the index here
  - Alternative: To initialize here is let `dp[i][0] = -1`, because index 0 represent a real character

- Answer:
  - Enumerate `dp[][T.size()]`:
    - if `dp[i][T.size()] != 0`(here 0 is 0th character, -1 is index), then here exist left start pointer of the window `dp[i][T.size()]`, the length of window is `i - dp[i][T.size()] + 1`
    - At this time, we maintain our minimum length of window `len` and the **most** left start pointer `start`
  - Answer: `S.substr(start, start + len)`


```c++
class Solution {
 public:
  std::string minWindow(std::string& S, std::string& T) {
    int n = S.size();
    int m = T.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));
    for (int i = 1; i <= n; ++i) {
      for (int j = 1; j <= m; ++j) {
        if (S[i - 1] == T[j - 1]) {
          if (j == 1) {
            dp[i][j] = i;
          } else {
            dp[i][j] = dp[i - 1][j - 1];
          }
        } else {
          dp[i][j] = dp[i - 1][j];
        }
      }
    }

    int start = 0;
    int len = n + 1;
    for (int i = 1; i <= n; ++i) {
      if (dp[i][m] != 0) {
        if (i - dp[i][m] + 1 < len) {
          start = dp[i][m] - 1;
          len = i - dp[i][m] + 1;
        }
      }
    }
    if (len == n + 1) {
      return "";
    }
    return S.substr(start, len);
  }
};
```

### Relative Problems
- [Lintcode 32 最小子串覆盖](https://www.lintcode.com/problem/32/)
- [Lintcode 397 最长上升连续子序列](https://www.lintcode.com/problem/397/)
- [Lintcode 77 最长公共子序列](https://www.lintcode.com/problem/77/)



## Chapter 16: 划分型、博弈型 和 背包型 动态规划

### 划分型动态规划

- 定义： 给定长度为`N`的序列或字符串，要求划分成若干段，每一段要满足一定的性质
  - 段数不限，或指定`K`段
  - 每一段满足一定的性质

- 做法：
  - 类似于序列型动态规划，但是通常要加上段数信息
  - 一般用`f[i][j]`记录前`i`个元素（元素`0 ~ i-1`）分成`j`段的性质，如最小代价

#### Example: Lintcode 513 Perfect Square：划分型

- [Lintcode 513 完美平方](https://www.lintcode.com/problem/513/)

##### 动态规划组成部分一：确定状态

- 确定状态：关注最优策略中最后一个完全平方数`j^2`
- 最优策略中`n - j^2`也一定被划分成最少的完全平方数之和
- 需要知道`n - j^2`最少被分成几个完全平方数之和
- 原来是求`n`最少被分成几个完全平方数之和
- 子问题
- 状态：设`f[i]`表示`i`最少被分成几个完全平方数之和（copy下来，变量变成下标，就能得到状态）
  - 这道题只开一维数组，没有段数，原因是段数不是我们需要限定的。比如说如果这道题问，能不能分成10段，就需要改一下。

##### 动态规划组成部分二：转移方程

- 设`f[i]`表示`i`最少被分成几个完全平方数之和
- `f[i] = min_{1 <= j * j <= i}(f[i - j^2] + 1)`
  - 此处`{1 <= j * j <= i}`是限定条件

![images 16.1](images/16.1.png)

##### 动态规划组成部分三：初始条件和边界情况

- 设`f[i]`表示`i`最少被分成几个完全平方数之和
- `f[i] = min_{1 <= j * j <= i}(f[i - j^2] + 1)`

- 初始条件：`0`被分成`0`个完全平方数之和
  - `f[0] = 0`

##### 动态规划组成部分四：计算顺序

- 初始化`f[0]`
- 计算`f[1], ..., f[N]`
- 答案是`f[N]`
- 空间复杂度是`O(n)`并且不能用滚动数组
- 时间复杂度是`sqrt(1) + sqrt(2) + ... + sqrt(n) = O(n * sqrt(n))`

##### Coding Solution

```c++
// DP solution
// Running time error
class Solution {
 public:
  int numSquares(int n) {
    std::vector<int> f(n + 1);
    f[0] = 0;
    for (int i = 1; i <= n; ++i) {
      f[i] = INT_MAX;
      // last perfect square is j * j
      for (int j = 1; j * j <= i; ++j) {
        f[i] = std::min(f[i], f[i - j * j] + 1);
      }
    }

    return f[n];
  }
};
```

A Math solution costs O(n) time, and O(1) space

```c++
// Math solution
// Accepted
class Solution {
 public:
  int numSquares(int n) {
    while (n % 4 == 0) {
      n /= 4;
    }
    if (n % 8 == 7) {
      return 4;
    }
    for (int i = 0; i * i <= n; ++i) {
      int j = (int)std::sqrt(n * 1.0 - i * i);
      if (i * i + j * j == n) {
        int res = 0;
        if (i > 0) {
          res += 1;
        }
        if (j > 0) {
          res += 1;
        }
        return res;
      }
    }
    return 3;
  }
};
```

##### Follow up
1. 有多少种方式把`N`表示成完全平方数之和（`1^2 + 2^2`和`2^2 + 1^2`属于不同的方式）————**方案数**
  - Ans: replace `min` with `sum`

2. 能不能把`N`表示成恰好`K`个完全平方数之和————**可行性**
  - 状态：`f[i][k]`能不能将`i`表示成恰好`k`个完全平方数之和
  - 状态转移：`f[i][k] = OR_{1 <= j * j <= i}(f[i - j^2][k - 1])`


#### Example: Lintcode 108 Palindrome Partitioning II

- [Lintcode Palindrome Partitioning II](https://www.lintcode.com/problem/108/)

##### 动态规划组成部分一：确定状态
- 最后一步：关注最优策略中最后一段回文串，设为`S[j .. N-1]`
- 需要知道`S`前`j`个字符`[0 .. j-1]`最少可以划分成几个回文串

##### 子问题
- 求`S`前`N`个字符`S[0 .. N-1]`最少划分为几个回文串
- 需要知道`S`前`j`个字符`[0 .. j-1]`最少可以划分成几个回文串
- 子问题
- 状态：设`S`前`i`个字符`S[0 .. i-1]`最少可以划分成`f[i]`个回文串

##### 动态规划组成部分二：转移方程
- 设`f[i]`为`S`前`i`个字符`S[0 .. i-1]`最少可以划分成几个回文串
  - `f[i] = min_{j = 0, ..., i-1}(f[j] + 1 | S[j .. i-1]是回文串)`

![images 16.2](images/16.2.png)

##### 动态规划组成部分三：初始条件和边界情况
- 设`f[i]`为`S`前`i`个字符`S[0 .. i-1]`最少可以划分成几个回文串
  - `f[i] = min_{j = 0, ..., i-1}(f[j] + 1 | S[j .. i-1]是回文串)`
- 初始条件：空串可以被分成`0`个回文串
  - `f[0] = 0`

##### 动态规划组成部分四：计算顺序
- 计算`f[0], f[1], ..., f[N]`


##### 回文串判断
- 方法一：从左到右 和 从右到左 各读一遍，完全一样
- 方法二：可以用两个指针从两头向中间移动，每一步两个指针指向的字符都必须相等
- 但是动态规划转移方程是`f[i] = min_{j = 0, ..., i-1}(f[j] + 1 | S[j .. i-1]是回文串)`
- 每次都判断`S[j .. i-1]`是不是回文串很慢(
转移方程为O(n^3)太慢)
- 如何优化？

###### 回文串种类
- 回文串分两种：
  1. 长度为奇数
  2. 长度为偶数

###### 生成回文串
- 假设我们现在不是寻找回文串，而是生成回文串
- 从中间开始，向两边扩展，每次左右两端加上同样的字符

###### 在字符串中找到所有回文串
- 以字符串的每一个字符为中点，向两边扩展，找到所有回文串

###### 记录回文串
- 从`S`每一个字符开始向两边扩展
  - 考虑奇数长度回文串 和 偶数长度回文串
- 用`isPlain[i][j]`表示`S[i .. j]`是否是回文串
- 时间复杂度`O(n^2)`

##### 回到原题
- `S`最少划分成多少个回文串
- `f[i] = min_{j = 0, ..., i-1}(f[j] + 1 | S[j .. i-1]是回文串)`
- `f[i] = min_{j = 0, ..., i-1}(f[j] + 1 | isPlain[j][i - 1] = True)`
- 答案是`f[N] - 1`(因为原题是求最少划分几次)
- 时间复杂度`O(n^2)`
- 空间复杂度`O(n^2)`


```c++
class Solution {
 public:
  int minCut(std::string& S) {
    int n = S.size();
    if (n == 0) {
      return 0;
    }
    std::vector<std::vector<bool>> palin = CalcPalin(S);
    std::vector<int> f(n + 1);
    f[0] = 0;
    int i, j;
    // S[0 .. i-1]
    for (i = 1; i <= n; ++i) {
      f[i] = 0x3f3f3f3f;
      // S[j .. i-1]
      for (j = 0; j < i; ++j) {
        if (palin[j][i - 1]) {
          f[i] = std::min(f[i], f[j] + 1);
        }
      }
    }
    return f[n] - 1;
  }

  std::vector<std::vector<bool>> CalcPalin(std::string& S) {
    int n = S.size();
    std::vector<std::vector<bool>> palin(n, std::vector<bool>(n, false));
    int i, j, mid;
    for (mid = 0; mid < n; ++mid) {
      // odd-length palindrome
      i = j = mid;
      while (i >= 0 && j < n && S[i] == S[j]) {
        palin[i][j] = true;
        --i;
        ++j;
      }
      // even-length palindrome
      i = mid - 1;
      j = mid;
      while (i >= 0 && j < n && S[i] == S[j]) {
        palin[i][j] = true;
        --i;
        ++j;
      }
    }
    return palin;
  }
};
```

#### Example: Lintcode 437 Copy Books

- [Lintcode 437 Copy Books](https://www.lintcode.com/problem/437/)

- 通过关键词**连续**可以判断是否为**划分型动态规划**
- 这道题有段数限制

##### 题目分析
- 如果一个抄写员抄写第`i`本到第`j`本书，则需要时间`A[i] + A[i + 1] + ... + A[j]`
- 最后完成时间取决于耗时最长的那个抄写员
- 需要找到一种分段方式，分成**不超过K段**，使得所有段的数字之和的最大值最小

##### 动态规划组成部分一：确定状态
- 最后一步：最优策略中最后一个抄写员Bob（设他是第K个）抄写的部分
  - 一段连续的书，包含最后一本
- 如果Bob抄写第`j`本到第`N - 1`本书
- 则Bob需要时间`A[j] + ... + A[N - 1]`
- 需要知道前面`K - 1`个人最少需要多少时间抄完前`j`本书（第`0 ~ j-1`本书）(这里也是指 时间的最大值最小)

##### 子问题
- 求`K`个人最短需要多少时间抄完前`N`本书
- 需要知道`K - 1`个人最少需要多少时间抄完前`j`本书
- 子问题
- 状态：设`f[k][i]`为前`k`个抄写员最少需要多少时间抄完前`i`本书

##### 动态规划组成部分二：转移方程
- 设`f[k][i]`为`k`个抄写员最少需要多少时间抄完前`i`本书
  - `f[k][i] = min_{i = 0, ..., i}(max(f[k - 1][j], A[j] + ... + A[i - 1]))`(Note: min的下标可以到`i`，代表这个人根本就不抄书，有些人可能分到0本书，所以是0 到 i)

![Images 16.3](images/16.3.png)

##### 动态规划组成部分三：初始条件和边界情况
- 设`f[k][i]`为`k`个抄写员最少需要多少时间抄完前`i`本书
- `f[k][i] = min_{j = 0, ..., i}(max(f[k - 1][j], A[j] + ... A[i - 1]))`

- 初始条件：
  - 0 个抄写员只能抄0本书
    - `f[0][0] = 0, f[0][1] = f[0][2] = ... = f[0][N] = +inf`
  - k 个抄写员（k > 0）需要 0 时间抄 0 本书
    - `f[k][0] = 0(k > 0)`

##### 动态规划组成部分四：计算顺序
- 计算`f[0][0], f[0][1], ..., f[0][N]`
- 计算`f[1][0], f[1][1], ..., f[1][N]`
- ...
- 计算`f[K][0], f[K][1], ..., f[K][N]`
- 答案是`f[K][N]`
- 时间复杂度`O(N^2 * K)`
- 空间复杂度`O(NK)`，优化后可以达到`O(N)`
- 如果`K > N`, 可以赋值`K <- N`



##### Coding: The First Solution with DP

```c++
class Solution {
 public:
  int copyBooks(std::vector<int>& A, int K) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }

    if (K > n) {
      K = n;
    }

    int f[K + 1][n + 1];
    int i, j, k, s;
    for (i = 1; i <= n; ++i) {
      f[0][i] = 0x3f3f3f3f;
    }

    f[0][0] = 0;

    // first k copier
    for (k = 1; k <= K; ++k) {
      f[k][0] = 0;
      // copy first i books
      for (i = 1; i <= n; ++i) {
        f[k][i] = 0x3f3f3f3f;
        s = 0;
        for (j = i; j >= 0; --j) {
          // s = A[j] + ... + A[i - 1]
          if (f[k - 1][j] != 0x3f3f3f3f) {
            f[k][i] = std::min(f[k][i], std::max(f[k - 1][j], s));
          }

          // update s
          // s += A[j - 1]
          if (j > 0) {
            s += A[j - 1];
          }
        }
      }
    }
    return f[K][n];
  }
};
```

##### Coding: The Second Solution with Binary Search

```c++
#include <numeric> // accumulate
#include <algorithm> // max_element

class Solution {
 public:
  int copyBooks(std::vector<int>& pages, int K) {
    if (pages.size() == 0) {
      return 0;
    }

    // int start = 0xcfcfcfcf; // maximum element of pages
    // int end = 0; // sum of pages
    // for (int i = 0; i < pages.size(); ++i) {
      // start = std::max(start, pages[end]);
      // i += pages[i];
    // }
    int start = *std::max_element(pages.begin(), pages.end());
    int end = std::accumulate(pages.begin(), pages.end(), 0);
    while (start + 1 < end) {
      int mid = start + (end - start) / 2;
      if (GetLeastPeople(pages, mid) <= K) {
        end = mid;
      } else {
        start = mid;
      }
    }

    if (GetLeastPeople(pages, start) <= K) {
      return start;
    }
    return end;
  }

  int GetLeastPeople(std::vector<int>& pages, int time_limit) {
    int count = 0;
    int time_cost = 0;
    for (auto& page : pages) {
      if (time_cost + page > time_limit) {
        ++count;
        time_cost = 0;
      }
      time_cost += page;
    }
    return count + 1;
  }
};
```


#### Summary

- 划分型动态规划
- 要求将一个序列或字符串划分成若干满足要求的片段
- 解决方法：最后一步->**最后一段**
- 枚举最后一段的起点，然后把最后一段拿出来判断满不满足性质，然后再看前面最少的段数啊最少的时间等等

* 如果题目不指定段数，用`f[i]`表示前`i`个元素分段后的最值，可行性，方式数：Perfect Squares, Palindrome Partition II
* 如果题目指定段数，用`f[i][j]`表示前`i`个元素分成`j`段后的最值，可行性，方案数：Copy Books

![images 16.4](images/16.4.png)



### 博弈型动态规划

- 博弈为两方游戏
- 一方先下，在一定规则下依次出招
- 如果满足一定条件，则一方胜
- 目标：取胜

- 先手：先出招的一方
- 出招后，先手换人，新的先手面对一个新的局面
- Note: 只记先手(为了简化状态)，当前要下棋的那个人

* 只有**博弈型动态规划**不是从最后一步分析，而是从**第一步**分析
  * 反例：如果往一个空棋盘上加石子，先到`n`的人先赢，那这个时候应该按最后一步来想，因为这个时候**子问题从后往前会更小**

- 博弈型动态规划基本上都是: 取数字，取石子

#### Example: Lintcode 394 Coins in a Line

- [Lintcode 394 Coins in a Line](https://www.lintcode.com/problem/394/)


#### 动态规划组成部分一：确定状态

- 博弈动态规划通常从**第一步**分析，而不是最后一步
  - 因为局面越来越简单，石子数越来越少
- 面对`N`个石子，先手Alice第一步可以拿`1`个或`2`个石子
- 这样后手Bob就面对`N - 1`个石子或`N - 2`个石子
- 先手Alice一定会选择能让自己赢的一步
  - 因为双方都是采取最优策略
* 假如后手Bob面对`N - 1`个石子
* 其实这和一开始Bob是先手，有`N - 1`个石子的情况是一样的
* 那么Bob也会选择让自己赢的一步：取走`1`个或`2`个石子
* 之后Alice面对新的局面，自己成为新的先手，选择让自己赢的一步
* ...

#### 博弈型动态规划：必胜 vs 必败

- 怎么选择让自己赢的一步
- 就是走了这一步之后，对手面对剩下的石子，他必输(这里不是循环定义)

* 知识点：如果取`1`个或`2`个石子后，能让剩下的局面先手必败，则当前先手必胜
* 知识点：如果不管怎么走，剩下的局面都是先手必胜，则当前先手必败
* 宗旨：
  * 必胜：在当下的局面走出一步，让对手无路可逃（即必败）
  * 必败：自己无路可逃（即必败）

![images 16.5](images/16.5.png)

#### 子问题

- 要求面对`N`个石子，是否先手必胜
- 需要知道面对`N - 1`个石子和`N - 2`个石子，是否先手必胜
- 子问题
- 状态：设`f[i]`表示面对`i`个石子，是否先手必胜（`f[i] = TRUE / FALSE`）

#### 动态规划组成部分二：转移方程

- 设`f[i]`表示面对`i`个石子，是否先手必胜（`f[i] = TRUE / FALSE`）

- `f[i] = `
  - `true, f[i - 1] == False && f[i - 2] == false` 拿1或2个石子都必胜
  - `true, f[i - 1] == false && f[i - 2] == true` 拿1个石子必胜
  - `true, f[i - 1] == true && f[i - 2] == false` 拿2个石子必胜
  - `false, f[i - 1] == true && f[i - 2] == true` 必败
- Simplify: `f[i] = f[i - 1] == false || f[i - 2] == false`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i]`表示面对`i`个石子，是否先手必胜（`f[i] = TRUE / FALSE`）

- `f[i] = f[i - 1] == false || f[i - 2] == false`

- `f[0] = false` 面对0个石子，先手必败
- `f[1] = f[2] = true` 面对1个或2个石子，先手必胜

#### 动态规划组成部分四：计算顺序

- `f[0], f[1], f[2], ..., f[N]`
- 如果`f[N] = true`则先手必胜，否则先手必败
- 时间复杂度`O(N)`
- 空间复杂度`O(N)`，可以滚动数组优化至`O(1)`


#### Official Solution

```c++
class Solution {
 public:
  bool firstWillWin(int n) {
    if (n == 0) {
      return false;
    }
    std::vector<bool> f(n + 1);
    f[0] = false;
    f[1] = true;
    int i, j, k;
    for (i = 2; i <= n; ++i) {
      f[i] = f[i - 1] == false || f[i - 2] == false;
    }
    return f[n];
  }
};
```



#### The Second Solution with Time O(1) Space O(1)
```c++
class Solution {
 public:
  bool firstWillWin(int n) {
    return n % 3 != 0;
  }
};
```


### 背包型动态规划

- 你有一个背包，背包有最大承重
- 商店里有若干物品，都是免费拿
- 每个物品有重量和价值
- 目标：不撑爆背包的前提下
  - 装下最多重量物品
  - 装下最大总价值的物品
  - 有多少种方式正好带走满满一书包物品

#### 直觉
- 逐个放物品，看是否还能放入
- 两个关键点:
  - 还有**几个物品**
  - 还剩**多少承重**

#### Example: Lintcode 92 Backpack

- [Lintcode 92 Backpack](https://www.lintcode.com/problem/92/)

- 黄金定律：背包问题中，数组大小和总承重有关

##### 动态规划组成部分一：确定状态

- 需要知道`N`个物品是否能拼出重量`W`（W = 0, 1, ..., M）
- 最后一步：最后一个物品（重量`A_{N - 1}`是否进入背包）
- 情况一：如果前`N - 1`个物品能拼出`W`，当然前`N`个物品也能拼出`W`
- 情况二：如果前`N - 1`个物品能拼出`W - A_{N - 1}`，再加上最后的物品`A_{N - 1}`，拼出`W`

- 例子:
- 4个物品，重量为 2, 3, 5, 7
- 前3个物品可以拼出重量8(即3 + 5)，自然4个物品可以拼出重量8
- 前3个物品可以拼出重量2（即2），加上最后一个物品，可以拼出重量9

##### 子问题

- 要求前`N`个物品能不能拼出重量 0, 1, ..., M
- 需要知道前`N - 1`个物品能不能拼出重量 0, 1, ..., M
- 子问题
- 状态：设`f[i][w] = `能否用**前i个物品**拼出重量`w (TRUE / FALSE)`
- 常见误区：**错误** 设`f[i]`表示前`i`个物品能拼出的最大重量（不超过`M`）
  - 反例：`A = [3 9 5 2], M = 10`
  - 错误原因：最优策略中，前`N - 1`个物品拼出的**不一定是**不超过`M`的最大重量
  - 或者用黄金定律，即一定要有背包承重的维度

##### 动态规划组成部分二：转移方程

- 设`f[i][w] = `能否用**前i个物品**拼出重量`w (TRUE / FALSE)`
  - `f[i][w] = f[i - 1][w] || f[i - 1][w - A_{i - 1}]`

##### 动态规划组成部分三：初始条件和边界情况

- `f[i][w] = f[i - 1][w] || f[i - 1][w - A_{i - 1}]`
- 初始条件：
  - `f[0][0] = true` : 0个物品可以拼出重量0
  - `f[0][1 .. M] = false` : 0个物品不能拼出大于0的重量
- 边界情况：
  - `f[i - 1][w - A_{i - 1}]`


只能在`w >= A_{i - 1}`时使用

##### 动态规划组成部分四：计算顺序

- 初始化`f[0][0], f[0][1], ..., f[0][M]`
- 计算前 1 个物品能拼出哪些重量：`f[1][0], f[1][1], ..., f[1][M]`
- 计算前 2 个物品能拼出哪些重量：`f[2][0], f[2][1], ..., f[2][M]`
- ...
- 计算前 N 个物品能拼出哪些重量：`f[N][0], f[N][1], ..., f[N][M]`
- 时间复杂度（计算步数）：`O(MN)`
- 空间复杂度（数组大小）：优化后可以达到`O(M)`


##### DP Official Solution

```c++
class Solution {
 public:
  int backPack(int m, std::vector<int>& A) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }

    bool f[n + 1][m + 1];
    int i, w;

    // initialization
    for (i = 1; i <= m; ++i) {
      f[0][i] = false;
    }
    f[0][0] = true;

    // first i items
    for (i = 1; i <= n; ++i) {
      for (w = 0; w <= m; ++w) {
        // case 1: not using item_{i - 1}
        f[i][w] = f[i - 1][w];
        // case 2: using item_{i - 1}
        if (w >= A[i - 1]) {
          f[i][w] = f[i][w] || f[i - 1][w - A[i - 1]];
        }
      }
    }

    for (i = m; i >= 0; --i) {
      if (f[n][i]) {
        return i;
      }
    }
    return 0;
  }
};
```

##### Backpack Official Solution

```c++
class Solution {
 public:
  int backPack(int m, std::vector<int>& A) {
    int n = A.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1));
    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= m; ++j) {
        if (i == 0 || j == 0) {
          dp[i][j] = 0;
        } else if (j - A[i - 1] >= 0) {
          dp[i][j] = std::max(dp[i - 1][j - A[i - 1]] + A[i - 1], dp[i - 1][j]);
        } else {
          dp[i][j] = dp[i - 1][j];
        }
      }
    }
    return dp[n][m];
  }
};
```

##### Summary

- 方法二：
- 要求不超过`M`时能拼出的最大重量
- 记录前`i`个物品能拼出哪些重量
- 前`i`个物品能拼出的重量：
  - 前`i - 1`个物品能拼出的重量
  - 前`i - 1`个物品能拼出的重量 + 第`i`个物品重量`A_{i - 1}`

* 如果我们的重量不是正数，而是保留的两位小数，那么我们应该怎么处理?
  * 把重量扩大**100**倍进行背包，但一般仅限于小数位数比较少的时候，不然我们需要大量的空间来存储背包。


#### Example: Lintcode 563 Backpack V

- [Lintcode 563 Backpack V](https://www.lintcode.com/problem/563/)

##### 动态规划组成部分一：确定状态

- 需要知道`N`个物品有多少种方式拼出重量`W (W = 0, 1, ..., Target)`
- 最后一步：第`N`个物品（重量`A_{N - 1}`）是否进入背包
  - 情况一：用前`N - 1`个物品拼出`W`
  - 情况二：用前`N - 1`个物品能拼出`W - A_{N - 1}`，再加上最后的物品`A_{N - 1}`，拼出`W`
  - 情况一的个数 + 情况二的个数 = 用前`N`个物品拼出`W`的方式

##### 子问题

- 要求前`N`个物品有多少种方式拼出重量 0, 1, ..., Target
- 需要知道前`N - 1`个物品有多少种方式拼出重量 0, 1, ..., Target
- 子问题
- 状态：设`f[i][w] = `用**前 i 个物品**有多少种方式拼出重量`w`

##### 动态规划组成部分二：转移方程

- 设`f[i][w] = `用**前 i 个物品**有多少种方式拼出重量`w`
  - `f[i][w] = f[i - 1][w] + f[i - 1][w - A_{i - 1}]`

##### 动态规划组成部分三：初始条件和边界情况

- `f[i][w] = f[i - 1][w] + f[i - 1][w - A_{i - 1}]`

- 初始条件：
  - `f[0][0] = 1` : 0 个物品可以有一种方式拼出重量 0
  - `f[0][1 .. M] = 0` : 0 个物品不能拼出大于 0 的重量
- 边界情况：
  - `f[i - 1][w - A_{i - 1}]`只能在`w >= A_{i - 1}`时使用

##### 动态规划组成部分四：计算顺序

- 初始化`f[0][0], f[0][1], ..., f[0][Target]`
- 计算前 1 个物品有多少种方式拼出重量：`f[1][0], f[1][1], ..., f[1][Target]`
- ...
- 计算前 N 个物品有多少种方式拼出重量：`f[N][0], f[N][1], ..., f[N][Target]`
- 答案是`f[N][Target]`
- 时间复杂度（计算步数）：`O(N * Target)`
- 空间复杂度（数组大小）：滚动数组优化后可以达到`O(Target)`



##### Official Solution

```c++
class Solution {
 public:
  int backPackV(std::vector<int>& A, int m) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }

    int f[n + 1][m + 1];
    int i, w;

    // initialization
    for (i = 1; i <= m; ++i) {
      f[0][i] = 0;
    }
    f[0][0] = 1;

    // first i items
    for (i = 1; i <= n; ++i) {
      for (w = 0; w <= m; ++w) {
        // case 1: not using item_{i - 1}
        f[i][w] = f[i - 1][w];
        // case 2: using item_{i - 1}
        if (w >= A[i - 1]) {
          f[i][w] = f[i][w] + f[i - 1][w - A[i - 1]];
        }
      }
    }

    return f[n][m];
  }
};
```

##### 进一步空间优化

- `f[i][w] = f[i - 1][w] + f[i - 1][w - A_{i - 1}]`
- 可以只开**一个数组**
- 按照`f[i][Target], ..., f[i][0]`的顺序更新


```c++
class Solution {
 public:
  int backPackV(std::vector<int>& A, int m) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }

    int f[m + 1];
    int i, w;

    // initialization
    for (i = 1; i <= m; ++i) {
      f[i] = 0;
    }
    f[0] = 1;

    // first i items
    for (i = 1; i <= n; ++i) {
      for (w = m; w >= A[i - 1]; --w) { // w doesn't have to be 0 here
        f[w] += f[w - A[i - 1]];
      }
    }

    return f[m];
  }
};
```


##### My Correct Solution

```c++
class Solution {
 public:
  int backPackV(std::vector<int>& nums, int target) {
    int n = nums.size();
    int dp[n + 1][target + 1];

    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= target; ++j) {
        if (i == 0 && j == 0) {
          dp[i][j] = 1;
        } else if (i == 0) {
          dp[i][j] = 0;
        } else if (j - nums[i - 1] >= 0) {
          dp[i][j] = dp[i - 1][j - nums[i - 1]] + dp[i - 1][j];
        } else {
          dp[i][j]= dp[i - 1][j];
        }
      }
    }
    return dp[n][target];
  }
};
```

#### Exercise: Lintcode 564 BackPack IV (组合总和 IV)

- [Lintcode 564 Backpack IV (组合总和 IV)](https://www.lintcode.com/problem/564/)

- 类似于最前面的**Coin Change**

- 区别于**BackpackV**:
  - Here: [5, 1, 1], [1, 1, 5] 为两种不同的方案
  - **BackpackV**: [5, 1, 1], [1, 1, 5] 只能存在一种

- 最后一步：背包里最后一个物品的重量是多少
- `f[i] = `有多少种组合能拼出**重量`i`**
- `f[i] = f[i - A_{0}] + f[i - A_{1}] + ... + f[i - A_{N - 1}]`

##### 题目分析
- 和**BackpackV**唯一区别：组合中数字可以按不同的顺序，比如1 + 1 + 2与1 + 2 + 1算两种组合
- 不能先处理第一个物品，再处理第二个物品
- 似乎是更难的背包问题
- 其实更简单

##### 动态规划组成部分一：确定状态

- 关注最后一步：最后一个物品的重量是多少

* 关键点1: 任何一个正确的组合中，所有物品总重量是`Target`
* 关键点2: 如果最后一个物品重量是`K`，则前面的物品重量是`Target - K`

- 如果最后一个物品重量是`A_{0}`，则要求有多少种组合能拼成`Target - A_{0}`
- 如果最后一个物品重量是`A_{1}`，则要求有多少种组合能拼成`Target - A_{1}`
- ...
- 如果最后一个物品重量是`A_{N - 1}`，则要求有多少种组合能拼成`Target - A_{N - 1}`

##### 子问题

- 原问题要求 有多少种组合能拼成`Target`
- 子问题
- 设`f[i] = `有多少种组合能拼出重量`i`

##### 动态规划组成部分二：转移方程

- 设`f[i] = `有多少种组合能拼出重量`i`
  - `f[i] = f[i - A_{0}] + f[i - A_{1}] + ... + f[i - A_{N - 1}]`

![images/16.11](images/16.11.png)

##### 动态规划组成部分三：初始条件和边界情况

- `f[i] = f[i - A_{0}] + f[i - A_{1}] + ... + f[i - A_{N - 1}]`

- 出事条件：
- `f[0] = 1`
  - 有`1`种组合能拼出重量`0`（什么都不选）

- 边界情况：
- 如果`i < A_{j}`，则对应的`f[i - A_{j}]`不加入`f[i]`
  - `A_{0} = 1, A_{1} = 2, A_{2} = 4`
  - `f[3] = f[3 - A_{0}] + f[3 - A_{1}]`

##### 动态规划组成部分四：计算顺序

- 设`f[i] = `有多少种组合能拼出重量`i`
  - `f[i] = f[i - A_{0}] + f[i - A_{1}] + ... + f[i - A_{N - 1}]`
- `f[0] = 1`
- 计算`f[1], f[2], ..., f[Target]`
- 结果为`f[Target]`
- 时间复杂度（计算步数）：`O(N * Target)`
- 空间复杂度：`O(Target)`

##### Offical Solution

```c++
class Solution {
 public:
  int backPackVI(std::vector<int>& A, int m) {
    int n = A.size();
    int f[m + 1];
    f[0] = 1;
    int i, j;
    for (i = 1; i <= m; ++i) {
      // how many ways can we make weight
      // last item A[j]
      f[i] = 0;
      for (j = 0; j < n; ++j) {
        if (A[j] <= i) {
          f[i] += f[i - A[j]];
        }
      }
    }
    return f[m];
  }
};
```


### Summary

- 划分型动态规划
  - 如果不需要段数，`f[i]`: 前`i`个元素分段的最优值，方案数，可行性
  - 如果需要段数，`f[i][k]`

- 博弈型动态规划
  - 必胜 vs 必败
  - 只考虑先手
  - 当前状态必胜，说明当前状态至少有一种状态 可以走到 必败
  - 当前状态必败，说明不管怎么走都到 必胜的局面

- 背包型动态规划
  - 黄金定律：背包的总承重一定要放在状态里

#### Exercise: Single Choice

![images/16.6](images/16.6.png)
![images/16.7](images/16.7.png)
![images/16.8](images/16.8.png)
![images/16.9](images/16.9.png)
![images/16.10](images/16.10.png)


## Chapter 17: 背包型 和 区间型 动态规划

### 01 backpack

- [Lintcode 125 Backpack II](https://www.lintcode.com/problem/125/)

```c++
class Solution {
 public:
  int backPackII(int m, std::vector<int>& A, std::vector<int>& V) {
    int n = A.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));
    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= m; ++j) {
        if (i == 0 || j == 0) {
          dp[i][j] = 0;
        } else if (j - A[i - 1] >= 0) {
          dp[i][j] = std::max(dp[i - 1][j - A[i - 1]] + V[i - 1], dp[i - 1][j]);
        } else {
          dp[i][j] = dp[i - 1][j];
        }
      }
    }
    return dp[n][m];
  }
};
```

#### 打印路径

```c++
class Solution {
 public:
  int backPackII(int m, std::vector<int>& A, std::vector<int>& V) {
    int n = A.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));

    // pi has the same size with dp
    std::vector<std::vector<int>> pi(n + 1, std::vector<int>(m + 1, 0));

    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= m; ++j) {
        if (i == 0 || j == 0) {
          dp[i][j] = 0;
        } else if (j - A[i - 1] >= 0) {
          dp[i][j] = std::max(dp[i - 1][j - A[i - 1]] + V[i - 1], dp[i - 1][j]);

          // keep tracking whether we choose the item
          if (dp[i][j] == dp[i - 1][j - A[i - 1]] + V[i - 1]) {
            pi[i][j] = 1;
          }

        } else {
          dp[i][j] = dp[i - 1][j];
        }
      }
    }

    // print path
    std::vector<bool> selected(n);
    int weight = m;
    for (int i = n; i >= 1; --i) {
      if (pi[i][weight] == 1) {
        selected[i - 1] = true;
        weight -= A[i - 1];
      } else {
        selected[i - 1] = false;
      }
    }

    for (int i = 0; i < n; ++i) {
      if (selected[i]) {
        std::cout << "i: " << i << "A[i]: " << A[i] << "V[i]: " << V[i] << std::endl;
      }
    }

    return dp[n][m];
  }
};
```

### complete backpack

- [Lintcode 440 backpack III](https://www.lintcode.com/problem/440/)

```c++
class Solution {
 public:
  int backPackIII(std::vector<int>& A, std::vector<int>& V, int m) {
    std::vector<int> AA;
    std::vector<int> VV;

    for (int )


    int n = AA.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));
  }
};
```

1. Convert to 01backpack
2. Two dimentional matrix
3. One dimentinoal array

### multiple backpack

- Convert the problem to 01-backpack

### 区间型动态规划

- 给定一个序列/字符串，进行一些操作
- 最后一步会将序列/字符串 去头/去尾
- 剩下的会是一个区间`[i, j]`
- 状态自然定义为`f[i][j]`，表示面对子序列`[i, ..., j]`时的最优性质

#### Example: Lintcode 667 Longest Palindrome Subsequence

- [Lintcode 667 Longest Palindrome Subsequence](https://www.lintcode.com/problem/667/)

##### 动态规划组成部分一：确定状态

- 最优策略产生最长的回文子序列`T`，长度是`M`
- 情况1: 回文串长度是1，即一个字母
- 情况2: 回文串长度大于1，那么必定有`T[0] = T[M - 1]`

- 设`T[0]`是`S[i]`，`T[M - 1]`是`S[j]`
- `T`剩下的部分`T[1 ... M - 2]`仍然是一个回文串，而且是`S[i + 1 ... j - 1]`的**最长回文子序列**

##### 子问题

- 要求`S[i ... j]`的最长回文子序列
- 如果`S[i] = S[j]`，需要知道`S[i + 1 ... j - 1]`的最长回文子序列
- 否则答案是`S[i + 1 .. j]`的最长回文子序列 或 `S[i ... j - 1]`的最长回文子序列
- 子问题
- 状态：设`f[i][j]`为`S[i ... j]`的最长回文子序列的长度

##### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`S[i ... j]`的最长回文子序列的长度
  - `f[i][j] = max(f[i + 1][j], f[i][j - 1], f[i + 1][j - 1] + 2 | S[i] == S[j])`

![images/17.1](images/17.1.png)

##### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`S[i ... j]`的最长回文子序列的长度
  - `f[i][j] = max(f[i + 1][j], f[i][j - 1], f[i + 1][j - 1] + 2 | S[i] == S[j])`

- 初始条件：
  - `f[0][0] = f[1][1] = ... = f[N - 1][N - 1] = 1`
    - 一个字母也是一个长度为1的回文串
  - 如果`S[i] == S[i + 1], f[i][i + 1] = 2`(即相邻)
  - 如果`S[i] != S[i + 1], f[i][i + 1] = 1`(即相邻)


##### 动态规划组成部分四：计算顺序

- 设`f[i][j]`为`S[i ... j]`的最长回文子序列的长度
  - `f[i][j] = max(f[i + 1][j], f[i][j - 1], f[i + 1][j - 1] + 2 | S[i] == S[j])`
- 不能按照`i`的顺序去算
- 区间动态规划：**按照长度`j - i`从小到大的顺序去算**
  - 即`for`循环那个长度，不能循环`i`或`j`

![images 17.2](images/17.2.png)

- 长度 1 ：`f[0][0], f[1][1], f[2][2], ..., f[N - 1][N - 1]`
- 长度 2 ：`f[0][1], ..., f[N - 2][N - 1]`
- ...
- 长度 N ：`f[0][N - 1]`
- 答案是`f[0][N - 1]`
- 时间复杂度`O(N^2)`
- 空间复杂度`O(N^2)`

##### Official Solution

```c++
class Solution {
 public:
  int longestPalindromeSubseq(std::string& S) {
    int n = S.size();
    if (n <= 1) {
      return n;
    }

    int f[n][n];
    int i, j, len;
    // case 1: len == 1
    for (i = 0; i < n; ++i) {
      f[i][i] = 1;
    }

    // case 2: len == 2
    for (i = 0; i < n - 1; ++i) {
      f[i][i + 1] = (S[i] == S[i + 1]) ? 2 : 1;
    }

    for (len = 3; len <= n; ++len) {
      // [i .. i + len - 1]
      // i + len - 1 < n ==> i < n - len + 1 ==> i <= n - len
      for (i = 0; i <= n - len; ++i) { // i 是起点
        j = i + len - 1; // j 是终点
        // S[i .. j], length is len
        // 三种情况：
        f[i][j] = std::max(f[i + 1][j], f[i][j - 1]);
        if (S[i] == S[j]) {
          f[i][j] = std::max(f[i][j], f[i + 1][j - 1] + 2);
        }
      }
    }
    return f[0][n - 1];
  }
};
```
> 区间动态规划的初始化和计算顺序都是基于区间长度

#### 记忆化搜索方法

- 一种写程序的方法，不是新的算法
- 动态规划编程的另一个选择
- `f[i][j] = max(f[i + 1][j], f[i][j - 1], f[i + 1][j - 1] + 2 | S[i] == S[j])`
- 计算`f[0][N - 1]`
- **递归计算**`f[1][N - 1], f[0, N - 2], f[1][N - 2]`
- **记忆化**：计算`f[i][j]`结束后，将结果保存在数组`f[i][j]`里，下次如果需要再次计算`f[i][j]`，直接返回`f[i][j]`

* 两种解决动态规划的思路:
  * top-down 记忆化搜索
  * bottom-up 递推 recurrence
> 任何动态规划的题 既可以用 **记忆化搜索** 又可以用 **递推**

##### 与递推方法比较

- 递推方法 自下而上（从简单到复杂）：`f[0], f[1], ..., f[N]`
- 记忆化方法 自上而下（从复杂到简单）：`f[N], f[N - 1], ...`
- 记忆化搜索编写一般比较简单
- 递推方法在某些条件下可以做空间优化，记忆化搜索则必须存储所有`f`值

##### Coding with Template (important)

```c++
class Solution {
 public:
  int longestPalindromeSubseq(std::string& ss) {
    s = ss;
    n = s.size();
    if (n <= 1) {
      return n;
    }

    f.resize(n, std::vector<int>(n, 0));

    // important1: clear memory
    int i, j;
    for (i = 0; i < n; ++i) {
      for (j = i; j < n; ++j) {
        f[i][j] = -1; // f[i][j] has not been computed yet
      }
    }

    calc(0, n - 1);
    return f[0][n - 1];
  }

 private:
  void calc(int i, int j) {
    // compute f[i][j]
    if (f[i][j] != -1) {
      // important2: 递归里的第一句话就要写上: if f[i][j] has been computed, return directly
      return;
    }

    // simple case: caculate directly: length is 1
    if (i == j) {
      f[i][i] = 1;
      return;
    }

    // simple case: caculate directly: length is 2
    if (i + 1 == j) {
      f[i][i + 1] = (s[i] == s[i + 1]) ? 2 : 1;
      return;
    }

    // important3: 先在这里递归
    calc(i + 1, j); // f[i + 1][j] is computed
    calc(i, j - 1);
    calc(i + 1, j - 1);

    f[i][j] = std::max(f[i + 1][j], f[i][j - 1]);
    if (s[i] == s[j]) {
      f[i][j] = std::max(f[i][j], f[i + 1][j - 1] + 2);
    }
  }

  // we need to do recursion, so we need some global variable
  std::string s;
  int n;
  std::vector<std::vector<int>> f;
};
```

#### Example: Lintcode 396 Coins in A Line III （区间型动态规划—博弈问题）

- [Lintcode 396 Coins in A Line III](https://www.lintcode.com/problem/396/)

##### 博弈

- 这道题是一道博弈题，目标是让自己拿到的数字之和不比对手小
- 设己方数字和是`A`，对手数字和是`B`，即目标是`A >= B`
- 等价于`A - B >= 0`
- 也就是说，如果Alice和Bob都存着**自己的数字和与对手的数字和之差**，分别记为`S_A = A - B`，`S_B = B - A`
- 则Alice的目标是最大化`S_A`，Bob的目标是最大化`S_B`
- 当一方`X`面对剩下的数字，可以认为`X`就是**当前的先手**，他的目标就是最大化`S_X = X - Y`
- 当他取走一个数字`m`后，对手`Y`**变成先手**，同理他也要最大化`S_Y = Y - X`

![images 17.3](images/17.3.png)

- important: 对于`X`来说，**`S_X = - S_Y + m`**
- 其中，`m`是当前这步的数字，`-S_Y`是对手看来的数字差取相反数（因为先手是`X`）
- 现在`X`有两种选择，取第一个数字`m_1`或最后一个数字`m_2`，为了最大化`S_X`，应该选择较大的那个`S_X`

##### 动态规划组成部分一：确定状态

- 如果Alice第一步取走`a[0]`，Bob面对`a[1 .. N - 1]`
- Bob的最大数字差是`S_Y`
- Alice的数字差是`a[0] - S_Y`

- 如果Alice第一步取走`a[N - 1]`，Bob面对`a[0 .. N - 2]`
- Bob的最大数字差是`S_Y_prime`
- Alice的数字差是`a[N - 1] - S_Y_prime`

- Alice 选择较大的数字差

##### 博弈子问题

- 当Bob面对`a[1 .. N - 1]`，**他这时是先手**
- 他的目标同样是最大化先手（自己）和后手（Alice）的数字差
- 但是此时的数字少了一个：`a[1 .. N - 1]`
- 子问题
- 状态：设`f[i][j]`为一方先手在面对`a[i .. j]`这些数字时，能得到的最大的与对手的数字差

##### 动态规划组成部分二：转移方程

- 设`f[i][j]`为一方先手在面对`a[i .. j]`这些数字时，能得到的最大的与对手的数字差
  - `f[i][j] = std::max(a[i] - f[i + 1][j], a[j] - f[i][j - 1])`

![images 17.4](images/17.4.png)

##### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为一方先手在面对`a[i .. j]`这些数字时，能得到的最大的与对手的数字差
  - `f[i][j] = std::max(a[i] - f[i + 1][j], a[j] - f[i][j - 1])`
- 只有一个数字`a[i]`时，己方得`a[i]`分，对手`0`分，数字差为`a[i]`
  - `f[i][i] = a[i] (i = 0, 1, ..., N - 1)`

##### 动态规划组成部分四：计算顺序

- 长度1: `f[0][0], f[1][1], f[2][2], ..., f[N - 1][N - 1]`
- 长度2: `f[0][1], ..., f[N - 2][N - 1]`
- ...
- 长度N: `f[0][N - 1]`
- 如果`f[0][N - 1] >= 0`，先手Alice必赢，否则必输
- 时间复杂度`O(N^2)`
- 空间复杂度`O(N^2)`


```c++
// 博弈型与区间型的结合类问题

class Solution {
 public:
  bool firstWillWin(std::vector<int>& values) {
    int n = values.size();
    if (n == 0) {
      return true;
    }

    int f[n][n];
    int i, j, len;
    // len == 1
    for (i = 0; i < n; ++i) {
      f[i][i] = values[i];
    }

    for (len = 2; len <= n; ++len) {
      for (i = 0; i <= n - len; ++i) {
        j = i + len - 1;
        // A[i ... j]
        f[i][j] = std::max(values[i] - f[i + 1][j], values[j] - f[i][j - 1]);
      }
    }
    return f[0][n - 1] >= 0;
  }
};
```

#### Example: Lintcode 430 Scramble String

- [Lintcode 430 Scramble String](https://www.lintcode.com/problem/430/)

- 区间有两种获得方式：
  1. 去头去尾
  2. 二分，中间劈一刀，像这道题

##### 动态规划组成部分一：确定状态

- 显然，`T`如果长度和`S`不一样，那么肯定不能由`S`变换而来
- 如果`T`是`S`变换而来的，并且我们知道`S`最上层二分被分成`S = S_1 S_2`，那么一定有：
  - `T`也有两部分`T = T_1 T_2`，`T_1`是`S_1`变换而来的，`T_2`是`S_2`变换而来的
  - `T`也有两部分`T = T_1 T_2`，`T_1`是`S_2`变换而来的，`T_2`是`S_1`变换而来的

![images 17.5](images/17.5.png)

##### 子问题

- 要求`T`是否由`S`变换而来
- 需要知道`T_1`是否由`S_1`变换而来的，`T_2`是否由`S_2`变换而来
- 需要知道`T_1`是否由`S_2`变换而来的，`T_2`是否由`S_1`变换而来
- `S_1, S_2, T_1, T_2`长度更短
- 子问题
- 状态：`f[i][j][k][h]`表示`T[k .. h]`是否由`S[i .. j]`变换而来

##### 动态规划组成部分一：确定状态

- 这里所有串都是`S`和`T`的子串，且长度**一样**
- 所以每个串都可以用**（起始位置， 长度）**表示
- 例如：
  - `S_1`长度是5，在`S`中位置7开始
  - `T_1`长度是5，在`T`中位置0开始
  - 可以用`f[7][0][5] = True/False`表示`S_1`能否通过变换成为`T_1`
- 状态：设`f[i][j][k]`表示`S_1`能否通过变换成为`T_1`
  - `S_1`为`S`从字符`i`开始的长度为`k`的子串
  - `T_1`为`T`从字符`j`开始的长度为`k`的子串

##### 动态规划组成部分二：转移方程

- 状态：设`f[i][j][k]`表示`S_1`能否通过变换成为`T_1`
  - `S_1`为`S`从字符`i`开始的长度为`k`的子串
  - `T_1`为`T`从字符`j`开始的长度为`k`的子串

![images 17.6](images/17.6.png)

##### 动态规划组成部分三：初始条件和边界情况

- 状态：设`f[i][j][k]`表示`S_1`能否通过变换成为`T_1`
  - `S_1`为`S`从字符`i`开始的长度为`k`的子串
  - `T_1`为`T`从字符`j`开始的长度为`k`的子串

- 如果`S[i] = T[j], f[i][j][1] = True`否则`f[i][j][1] = False`

##### 动态规划组成部分四：计算顺序

- 状态：设`f[i][j][k]`表示`S_1`能否通过变换成为`T_1`
  - `S_1`为`S`从字符`i`开始的长度为`k`的子串
  - `T_1`为`T`从字符`j`开始的长度为`k`的子串

- 按照`k`从小到大的顺序去计算
  - `f[i][j][1], 0 <= i < N, 0 <= j < N`
  - `f[i][j][2], 0 <= i < N - 1, 0 <= j < N - 1`
  - ...
  - `f[0][0][N]`

- 答案是`f[0][0][N]`

- 时间复杂度`O(N^4)`
- 空间复杂度`O(N^3)`


```c++
class Solution {
 public:
  bool isScramble(std::string& S, std::string& T) {
    int m = S.size();
    int n = T.size();
    if (m != n) {
      return false;
    }

    bool f[n][n][n + 1];
    int i, j, w, len;
    // len = 1
    for (i = 0; i < n; ++i) {
      for (j = 0; j < n; ++j) {
        f[i][j][1] = (S[i] == T[j]);
      }
    }

    for (len = 2; len <= n; ++len) {
      for (i = 0; i <= n - len; ++i) { // S[i ... i+len-1]
        for (j = 0; j <= n - len; ++j) { // T[j ... j+len-1]
          f[i][j][len] = false;
          // break into S1 and S2
          // S1 has length w, S2 has length len - w
          for (w = 1; w < len; ++w) {
            //no swap
            // S1-->T1, S2-->T2
            if (f[i][j][w] && f[i + w][j + w][len - w]) {
              f[i][j][len] = true;
              break;
            }

            // swap
            // S1-->T2, S2-->T1
            if (f[i][j + len - w][w] && f[i + w][j][len - w]) {
              f[i][j][len] = true;
              break;
            }
          }
        }
      }
    }

    return f[0][0][n];
  }
};
```


##### 记忆化搜索

```c++
class Solution {
 public:
  bool isScramble(std::string& SS, std::string& TT) {
    S = SS;
    T = TT;
    int m = S.size();
    n = T.size();
    if (m != n) {
      return false;
    }

    int i, j, len;

    f.resize(n, std::vector<std::vector<bool>>(n, std::vector<bool>(n + 1)));

    done.resize(n, std::vector<std::vector<bool>>(n, std::vector<bool>(n + 1)));
    for (len = 1; len <= n; ++len) {
      for (i = 0; i <= n - len; ++i) { // S[i ... i+len-1]
        for (j = 0; j <= n - len; ++j) { // T[j ... j+len-1]
          done[i][j][len] = false; // f[i][j][len] not computed yet
        }
      }
    }

    calc(0, 0, n);
    return f[0][0][n];
  }
 private:
  void calc(int i, int j, int len) {
    if (done[i][j][len]) {
      return;
    }

    int w;
    if (len == 1) {
      f[i][j][1] = (S[i] == T[j]);
      return;
    }

    // break into S1 and S2
    // S1 has length w, S2 has length len - w
    for (w = 1; w < len; ++w) {
      //no swap
      // S1-->T1, S2-->T2
      calc(i, j, w);
      calc(i + w, j + w, len - w);
      if (f[i][j][w] && f[i + w][j + w][len - w]) {
        f[i][j][len] = true;
        break;
      }

      // swap
      // S1-->T2, S2-->T1
      calc(i, j + len - w, w);
      calc(i + w, j, len - w);
      if (f[i][j + len - w][w] && f[i + w][j][len - w]) {
        f[i][j][len] = true;
        break;
      }
    }
    done[i][j][len] = true; // has been computed
  }

  std::vector<std::vector<std::vector<bool>>> f;
  std::vector<std::vector<std::vector<bool>>> done;
  int n;
  std::string S;
  std::string T;
};
```

![images](images/17.7.png)
![images](images/17.8.png)
![images](images/17.9.png)
![images](images/17.10.png)
![images](images/17.11.png)


#### Example: Lintcode 168 吹气球 (消去型 --> 区间型)

- [Lintcode 168 吹气球](https://www.lintcode.com/problem/168/)

- 消去型：一定要倒着想，不然状态过多

- 观察最后被扎破的气球，分为左右两个区间
- 设`f[i][j]`为扎破`i+1 ~ j-1`号气球，最多获得的金币数
- `f[i][j] = max_{i < k < j}(f[i][k] + f[k][j] + a[i] * a[k] * a[j])`
- 时间复杂度`O(N^3)`
- 空间复杂度`O(N^2)`
- 类似题目： Lintcode 1694 Monster Hunter
![images](images/17.12.png)

##### 动态规划组成部分一：确定状态

- 所有`N`个气球都被扎破
- 最后一步：一定有最后一个被扎破的气球，编号是`i`
- 扎破`i`时，左边是气球`0`，右边是气球`N + 1`，获得金币`1 * a_i * 1 = a_i`
- 此时气球`1 ~ i-1`以及`i+1 ~ N`都已经被扎破，并且已经获得对应金币

##### 子问题

- 要求扎破`1 ~ N`号气球，最多获得的金币数
- 需要知道扎破`1 ~ i - 1`号气球，最多获得的金币数和扎破`i+1 ~ N`号气球，最多获得的金币数
- 子问题
- 状态：设`f[i][j]`为扎破`i+1 ~ j-1`号气球，最多获得的金币数

##### 动态规划组成部分二：转移方程

- 设`f[i][j]`为扎破`i+1 ~ j-1`号气球，最多获得的金币数
  - `i`和`j`不能扎破
- `f[i][j] = max_{i < k < j}(f[i][k] + f[k][j] + a[i] * a[k] * a[j])`

![images](images/17.13.png)

##### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为扎破`i+1 ~ j-1`号气球，最多获得的金币数
  - `i`和`j`不能扎破
- `f[i][j] = max_{i < k < j}(f[i][k] + f[k][j] + a[i] * a[k] * a[j])`

- 初始条件：`f[0][1] = f[1][2] = ... = f[N][N + 1] = 0`
  - 当没有气球要扎破时，最多获得`0`枚金币


##### 动态规划组成部分四：计算顺序

- 设`f[i][j]`为扎破`i+1 ~ j-1`号气球，最多获得的金币数
  - `i`和`j`不能扎破
- `f[i][j] = max_{i < k < j}(f[i][k] + f[k][j] + a[i] * a[k] * a[j])`

- 区间动态规划：**按照长度`j - i`从小到大的顺序去算**
  - `f[0][1], f[1][2], f[2][3], ..., f[N][N + 1]`
  - `f[0][2], f[1][3], f[2][4], ..., f[N - 1][N + 1]`
  - ...
  - `f[0][N + 1]`
- 时间复杂度`O(N^3)
`
- 空间复杂度`O(N^2)`


```c++
class Solution {
 public:
  int maxCoins(std::vector<int>& AA) {
    int n = AA.size();
    if (n == 0) {
      return 0;
    }

    int i, j, k, len;
    int A[n + 2];
    A[0] = A[n + 1] = 1;
    for (i = 1; i <= n; ++i) {
      A[i] = AA[i - 1];
    }

    n += 2;

    // AA: 3 2 8 7 9
    // A: 1 3 2 8 7 9 1
    int f[n][n];
    for (i = 0; i < n - 1; ++i) {
      f[i][i + 1] = 0;
    }

    for (len = 3; len <= n; ++len) {
      for (i = 0; i <= n - len; ++i) {
        j = i + len - 1;
        // i ... k ... j
        f[i][j] = 0;
        for (k = i + 1; k < j; ++k) {
          f[i][j] = std::max(f[i][j], f[i][k] + f[k][j] + A[i] * A[k] * A[j]);
        }
      }
    }
    return f[0][n - 1]; // n here has added 2 before
  }
};
```

#### Summary

- 区间型动态规划
  - 状态用区间左右端点：`f[i][j]`
  - 有时需要逆向思考，从最后一个操作开始考虑，分成左右两个独立的空间
- 如何发现是否是区间型动态规划
  1. 去头去尾
  2. 二分: Scramble String
  3. 消去型，其实也是二分，但是**一定要倒着想**


## Chapter 18: 石头碰撞：背包型

- [Lintcode 724 最小划分](https://www.lintcode.com/problem/724/)

- 分析也许和coding不一致，只能做参考
  - 使用`i`循环从`1`到**石头总和 / 2**大小的背包
  - `dp[j]`代表将容量为`j`的01背包装满是否可行，如果可行，`|sum - j - j|`即为目前的碰撞结果
  - 每装满一个大小为`x`的01背包，都要维护`|sum - 2x|`的最小值

```c++
class Solution {
 public:
  int findMin(std::vector<int>& nums) {
    int n = nums.size();
    if (n == 0) return 0;
    if (n == 1) return nums[0];
    int sum = 0;

    for (int i = 0; i < n ; ++i)
      sum += nums[i];

    std::vector<int> dp(sum / 2 + 1);
    dp[0] = 0;
    for (int i = 0; i < n; ++i)
      for (int j = sum / 2; j >= nums[i]; --j)
        dp[j] = dp[j - nums[i]] + nums[i] > dp[j] ? dp[j - nums[i]] + nums[i] : dp[j];
    return std::abs(sum - 2 * dp[sum / 2]);
  }
};
```

## Chapter 19: 合并金币：区间型

- [Lintcode 476 石子合并](https://www.lintcode.com/problem/476/)

- 这道题是一道区间dp的入门题，通过理解状态转移的过程，决定循环的要素。在这题里，我们需要先枚举区间长度，再枚举起点。这就是区间dp的精髓。让我们一起来亲手做一下这道题目吧~

- 我们令`dp[i][j]`为从 第`i`堆金币到第`j`堆金币所需的最小代价
- 区间`[i, j]`可以从以任意的`i <= k < j`为分割点所得的两个子区间得来
- `dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + sum[i][j])`
- `sum[i][j]`表示区间`[i, j]`的数字和，可以使用前缀和来维护

* 区间DP通用思路：
  * 目标是求解在一个区间上的最优解，那么我把这个区间分割成一个个小区间，求解每个小区间的最优解，再合并小区间得到大区间即可
- 本题思路：
  - 枚举区间长度 len 为每次分割成的小区间长度（由短到长不断合并），内层枚举该长度下的可能起点，并按照 len 计算终点。然后在这个起点终点之间枚举分割点 k ，求解这段以 i 为起点。长度为 len 的小区间在某个 k 的最优解。

```c++
class Solution {
 public:
  int stoneGame(std::vector<int>& A) {
    int n = A.size();
    if (n == 0) {
      return 0;
    }
    std::vector<std::vector<int>> dp(n, std::vector<int>(n, 0));
    std::vector<int> sum(n + 1, 0);
    // prefix sum
    for (int i = 1; i < n + 1; ++i) {
      sum[i] = sum[i - 1] + A[i - 1];
    }
    for (int len = 2; len <= n; ++len) {
      for (int i = 0; i <= n - len; ++i) {
        int j = i + len - 1;
        dp[i][j] = 0x3f3f3f3f;
        int least_sum = sum[j + 1] - sum[i];
        for (int k = i; k < j; ++k) {
          // 当前区间由子区间得到
          dp[i][j] = std::min(dp[i][j], dp[i][k] + dp[k + 1][j] + least_sum);
        }
      }
    }
    return dp[0][n - 1];
  }
};
```

- [Lintcode 593 Stone Game II](https://www.lintcode.com/problem/593/)
- [Lintcode 168 Burst Ballon](https://www.lintcode.com/problem/168/)



## Chapter 20: 外卖满减：01背包

![images](images/20.1.png)

- 输入&输出
- 输入：5 20 [18, 19, 17, 6, 7]
- 输出：23

```c++
class Solution {
 public:
  std::vector minimumPrice(int n, int X, std::vector<int> price) {
    int total_price = 0;
    for (int i = 0; i < n; ++i) {
      total_price += price[i];
    }
    // 转化为容量为 total_price 的 01背包
    // dp[i] 为 true 表示可以选择总价恰好为 i 的物品
    std::vector<bool> dp(total_price + 1, false);

    for (int i = 0; i < n; ++i) {
      for (int j = total_price; j >= price[i]; --j) {
        dp[j] |= dp[j - price[i]];
      }
    }

    // 找到 >= X 的最小价格
    for (int i = X; i <= total_price; ++i) {
      if (dp[i]) {
        return i;
      }
    }

    return -1;
  }
};
```

### Exercise Lintcode 92 backpack

- [Lintcode 92 Backpack](https://www.lintcode.com/problem/92/)

### Exercise Lintcode 125 backpack II

- [Lintcode 125 Backpack](https://www.lintcode.com/problem/125/)

### Exercise Lintcode 563 backpack V

- [Lintcode 563 Backpack](https://www.lintcode.com/problem/563/)

## Chapter 21: 考试策略：0/0.5/1背包

- [Lintcode 273 考试策略](https://www.lintcode.com/problem/273/)

- 做一部分：(满足`p[i - 1] <= j`): `part = dp[i - 1][j - p_time[i - 1]] + p_score[i - 1]`
- 全做完：(满足`f[i - 1] <= j`): `full = dp[i - 1][j - f_time[i - 1]] + f_score[i - 1]`
- `dp[i][j]= max(part, full, dp[i - 1][j])`


```c++
class Solution {
 public:
  int exam(std::vector<int>& p, std::vector<int>& part, std::vector<int>& f, std::vector<int>& full) {
    int n = p.size();
    int m = 120;
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(m + 1, 0));
    for (int i = 1; i <= n; ++i) {
      for (int j = 1; j <= m; ++j) {
        dp[i][j] = dp[i - 1][j];
        if (j - p[i - 1] >= 0) {
          dp[i][j] = std::max(dp[i][j], dp[i - 1][j - p[i - 1]] + part[i - 1]);
        }
        if (j - f[i - 1] >= 0) {
          dp[i][j] = std::max(dp[i][j], dp[i - 1][j - f[i - 1]] + full[i - 1]);
        }
      }
    }
    return dp[n][m];
  }
};
```

```c++
// 滚动数组优化
class Solution {
 public:
  int exam(std::vector<int>& p, std::vector<int>& part, std::vector<int>& f, std::vector<int>& full) {
    int n = p.size();
    int m = 120;
    std::vector<std::vector<int>> dp(2, std::vector<int>(m + 1, 0));
    for (int i = 1; i <= n; ++i) {
      for (int j = 1; j <= m; ++j) {
        dp[i % 2][j] = dp[(i - 1) % 2][j];
        if (j - p[i - 1] >= 0) {
          dp[i % 2][j] = std::max(dp[i % 2][j], dp[(i - 1) % 2][j - p[i - 1]] + part[i - 1]);
        }
        if (j - f[i - 1] >= 0) {
          dp[i % 2][j] = std::max(dp[i % 2][j], dp[(i - 1) % 2][j - f[i - 1]] + full[i - 1]);
        }
      }
    }
    return dp[n % 2][m];
  }
};
```

### Exercise Lintcode 1538 卡牌游戏 II
- [Lintcode 1538 卡牌游戏 II](https://www.lintcode.com/problem/1538/)

### Exercise Lintcode 700 杆子分割
- [Lintcode 700 杆子分割](https://www.lintcode.com/problem/700/)


## Chapter 22: 双序列动态规划

- 顾名思义，有两个序列/字符串，需要进行一些操作
- 每个序列本身是一维的
- 可以转化为二维动态规划

### Example: Lintcode 77 最长公共子序列

- [Lintcode 77 最长公共子序列](https://www.lintcode.com/problem/77/)

#### 题目分析

- 公共子序列一定是对应的字符按顺序都相等
- 找到最长的对应对子，且对子连线不能相交

![images 22.1](images/22.1.png)

#### 动态规划组成部分一：确定状态

- 设`A`长度是`m`，`B`长度是`n`
- 现在我们考虑最优策略产生出的最长公共子序列（虽然还不知道是什么）
- 最后一步：观察`A[m - 1]`和`B[n - 1]`这两个字符是否作为一个对子在最优策略中

- 最长公共子序列也是公共子序列：长度是`L` -> 选定了`L`个对应的**对子**
**最长公共子序列**
**情况一：对子中没有A[m - 1]**
**推论：A和B的最长公共子序列就是 A 前 m - 1 个字符和 B 前 n 个字符的最长公共子序列**
![images 22.2](images/22.2.png)

**情况二：对子中没有B[n - 1]**
**推论：A和B的最长公共子序列就是 A 前 m 个字符和 B 前 n - 1 个字符的最长公共子序列**
![images 22.3](images/22.3.png)

**情况三：对子中有 A[m - 1] - B[n - 1]**
**推论：A和B的最长公共子序列就是 A 前 m - 1 个字符和 B 前 n - 1 个字符的最长公共子序列 + A[m - 1]**
![images 22.4](images/22.4.png)

#### 子问题

- 要求`A[0 .. m - 1]`和`B[0 .. n - 2]`的最长公共子序列，`A[0 .. m - 2]`和`B[0 .. n - 1]`的最长公共子序列和`A[0 .. m - 2]`和`B[0 .. n - 2]`的最长公共子序列
- 原来是求`A[0 .. m - 1]`和`B[0 .. n - 1]`的最长公共子序列
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`[0 .. j - 1]`的最长公共子序列的长度

#### 动态规划组成部分二：转移方程

- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`[0 .. j - 1]`的最长公共子序列的长度
- 要求`f[m][n]`
- `f[i][j] = max(f[i - 1][j], f[i][j - 1], f[i - 1][j - 1] + 1 | A[i - 1] == B[j - 1])`

![images 22.5](images/22.5.png)

#### 动态规划组成部分三：初始条件和边界情况

- `f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`[0 .. j - 1]`的最长公共子序列的长度
- 转移方程：`f[i][j] = max(f[i - 1][j], f[i][j - 1], f[i - 1][j - 1] + 1 | A[i - 1] == B[j - 1])`
- 初始条件：空串和任何串的最长公共子序列长度是`0`
  - `f[0][j] = 0, j = 0 .. n`
  - `f[i][0] = 0, i = 0 .. m`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`

```c++
class Solution {
 public:
  int longestCommonSubsequence(std::string& A, std::string& B) {
    int n = A.size();
    int m = B.size();
    std::vector<std::vector<int>> f(n + 1, std::vector<int>(m + 1, 0));
    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= m; ++j) {
        if (i == 0 || j == 0) {
          f[i][j] = 0;
          continue;
        }
        f[i][j] = std::max(f[i][j - 1], f[i - 1][j]);
        if (A[i - 1] == B[j - 1]) {
          f[i][j] = std::max(f[i][j], f[i - 1][j - 1] + 1);
        }
      }
    }
    return f[n][m];
  }
};
```

#### 打印最长公共子序列

```c++
class Solution {
 public:
  int longestCommonSubsequence(std::string& A, std::string& B) {
    int n = A.size();
    int m = B.size();
    std::vector<std::vector<int>> f(n + 1, std::vector<int>(m + 1, 0));
    std::vector<std::vector<int>> pi(n + 1, std::vector<int>(m + 1, 0));
    for (int i = 0; i <= n; ++i) {
      for (int j = 0; j <= m; ++j) {
        if (i == 0 || j == 0) {
          f[i][j] = 0;
          continue;
        }
        f[i][j] = std::max(f[i][j - 1], f[i - 1][j]);
        if (f[i][j] == f[i - 1][j]) {
          pi[i][j] = 1;
        } else {
          pi[i][j] = 2;
        }
        if (A[i - 1] == B[j - 1]) {
          f[i][j] = std::max(f[i][j], f[i - 1][j - 1] + 1);
          if (f[i][j] == f[i - 1][j - 1] + 1) {
            pi[i][j] = 3;
          }
        }
      }
    }

    std::vector<char> routine(f[n][m]);
    int p = f[n][m] - 1;
    int i = n;
    int j = m;
    while (i > 0 && j > 0) {
      if (pi[i][j] == 1) {
        --i; // not using A's tail
      } else {
        if (pi[i][j] == 2) {
          --j; // not using B's tail
        } else {
          routine[p] = A[i - 1];
          --p;
          --i;
          --j;
        }
      }
    }

    for (p = 0; p < f[n][m]; ++p) {
      std::cout << routine[p];
    }

    return f[n][m];
  }
};
```

### Example: Lintcode 29 交叉字符串

- [Lintcode 29 交叉字符串](https://www.lintcode.com/problem/29/)

#### 动态规划组成部分一：确定状态

- 首先，如果 `X`的长度 不等于 `A`的长度 + `B`的长度，直接输出 False
- 设`A`长度是`m`，`B`长度是`n`，`X`的长度是`m + n`
- 最后一步：假设`X`是由`A`和`B`交错形成的，那么`X`的最后一个字符`X[m + n - 1]`
  - 要么是`A[m - 1]`
    - 那么`X[0 .. m + n - 2]`是由`A[0 .. m - 2]`和`B[0 .. n - 1]`交错形成的
  - 要么是`B[n - 1]`
    - 那么`X[0 .. m + n - 2]`是由`A[0 .. m - 1]`和`B[0 .. n - 2]`交错形成的

#### 子问题

- 要求`X[0 .. m + n - 1]`是否由`A[0 .. m - 1]`和`B[0 .. n - 1]`交错形成
- 需要知道`X[0 .. m + n - 2]`是否由`A[0 .. m - 2]`和`B[0 .. n - 1]`交错形成，以及`X[0 .. m + n - 2]`是否由`A[0 .. m - 1]`和`B[0 .. n - 2]`交错形成
- 子问题
- 状态：设`f[s][i][j]`为`X`前`s`个字符是否由`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`交错形成
- 但是`s = i + j`，所以可以简化为：设`f[i][j]`为`X`前`i + j`个字符是否由`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`交错形成

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`X`前`i + j`个字符是否由`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`交错形成
  - `f[i][j] = (f[i - 1][j] && X[i + j - 1] == A[i - 1]) || (f[i][j - 1] && X[i + j - 1] == B[j - 1])`

![images 22.6](images/22.6.png)

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`X`前`i + j`个字符是否由`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`交错形成
  - `f[i][j] = (f[i - 1][j] && X[i + j - 1] == A[i - 1]) || (f[i][j - 1] && X[i + j - 1] == B[j - 1])`
- 初始条件：空串由`A`的空串和`B`的空串交错形成 -> `f[0][0] = true`
- 边界情况：如果`i = 0`，不考虑情况一；如果`j = 0`，不考虑情况二

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][m]`
- `f[1][0], f[1][1], ..., f[1][m]`
- ...
- `f[n][0], f[n][1], ..., f[n][m]`
- 答案是`f[n][m]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`

```c++
class Solution {
 public:
  bool isInterleave(std::string& A, std::string& B, std::string& X) {
    int n = A.size();
    int m = B.size();
    if (X.size() != n + m) {
      return false;
    }

    std::vector<std::vector<bool>> f(n + 1, std::vector<bool>(m + 1, false));

    int i, j;
    for (i = 0; i <= n; ++i) {
      for (j = 0; j <= m; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = true;
          continue;
        }

        f[i][j] = false;
        if (i > 0 && X[i + j - 1] == A[i - 1] && f[i - 1][j]) {
          f[i][j] = true;
        }
        if (j > 0 && X[i + j - 1] == B[j - 1] && f[i][j - 1]) {
          f[i][j] = true;
        }
      }
    }

    return f[n][m];
  }
};
```

#### 滚动数组优化

```c++
class Solution {
 public:
  bool isInterleave(std::string& A, std::string& B, std::string& X) {
    int n = A.size();
    int m = B.size();
    if (X.size() != n + m) {
      return false;
    }

    // first
    std::vector<std::vector<bool>> f(2, std::vector<bool>(m + 1, false));

    int i, j;

    // second
    int old, now = 0;

    for (i = 0; i <= n; ++i) {
      // third
      old = now;
      now = 1 - now;
      // then change all f[i] to f[now]
      // change all f[i - 1] to f[old]

      for (j = 0; j <= m; ++j) {
        if (i == 0 && j == 0) {
          f[now][j] = true;
          continue;
        }

        f[now][j] = false;
        if (i > 0 && X[i + j - 1] == A[i - 1] && f[old][j]) {
          f[now][j] = true;
        }
        if (j > 0 && X[i + j - 1] == B[j - 1] && f[now][j - 1]) {
          f[now][j] = true;
        }
      }
    }

    return f[now][m];
  }
};
```


### Example: Lintcode 119 编辑距离

- [Lintcode 119 编辑距离](https://www.lintcode.com/problem/119/)
- 最小操作次数 == 最小编辑距离

#### 动态规划组成部分一：确定状态

- 设`A`长度是`m`，`B`长度是`n`
- **全部操作完成后`A`的长度也是`n`，并且`A[n - 1] = B[n - 1]`**
- 于是最优策略（以及所有合法策略）最终都是让`A`的最后一个字符变成`B`的最后一个字符

- 情况一：`A`在最后插入`B[n - 1]`
  - 要将`A[0 .. m - 1]`变成`B[0 .. n - 2]`

- 情况二：`A`最后一个字符替换成`B[n - 1]`
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 2]`

- 情况三：`A`删掉最后一个字符
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 1]`

- 情况四：`A`和`B`最后一个字符相等
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 2]`

#### 子问题

- 要求`A[0 .. m - 1]`和`B[0 .. n - 2]`的最小编辑距离，`A[0 .. m - 2]`和`B[0 .. n - 1]`的最小编辑距离和`A[0 .. m - 2]`和`B[0 .. n - 2]`的最小编辑距离
- 原来是求`A[0 .. m - 1]`和`B[0 .. n - 1]`的最小编辑距离
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`的前`j`个字符`B[0 .. j - 1]`的最小编辑距离

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`的最小编辑距离
- 要求`f[m][n]`
  - `f[i][j] = std::min(f[i][j - 1] + 1, f[i - 1][j - 1] + 1, f[i - 1][j] + 1, f[i - 1][j - 1] | A[i - 1] == B[j - 1])`

![images 22.7](images/22.7.png)

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`的最小编辑距离
- 要求`f[m][n]`
  - `f[i][j] = std::min(f[i][j - 1] + 1, f[i - 1][j - 1] + 1, f[i - 1][j] + 1, f[i - 1][j - 1] | A[i - 1] == B[j - 1])`

- 初始条件：一个空串和一个长度为`L`的串的最小编辑距离是`L`
  - `f[0][j] = j (j = 0, 1, 2, ..., n)`
  - `f[i][0] = i (j = 0, 1, 2, ..., m)`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`


```c++
class Solution {
 public:
  int minDistance(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();

    std::vector<std::vector<int>> f(m + 1, std::vector<int>(n + 1, 0));
    int i, j;

    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0) { // insert, insert, ...
          f[i][j] = j;
          continue;
        }

        if (j == 0) { // delete, delete, ...
          f[i][j] = i;
          continue;
        }

        // insert, delete, replace
        f[i][j] = std::min(std::min(f[i - 1][j], f[i][j - 1]), f[i - 1][j - 1]) + 1;
        if (A[i - 1] == B[j - 1]) { // 情况四
          f[i][j] = std::min(f[i][j], f[i - 1][j - 1]);
        }
      }
    }

    return f[m][n];
  }
};
```

#### 滚动数组优化

```c++
class Solution {
 public:
  int minDistance(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();

    // first
    std::vector<std::vector<int>> f(2, std::vector<int>(n + 1, 0));
    int i, j;

    // second
    int old, now = 0;

    for (i = 0; i <= m; ++i) {
      // third
      old = now;
      now = 1 - now;
      for (j = 0; j <= n; ++j) {
        if (i == 0) {
          f[now][j] = j;
          continue;
        }

        if (j == 0) {
          f[now][j] = i;
          continue;
        }

        f[now][j] = std::min(std::min(f[old][j], f[now][j - 1]), f[old][j - 1]) + 1;
        if (A[i - 1] == B[j - 1]) {
          f[now][j] = std::min(f[now][j], f[old][j - 1]);
        }
      }
    }

    return f[now][n];
  }
};
```


#### 编辑距离的实际用途

1. 比较两个字符串
2. 显示较错：input "Chia" 然后根据最小编辑距离1 显示结果"China"，然后根据最小编辑距离2 显示结果"Chinaa", ...


### Example: Lintcode 154 Regular Expression Matching

- [Lintcode 154 Regular Expression Matching](https://www.lintcode.com/problem/154/)

#### 动态规划组成部分一：确定状态

- 双序列型动态规划
- 设`A`长度是`m`，`B`长度是`n`
- 现在我们考虑`A`和`B`如何匹配
- 最后一步：关注最后的字符
- 主要取决于正则表达式`B`中最后的字符`B[n - 1]`是什么

- 如果`B[n - 1]`是一个正常字符（非`.`非`*`），则必须`A[m - 1] = B[n - 1]`，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配；否则不能匹配
- 如果`B[n - 1]`是`.`，则`A[m - 1]`一定是和`.`匹配，之后能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配
- 如果`B[n - 1]`是`*`，它代表`B[n - 2] = c`可以重复`0`次或多次，它们是一个整体`c*`，需要考虑`A[m - 1]`是`0`个`c`，还是多个`c`中的最后一个
  - `A[m - 1]`是`0`个`c`，能否匹配取决于`A[0 .. m - 1]`和`B[0 .. n - 3]`是否匹配
  - `A[m - 1]`是多个`c`中的最后一个，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 1]`是否匹配
    - 这种情况必须`A[m - 1] = c`或者`c = .`

#### 子问题

- 要求`A`前`m`个字符和`B`前`n`个字符能否匹配，需要知道`A`前`m`个字符和`B`前`n - 1`个字符，`A`前`m - 1`个字符和`B`前`n`个字符以及`A`前`m`个字符和`B`前`n - 2`个字符能否匹配
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
  - `f[i][j] = `
    - `f[i - 1][j - 1]`，如果`i > 0`，并且`B[j - 1] = .`或者`A[i - 1] = B[j - 1]`
    - `f[i][j - 2] || (f[i - 1][j] && (B[j - 2] == . || B[j - 2] == A[i - 1]))`，如果`B[j - 1] = *`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
- 空串和空正则表达式匹配：`f[0][0] = true`
- 空正则表达式不能匹配长度`> 0`的串
  - `f[1][0] = ... = f[m][0] = false`
- 注意：`f[0][1 .. n]`也用动态规划计算，但是因为没有`A[-1]`，所以只能用第二种情况中的`f[i][j - 2]`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`


```c++
class Solution {
 public:
  bool isMatch(std::string& s, std::string& p) {
    int m = s.size();
    int n = p.size();
    std::vector<std::vector<bool>> f(m + 1, std::vector<bool>(n + 1, false));
    int i, j;
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = true;
          continue;
        }
        if (j == 0) {
          // i > 0
          f[i][j] = false;
          continue;
        }

        f[i][j] = false;
        if (p[j - 1] != '*') {
          if (i > 0 && (p[j - 1] == '.' || p[j - 1] == s[i - 1])) {
            f[i][j] = f[i - 1][j - 1];
          }
        } else {
          // c*
          // 0 c's
          if (j > 1) {
            f[i][j] = f[i][j - 2];
          }

          // >= 1 c's, c: p[j - 2]
          if (i > 0 && j > 1 && (p[j - 2] == '.' || p[j - 2] == s[i - 1])) {
            f[i][j] = f[i][j] || f[i - 1][j];
          }
        }
      }
    }
    return f[m][n];
  }
};
```


### Example: Lintcode 192 Wildcard Matching

- [Lintcode 192 Wildcard Matching](https://www.lintcode.com/problem/192/)

#### 动态规划组成部分一：确定状态

- 双序列型动态规划
- 和`Regular Expression Matching`很类似，因为`.`和`?`作用相同，但是这题中`*`可以匹配`0`个或多个任意字符
- 设`A`长度是`m`，`B`长度是`n`
- 现在我们考虑`A`和`B`如何匹配
- 最后一步：关注最后的字符
- 主要取决于`Wildcard B`中最后的字符`B[n - 1]`是什么

- 如果`B[n - 1]`是一个正常字符（非`?`非`*`），则必须`A[m - 1] = B[n - 1]`，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配；否则不能匹配
- 如果`B[n - 1]`是`?`，则`A[m - 1]`一定是和`?`匹配，之后能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配
- 如果`B[n - 1]`是`*`，它可以匹配`0`个或任意多个字符，需要考虑`A[m - 1]`有没有被这个`*`匹配
  - `A[m - 1]`不被`*`匹配，能否匹配取决于`A[0 .. m - 1]`和`B[0 .. n - 2]`是否匹配
  - `A[m - 1]`被`*`匹配，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 1]`是否匹配

#### 子问题

- 要求`A`前`m`个字符和`B`前`n`个字符能否匹配，需要知道`A`前`m - 1`个字符和`B`前`n - 1`个字符，`A`前`m`个字符和`B`前`n - 1`个字符以及`A`前`m - 1`个字符和`B`前`n`个字符能否匹配
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
  - `f[i][j] = `
    - `f[i - 1][j - 1]`，如果`i > 0`，并且`B[j - 1] = ?`或者`A[i - 1] = B[j - 1]`
    - `f[i - 1][j] || f[i][j - 1]`，如果`B[j - 1] = *`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
- 空串和空`Wildcard`匹配：`f[0][0] = true`
- 空`Wildcard`不能匹配长度`> 0`的串
  - `f[1][0] = ... = f[m][0] = false`
- 注意：`f[0][1 .. n]`也用动态规划计算，但是因为没有`A[-1]`，所以只能用第二种情况中的`f[i][j - 1]`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`



```c++
class Solution {
 public:
  bool isMatch(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();
    std::vector<std::vector<bool>> f(m + 1, std::vector<bool>(n + 1, false));
    int i, j;
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = true;
          continue;
        }
        if (j == 0) {
          f[i][j] = false;
          continue;
        }

        // j > 0
        f[i][j] = false;
        if (B[j - 1] != '*') {
          if (i > 0 && (B[j - 1] == '?' || B[j - 1] == A[i - 1])) {
            f[i][j] = f[i - 1][j - 1];
          }
        } else {
          // * represents 0 character
          f[i][j] = f[i][j - 1];
          if (i > 0) {
            f[i][j] = (f[i][j] || f[i - 1][j]);
          }
        }
      }
    }
    return f[m][n];
  }
};
```


### Example: Lintcode 668 Ones and Zeroes：双背包

- [Lintcode 668 Ones and Zeroes](https://www.lintcode.com/problem/668/)

#### 动态规划组成部分一：确定状态

- 最后一步：最优策略组成了最多的`01串`，其中有没有最后一个字符串`S_{T - 1}`
- 情况一：没有`S_{T - 1}`
  - 需要知道前`T - 1`个`01串`中，用`m`个`0`和`n`个`1`最多能组成多少个`01串`
- 情况二：有`S_{T - 1}`
  - 设第`T - 1`个`01串`中有`a_{T - 1}`个`0`，`b_{T - 1}`个`1`
  - 需要知道前`T - 1`个`01串`中，用`m - a_{T - 1}`个`0`和`n - b_{T - 1}`个`1`最多能组成多少个`01串`
- 子问题
- `0`和`1`的个数在变化，如何记录？
  - 直接放入状态
  - 状态：设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成

#### 动态规划组成部分二：转移方程

- 设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成
- 设`S_i`中有`a_i`个`0`，`b_i`个`1`
  - `f[i][j][k] = max(f[i - 1][j][k], f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1 | j >= a_{i - 1} && k >= b_{i - 1})`

![images](images/22.8.png)

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成
- 设`S_i`中有`a_i`个`0`，`b_i`个`1`
  - `f[i][j][k] = max(f[i - 1][j][k], f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1 | j >= a_{i - 1} && k >= b_{i - 1})`
- 初始条件：`f[0][0 ~ m][0 ~ n] = 0`
  - 无论有多少`0`和`1`，前`0`个`01串`最多能组成`0`个
- 边界情况：`f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1`必须`j >= a_{i - 1} && k >= b_{i - 1}`

#### 动态规划组成部分四：计算顺序

- `f[0][0][0], f[0][0][1], ..., f[0][0][n], f[0][1][0], ..., f[0][1][n], ..., f[0][m][n]`
- `f[1][0][0], f[1][0][1], ..., f[1][0][n], f[1][1][0], ..., f[1][1][n], ..., f[1][m][n]`
- ...
- `f[T][0][0], f[T][0][1], ..., f[T][0][n], f[T][1][0], ..., f[T][1][n], ..., f[T][m][n]`
- 答案是`max(f[T][0][0], f[T][0][1], ..., f[T][m][n])`
- 时间复杂度：`O(Tmn)`
- 空间复杂度：`O(Tmn)`，可以用滚动数组优化空间至`O(mn)`


```c++
class Solution {
 public:
  int findMaxForm(std::vector<std::string>& A, int m, int n) {
    if (A.size() == 0) {
      return 0;
    }

    int T = A.size();
    std::vector<int> cnt0(T, 0);
    std::vector<int> cnt1(T, 0);
    int i, j, k;
    for (i = 0; i < T; ++i) {
      cnt0[i] = cnt1[i] = 0;
      std::string s = A[i];
      for (j = 0; j < s.size(); ++j) {
        if (s[j] == '0') {
          ++cnt0[i];
        } else {
          ++cnt1[i];
        }
      }
    }

    std::vector<std::vector<std::vector<int>>> f(T + 1, std::vector<std::vector<int>>(m + 1, std::vector<int>(n + 1, 0)));
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        f[0][i][j] = 0;
      }
    }

    for (i = 1; i <= T; ++i) {
      for (j = 0; j <= m; ++j) {
        for (k = 0; k <= n; ++k) {
          // j 0's, k 1's
          // do not take A[i - 1]
          f[i][j][k] = f[i - 1][j][k];

          // take A[i - 1]
          if (j >= cnt0[i - 1] && k >= cnt1[i - 1]) {
            f[i][j][k] = std::max(f[i][j][k], f[i - 1][j - cnt0[i - 1]][k - cnt1[i - 1]] + 1);
          }
        }
      }
    }

    int ans = 0;
    for (j = 0; j <= m; ++j) {
      for (k = 0; k <= n; ++k) {
        ans = std::max(ans, f[T][j][k]);
      }
    }

    return ans;
  }
};
```


### Example: Lintcode 118 Distinct Subsequences

- [Lintcode 118 Distinct Subsequences](https://www.lintcode.com/problem/118/)
- 类似于最长公共子序列

- `B`在`A`中出现多少次 -> `B`的每个字符都要在`A`中出现
- `B`的“尾巴”是否和`A`的“尾巴”结成对子
- 设`f[i][j]`为`B`前`j`个字符`B[0 .. j - 1]`在`A`前`i`个字符`A[0 .. i - 1]`中出现多少次
- `f[i][j] = f[i - 1][j - 1] | A[i - 1] == B[j - 1] + f[i - 1][j]`

```c++
class Solution {
 public:
  int numDistinct(std::string& s, std::string& t) {
  }
};
```



## Chapter 23: 毕业旅行

- [Lintcode 816 TSP](https://www.lintcode.com/problem/816/)

- TSP问题（旅行商问题）是 NP 问题非常典型的代表
- Traveling salesman problem

### Solution 1: 排列型DFS
- 需要开数组存储哪些位置/元素已经被访问
- 递归中用循环选择下一个符合条件的位置/元素
- 循环内：
  - 标记访问
  - 递归
  - **标记未访问**

#### 分析
- DFS
- 相当于所有城市全排列，但是第一个城市固定是`1`，需要找到代价最小的路径（全排列）
- 需要记录当前的路径（包括上一个城市）
- 搜索过程中可以剪枝：当前路径长度已经 >= 当前最优解即退出

#### AC

```c++
class Solution {
 public:
  int minCost(int nn, std::vector<std::vector<int>>& costs) {
    // costs: [[i, j, d]] i----j cost is d
    n = nn;
    result = 0x3f3f3f3f;
    int i, j, x, y;

    g.resize(n, std::vector<int>(n, 0x3f3f3f3f));

    for (i = 0; i < costs.size(); ++i) {
      x = costs[i][0] - 1;
      y = costs[i][1] - 1;
      g[x][y] = std::min(g[x][y], costs[i][2]);
      g[y][x] = std::min(g[y][x], costs[i][2]);
    }

    done.resize(n, false);

    done[0] = true; // 第0个城市搞过了
    dfs(1, 0, 0); // 第1个城市; 前一个城市是0; 当前花费时间是0

    return result;
  }

 private:
  // level is the level-th city
  // previous city p
  // current cost c
  void dfs(int level, int p, int c) {
    if (level == n) {
      if (c < result) {
        result = c;
      }
      return;
    }

    int i;
    // next city i, from p
    // p-->i must have a road
    for (i = 0; i < n; ++i) {
      if (!done[i] && g[p][i] != 0x3f3f3f3f) {
        done[i] = true;
        dfs(level + 1, i, c + g[p][i]);
        done[i] = false;
      }
    }
  }

  int n;
  std::vector<std::vector<int>> g; // g[i][j] is the cost to go from city i to j (<---> 双向)
  std::vector<bool> done;
  int result;
};
```

#### Optimize: Pruning

```c++
class Solution {
 public:
  int minCost(int nn, std::vector<std::vector<int>>& costs) {
    n = nn;
    result = 0x3f3f3f3f;
    int i, j, x, y;

    g.resize(n, std::vector<int>(n, 0x3f3f3f3f));

    for (i = 0; i < costs.size(); ++i) {
      x = costs[i][0] - 1;
      y = costs[i][1] - 1;
      g[x][y] = std::min(g[x][y], costs[i][2]);
      g[y][x] = std::min(g[y][x], costs[i][2]);
    }

    done.resize(n, false);

    done[0] = true;
    dfs(1, 0, 0);

    return result;
  }

 private:
  void dfs(int level, int p, int c) {
    // 1. pruning!!!
    if (c >= result) {
      return;
    }

    if (level == n) {
      // 2. pruning, remove this branch
      // c < result
      result = c;
      return;
    }

    int i;
    for (i = 0; i < n; ++i) {
      if (!done[i] && g[p][i] != 0x3f3f3f3f) {
        done[i] = true;
        dfs(level + 1, i, c + g[p][i]);
        done[i] = false;
      }
    }
  }

  int n;
  std::vector<std::vector<int>> g; // g[i][j] is the cost to go from city i to j (<---> 双向)
  std::vector<bool> done;
  int result;
};
```

### Solution 2: 状态压缩型动态规划???

- 设城市数为`n`，则有`2^n`个子集合
- 时间复杂度：枚举全部集合`2^n`，起点`n`，子问题`n`。时间复杂度为`O(n^2 * 2^n)`
- 空间复杂度：DP数组规模为`n * (2^n)`。空间复杂度为`O(n * 2^n)`

```c++
class Solution {
 public:
  int minCost(int n, std::vector<std::vector<int>>& roads) {
    int inf = 1000000000;
    std::vector<std::vector<int>> graph(n + 1, std::vector<int>(n + 1, 0));
    ConstructGraph(graph, roads, n);
    // state_size represent the number of cities
    int state_size = 1 << n;
    std::vector<std::vector<int>> f(state_size, std::vector<int>(n + 1, 0));

    for (int i = 0; i < state_size; i++) {
      for (int j = 0; j < n + 1; j++) {
        f[i][j] = inf;
      }
    }
    f[1][1] = 0;

    for (int state = 0; state < state_size; state++) {
      for (int i = 2; i < n + 1; i++) {
        if ((state & (1 << (i - 1))) == 0) {
          continue;
        }
        int prev_state = state ^ (1 << (i - 1));
        for (int j = 1; j < n + 1; j++) {
          if ((prev_state & (1 << (j - 1))) == 0) {
            continue;
          }
          f[state][i] = std::min(f[state][i], f[prev_state][j] + graph[j][i]);
        }
      }
    }

    int minimal_cost = inf;
    for (int i = 0; i < n + 1; i++) {
      minimal_cost = std::min(minimal_cost, f[state_size - 1][i]);
    }

    return minimal_cost;
  }

 private:
  void ConstructGraph(std::vector<std::vector<int>>& graph, std::vector<std::vector<int>>& roads, int n) {
    int inf = 1000000000;
    for (int i = 0; i < n + 1; i++) {
      for (int j = 0; j < n + 1; j++) {
        graph[i][j] = inf;
      }
    }
    for (int i = 0; i < roads.size(); i++) {
      int a = roads[i][0], b = roads[i][1], c = roads[i][2];
      graph[a][b] = std::min(graph[a][b], c);
      graph[b][a] = std::min(graph[b][a], c);
    }
  }
};
```


## Chapter 24: 双色塔

- [Lintcode 269 双色塔](https://www.lintcode.com/problem/269/)

```c++
class Solution {
 public:
  int twoColorsTower(int red, int green) {
  }
};
```






## Chapter 25: 编辑距离

### Example: Lintcode 119 编辑距离

- [Lintcode 119 编辑距离](https://www.lintcode.com/problem/119/)
- 最小操作次数 == 最小编辑距离

#### 动态规划组成部分一：确定状态

- 设`A`长度是`m`，`B`长度是`n`
- **全部操作完成后`A`的长度也是`n`，并且`A[n - 1] = B[n - 1]`**
- 于是最优策略（以及所有合法策略）最终都是让`A`的最后一个字符变成`B`的最后一个字符

- 情况一：`A`在最后插入`B[n - 1]`
  - 要将`A[0 .. m - 1]`变成`B[0 .. n - 2]`

- 情况二：`A`最后一个字符替换成`B[n - 1]`
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 2]`

- 情况三：`A`删掉最后一个字符
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 1]`

- 情况四：`A`和`B`最后一个字符相等
  - 要将`A[0 .. m - 2]`变成`B[0 .. n - 2]`

#### 子问题

- 要求`A[0 .. m - 1]`和`B[0 .. n - 2]`的最小编辑距离，`A[0 .. m - 2]`和`B[0 .. n - 1]`的最小编辑距离和`A[0 .. m - 2]`和`B[0 .. n - 2]`的最小编辑距离
- 原来是求`A[0 .. m - 1]`和`B[0 .. n - 1]`的最小编辑距离
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`的前`j`个字符`B[0 .. j - 1]`的最小编辑距离

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`的最小编辑距离
- 要求`f[m][n]`
  - `f[i][j] = std::min(f[i][j - 1] + 1, f[i - 1][j - 1] + 1, f[i - 1][j] + 1, f[i - 1][j - 1] | A[i - 1] == B[j - 1])`

![images 22.7](images/22.7.png)

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`的最小编辑距离
- 要求`f[m][n]`
  - `f[i][j] = std::min(f[i][j - 1] + 1, f[i - 1][j - 1] + 1, f[i - 1][j] + 1, f[i - 1][j - 1] | A[i - 1] == B[j - 1])`

- 初始条件：一个空串和一个长度为`L`的串的最小编辑距离是`L`
  - `f[0][j] = j (j = 0, 1, 2, ..., n)`
  - `f[i][0] = i (j = 0, 1, 2, ..., m)`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`


```c++
class Solution {
 public:
  int minDistance(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();

    std::vector<std::vector<int>> f(m + 1, std::vector<int>(n + 1, 0));
    int i, j;

    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0) { // insert, insert, ...
          f[i][j] = j;
          continue;
        }

        if (j == 0) { // delete, delete, ...
          f[i][j] = i;
          continue;
        }

        // insert, delete, replace
        f[i][j] = std::min(std::min(f[i - 1][j], f[i][j - 1]), f[i - 1][j - 1]) + 1;
        if (A[i - 1] == B[j - 1]) { // 情况四
          f[i][j] = std::min(f[i][j], f[i - 1][j - 1]);
        }
      }
    }

    return f[m][n];
  }
};
```

#### 滚动数组优化

```c++
class Solution {
 public:
  int minDistance(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();

    // first
    std::vector<std::vector<int>> f(2, std::vector<int>(n + 1, 0));
    int i, j;

    // second
    int old, now = 0;

    for (i = 0; i <= m; ++i) {
      // third
      old = now;
      now = 1 - now;
      for (j = 0; j <= n; ++j) {
        if (i == 0) {
          f[now][j] = j;
          continue;
        }

        if (j == 0) {
          f[now][j] = i;
          continue;
        }

        f[now][j] = std::min(std::min(f[old][j], f[now][j - 1]), f[old][j - 1]) + 1;
        if (A[i - 1] == B[j - 1]) {
          f[now][j] = std::min(f[now][j], f[old][j - 1]);
        }
      }
    }

    return f[now][n];
  }
};
```


#### 编辑距离的实际用途

1. 比较两个字符串
2. 显示较错：input "Chia" 然后根据最小编辑距离1 显示结果"China"，然后根据最小编辑距离2 显示结果"Chinaa", ...


### Example: Lintcode 154 Regular Expression Matching

- [Lintcode 154 Regular Expression Matching](https://www.lintcode.com/problem/154/)

#### 动态规划组成部分一：确定状态

- 双序列型动态规划
- 设`A`长度是`m`，`B`长度是`n`
- 现在我们考虑`A`和`B`如何匹配
- 最后一步：关注最后的字符
- 主要取决于正则表达式`B`中最后的字符`B[n - 1]`是什么

- 如果`B[n - 1]`是一个正常字符（非`.`非`*`），则必须`A[m - 1] = B[n - 1]`，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配；否则不能匹配
- 如果`B[n - 1]`是`.`，则`A[m - 1]`一定是和`.`匹配，之后能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配
- 如果`B[n - 1]`是`*`，它代表`B[n - 2] = c`可以重复`0`次或多次，它们是一个整体`c*`，需要考虑`A[m - 1]`是`0`个`c`，还是多个`c`中的最后一个
  - `A[m - 1]`是`0`个`c`，能否匹配取决于`A[0 .. m - 1]`和`B[0 .. n - 3]`是否匹配
  - `A[m - 1]`是多个`c`中的最后一个，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 1]`是否匹配
    - 这种情况必须`A[m - 1] = c`或者`c = .`

#### 子问题

- 要求`A`前`m`个字符和`B`前`n`个字符能否匹配，需要知道`A`前`m`个字符和`B`前`n - 1`个字符，`A`前`m - 1`个字符和`B`前`n`个字符以及`A`前`m`个字符和`B`前`n - 2`个字符能否匹配
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
  - `f[i][j] = `
    - `f[i - 1][j - 1]`，如果`i > 0`，并且`B[j - 1] = .`或者`A[i - 1] = B[j - 1]`
    - `f[i][j - 2] || (f[i - 1][j] && (B[j - 2] == . || B[j - 2] == A[i - 1]))`，如果`B[j - 1] = *`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
- 空串和空正则表达式匹配：`f[0][0] = true`
- 空正则表达式不能匹配长度`> 0`的串
  - `f[1][0] = ... = f[m][0] = false`
- 注意：`f[0][1 .. n]`也用动态规划计算，但是因为没有`A[-1]`，所以只能用第二种情况中的`f[i][j - 2]`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`


```c++
class Solution {
 public:
  bool isMatch(std::string& s, std::string& p) {
    int m = s.size();
    int n = p.size();
    std::vector<std::vector<bool>> f(m + 1, std::vector<bool>(n + 1, false));
    int i, j;
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = true;
          continue;
        }
        if (j == 0) {
          // i > 0
          f[i][j] = false;
          continue;
        }

        f[i][j] = false;
        if (p[j - 1] != '*') {
          if (i > 0 && (p[j - 1] == '.' || p[j - 1] == s[i - 1])) {
            f[i][j] = f[i - 1][j - 1];
          }
        } else {
          // c*
          // 0 c's
          if (j > 1) {
            f[i][j] = f[i][j - 2];
          }

          // >= 1 c's, c: p[j - 2]
          if (i > 0 && j > 1 && (p[j - 2] == '.' || p[j - 2] == s[i - 1])) {
            f[i][j] = f[i][j] || f[i - 1][j];
          }
        }
      }
    }
    return f[m][n];
  }
};
```


### Example: Lintcode 192 Wildcard Matching

- [Lintcode 192 Wildcard Matching](https://www.lintcode.com/problem/192/)

#### 动态规划组成部分一：确定状态

- 双序列型动态规划
- 和`Regular Expression Matching`很类似，因为`.`和`?`作用相同，但是这题中`*`可以匹配`0`个或多个任意字符
- 设`A`长度是`m`，`B`长度是`n`
- 现在我们考虑`A`和`B`如何匹配
- 最后一步：关注最后的字符
- 主要取决于`Wildcard B`中最后的字符`B[n - 1]`是什么

- 如果`B[n - 1]`是一个正常字符（非`?`非`*`），则必须`A[m - 1] = B[n - 1]`，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配；否则不能匹配
- 如果`B[n - 1]`是`?`，则`A[m - 1]`一定是和`?`匹配，之后能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 2]`是否匹配
- 如果`B[n - 1]`是`*`，它可以匹配`0`个或任意多个字符，需要考虑`A[m - 1]`有没有被这个`*`匹配
  - `A[m - 1]`不被`*`匹配，能否匹配取决于`A[0 .. m - 1]`和`B[0 .. n - 2]`是否匹配
  - `A[m - 1]`被`*`匹配，能否匹配取决于`A[0 .. m - 2]`和`B[0 .. n - 1]`是否匹配

#### 子问题

- 要求`A`前`m`个字符和`B`前`n`个字符能否匹配，需要知道`A`前`m - 1`个字符和`B`前`n - 1`个字符，`A`前`m`个字符和`B`前`n - 1`个字符以及`A`前`m - 1`个字符和`B`前`n`个字符能否匹配
- 子问题
- 状态：设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配

#### 动态规划组成部分二：转移方程

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
  - `f[i][j] = `
    - `f[i - 1][j - 1]`，如果`i > 0`，并且`B[j - 1] = ?`或者`A[i - 1] = B[j - 1]`
    - `f[i - 1][j] || f[i][j - 1]`，如果`B[j - 1] = *`

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j]`为`A`前`i`个字符`A[0 .. i - 1]`和`B`前`j`个字符`B[0 .. j - 1]`能否匹配
- 空串和空`Wildcard`匹配：`f[0][0] = true`
- 空`Wildcard`不能匹配长度`> 0`的串
  - `f[1][0] = ... = f[m][0] = false`
- 注意：`f[0][1 .. n]`也用动态规划计算，但是因为没有`A[-1]`，所以只能用第二种情况中的`f[i][j - 1]`

#### 动态规划组成部分四：计算顺序

- `f[0][0], f[0][1], ..., f[0][n]`
- `f[1][0], f[1][1], ..., f[1][n]`
- ...
- `f[m][0], f[m][1], ..., f[m][n]`
- 答案是`f[m][n]`
- 时间复杂度（计算步数）`O(MN)`
- 空间复杂度（数组大小）`O(MN)`，可以用滚动数组优化空间至`O(N)`



```c++
class Solution {
 public:
  bool isMatch(std::string& A, std::string& B) {
    int m = A.size();
    int n = B.size();
    std::vector<std::vector<bool>> f(m + 1, std::vector<bool>(n + 1, false));
    int i, j;
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        if (i == 0 && j == 0) {
          f[i][j] = true;
          continue;
        }
        if (j == 0) {
          f[i][j] = false;
          continue;
        }

        // j > 0
        f[i][j] = false;
        if (B[j - 1] != '*') {
          if (i > 0 && (B[j - 1] == '?' || B[j - 1] == A[i - 1])) {
            f[i][j] = f[i - 1][j - 1];
          }
        } else {
          // * represents 0 character
          f[i][j] = f[i][j - 1];
          if (i > 0) {
            f[i][j] = (f[i][j] || f[i - 1][j]);
          }
        }
      }
    }
    return f[m][n];
  }
};
```


### Example: Lintcode 668 Ones and Zeroes：双背包

- [Lintcode 668 Ones and Zeroes](https://www.lintcode.com/problem/668/)

#### 动态规划组成部分一：确定状态

- 最后一步：最优策略组成了最多的`01串`，其中有没有最后一个字符串`S_{T - 1}`
- 情况一：没有`S_{T - 1}`
  - 需要知道前`T - 1`个`01串`中，用`m`个`0`和`n`个`1`最多能组成多少个`01串`
- 情况二：有`S_{T - 1}`
  - 设第`T - 1`个`01串`中有`a_{T - 1}`个`0`，`b_{T - 1}`个`1`
  - 需要知道前`T - 1`个`01串`中，用`m - a_{T - 1}`个`0`和`n - b_{T - 1}`个`1`最多能组成多少个`01串`
- 子问题
- `0`和`1`的个数在变化，如何记录？
  - 直接放入状态
  - 状态：设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成

#### 动态规划组成部分二：转移方程

- 设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成
- 设`S_i`中有`a_i`个`0`，`b_i`个`1`
  - `f[i][j][k] = max(f[i - 1][j][k], f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1 | j >= a_{i - 1} && k >= b_{i - 1})`

![images](images/22.8.png)

#### 动态规划组成部分三：初始条件和边界情况

- 设`f[i][j][k]`为前`i`个`01串`最多能有多少个被`j`个`0`和`k`个`1`组成
- 设`S_i`中有`a_i`个`0`，`b_i`个`1`
  - `f[i][j][k] = max(f[i - 1][j][k], f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1 | j >= a_{i - 1} && k >= b_{i - 1})`
- 初始条件：`f[0][0 ~ m][0 ~ n] = 0`
  - 无论有多少`0`和`1`，前`0`个`01串`最多能组成`0`个
- 边界情况：`f[i - 1][j - a_{i - 1}][k - b_{i - 1}] + 1`必须`j >= a_{i - 1} && k >= b_{i - 1}`

#### 动态规划组成部分四：计算顺序

- `f[0][0][0], f[0][0][1], ..., f[0][0][n], f[0][1][0], ..., f[0][1][n], ..., f[0][m][n]`
- `f[1][0][0], f[1][0][1], ..., f[1][0][n], f[1][1][0], ..., f[1][1][n], ..., f[1][m][n]`
- ...
- `f[T][0][0], f[T][0][1], ..., f[T][0][n], f[T][1][0], ..., f[T][1][n], ..., f[T][m][n]`
- 答案是`max(f[T][0][0], f[T][0][1], ..., f[T][m][n])`
- 时间复杂度：`O(Tmn)`
- 空间复杂度：`O(Tmn)`，可以用滚动数组优化空间至`O(mn)`


```c++
class Solution {
 public:
  int findMaxForm(std::vector<std::string>& A, int m, int n) {
    if (A.size() == 0) {
      return 0;
    }

    int T = A.size();
    std::vector<int> cnt0(T, 0);
    std::vector<int> cnt1(T, 0);
    int i, j, k;
    for (i = 0; i < T; ++i) {
      cnt0[i] = cnt1[i] = 0;
      std::string s = A[i];
      for (j = 0; j < s.size(); ++j) {
        if (s[j] == '0') {
          ++cnt0[i];
        } else {
          ++cnt1[i];
        }
      }
    }

    std::vector<std::vector<std::vector<int>>> f(T + 1, std::vector<std::vector<int>>(m + 1, std::vector<int>(n + 1, 0)));
    for (i = 0; i <= m; ++i) {
      for (j = 0; j <= n; ++j) {
        f[0][i][j] = 0;
      }
    }

    for (i = 1; i <= T; ++i) {
      for (j = 0; j <= m; ++j) {
        for (k = 0; k <= n; ++k) {
          // j 0's, k 1's
          // do not take A[i - 1]
          f[i][j][k] = f[i - 1][j][k];

          // take A[i - 1]
          if (j >= cnt0[i - 1] && k >= cnt1[i - 1]) {
            f[i][j][k] = std::max(f[i][j][k], f[i - 1][j - cnt0[i - 1]][k - cnt1[i - 1]] + 1);
          }
        }
      }
    }

    int ans = 0;
    for (j = 0; j <= m; ++j) {
      for (k = 0; k <= n; ++k) {
        ans = std::max(ans, f[T][j][k]);
      }
    }

    return ans;
  }
};
```


### Example: Lintcode 118 Distinct Subsequences

- [Lintcode 118 Distinct Subsequences](https://www.lintcode.com/problem/118/)
- 类似于最长公共子序列

- `B`在`A`中出现多少次 -> `B`的每个字符都要在`A`中出现
- `B`的“尾巴”是否和`A`的“尾巴”结成对子
- 设`f[i][j]`为`B`前`j`个字符`B[0 .. j - 1]`在`A`前`i`个字符`A[0 .. i - 1]`中出现多少次
- `f[i][j] = f[i - 1][j - 1] | A[i - 1] == B[j - 1] + f[i - 1][j]`

```c++
class Solution {
 public:
  int numDistinct(std::string& s, std::string& t) {
  }
};
```



## Chapter 23: 毕业旅行

- [Lintcode 816 TSP](https://www.lintcode.com/problem/816/)

- TSP问题（旅行商问题）是 NP 问题非常典型的代表
- Traveling salesman problem

### Solution 1: 排列型DFS
- 需要开数组存储哪些位置/元素已经被访问
- 递归中用循环选择下一个符合条件的位置/元素
- 循环内：
  - 标记访问
  - 递归
  - **标记未访问**

#### 分析
- DFS
- 相当于所有城市全排列，但是第一个城市固定是`1`，需要找到代价最小的路径（全排列）
- 需要记录当前的路径（包括上一个城市）
- 搜索过程中可以剪枝：当前路径长度已经 >= 当前最优解即退出

#### AC

```c++
class Solution {
 public:
  int minCost(int nn, std::vector<std::vector<int>>& costs) {
    // costs: [[i, j, d]] i----j cost is d
    n = nn;
    result = 0x3f3f3f3f;
    int i, j, x, y;

    g.resize(n, std::vector<int>(n, 0x3f3f3f3f));

    for (i = 0; i < costs.size(); ++i) {
      x = costs[i][0] - 1;
      y = costs[i][1] - 1;
      g[x][y] = std::min(g[x][y], costs[i][2]);
      g[y][x] = std::min(g[y][x], costs[i][2]);
    }

    done.resize(n, false);

    done[0] = true; // 第0个城市搞过了
    dfs(1, 0, 0); // 第1个城市; 前一个城市是0; 当前花费时间是0

    return result;
  }

 private:
  // level is the level-th city
  // previous city p
  // current cost c
  void dfs(int level, int p, int c) {
    if (level == n) {
      if (c < result) {
        result = c;
      }
      return;
    }

    int i;
    // next city i, from p
    // p-->i must have a road
    for (i = 0; i < n; ++i) {
      if (!done[i] && g[p][i] != 0x3f3f3f3f) {
        done[i] = true;
        dfs(level + 1, i, c + g[p][i]);
        done[i] = false;
      }
    }
  }

  int n;
  std::vector<std::vector<int>> g; // g[i][j] is the cost to go from city i to j (<---> 双向)
  std::vector<bool> done;
  int result;
};
```

#### Optimize: Pruning

```c++
class Solution {
 public:
  int minCost(int nn, std::vector<std::vector<int>>& costs) {
    n = nn;
    result = 0x3f3f3f3f;
    int i, j, x, y;

    g.resize(n, std::vector<int>(n, 0x3f3f3f3f));

    for (i = 0; i < costs.size(); ++i) {
      x = costs[i][0] - 1;
      y = costs[i][1] - 1;
      g[x][y] = std::min(g[x][y], costs[i][2]);
      g[y][x] = std::min(g[y][x], costs[i][2]);
    }

    done.resize(n, false);

    done[0] = true;
    dfs(1, 0, 0);

    return result;
  }

 private:
  void dfs(int level, int p, int c) {
    // 1. pruning!!!
    if (c >= result) {
      return;
    }

    if (level == n) {
      // 2. pruning, remove this branch
      // c < result
      result = c;
      return;
    }

    int i;
    for (i = 0; i < n; ++i) {
      if (!done[i] && g[p][i] != 0x3f3f3f3f) {
        done[i] = true;
        dfs(level + 1, i, c + g[p][i]);
        done[i] = false;
      }
    }
  }

  int n;
  std::vector<std::vector<int>> g; // g[i][j] is the cost to go from city i to j (<---> 双向)
  std::vector<bool> done;
  int result;
};
```

### Solution 2: 状态压缩型动态规划???

- 设城市数为`n`，则有`2^n`个子集合
- 时间复杂度：枚举全部集合`2^n`，起点`n`，子问题`n`。时间复杂度为`O(n^2 * 2^n)`
- 空间复杂度：DP数组规模为`n * (2^n)`。空间复杂度为`O(n * 2^n)`

```c++
class Solution {
 public:
  int minCost(int n, std::vector<std::vector<int>>& roads) {
    int inf = 1000000000;
    std::vector<std::vector<int>> graph(n + 1, std::vector<int>(n + 1, 0));
    ConstructGraph(graph, roads, n);
    // state_size represent the number of cities
    int state_size = 1 << n;
    std::vector<std::vector<int>> f(state_size, std::vector<int>(n + 1, 0));

    for (int i = 0; i < state_size; i++) {
      for (int j = 0; j < n + 1; j++) {
        f[i][j] = inf;
      }
    }
    f[1][1] = 0;

    for (int state = 0; state < state_size; state++) {
      for (int i = 2; i < n + 1; i++) {
        if ((state & (1 << (i - 1))) == 0) {
          continue;
        }
        int prev_state = state ^ (1 << (i - 1));
        for (int j = 1; j < n + 1; j++) {
          if ((prev_state & (1 << (j - 1))) == 0) {
            continue;
          }
          f[state][i] = std::min(f[state][i], f[prev_state][j] + graph[j][i]);
        }
      }
    }

    int minimal_cost = inf;
    for (int i = 0; i < n + 1; i++) {
      minimal_cost = std::min(minimal_cost, f[state_size - 1][i]);
    }

    return minimal_cost;
  }

 private:
  void ConstructGraph(std::vector<std::vector<int>>& graph, std::vector<std::vector<int>>& roads, int n) {
    int inf = 1000000000;
    for (int i = 0; i < n + 1; i++) {
      for (int j = 0; j < n + 1; j++) {
        graph[i][j] = inf;
      }
    }
    for (int i = 0; i < roads.size(); i++) {
      int a = roads[i][0], b = roads[i][1], c = roads[i][2];
      graph[a][b] = std::min(graph[a][b], c);
      graph[b][a] = std::min(graph[b][a], c);
    }
  }
};
```


## Chapter 24: 双色塔

- [Lintcode 269 双色塔](https://www.lintcode.com/problem/269/)

- 求*方案总数*和*可行性*的问题 **很有** 可能是动态规划，求最大最小值其次
- 求*方案总数*的问题 **99%** 都是动态规划

```c++
class Solution {
 public:
  int twoColorsTower(int red, int green) {
  }
};
```






## Chapter 25: 编辑距离

- [Click on this link](#example-lintcode-119-编辑距离)

### (Really Important) The most relevant problem
- LCS: Longest common subsequences
- LIS: Longest increasing subsequences

### Relevant Problems
- [Lintcode 640 一次编辑距离](https://www.lintcode.com/problem/640/)
- [Lintcode 623 K步编辑](https://www.lintcode.com/problem/623/)


## Chapter 26: 动态规划难题专场

### Lintcode 752 Rogue Knight Sven
















***
## Others Note

***
### 动态规划的题型

- 坐标型：Triangle, Unique Paths, Jump Game
- 前缀型：
  - 匹配型：Longest Increasing Subsequence, Wildcard Matching
  - 划分型：Word Break
- 区间型：Stone Game
- 背包型：Backpack series
- 博弈型：Coins in a Line
- 状态压缩型：Traveling Salesman Problem
- 树型：Binary Tree Maximum Path Sum
- 图型：（面试基本没考过）


- 常见DP类型：
  - 坐标型（20%）

  - 序列型（20%）
  - 划分型（20%）

  - 区间型（15%）
  - 背包型（10%）
  - 博弈型（5%）

  - 最长序列型（5%）
  - 综合型（5%）


left: 清华动态规划专题课
- 美团：最长公共子序列
- 微软：最长上升子序列
- 阿里巴巴、腾讯：最长回文子串
- 猿辅导：零钱兑换II

+ 第一章 动态规划了入门
+ 第二章 动态规划初探+坐标型动态规划+位操作型动态规划
+ 第九章 序列型动态规划
+ 第十六章 划分型，博弈型和背包型动态规划
+ 第十七章 背包型动态规划和区间型动态规划
+ 第二十二章 双序列动态规划

right: 国内大厂高频动规题详解

### 简历: 最好一页
1. 清楚简洁，简明扼要，但不要太花里胡哨。不要有错字，错词或者语法错误
2. Project & Experience: 一定要和申请的职位相关
  - 写清楚Contribution。避免写成产品介绍，主要写我做了什么，必要的时候写用了什么工具。e.g. I drove ..., drove ..., design ...
  - **可以放一些数字**: reduce pipline time by 51.7%
  - 选最喜欢，最擅长，贡献最大的三个projects
3. 倒背如流细节


***
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







***
## Others Note

***
### 动态规划的题型

- 坐标型：Triangle, Unique Paths, Jump Game
- 前缀型：
  - 匹配型：Longest Increasing Subsequence, Wildcard Matching
  - 划分型：Word Break
- 区间型：Stone Game
- 背包型：Backpack series
- 博弈型：Coins in a Line
- 状态压缩型：Traveling Salesman Problem
- 树型：Binary Tree Maximum Path Sum
- 图型：（面试基本没考过）


- 常见DP类型：
  - 坐标型（20%）
  - 序列型（20%）
  - 划分型（20%）
  - 区间型（15%）
  - 背包型（10%）
  - 最长序列型（5%）
  - 博弈型（5%）
  - 综合型（5%）


left: 清华动态规划专题课
- 美团：最长公共子序列
- 微软：最长上升子序列
- 阿里巴巴、腾讯：最长回文子串
- 猿辅导：零钱兑换II

+ 第一章 动态规划了入门
+ 第二章 动态规划初探+坐标型动态规划+位操作型动态规划
+ 第九章 序列型动态规划
+ 第十六章 划分型，博弈型和背包型动态规划
+ 第十七章 背包型动态规划和区间型动态规划
+ 第二十二章 双序列动态规划

right: 国内大厂高频动规题详解

### 简历: 最好一页
1. 清楚简洁，简明扼要，但不要太花里胡哨。不要有错字，错词或者语法错误
2. Project & Experience: 一定要和申请的职位相关
  - 写清楚Contribution。避免写成产品介绍，主要写我做了什么，必要的时候写用了什么工具。e.g. I drove ..., drove ..., design ...
  - **可以放一些数字**: reduce pipline time by 51.7%
  - 选最喜欢，最擅长，贡献最大的三个projects
3. 倒背如流细节


***
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
