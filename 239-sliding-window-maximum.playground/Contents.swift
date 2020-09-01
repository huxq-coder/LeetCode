import UIKit

/**
 暴力解法
 外层循环数组，内层循环窗口k，找到最大值
 时间复杂度为O(n*k)
 空间复杂度为O(1)
 提交LeetCode超时
 */
//func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//    // 过滤边界
//    guard nums.count > 0 else {
//        return []
//    }
//    var results = [Int]()
//    for i in 0..<nums.count-k+1 {
//        var maxValue = nums[i]
//        for j in 1..<k {
//            maxValue = max(maxValue, nums[i+j])
//        }
//        results.append(maxValue)
//    }
//    return results
//}

/**
 双端队列
 单调递减队列，保证队列头部始终是最大值
 尾部插入数据，判断当前索引值 ？ 尾部索引值，小于：尾插；否则，移除尾部数据
 判断队列内的元素个数是否超出窗口k， 当前索引 - 队列头部索引 ？k 超出，移除队列头部
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    // 过滤边界
    guard nums.count > 0 else {
        return []
    }
    var results = [Int](repeating: 0, count: nums.count-k+1)
    // 双端队列，单调递减，保证头部为最大值
    var deque = [Int]()
    var currentIndex = 0
    for i in 0..<nums.count {
        // 当前索引值 大于等于 队列尾部的值，移除尾部索引
        while !deque.isEmpty && nums[i] >= nums[deque.last!]  {
            deque.removeLast()
        }
        deque.append(i)
        // 队列头部的索引超出当前窗口，移除头部索引
        while deque.first! <= i - k {
            deque.removeFirst()
        }
        // 数组索引小于 k-1 的元素不需要保存记录
        if i >= k - 1 {
            results[currentIndex] = nums[deque.first!]
            currentIndex += 1
        }
    }
    return results
}

var nums = [1,3,-1,-3,5,3,6,7]
var k = 3
maxSlidingWindow(nums, k)

