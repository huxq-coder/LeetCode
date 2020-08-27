import java.lang.reflect.Array;

/*
 * @lc app=leetcode.cn id=641 lang=java
 *
 * [641] 设计循环双端队列
 */

// @lc code=start
class MyCircularDeque {

    private int front;
    private int rear;
    private int capacity;
    private int[] deque;

    /** Initialize your data structure here. Set the size of the deque to be k. */
    public MyCircularDeque(int k) {
        capacity = k + 1;
        deque = new int[capacity]; 
        front = 0;
        rear = 0;
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    public boolean insertFront(int value) {
        if (isFull()) {
            return false;
        } else {
            front = (front - 1 + capacity) % capacity;
            deque[front] = value;
            return true;
        }
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    public boolean insertLast(int value) {
        if (isFull()) {
            return false;
        } else {
            deque[rear] = value;
            rear = (rear + 1) % capacity;
            return true;
        }
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    public boolean deleteFront() {
        if (isEmpty()) {
            return false;
        } else {
            front = (front + 1) % capacity;
            return true;
        }
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    public boolean deleteLast() {
        if (isEmpty()) {
            return false;
        } else {
            rear = (rear - 1 + capacity) % capacity;
            return true;
        }
    }
    
    /** Get the front item from the deque. */
    public int getFront() {
        if (isEmpty()) {
            return -1;
        }
        return deque[front];
    }
    
    /** Get the last item from the deque. */
    public int getRear() {
        if (isEmpty()) {
            return -1;
        }
        return deque[(rear - 1 + capacity) % capacity];
    }
    
    /** Checks whether the circular deque is empty or not. */
    public boolean isEmpty() {
        return rear == front;
    }
    
    /** Checks whether the circular deque is full or not. */
    public boolean isFull() {
        return (rear + 1) % capacity == front;
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * MyCircularDeque obj = new MyCircularDeque(k);
 * boolean param_1 = obj.insertFront(value);
 * boolean param_2 = obj.insertLast(value);
 * boolean param_3 = obj.deleteFront();
 * boolean param_4 = obj.deleteLast();
 * int param_5 = obj.getFront();
 * int param_6 = obj.getRear();
 * boolean param_7 = obj.isEmpty();
 * boolean param_8 = obj.isFull();
 */
// @lc code=end

