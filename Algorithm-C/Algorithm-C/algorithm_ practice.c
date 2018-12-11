//
//  algorithm_ practice.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/24.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "algorithm_ practice.h"
#include <math.h>

int is_square_num(int n)
{
    int a = (int)sqrt(n);
    if (a * a == n) {
        return 1;
    }
    return 0;
}
void square_number()
{
    int n = 1;
    while (1) {
        int result1 = is_square_num(n+100);
        int result2 = is_square_num(n+268);
        if (result1 && result2) {
            printf("这个数是 : %d",n);
            break;
        } else {
            n++;
        }
    }
}

void multiplication_tables(void)
{
    for (int i = 1; i <= 9; i++) {
        for (int j = 1; j <= i; j++) {
            printf("%d * %d = %d  ",i,j,i*j);
        }
        printf("\n");
    }
}

void rabbit(void)
{
    long a = 1,b = 1;
    for (long i = 1; i <= 20; i++) {
        printf("%ld   %ld\n",a , b);
        a = a+b;
        b = a+b;
    }
}

void prime_factor(int n)
{
    printf("%d=",n);
    for (int i = 2; i <= n; i++) {
        while (n%i == 0) {
            printf("%d",i);
            n/=i;
            if (n != 1) printf("*");
        }
    }
}

void perfect_number(void)
{
    printf("1000以内的完数有: ");
    for (int i = 2; i <= 1000; i++) {
        int sum = 1;
        for (int j = 2; j <= i/2; j++) {
            if (i%j == 0) {
                sum += j;
            }
        }
        if (sum == i) {
            printf("%d ",i);
        }
    }
}

int number_off1(int n, int m, int k){
    /*
     old = (new + m) % (n-k+1)
     最后一圈:  原  1  2
              旧   1  2(最后一圈的旧值)
              新      1
     通过最后一圈的旧值,倒推第1圈的旧值
     */
    if (k == n-1) {
        return 2;
    }
    return (number_off1(n, m, k+1)+m)%(n-k+1);
}
void number_off(int n, int m)
{
    //约瑟夫环
    //for循环写法
//    int i,r = 0;
//    for (i = 2; i <= n; i++) {
//        r = (r+m)%i;
//    }
//    printf("最后一个人,原先圈子的号是 : %d",r+1);
    
    //递归解法 n : 人数, m : 循环单位 , k : 第几次k循环
    printf("%d",number_off1(n, m, 1));
}

void creat_linked_list()
{
    
}
void swapaa(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
void theWholeArrangement(int arr[],int k, int n)
{
    if (k == n) {
        for (int i = 0; i < n; i++) {
            printf("%d ", arr[i]);
        }
        printf("\n");
        return;
    } else {
        for (int i = k;i < n; i++) {
            swapaa(&arr[k], &arr[i]);
            theWholeArrangement(arr, k+1, n);
            swapaa(&arr[k], &arr[i]);
        }
    }
}
