import UIKit


/*
  
 https://leetcode-cn.com/problems/generate-parentheses/
 
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 
 
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 
 输入：n = 1
 输出：["()"]
 
 
 
 解题思路：
 我们需要生成 n 对 括号， 所以 左括号的个数 是 n，右括号的个数也是n。

 我们要做的合法操作有下面两个：

 如果左括号数量不大于 n， 我们可以放一个左括号。并且可以一直放下去

 如果右括号数量小于左括号的数量，我们可以补一个右括号。

 直到 左右括号的个数 都达到 n

 
 **/



    var result = [String]()

    func generateParenthesis(_ n: Int) -> [String] {
      dfs(0, 0, n, "")
      return result
    }

    func dfs(_ left:Int, _ right:Int, _ n:Int, _ s: String) {
      if left == n && right == n {
        result.append(s)
        return
      }
      //! 递归过程中，进行合法操作
      if left < n {
          dfs(left+1,right,n,s+"(")
      }
    
      if left > right {
          dfs(left,right+1,n,s+")")
      }
  
    }
    
 

   let str =   generateParenthesis(5)

   print(str)
