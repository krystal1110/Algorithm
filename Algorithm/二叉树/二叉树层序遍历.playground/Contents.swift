import UIKit

/*
 二叉树层序遍历
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 
 
 什么是层序遍历？

 遍历顺序:即逐层地，从左到右访问所有节点
 
  
 
               4
          2        6
       1    3    5    7
 
 层序遍历： 4 -> 2 -> 6 -> 1 -> 3 -> 5 ->7
 
 
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。
 
 
 
 
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
    // 用来存放结果的数组
    var res = [Int]()
    
    func levelOrder(_ root: TreeNode?) -> [Int] {
       
        guard let root = root else{
            return []
        }

        // 初始化队列
         var queue = [TreeNode]()
        
        
        // 根节点入队
        queue.append(root);
        
        while !queue.isEmpty {
            
            let node = queue.removeFirst()
            
            res.append(node.val)
            
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }

        }
        return res;
    }
}



/*
 可以看到，我们在while循环内部，根据queue中节点的数量，加了一层for循环，保证了每次队列中的节点都是同一层的节点，从而实现了，输出一个二维数组，存放的是每层的节点数组

 
 
 **/
class Solution2 {
    // 用来存放结果的数组
    var res = [[Int]]()
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
       
        guard let root = root else{
            return res
        }

        // 初始化队列
         var queue = [TreeNode]()
        
        // 根节点入队
        queue.append(root);
        
        while !queue.isEmpty {
            
            var level = [Int]()
            
            
            for _ in 0..<queue.count {
            
            let node = queue.removeFirst()
            
            level.append(node.val)
            
      
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }
            
            }
            res.append(level)
        }
        return res;
    }
}
