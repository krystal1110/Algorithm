import UIKit

/*
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 
 什么是前序遍历？
 遍历顺序:根节点->左节点->右节点

 
               4
          2        6
       1    3    5    7
 
 前序遍历： 4 -> 2 -> 1 -> 3 -> 6 -> 5 ->7
 
 
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。


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

//递归
class Solution1 {
  var res = [Int]()
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    dfs(root)
    return res
  }
  
  func dfs(_ root:TreeNode?) {
    guard let root = root else {
      return
    }
    res.append(root.val)
    dfs(root.left)
    dfs(root.right)
  }
}
 

//迭代
class Solution2 {
  
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    var res = [Int]()
    var stack = [TreeNode]()
    stack.append(root)
    while !stack.isEmpty {
      let node = stack.popLast()!
      res.append(node.val)
      
      if node.right != nil {
        stack.append(node.right!)
      }
      if node.left != nil {
        stack.append(node.left!)
      }
    }
    return res
  }
}

 
