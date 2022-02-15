import UIKit



/*
 https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

          3
       9     20
           15   7
 
 返回它的最大深度 3
 
 利用层序遍历,就可以得到最大深度
 
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
    func maxDepth(_ root: TreeNode?) -> Int {

        guard let root = root else{
            return 0;
        }
        
        var queen = [TreeNode]()
        
        var count = 0;
        
        queen.append(root)
        
        while !queen.isEmpty {
            
            for _ in 0..<queen.count {
            
           let node =  queen.removeFirst();
            
                
                
            if node.left != nil {
                queen.append(node.left!)
            }
            
            if node.right != nil {
                queen.append(node.right!)
            }
            
            }
            
            count += 1
        }
        return count
    }
}
