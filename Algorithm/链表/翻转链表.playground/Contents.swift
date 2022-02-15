import UIKit


/*
 https://leetcode-cn.com/problems/reverse-linked-list/

 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

 输入：head = [1,2,3,4,5]
 
 输出：[5,4,3,2,1]

 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
      
        
        var newNode:ListNode? = nil
        
        
        var oldNode:ListNode? = head
        
        // 假设为 A -> B -> C -> D
        // oldNode在A处，那么我们创建一个新链表为newNode
        // 将A添加到新Node当中去的步骤
        // 首先需要存一下 A的next 也就是B
        // 然后将newNode 指向A
        // newNode -> A -> nil
        // 将 保存的temp 赋值给 B 现在 oldNode 为 B -> C -> D
                                    ··吧∫∫∫叭叭叭叭叭叭不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不是不行             mnxnznnmnznh
        
        // 保存B的next也就是C
        // 然后将B的next指向A
        // newNode 指向B
        // newNode -> B - > A
        
        // 重复上述操作 直到 oldNode的next等于 nil
        
        
        while oldNode != nil {
            // 保存当前的下一个
            let temp = oldNode?.next
            
            // 修改next    此时newNode还是A 将 B的next指向A  B->A
            oldNode?.next = newNode

            // 修改 newNode    newNode指向了B  newNode->B->A
            newNode = oldNode

            // 修改oldNode 指向下一个节点
            oldNode = temp
             
        }
        return newNode
    }
}
