import UIKit

 /*
  https://leetcode-cn.com/problems/validate-binary-search-tree
  
  给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

  有效 二叉搜索树定义如下：

  节点的左子树只包含 小于 当前节点的数。
  节点的右子树只包含 大于 当前节点的数。
  所有左子树和右子树自身必须也是二叉搜索树。
 
  
  
  解题思路：
  因为二叉搜索树使用中序遍历的话 就会从小到大的顺序排列
  先中序遍历然后拿到数组，判断数组是否是从小到大排序数组
  如果是则为二叉搜索树 
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
    var values = [Int]()
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        inOrderTree(root)

        // 判断是否是从小到大的排序数组
        for index in 1..<values.count {
            if values[index] <= values[index - 1] {
                return false
            }
        }
        
        return true
    }
    
    // 中序遍历
    func inOrderTree(_ root: TreeNode?) {
        
        if root == nil {
            return
        }
        inOrderTree(root?.left)
        values.append(root!.val)
        inOrderTree(root?.right)
    }
}
 
