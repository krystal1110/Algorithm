

import UIKit


/*
 https://leetcode-cn.com/problems/merge-two-sorted-lists/

 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 输入：l1 = [], l2 = []
 输出：[]
 
 输入：l1 = [], l2 = [0]
 输出：[0]

 
 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

     
        var newNode = ListNode()
        var node1 = list1;
        var node2 = list2;
        
        // 用于保存newNode的头  因为后面我们会移动newNode
        let cur = newNode;
        
        while node1 != nil && node2 != nil {
            
            if (node1!.val <= node2!.val){
                // 如果node1 的值 小于 node2的值
                // 那么我们就要把node1的值加在新链表上
                newNode.next = ListNode(node1!.val)
                // 然后将原始的node1像后移动
                node1 = node1?.next
            }else{
                // 如果node1 的值 大于node2的值
                // 那么我们就要把node2的值加载新链表上
                newNode.next = ListNode(node2!.val)
                // 然后将原因的node2像后移动
                node2 = node2?.next
            }
            // 不停的移动newNode至下一个
            // 那么newNode.next在上面循环的时候
            // 永远只需要关心newNode.next 是 node1和node2比较的结果
            newNode = newNode.next!
        }
        
        
        if (node1 == nil){
            // 如果node1走完了 那么要把node2的所有剩余链表都加上去
            newNode.next = node2
            
        }else if (node2 == nil){
            // 如果node2走完了 那么要把node1的所有剩余链表都加上去
            newNode.next = node1
        }
        // 头节点是空的，所以返回newNode.next
        return cur.next
    }
}

 
