import java.util.*;

/*
 * @lc app=leetcode.cn id=20 lang=java
 *
 * [20] 有效的括号
 */

// @lc code=start
class Solution {
    /**
     * 栈
     */
    // public boolean isValid(final String s) {
    //     // 过滤数据
    //     if(s.length()%2 == 1) return false; 
    //     Stack<Character> stack = new Stack<Character>();
    //     for (Character character : s.toCharArray()) {
    //         // 左括号入栈
    //         if(character == '(' || character == '[' || character == '{'){
    //             stack.push(character);
    //         // 右括号与栈顶元素匹配，出栈
    //         } else if(!stack.isEmpty() && ((character == ')' && stack.peek() == '(')
    //          || (character == ']' && stack.peek() == '[') 
    //          || (character == '}' && stack.peek() == '{'))){
    //             stack.pop();
    //         } else {
    //             return false;
    //         }
    //     }
    //     return stack.isEmpty();
    // }

    public boolean isValid(final String s) {
        // 过滤数据
        if(s.length()%2 == 1) return false; 
        Map<Character, Character> map = new HashMap<Character, Character>();
        Stack<Character> stack = new Stack<>();
        map.put(')', '(');
        map.put(']', '[');
        map.put('}', '{');
        for (Character c : s.toCharArray()) {
            if (map.containsValue(c)) {
                stack.push(c);
            } else if (stack.isEmpty()) {
                return false;
            } else if (map.get(c) == stack.peek()) {
                stack.pop();
            } else {
                return false;
            }
        }
        return stack.isEmpty();
    }

}
// @lc code=end

