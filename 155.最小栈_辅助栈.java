import java.util.Stack;

/*
 * @lc app=leetcode.cn id=155 lang=java
 *
 * [155] 最小栈
 * 
 * 利用辅助栈（minStack）保存栈中最小元素
 * 辅助栈的数据与原始的栈数据保持同步
 */

// @lc code=start
public class MinStack{

    private Stack<Integer> stack;
    private Stack<Integer> minStack;

    /** initialize your data structure here. */
    public MinStack() {
        stack = new Stack<>();
        // 最小值的辅助栈
        minStack = new Stack<>();
    }

    public void push(final int x) {
        if(minStack.isEmpty()){
            minStack.push(x);
        } else {
            // 判断要入栈的数据和最小辅助栈的栈顶数据大小，取小的数据放入最小辅助栈中
            if(x <= minStack.peek()){
                minStack.push(x);
            } else {
                minStack.push(minStack.peek());
            }
        }
        stack.push(x);
    }
    
    public void pop() {
        if(!stack.isEmpty()){
            stack.pop();
            minStack.pop();
        }
    }
    
    public int top(){
        if(stack.isEmpty()){
            throw new RuntimeException("空栈");
        }
        return stack.peek();
    }
    
    public int getMin(){
        if(minStack.isEmpty()) {
            throw new RuntimeException("空栈");
        }
        return minStack.peek();
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
// @lc code=end

