//
//  NSString+AES256.m
//  VXHotFix
//
//  Created by voidxin on 16/12/7.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import "NSString+AES256.h"

@implementation NSString (AES256)

-(NSString *) aes256_encrypt:(NSString *)key
{
     NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
   
    NSData *result = [data aes256_encrypt:key];
    
    if (result && result.length > 0) {
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
    
}

-(NSString *) aes256_decrypt:(NSString *)key
{
    
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
  
    
    
    NSData* result = [data aes256_decrypt:key];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}
@end
