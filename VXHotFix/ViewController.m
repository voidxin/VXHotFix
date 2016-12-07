//
//  ViewController.m
//  VXHotFix
//
//  Created by voidxin on 16/12/7.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testFunction];
}

- (void)testFunction{
   
    NSLog(@"i am voidxin, from native");
    self.contentLabel.text = @"i am voidxin, from native";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
