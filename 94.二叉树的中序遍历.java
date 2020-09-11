import java.util.List;
import java.util.Stack;

import javax.swing.tree.TreeNode;

/*
 * @lc app=leetcode.cn id=94 lang=java
 *
 * [94] 二叉树的中序遍历
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    /**
     * 递归
     * 左中右
     * @param root
     * @return
     */
    // public List<Integer> inorderTraversal(TreeNode root) {
    //     List<Integer> result = new ArrayList<>();
    //     if (root == null) {
    //         return result;
    //     }
    //     helper(root, result);
    //     return result;
    // }

    public void helper(TreeNode node, List result) {
        if (node == null) {
            return;
        }
        helper(node.left, result);
        result.add(node.val);
        helper(node.right, result);
    }

    /**
     * 迭代
     * @param root
     * @return
     */
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        Stack<TreeNode> stack = new Stack<>();
        if (root == null) {
            return result;
        }
        // 左中右
        TreeNode current = root;
        while (!stack.isEmpty() || current != null) {
            // 一直向左节点移动，直到最左边的节点
            while (current != null) {
                stack.push(current);
                current = current.left;
            }
            // 没有左节点，出当前节点(父节点)
            current = stack.pop();
            result.add(current.val);
            // 向右节点移动
            current = current.right;
        }
        return result;
    }

}
// @lc code=end

