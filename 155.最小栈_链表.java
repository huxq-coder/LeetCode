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
    private Node head;

    /** initialize your data structure here. */
    public MinStack() {
    }

    public void push(final int x) {
        if (head == null){
            head = new Node(x, x, null);
        } else {
            head = new Node(x, Math.min(x, head.min), head);
        }
    }
    
    public void pop() {
        head = head.prior;
    }
    
    public int top(){
        return head.value;
    }
    
    public int getMin(){
        return head.min;
    }

    private class Node{
        int value;
        int min;
        Node prior;
        private Node(int value, int min, Node prior) {
            this.value = value;
            this.min = min;
            this.prior = prior;
        }
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

