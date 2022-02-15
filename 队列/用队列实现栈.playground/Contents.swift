import UIKit

/*
 
 https://leetcode-cn.com/problems/implement-stack-using-queues/
 
 
 请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。

 实现 MyStack 类：

 void push(int x) 将元素 x 压入栈顶。
 int pop() 移除并返回栈顶元素。
 int top() 返回栈顶元素。
 boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。
  

 注意：

 你只能使用队列的基本操作 —— 也就是 push to back、peek/pop from front、size 和 is empty 这些操作。
 你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。

 
 
 示例：
 输入：
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 2, 2, false]

 解释：
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // 返回 2
 myStack.pop(); // 返回 2
 myStack.empty(); // 返回 False

 
 

 解题思路：
    
 
 
 **/


class MyStack {

    var queus = Queue<Int>()
    
    init() {
    }
    
    func push(_ x: Int) {
 
        queus.push(obj: x)
        
//  每次有新元素入队列，将原队列队首元素依次弹出并从队尾加回到队列中，直到新元素成为队首
        for _ in 0..<queus.count - 1{
            queus.push(obj: queus.pop()!)
        }
        
    }
    
    func pop() -> Int {
        return queus.pop() ?? 0
    }
    
    func top() -> Int {
        return queus.top ?? 0
    }
    
    func empty() -> Bool {
        return queus.isEmpty
    }
}

class Queue<Element> {
    
    var queue = [Element]()
    var isEmpty: Bool { return queue.isEmpty }
    var top: Element? { return queue.first }
    var count: Int { return queue.count }
    func pop() -> Element? {
        //因为在每次push的时候就同时完成了队列的再整序工作，所以直接弹出队首即可
        return queue.removeFirst()
    }
    
    func push(obj: Element) {
        queue.append(obj)
    }
}

 
