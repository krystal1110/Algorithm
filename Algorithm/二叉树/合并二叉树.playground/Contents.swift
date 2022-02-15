import UIKit

 

/*
 
 https://leetcode-cn.com/problems/merge-two-binary-trees/
 
 给你两棵二叉树： root1 和 root2 。

 想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠，那么将这两个节点的值相加作为合并后节点的新值；否则，不为 null 的节点将直接作为新二叉树的节点。

 返回合并后的二叉树。

 注意: 合并过程必须从两个树的根节点开始。

 
 示例1：
 输入：
 root1 = [1,3,2,5],
 root2 = [2,1,3,null,4,null,7]
 输出：[3,4,5,5,4,null,7]
 
 示例2：
 输入：root1 = [1], root2 = [1,2]
 输出：[2,2]
 
 
 解题思路
 1: 如果2棵树的节点都为nil，返回nil；
 2: 其实一个不为nil，返回不为nil
 3: 都不为nil，合并，然后继续递归left和right
 
 **/

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {

        if root1 == nil {
            return root2
        }
        if root2 == nil {
            return root1
        }
        
        let root = TreeNode(root1!.val + root2!.val);
       
        root.left = mergeTrees(root1?.left,root2?.left)
        
        root.right = mergeTrees(root1?.right, root2?.right)
        
        return root;
    }
}
