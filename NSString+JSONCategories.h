//
//  NSString+JSONCategories.h
//  ZTRecognizerDemo
//
//  Created by 蔡杰 on 14-7-4.
//  Copyright (c) 2014年 xiaohongman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSONCategories)


/**
 *  将NSString 转换为 NSArray  或 NSDictionary
 *
 *  @returnb id : NSArray  or  NSDictionary
 */
-(id)JSONValue;


@end
