//
//  NSObject+JSONCategories.m
//  ZTRecognizerDemo
//
//  Created by 蔡杰 on 14-7-4.
//  Copyright (c) 2014年 xiaohongman. All rights reserved.
//

#import "NSObject+JSONCategories.h"

@implementation NSObject (JSONCategories)
-(NSData *)JSONString
{
    NSError *error = nil;
    
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    
    //NSLog(@"error = %@",error);
    
    
    if (error != nil) {
    

        return nil;
    }
    
    return result;
}
@end
