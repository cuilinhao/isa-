//
//  MJPerson.h
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPerson : NSObject
//@property (assign, nonatomic, getter=isTall) BOOL tall; 可以拿一个二进制位来存储
//@property (assign, nonatomic, getter=isRich) BOOL rich;
//@property (assign, nonatomic, getter=isHansome) BOOL handsome;


//三个属性会生成三个成员变量
// bool值只有0和1 两种情况 故可以拿一个二进制位来存储
//三个属性放到一个字节中

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;
- (void)setThin:(BOOL)thin;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;
- (BOOL)isThin;

@end
