//
//  overturn.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/19.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "overturn.h"
char *overturn(char str[], size_t len){
    
    char *start = str;
    char *end = str + len - 1;
    char temp;
    if (str != NULL) {
        while (start < end) {
           
            temp = *start;
            *start++ = *end;
            *end-- = temp;
        }
    }
    return str;
}
