//
//  Student.m
//  Objc_动态方法解析
//
//  Created by Steven on 2018/6/4.
//  Copyright © 2018年 Steven. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Student

//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    
//    
//}


//-(id)forwardingTargetForSelector:(SEL)aSelector{
//
//    if (aSelector == @selector(test)) {
//
//        return [[Cat alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


//返回空
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    
//    if (aSelector == @selector(test)) {
//        
//        return [[Cat alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


// 方法签名:  返回值类型, 参数类型
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];

    }
    return [super methodSignatureForSelector:aSelector];
}

// NSInvocation  封装的一个函数方法调用 :方法调用者, 方法,方法参数
-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"123344%@---------",    anInvocation.target);
//    anInvocation.target = [[Cat alloc] init];
//
//    [anInvocation invoke];
    
   [anInvocation invokeWithTarget:[[Cat alloc] init]];

}




@end














