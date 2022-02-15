import UIKit


/*
 https://leetcode-cn.com/problems/climbing-stairs/
 **/

/*
class Solution {
    func climbStairs(_ n: Int) -> Int {
       if n <= 3 {
         return n
       }
       return climbStairs(n-1) + climbStairs(n-2)
    }
}
*/

class Solution {
    
//    我们假设 n = 4， 那么它可能是从 第二台阶，跨 2步 到 4台阶，或者 从 第三台阶 跨 1步 到4台阶.
//
//    也就是说 我们只需要用到前两个的结果， 所以我们可以用滑动窗口的形式保存临时的值，并让 尾递归 变成 迭代。
//
//    整个求解过程也是 动态规划的思路

 
    func climbStairs(_ n: Int) -> Int {
       if n <= 3 {
         return n
       }

       var f2 = 2
       var f3 = 3

       for _ in 4...n {
         let f4 = f2+f3
         f2 = f3
         f3 = f4
       }

       return f3
    }
}

 
