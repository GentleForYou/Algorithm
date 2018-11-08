//
//  palindromic_number.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/16.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "palindromic_number.h"

void palindromic(int n){
    /* 123321
     m n的副本
     p 余数
     */
    int m = n,p = 0;
    
    while (m != 0) {
        p = p*10 + m%10;
        m /= 10;
    }
    if (p == n) {
        printf("是回文数");
    } else {
        printf("不是回文数");
    }
    
}
