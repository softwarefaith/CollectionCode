//
//  NSString+JSONCategories.m
//  ZTRecognizerDemo
//
//  Created by 蔡杰 on 14-7-4.
//  Copyright (c) 2014年 xiaohongman. All rights reserved.
//

#import "NSString+JSONCategories.h"

@implementation NSString (JSONCategories)
-(id)JSONValue
{
    
    
    if (![self length]>0 ) {
        
        return nil;
    }
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    __autoreleasing NSError *error;
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSLog(@"%@",error);
    
    if (error != nil) {
        return nil;
    }
    
    return result;
    
}


@end
