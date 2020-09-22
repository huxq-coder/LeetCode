import java.lang.ProcessHandle.Info;
import java.util.HashMap;
import java.util.Map;

import javax.swing.tree.TreeNode;

/*
 * @lc app=leetcode.cn id=105 lang=java
 *
 * [105] 从前序与中序遍历序列构造二叉树
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
    // 中序数组的哈希表，key：值；value：索引
    Map<Integer, Integer> map;

    public TreeNode buildTree(int[] preorder, int[] inorder) {
        map = new HashMap<>();
        // 遍历中序数组，缓存哈希表
        for (int i = 0; i < inorder.length; i++) {
            map.put(inorder[i], i);
        }
        return buildTreHelper(preorder, 0, preorder.length, inorder, 0, inorder.length);
    }

    private TreeNode buildTreHelper(int[] preorder, int p_start, int p_end, int[] inorder, int i_start, int i_end) {
        // 递归终结条件
        if (p_start == p_end || i_start == i_end) {
            return null;
        }
        // 确定root节点
        TreeNode root = new TreeNode(preorder[p_start]);
        // 根节点在中序数组的索引
        int rootIndex = map.get(root.val);
        // 左子树节点个数
        int leftCount = rootIndex - i_start;
        // 左子树
        root.left = buildTreHelper(preorder, p_start+1, p_start+1+leftCount, inorder, i_start, rootIndex);
        // 右子树
        root.right = buildTreHelper(preorder, p_start+leftCount+1, p_end, inorder, rootIndex+1, i_end);
        return root;
    }
}
// @lc code=end

