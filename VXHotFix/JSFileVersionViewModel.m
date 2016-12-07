//
//  JSFileVersionViewModel.m
//  VXHotFix
//
//  Created by voidxin on 16/12/7.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import "JSFileVersionViewModel.h"
#import <JSPatch/JSPatch.h>
#import "JPEngine.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSString+AES256.h"
#define kVersion_URL  @"https://oan5zurgx.qnssl.com/targetversion.txt"
#define kFilePath_URL @"https://oan5zurgx.qnssl.com/hotfix2.js"
//加密秘钥
#define kEnKey @"ab12"
@implementation JSFileVersionViewModel

+ (void)checkVersion{
    //获取服务器端控制的版本号和本地版本号对比
    NSString *path = kVersion_URL;
    NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:path] encoding:NSUTF8StringEncoding error:nil];
    [content isEqualToString:[self _getterAppVersion]] ? ({
        //版本号一致执行js代码
        @try {
            NSString *path = kFilePath_URL;
            NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:path] encoding:NSUTF8StringEncoding error:nil];
            //AES256解密
            content = [content aes256_decrypt:kEnKey];
            NSLog(@"解密后是:%@",content);
            [JPEngine startEngine];
            [JPEngine evaluateScript:content];
        } @catch (NSException *exception) {
            NSLog(@"加载jspatch文件出错");
        } @finally {
            
        }
        
    }) : ({
        //版本号不一致不执行js代码
    });
  
}

+ (NSString *)_getterAppVersion{
    //获取当前app版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *app_version = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"app version:%@",app_version);
    return app_version;
}

@end
