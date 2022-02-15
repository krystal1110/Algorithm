import UIKit

/*
 
 https://leetcode-cn.com/problems/implement-queue-using-stacks/
 
 
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
 说明：

 你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
  
 
 示例 1：
 输入：
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 1, 1, false]

 解释：
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false
 
 
 解题思路：
    
 首先 队列的特点是 只能在头尾两端操作  先进先出的原则 11进入 11先出
 
 --------------
 44  33  22 11
 --------------
 
 准备2个栈: inStack、outStack
 
 inStack 入栈  33 22 11  (11为栈底)
 将inStack的东西全部移动到outStack  那么outStack就是  11 22 33 （33为栈底）
 那么弹出outStack栈顶 就是 11
 
 
 入队时，push到inStack中
 出队时
   如果outStack为空，将inStack所有元素逐一弹出，push到outStack,outStack弹出栈顶元素
   如果outStack不为空,outStack弹出栈顶元素
 
 **/



class MyQueue {

    var inStack:[Int]
    var outStack:[Int]
    
    init() {

        inStack = [Int]()
        outStack = [Int]()
        
    }
    
    func push(_ x: Int) {
        inStack .append(x)
    }
    
    func pop() -> Int {
        
        if(outStack.isEmpty){
            while(!inStack.isEmpty){
                outStack.append(inStack.first!)
                inStack.removeFirst()
            }
        }
        let p = outStack.first!
        outStack.removeFirst();
        return p
    }
    
    // 获取队头元素
    func peek() -> Int {
        if(outStack.isEmpty){
            while(!inStack.isEmpty){
                outStack.append(inStack.first!)
                inStack.removeFirst()
            }
        }
        return outStack.first!;
    }
    
    func empty() -> Bool {
   
        if (inStack.isEmpty && outStack.isEmpty){
            return true
        }
        return false
    }
}
