//
//  AppDelegate.m
//  VXHotFix
//
//  Created by voidxin on 16/12/7.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import "AppDelegate.h"
#import "JSFileVersionViewModel.h"

@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [JSFileVersionViewModel checkVersion];
    
    return YES;
}







@end
