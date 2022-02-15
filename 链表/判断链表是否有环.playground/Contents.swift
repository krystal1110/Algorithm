

import UIKit


/*
 https://leetcode-cn.com/problems/linked-list-cycle/

 给你一个链表的头节点 head ，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

 如果链表中存在环 ，则返回 true 。 否则，返回 false 。

 
 3->2->0->-4->2
 
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {

        
    // 无环的话，两个步长不一致的指针肯定无法再次相遇
      
        // 初始化一个快指针
        var fast = head
      
        // 初始化一个慢指针
        var slow = head
    
        // 终止条件为
        // fast != nil 是为了 判断当前就只有一个fast 所有没环
        // 快的那个指针走到了链表的最后一个元素 也就是  fast的next为 nil
      while fast != nil && fast!.next != nil {
          
          // 快指针一次跨 2步
          fast = fast!.next!.next
          
          // 慢指针一次跨 1步
          slow = slow!.next!
       
          // 有环证明相遇了
          if fast === slow {
          
              return true
        
          }
      }
      return false
    }
}
