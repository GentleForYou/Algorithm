//
//  ViewController.swift
//  Algorithm-Swift
//
//  Created by 掌上汇通Mac on 2018/11/8.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leetcode = LeetCode();
        
//        print("%ld",leetcode.isMonotonic([11,11,9,4,3,3,3,1,-1,-1,3,3,3,5,5,5]));
//       print(leetcode.spiralMatrixIII(5, 6, 1, 4))
//        print(leetcode.decodeAtIndex("a23", 6))
//        print(leetcode.fairCandySwap([1,2,5], [2,4]))
//        print(leetcode.numRescueBoats([3,5,3,4], 5))
        print(leetcode.projectionArea([[2,2,2],[2,1,2],[2,2,2]]))
        
    }


    
}
