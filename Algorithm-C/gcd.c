//
//  gcd.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/16.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "gcd.h"



//最大公约数
int gcd(int n1, int n2) {
    if (n2 != 0) {
        return gcd(n2, n1%n2);
    }
    return n1;
}
//最小公倍数
int min_multiple(int n1, int n2) {
    return n1*n2/gcd(n1, n2);
}

void twoNum(int n1, int n2){
    printf("最大公约数 : %d\nd最小公倍数 : %d",gcd(n1, n2),min_multiple(n1, n2));
}
