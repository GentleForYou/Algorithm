//
//  prime_number.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/17.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "prime_number.h"
#include <math.h>
void prime_num(int n)
{
    if (n < 2) {
        printf("无质数");
    }
    
    for (int i = 2; i <= n; i++) {
        int flag = 0;
        for (int j = 2; j*j <= i; j++) {
            if (i%j == 0) {
                flag =  1;
                break;
            }
        }
        if (flag == 0) {
            printf("%d\n",i);
        }
    }
    
}

void isArmstrong_num(int n){
    
    int i = 0,sum = 0,m = n;
    int arr[100];
    while (n != 0) {
        arr[i] = n%10;
        n /= 10;
        i++;
    }
    for (int j = i-1; j > -1; j--) {
      sum += pow(arr[j], i);
    }
    if (m == sum) {
        printf("%d是Armstrong数",m);
    } else {
        printf("%d不是Armstrong数",m);
    }
}
