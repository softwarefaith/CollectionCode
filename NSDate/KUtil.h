//
//  KUtil.h
//
//
//  Created by 蔡杰 on 14-5-6.
//  Copyright (c) 2014年 ZTSpeech. All rights reserved.
//

#import <Foundation/Foundation.h>

//The time stamp    or   time

@interface KUtil : NSObject

+ (NSInteger)expiredTimestampForLife:(NSInteger)duration;

+ (NSInteger)nowTimestamp;

+(NSString *)nowTimestampString;

//返回时间戳为毫秒级别  如果返回微妙级别在*1000
+(UInt64)nowTimestampMS;

+(NSString*)nowTimestampMSString;

//根据给定的date返回毫秒时间戳--
+(NSString*)timeTransformation:(NSDate*)aDate type:(NSInteger)aType;




/**
 *  按照指定格式返回时间戳//需求:
 //1，一分钟之内的显示“刚刚”
 //2，一分钟以上且一个小时之内的，显示“多少分钟前”，例如“5分钟前”
 //3，1小时以内的字颜色为黄色（以上三点与目前一样）
 //4，1小时以上三天以内的显示“今天/昨天/前天+具体时间”
 //5，前天以后的显示"日期+具体时间",如"2月11日 20:19"
 //数据前提:
 //1, 提供一个时间串
 //方法调用:
 //1, [类名 timeStrTotimeStamp:时间串];
 //方法来源:
 //1, 通过网络代码进行改造
 *
 *  @param timeStr 时间戳字符串
 *
 *  @return 查看上述
 */
+(NSString *)timeStrTotimeStamp:(NSString*)timeStr;

//返回时间所在日期当天的准确时间. (20:19)
+(NSString *)smallTimewithTimeStr:(NSString *)timeStr;

//按照指定格式返回时间 (日期+具体时间",如"2月11日 20:19")
+(NSString *)speTimewithTimeStr:(NSString *)timeStr;
//按照指定格式返回时间(日期)
+(NSString*)bigSmallTimewithTimeStr:(NSString *)timeStr;



//返回结果  今天、昨天 前天   具体日期
+(NSString *)smallTimeStrTotimeStamp:(NSString*)timeStr;




//当前时间转换为时间戳
//+(NSString*)timeTransformation:(NSDate*)aDate;
+(NSString*)timeMSTransformation:(NSDate*)aDate;

/**
 *  首先 [[NSDate date] timeIntervalSince1970] 是可以获取到后面的毫秒 微秒的 ，只是在保存的时候省略掉了， 如一个时间戳不省略的情况下为 1395399556.862046 ，省略掉后为一般所见 1395399556 。所以想取得毫秒时用获取到的时间戳 *1000 ，想取得微秒时 用取到的时间戳 * 1000 * 1000 。
 */
/**
 *  毫秒也是可以的.你可以采用yyyy-MM-dd HH:mm:ss.fffffff这个格式化形式进行时间的转换。
 */

@end
