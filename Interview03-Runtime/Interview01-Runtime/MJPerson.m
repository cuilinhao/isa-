//
//  MJPerson.m
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

//Mask 掩码，一般是按位运算的
//#define MJTallMask 1
//#define MJRichMask 2
//#define MJHandsomeMask 4

//#define MJTallMask 0b00000001
//#define MJRichMask 0b00000010
//#define MJHandsomeMask 0b00000100


//------------------------------
//类 原类  最后三位都为0
//64 存很多信息， 其中33位 有用

//什么是isa?
//在arm64之后，采用共用体，把64位存储很多信息， 其中33位存储地址值（33是存class），最后加三位0
/*
 在arm64架构之前，isa就是一个普通的指针，存储着Class，Meta-class对象的内存地址
 从arm64架构开始，对isa进行了优化，变成了一个共同体(union)结构，还使用位域来存储更多的信息
 
 */

//1 向左移0位
#define MJTallMask (1<<0)
//1 向左移1位
#define MJRichMask (1<<1)
//1 左移2位
#define MJHandsomeMask (1<<2)
#define MJThinMask (1<<3)


/*
 位运算 &可以取出特定的位（取那一位，则设置哪一位为1，其他位置为0）

 都为1 则1 其余为0
  0011
 &1111
---------
 0011
 */


@interface MJPerson()
{

//只占一个字节 0b 0000 0011
//0b 表示二进制 如果按位 最右边是高 然后是富，帅
//char _tallRichHansome;
    
    /*
     union 公用体
     
     bits 放所有的数据，且bits是公用体
     结构体只是为了可读性，告诉读者结构体中有tall，rich
     
     */
    
    union {
        
        int bits;
        
        //位域
        struct {
            char tall : 4;
            char rich : 4;
            char handsome : 4;
            char thin : 4;
        };
    } _tallRichHandsome;
}

@end

@implementation MJPerson

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _tallRichHandsome = 0b00000011;
//    }
//    return self;
//}


- (void)setTall:(BOOL)tall
{
    //如果传进来tall 是1  则要tall为1 ，可以使用或运算|
    //或运算
    //取反 然后按位与
    
    if (tall) {
        _tallRichHandsome.bits |= MJTallMask;
    } else {
        //取反 然后按位与
        _tallRichHandsome.bits &= ~MJTallMask;
    }
}

- (BOOL)isTall
{
    //return !!(_tallRichHandsome & 1);
    return !!(_tallRichHandsome.bits & MJTallMask);
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsome.bits |= MJRichMask;
    } else {
        _tallRichHandsome.bits &= ~MJRichMask;
    }
}

- (BOOL)isRich
{
    //!!表示可强转成bool类型
    //return !!(_tallRichHandsome & 2);
    return !!(_tallRichHandsome.bits & MJRichMask);
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _tallRichHandsome.bits |= MJHandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~MJHandsomeMask;
    }
}

- (BOOL)isHandsome
{
    //return !!(_tallRichHandsome & 4);
    return !!(_tallRichHandsome.bits & MJHandsomeMask);
}


- (void)setThin:(BOOL)thin
{
    if (thin) {
        _tallRichHandsome.bits |= MJThinMask;
    } else {
        _tallRichHandsome.bits &= ~MJThinMask;
    }
}

- (BOOL)isThin
{
    return !!(_tallRichHandsome.bits & MJThinMask);
}

@end
