import UIKit


/*
 https://leetcode-cn.com/problems/invert-binary-tree/
 
 给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
 
 示例 1：
 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
 
 示例 2：
 输入：root = [2,1,3]
 输出：[2,3,1]
 
 示例 3：
 输入：root = []
 输出：[]
 
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {

        guard let root = root else {
          return nil
        }
        
        let leftRoot = invertTree(root.left)
        
        let rightRoot = invertTree(root.right)
        
        root.left = rightRoot
        
        root.right = leftRoot
        
        return root
 
    }
}
