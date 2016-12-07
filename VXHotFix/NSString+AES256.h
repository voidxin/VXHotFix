//
//  NSString+AES256.h
//  VXHotFix
//
//  Created by voidxin on 16/12/7.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#import "NSData+AES256.h"
@interface NSString (AES256)
-(NSString *) aes256_encrypt:(NSString *)key;
-(NSString *) aes256_decrypt:(NSString *)key;
@end
