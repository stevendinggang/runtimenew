//
//  ViewController.m
//  Objc_动态方法解析
//
//  Created by Steven on 2018/6/3.
//  Copyright © 2018年 Steven. All rights reserved.
//

#import "ViewController.h"
#import "DGPersion.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[[DGPersion alloc]init] test]; // 动态解析方法
    
//  [DGPersion testClass];
    [[[Student alloc]init] test];  //消息转发阶段

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
