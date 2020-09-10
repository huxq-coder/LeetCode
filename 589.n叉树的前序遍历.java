import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Stack;

/*
 * @lc app=leetcode.cn id=589 lang=java
 *
 * [589] N叉树的前序遍历
 */

// @lc code=start
/*
// Definition for a Node.
class Node {
    public int val;
    public List<Node> children;

    public Node() {}

    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, List<Node> _children) {
        val = _val;
        children = _children;
    }
};
*/

class Solution {
    List<Integer> list;
    Stack<Node> stack;
    /** 递归 */
    // public List<Integer> preorder(Node root) {
    //     list = new ArrayList<>();
    //     if (root == null) {
    //         return list;
    //     }
    //     helper(root);
    //     return list;
    // }

    public void helper(Node node) {
        list.add(node.val);
        if (node.children.size() > 0) {
            for (Node child : node.children) {
                helper(child);
            }
        }
    }


    /** 迭代 */
    public List<Integer> preorder(Node root) {
        list = new ArrayList<>();
        stack = new Stack<>();
        if (root == null) {
            return list;
        }
        stack.push(root);
        while (!stack.isEmpty()) {
            Node current = stack.pop();
            list.add(current.val);
            if (current.children.size() > 0) {
                Collections.reverse(current.children);
                for (Node child : current.children) {
                    stack.push(child);
                }
            }
        }
        return list;
    }

}
// @lc code=end

