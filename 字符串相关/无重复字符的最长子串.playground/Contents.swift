import UIKit



/*
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 无重复字符的最长子串
 
 
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。


 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 
 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 
 
 解题思路:
 
 
 
 **/




class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if(s == ""){
            return 0
        }
        var maxStr = String()
        var curStr = String()
        for char in s{
            while curStr.contains(char) {
                // 如果字符串里面包含 那么就开始去掉第一个 开始 缩小滑动窗口
                // 不停的缩小 直到没有重复的
                curStr.remove(at: curStr.startIndex)
            }
            // 开始往右继续添加新的
            curStr.append(char)
            
            // 记录一下 当前没有重复的字符串长度
            // 和历史长度相对比
            if(curStr.count > maxStr.count){
                maxStr = curStr
            }
        }
        return maxStr.count
    }
}
