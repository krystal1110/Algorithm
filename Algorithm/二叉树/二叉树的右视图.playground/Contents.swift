import UIKit



/*
 https://leetcode-cn.com/problems/binary-tree-right-side-view/
 给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 
 
            1
       2         3
         5          4
 
 输入: [1,2,3,null,5,null,4]
 输出: [1,3,4]
 
 解题思路：
 层序遍历的思路
 但是每一层 先判断右子树 再到左子树  那么就是从右到左 得到一个数组 我们取第一个
 然后把每一层的第一个元素加入到数组中就可以得到右子树了
 
 
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
    func rightSideView(_ root: TreeNode?) -> [Int] {

        guard let root = root else{
            return []
        }
        
        var res = [Int]()
        
        var queen = [TreeNode]()
        
        queen.append(root)
        
        while !queen.isEmpty {
            
            var level = [Int]()
            
            for  _ in 0..<queen.count {
            
            let node = queen.removeFirst()
            
            level.append(node.val)
                
            if node.right != nil {
                
                queen.append(node.right!)
            }
                
            if node.left != nil{
                queen.append(node.left!)
            }
                
          }
        
            // 加入第一个元素
            res.append(level[0])
            
        }
        return res;
        
    }
}
