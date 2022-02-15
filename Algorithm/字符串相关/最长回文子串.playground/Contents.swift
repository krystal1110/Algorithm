import UIKit


/*
 最长回文子串
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 
 
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 
 
 输入：s = "cbbd"
 输出："bb"
 
 解题思路：
 中心扩散法
 abccccdd
 
 从左到右遍历字符串
 遍历到一个字符串，然后像左像右各走一步
 判断左右两边是否相等
 eg：例如走到第四个c   那就判断第三个字符和第五个字符 是否是c 如果是C就括进去
     如果不是c 那就判断两者两者是否相等 就例如 bcb 也是回文
     那现在回文就是 ccc 就可以继续像左像右再走一步
 
 
 
 
 
 **/

 
    func longestPalindrome(_ s: String) -> String {

        // 起始位置
        var start = 0;
        
        // 长度
        var resLengh = 0;
        
         
        
        let array = s.map{$0}
        
        for i in 0..<s.count {
            
            var left = i - 1
            var right = i + 1
            var res = 1 // 用于存储几位
           
            
            
            
            while (left>=0 && array[left] == array[i] ) {
                print("1111")
                left = left - 1;
                res  = res +  1;
            }
            
            while (right<s.count && array[right] == array[i]) {
                print("22222")
                right =  right + 1;
                res  = res + 1;
            }
            while(left >= 0 && right<s.count && array[left] == array[right]){
                left = left - 1;
                right = right + 1;
                res = res + 2;
            }
            if (res > resLengh){
            start = left + 1
            
            resLengh = res
            }
        }
        
//        let aStr = "0123456789";
//        let str0 = aStr[10]; //获取第几位的字符

//        let result = Array(array[start...resLengh])


//        print(result)
        
        print("\(start) and \(resLengh)")
        return "123"
    }



longestPalindrome("abccccbd")
