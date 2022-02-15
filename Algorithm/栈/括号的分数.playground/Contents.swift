import UIKit

/*
 
 https://leetcode-cn.com/problems/score-of-parentheses/
 
 
 给定一个平衡括号字符串 S，按下述规则计算该字符串的分数：

 () 得 1 分。
 
 AB 得 A + B 分，其中 A 和 B 是平衡括号字符串。
 
 (A) 得 2 * A 分，其中 A 是平衡括号字符串
 

 示例 1：
 输入： "()"
 输出： 1
 
 示例 2：
 输入： "(())"
 输出： 2
 
 示例 3：
 输入： "()()"
 输出： 2
 
 示例 4：
 输入： "(()(()))"
 输出： 6
  
 
 
 解题思路：
    
 1.初始化一个栈（数组），遇见左字符，将左字符入栈
 
 2.遇到右字符， 取出栈顶元素 看 是否是数字 是数字的话就相加 然后将数字出栈
   如果不是数字的话 判断sum是否为空 为空的话 就是第一次遇到 那么sum = 1 否则的话 sum * 2
   然后先将左字符出栈，出栈以后 再将刚刚计算得来的结果放入栈中
   那么栈中 ["(", "1", "(", "("]
   这样一直下去 就可以得到 ["(", "1", "2"]
   最后 2 * 3 = 6
 
   最后把栈中数字全部加载一起 就可以了
 
 //            ["(", "("]
 //            ["(", "1", "(", "("]
 //            ["(", "1", "(", "1"]
 //            ["(", "1", "2"]
 //            6
 
 **/



func scoreOfParentheses(_ S: String) -> Int {
    guard S.count > 0 else {
        return 0
    }

    var stack = [String]()

    for char in S {
        
        var sum = 0
        if char == ")" {
            // 判断栈顶元素是什么
            
            while let last = stack.last, let intLast = Int(last) {
                sum += intLast
                stack.popLast()
            }

            sum = sum == 0 ? 1 : sum * 2
            
            stack.popLast()
            
            stack.append(String(sum))

        } else {
            // 遇到左括号入栈
            stack.append(String(char))
        }
    }

    // 计算结果
    var res = 0

    for item in stack {
        res += Int(item)!
    }

    return res
}

var count = scoreOfParentheses("(()(()))")

print(count);

let arrayCount = 120
let destCount = 60

var array: [Int] = Array(repeating: 0, count: arrayCount)
for i in 0..<array.count {
    array[i] = i
}
var dest: [Int] = []
dest = Array(repeating: 0, count: destCount)
 
memcpy(&dest, &array, destCount*MemoryLayout<Int>.size)

print(dest)
