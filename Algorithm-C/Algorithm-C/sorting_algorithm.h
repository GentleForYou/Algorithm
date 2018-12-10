//
//  sorting_algorithm.h
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/22.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//  排序算法

#ifndef sorting_algorithm_h
#define sorting_algorithm_h

#include <stdio.h>

#endif /* sorting_algorithm_h */

//冒泡排序
int * bubbleSort(int arr[], int size);

//选择排序
int * selection_sort(int arr[], int size);

//插入排序
int * insertion_sort(int arr[], int size);

//希尔排序
int * shell_sort(int arr[], int size);

//归并排序
int * merge_sort(int arr[], int reg[], int start, int end);

//快速排序
int * quick_sort_recursive(int arr[], int low, int high);
