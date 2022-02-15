

import UIKit


/*
 https://leetcode-cn.com/problems/middle-of-the-linked-list/

 给定一个头结点为 head 的非空单链表，返回链表的中间结点。

 如果有两个中间结点，则返回第二个中间结点。
 
 输入：[1,2,3,4,5]
 输出：此列表中的结点 3 (序列化形式：[3,4,5])
 返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
 注意，我们返回了一个 ListNode 类型的对象 ans，这样：
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.


 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。


 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {

        var cur = head;
        
        var count = 0
        
        while cur != nil {
            cur = cur?.next
            
            count = count + 1
        }
        
        cur = head
        // 计算出 mid 是在第几个  假设count是8  mid就是4
        var mid = count / 2
        
        
        // 然后开始循环 找到链表第四个的位置 也就是mid = 4 的位置
        while mid != 0 {
            mid = mid - 1
            cur = cur?.next
        }
        return cur
    }
}
