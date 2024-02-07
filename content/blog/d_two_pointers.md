+++
title = 'Draft: Two Pointers'
date = 2023-11-04T23:19:45-04:00
draft = true
+++

<!--more-->
## fast slow pointers
```c++
ListNode* GetMid(ListNode* head) {
  ListNode* slow = head;
  ListNode* fast = head;

  // 1. while (fast->next != nullptr && fast->next->next != nullptr)
  // odd number of elements:  1->2->3->4->5
  //                                ^
  //                                slow
  // even number of elements: 1->2->3->4
  //                             ^
  //                             slow

  // 2. while (fast != nullptr && fast->next != nullptr)
  // odd number of elements:  1->2->3->4->5
  //                                ^
  //                                slow
  // even number of elements: 1->2->3->4
  //                                ^
  //                                slow
  while (fast->next != nullptr && fast->next->next != nullptr) {
    slow = slow->next;
    fast = fast->next->next;
  }

  return slow;
}
```