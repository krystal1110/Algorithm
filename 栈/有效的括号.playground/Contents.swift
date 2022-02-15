import UIKit

/*
 
 https://leetcode-cn.com/problems/valid-parentheses/
 
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

    1. 左括号必须用相同类型的右括号闭合。
    2. 左括号必须以正确的顺序闭合。


 示例 1：
 输入：s = "()"
 输出：true
 
 示例 2：
 输入：s = "()[]{}"
 输出：true
  
 
 
 解题思路：
 
 初始化一个栈（数组），遇见左字符，将左字符入栈
 
 遇到右字符的时候 首先判断栈为空的话 为空的话 代表 )xxx 这种情况 直接就能确定不是有效的
 
 如果不为空 那么判断 栈的栈顶元素和右字符是否匹配
 
 匹配的话 出栈 必须遍历
 不匹配 就代表不是有效的
 
 当栈为空的时候 就代表括号是成双成对的
 当栈不为空的时候 就代表括号不是有效的
 
 
 **/



class Solution {
    func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else{
        return false
    }

    let map:[Character:Character] = ["(":")","[":"]","{":"}"]

    var stack = [Character]()

    for char in s {
        if map[char] != nil{
            // 判断左括号 入栈
            stack.append(char)
        }else{
            // 如果栈直接为空的 直接返回false
            if stack.isEmpty {
                return false
            }else if map[stack.last!] != char{ // 判断栈顶是否匹配 不匹配返回false
               return false
            }else{
                // 括号匹配，出栈，继续遍历
                stack.popLast();
            }
        }
    }
    return stack.isEmpty
    }
}
