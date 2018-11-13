//
//  LeetCode.swift
//  Algorithm-Swift
//
//  Created by 掌上汇通Mac on 2018/11/8.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

import UIKit

class LeetCode: NSObject {
    /*
     单调数列
     如果数组是单调递增或单调递减的，那么它是单调的。
     
     如果对于所有 i <= j，A[i] <= A[j]，那么数组 A 是单调递增的。 如果对于所有 i <= j，A[i]> = A[j]，那么数组 A 是单调递减的。
     
     当给定的数组 A 是单调数组时返回 true，否则返回 false。
     示例 1：
     
     输入：[1,2,2,3]
     输出：true
     示例 2：
     
     输入：[6,5,4,4]
     输出：true
     示例 3：
     
     输入：[1,3,2]
     输出：false
     示例 4：
     
     输入：[1,2,4,5]
     输出：true
     示例 5：
     
     输入：[1,1,1]
     输出：true
     */
     func isMonotonic(_ A: [Int]) -> Bool {
        
        
        var a = 0,b=0;
        for (i,item) in A.enumerated() {
            if (i > 0) {
                if(item > A[i-1]) {//递增
                    a = 1
                } else if(item < A[i-1]) {//递减
                    b = 1
                } else {
                    if (a != b && a > 0) {
                        a = 1
                    } else if (a != b && b > 0) {
                        b = 1
                    }
                }
                if a*b > 0 {
                    return false;
                }
            }
        }
        return true;
    }
    
    /*
     二叉树的最大深度
     给定一个二叉树，找出其最大深度。
     
     二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
     
     说明: 叶子节点是指没有子节点的节点。
     
     示例：
     给定二叉树 [3,9,20,null,null,15,7]，
     
     3
     / \
     9  20
     /  \
     15   7
     返回它的最大深度 3 。
     */
    func maxDepth(_ root : TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right))+1
    }
    
}
