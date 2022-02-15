import UIKit


/*
 https://leetcode-cn.com/problems/symmetric-tree/
 给你一个二叉树的根节点 root ， 检查它是否轴对称。

 
 
 解题思路:
 递归
 判断两个跟节点是否相同
 判断右子树跟左子树是否对称的
 判断双方节点数是否一样多
 
 
 迭代
 可以通过复制一颗二叉树，然后将这颗二叉树与原来二叉树合并来判断是否相等
 也可以通过遍历所有左节点放入一个队列，紧接着放右队列，然后两个队列出队比较顺序是否相同，长度是否相同

 
 层序遍历
 先整个层序遍历，然后判断是否为 回文字符串
 
 注意：空节点我们用()进行占位处理
 
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
      return DFS(root?.left, root?.right)
    }
    
    func DFS(_ left:TreeNode?,_ right:TreeNode?) -> Bool {
    
      if left == nil && right == nil {
        return true
      }
    
      if left?.val != right?.val {
        return false
      }
        // 每个树的右子树都与这棵树的左子树镜像对称
      return DFS(left?.left, right?.right) && DFS(left?.right, right?.left)
  }
}
 

//迭代
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
      guard let root = root else {
        return true
      }
  
      var queue = [TreeNode]()
      queue.append(root)
      queue.append(root)
  
      while !queue.isEmpty {
        let u = queue.removeFirst()
        let v = queue.removeFirst()
    
        if u.val != v.val {
          return false
        }
    
        if u.left != nil && v.right != nil {
          queue.append(u.left!)
          queue.append(v.right!)
        } else if u.left != nil || v.right != nil {
          return false
        }
    
        if u.right != nil && v.left != nil {
          queue.append(u.right!)
          queue.append(v.left!)
        }  else if u.right != nil || v.left != nil {
          return false
        }
    
      }
      return true
   }
}
 

class Solution3 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
    
      guard let root = root else {
        return true
      }
  
      var queue = [TreeNode?]()
      queue.append(root)
  
      while !queue.isEmpty {
    
        var str = [String]()
        var temp = [TreeNode?]()
    
        while !queue.isEmpty {
      
          guard let node = queue.removeLast()  else {
            str.append("()")
            continue
          }
      
          str.append("(\(node.val))")
          temp.append(node.left)
          temp.append(node.right)
        }
    
        if str != str.reversed() {
          return false
        }
        queue.append(contentsOf: temp)
      }
      return true
   }
}
 


