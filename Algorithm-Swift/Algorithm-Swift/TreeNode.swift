//
//  TreeNode.swift
//  Algorithm-Swift
//
//  Created by 掌上汇通Mac on 2018/11/9.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

import UIKit

 public class TreeNode {
         public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(_ val: Int) {
                 self.val = val
                     self.left = nil
                     self.right = nil
             }
     }
