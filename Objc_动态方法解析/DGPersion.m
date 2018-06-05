//
//  DGPersion.m
//  Objc_动态方法解析
//
//  Created by Steven on 2018/6/3.
//  Copyright © 2018年 Steven. All rights reserved.
//

#import "DGPersion.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation DGPersion


//struct method_t{
//
//    SEL sel;
//    char *type;
//    IMP imp;
//}

void c_other(id self, SEL _cmd)
{
    NSLog(@"%@----%@",self,NSStringFromSelector(_cmd));
}



+ (BOOL)resolveClassMethod:(SEL)sel{
    
    if (sel == @selector(testClass)) {
        //        // 获取其他方法
            // 第一个参数是object_getClass(self)
        class_addMethod(object_getClass(self), sel, (IMP)c_other, "v16@0:8");
        // 返回YES代表有动态添加方法
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}


//+ (BOOL)resolveClassMethod:(SEL)sel{
//
//    if (sel == @selector(testClass)) {
//        //        // 获取其他方法
//        Method method = class_getInstanceMethod(self, @selector(other));
//
//        // 动态添加test方法的实现
//        class_addMethod(self, sel,
//                        method_getImplementation(method),
//                        method_getTypeEncoding(method));
//
//        // 返回YES代表有动态添加方法
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}

+(void)otherClass{
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 200, 100)];
    
    redView.backgroundColor = [UIColor redColor];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview: redView] ;
    
    NSLog(@"%@",redView);
}

-(void)other{
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 200, 100)];
    
    redView.backgroundColor = [UIColor redColor];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview: redView] ;
    
    NSLog(@"%@",redView);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{

    if (sel == @selector(test)) {
        //        // 获取其他方法
        Method method = class_getInstanceMethod(self, @selector(other));

        // 动态添加test方法的实现
        class_addMethod(self, sel,
                        method_getImplementation(method),
                        method_getTypeEncoding(method));

        // 返回YES代表有动态添加方法
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//
//    if (sel == @selector(test)) {
//        //        // 获取其他方法
////        Method method = class_getInstanceMethod(self, @selector(other));
//
//        // 动态添加test方法的实现
//        class_addMethod(self, sel,
//                        (IMP)c_other,
//                        "v16@0:8");
//
//        // 返回YES代表有动态添加方法
//        return YES;
//    }
//
//    return [super resolveInstanceMethod:sel];
//}




@end
