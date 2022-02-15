import UIKit

 /*
  
  https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
  
  给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

  给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

  
  输入：digits = "23"
  输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
  
  输入：digits = ""
  输出：[]
  
  输入：digits = "2"
  输出：["a","b","c"]
  
  
  解题思路：
  
  **/
 


class Solution{
    
    var listRes = [String]()

    let map : [Character:[Character]] = {
      
      return ["2":Array("abc"),
              "3":Array("def"),
              "4":Array("ghi"),
              "5":Array("jkl"),
              "6":Array("mno"),
              "7":Array("pqrs"),
              "8":Array("tuv"),
              "9":Array("wxyz")
              ]
    }()

    func letterCombinations(_ digits: String) -> [String] {
      if digits.count == 0 {
        return []
      }
      dfs("", Array(digits), 0)
      return listRes
    }

    func dfs(_ s:String,_ digits: [Character],_ index:Int) {
      // 找到叶子节点了
      if index == digits.count {
        listRes.append(s)
        return
      }
    
      //! 2. 拿到第二个数组  例如234   就是  digits[0] = 2 , digits[1] = 3
        //lettersArray = abc 
      let lettersArray = map[digits[index]]!
        
        
      //! 与当前号码的字母分别进行组合
      for j in 0..<lettersArray.count {
        // 假设 s是 a 那就是 s+String(lettersArray[j]) = ab    index = 2 继续往下去寻找叶子节点
          dfs(s+String(lettersArray[j]), digits, index+1)
      }
  }
}
 
