import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import javax.swing.tree.TreeNode;

import org.graalvm.compiler.nodes.spi.SwitchFoldable.Helper;

/*
 * @lc app=leetcode.cn id=144 lang=java
 *
 * [144] 二叉树的前序遍历
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
     * 递归方法
     * @param root
     * @return
     */
    // public List<Integer> preorderTraversal(final TreeNode root) {
    //     final List<Integer> result = new ArrayList<>();
    //     if (root == null) {
    //         return result;
    //     }
    //     helper(root, result);
    //     return result;
    // }

    public void helper(TreeNode node, final List result) {
        if (node == null) {
            return;
        }
        result.add(node.val);
        helper(node.left, result);
        helper(node.right, result);
    }

    /**
     * 迭代方法
     * @param root
     * @return
     */
    public List<Integer> preorderTraversal(final TreeNode root) {
        List<Integer> result = new ArrayList<>();
        Stack<TreeNode> stack = new Stack<>(); 
        if (root == null) {
            return result;
        }
        stack.push(root);
        while (!stack.isEmpty()) {
            TreeNode current = stack.pop();
            result.add(current.val);
            if (current.right != null) {
                stack.push(current.right);
            }
            if (current.left != null) {
                stack.push(current.left);
            }
        }
        return result;
    }
}
// @lc code=end

