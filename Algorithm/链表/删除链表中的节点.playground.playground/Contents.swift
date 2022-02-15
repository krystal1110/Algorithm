import UIKit

/*
 https://leetcode-cn.com/problems/delete-node-in-a-linked-list/

 请编写一个函数，用于删除单链表中某个特定节点。
 在设计函数时需要注意，你无法访问链表的头节点 head，只能直接访问 要被删除的节点 。

 题目数据保证需要删除的节点 不是末尾节点 。
 **/


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }
 


class Solution {
    func deleteNode(_ node: ListNode?) {
        // 假设为 4 5 1 9  要删除5  那么我们把5的值改为1  5的next改为9 那么第三个1就没了
        // 4 1 1 9
        node?.val = (node?.next?.val)!
        // 4 1 9
        node?.next = node?.next?.next
    }
}






/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 删除排序链表中的重复元素
 
 给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回已排序的链表
 
 输入：head = [1,1,2]
 输出：[1,2]
 
 输入：head = [1,1,2,3,3]
 输出：[1,2,3]

 **/

class Solution2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        let resNode = head
        
        var cur = head
        
        // 当cur.next为空的时候 就没有比较的意义了 cur.val = nil.val是没有意义的
        while cur?.next != nil {
            if cur?.val  == cur?.next?.val {
                // 相同
                cur?.next = cur?.next?.next
            }else {
                // 当不相同的时候 我们就拿把cur复制给下一个节点 继续重复
                cur = cur?.next
            }
        }
        // 最后返回头节点
        return resNode
    }
}
