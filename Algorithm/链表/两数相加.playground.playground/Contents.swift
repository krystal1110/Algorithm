import UIKit




/*
    https://leetcode-cn.com/problems/add-two-numbers/
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 **/



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


     
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var ll1 = l1 ,ll2 = l2 ,node = ListNode(0)
        
        let newNode = node
        
        // 进位flag
        var flag = 0
       
        while (ll1?.val != nil || ll2?.val != nil || flag == 1)
        {
            let num1 : Int = ll1?.val ?? 0
            
            let num2 : Int = ll2?.val ?? 0
            
            var num = num1 + num2 + flag
         
            // 大于9进一位 因为不会有0 那么进一位最多为1  flag 保存为1
            if num > 9
            {
                num = num%10
                
                flag = 1
                
            }else
            {
                // 否则只是相加 不会进位
                flag = 0
            }
            
            //创建一个新的List 把node指向 相加后的结果
            node.next = ListNode(num)
            
            
            node = node.next ?? ListNode(0)
            
            ll1  = ll1?.next
            
            ll2  = ll2?.next
        }
        return newNode.next
    }
    

    

    
 
