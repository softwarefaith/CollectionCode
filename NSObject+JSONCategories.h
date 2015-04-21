//
//  NSObject+JSONCategories.h
//  ZTRecognizerDemo
//
//  Created by 蔡杰 on 14-7-4.
//  Copyright (c) 2014年 xiaohongman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONCategories)


/**
 *  NSArray or  NSDictionary  转换为NSData
 *
 *  @return NSData
 */
-(NSData*)JSONString;
@end
