

import UIKit


/*
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 输入：head = [1], n = 1
 输出：[]
 
 输入：head = [1,2], n = 1
 输出：[1]

 
 解题思路
 
 暴力解法：循环两次 先计算总数 然后在循环去删除
 
 双指针解法：
       定义fast指针和slow指针，初始值为虚拟头结点
       fast指针就n+1步，slow走1步，当fast走到null最后一个节点的时候
       slow指针就刚好走到 总数-n 的地方，那么这样slow指针直接操作删除就完成了
 

 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  
        guard head != nil else{
            return head;
        }

        var cur = head;
        var count = 0;
        
        while cur != nil {
            count+=1
            cur = cur?.next
        }


        if count == 1 && n == 1{
            return  nil
        }
         
        // 2 - 2 = 0

        cur = head;
        var currIndex = 1;
        
        while cur != nil  {
             if count - n < currIndex{
                currIndex == 100
                cur = nil;
             }

            else if count - n  == currIndex   {
                cur?.next = cur?.next?.next
                cur = nil;
            }else{
                cur = cur?.next
                currIndex+=1
            }
        }

        if count - n == 0{
            return head?.next;
        }
        return head;
    }
}


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    if n == 0 {
        return head
    }
    let dummyHead = ListNode(-1, head)
    var fast: ListNode? = dummyHead
    var slow: ListNode? = dummyHead
    
    // fast 前移 n
    for _ in 0 ..< n {
        fast = fast?.next
    }
    
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    slow?.next = slow?.next?.next
    
    return dummyHead.next
}
 
