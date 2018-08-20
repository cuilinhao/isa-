//
//  main.m
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>

/*
 
 结构体：每一个都是独立的
 共同体： 大家都在一个字节里面，
 
 */

union Date {
    int year;//占4个字节
    char month;//占4个字节
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 2011 和 1 占了共同的字节
//        union Date date;
//        date.month = 1;
//        date.year = 2011;
//
        
//         MJPerson *person = [[MJPerson alloc] init];
//        person.tall = YES;
//        person.rich = YES;
//        person.handsome = NO;
//        查看需要多少内存 16
//        NSLog(@"%zd", class_getInstanceSize([MJPerson class]));

        MJPerson *person = [[MJPerson alloc] init];
        person.thin = YES;
        person.rich = YES;
        person.handsome = NO;
        
        
        NSLog(@"thin:%d rich:%d hansome:%d", person.isThin, person.isRich, person.isHandsome);
    }
    return 0;
}
