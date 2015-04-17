//
//  KUtil.m
//  KacheDemo
//
//  Created by 蔡杰 on 14-5-6.
//  Copyright (c) 2014年 ZTSpeech. All rights reserved.//

#import "KUtil.h"

@implementation KUtil

+ (NSInteger)nowTimestamp {
    
    return (NSInteger)ceil([[NSDate date] timeIntervalSince1970]); // Use Int For Computing.
}

+(UInt64)nowTimestampMS
{
  UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    
    return recordTime;
}

+(NSString *)nowTimestampString{
    
    // NSDate *datenow = [NSDate date];
    
    //return [NSString stringWithFormat:@"%lld",(long long)[datenow timeIntervalSince1970]];
    
    return [KUtil nowTimestampMSString];
}

//测试成功
+(NSString*)nowTimestampMSString
{
    
      
    return [NSString stringWithFormat:@"%lld",[KUtil nowTimestampMS]];
}


+(NSString *)TimestampMSStringByDate:(NSDate*)date
{
    UInt64 recordTime = [date timeIntervalSince1970]*1000;
    
    return [NSString stringWithFormat:@"%lld",recordTime];
}


+ (NSInteger)expiredTimestampForLife:(NSInteger)duration{
    
    return [KUtil nowTimestamp] + duration;
}

+(NSString*)timeTransformation:(NSDate*)aDate type:(NSInteger)aType
{
    NSDateFormatter *format;

    if (!format) {
        format = [[NSDateFormatter alloc]init];
    }
    
    switch (aType) {
        case 0:
        {
            [format setDateFormat:@"yyyy-MM-dd HH:mm"];

            break;
        }
        case 1:
        {
            [format setDateFormat:@"yyyy-MM-dd"];
            break;
        }
            
        case 2:
        {
            [format setDateFormat:@"HH:mm"];
            break;

        }
            
            break;
            
        default:
            break;
    }
    
    NSString * dateString = [format stringFromDate:aDate];
    
    return dateString;
    
}

+(NSString*)bigSmallTimewithTimeStr:(NSString *)timeStr
{
    if ([timeStr longLongValue]==0) {
        return @"";
    }
    
    timeStr =[KUtil check:timeStr];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM月dd日"];
    NSTimeInterval timeInterval = [timeStr intValue];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *str =[formatter stringFromDate:confromTimesp];
    return str;

}

//按照指定格式返回时间 (日期+具体时间",如"2月11日 20:19")
+(NSString *)speTimewithTimeStr:(NSString *)timeStr{
    
    //if (![timeStr length] > 0 ) {
        
       
       //return  @"";
    //}
    if ([timeStr longLongValue]==0) {
        return @"";
    }
    
    timeStr =[KUtil check:timeStr];

   NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM月dd日 HH:mm:ss"];
    NSTimeInterval timeInterval = [timeStr intValue];
   NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *str =[formatter stringFromDate:confromTimesp];
    return str;
}

//返回时间所在日期当天的准确时间. (20:19)
+(NSString *)smallTimewithTimeStr:(NSString *)timeStr{
    
    if ([timeStr longLongValue]==0) {
        return @"";
    }
    
    timeStr =[KUtil check:timeStr];

    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
   [formatter setDateFormat:@" HH:mm"];
    NSTimeInterval timeInterval = [timeStr intValue];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
   NSString *str =[formatter stringFromDate:confromTimesp];
    return str;
}


//判断两个日期是否是同一天
+(BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
   NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
   NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
   return [comp1 day] == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year] == [comp2 year];
}


//时间转时间戳
+(NSString *)timeStrTotimeStamp:(NSString*)timeStr{
    
    if ([timeStr longLongValue]==0) {
        return @"";
    }
    
    timeStr =[KUtil check:timeStr];
    //获取当前时间时间串
    //与获得时间串进行对比
    //根据时间差显示不同内容
    //返回内容
    long long nowTime = [[KUtil nowTimestampString]longLongValue]/1000;
    long long gapTime = nowTime - [timeStr longLongValue];
    NSString *timeStamp = nil;
    if (gapTime < 60) {
        //一分钟内显示刚刚
        timeStamp = [NSString stringWithFormat:@"刚刚"];
       }else if(60<=gapTime && gapTime<60*60){
            //一分钟以上且一个小时之内的，显示“多少分钟前”，例如“5分钟前”
            timeStamp = [NSString stringWithFormat:@"%lli分钟前",gapTime/60];
           }else if (60*60<=gapTime && gapTime<60*60*24*3){
                //1小时以上三天以内的显示“今天/昨天/前天+具体时间”
                NSString *dayStr ;
              long long gapDay = gapTime/(60*60*24) ;
               switch (gapDay) {
                        case 0:
                       {
                           //在24小时内,存在跨天的现象. 判断两个时间是否在同一天内.
                            NSDate *date1 = [NSDate date];
                           NSTimeInterval timeInterval = [timeStr intValue];
                            NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
                            BOOL idSameDay = [KUtil isSameDay:date1 date2:date2];
                           if (idSameDay == YES) {
                               dayStr = [NSString stringWithFormat:@"今天"];
                                }else{
                                   dayStr = [NSString stringWithFormat:@"昨天"];
                                    }
                            }
                        break;
                        case 1:
                        dayStr = [NSString stringWithFormat:@"昨天"];
                        break;
                        case 2:
                        dayStr = [NSString stringWithFormat:@"前天"];
                        break;
                        default:
                        break;
                    }
                //        timeStamp = [dayStr stringByAppendingString:[DSUtils smallTimewithTimeStr:timeStrs]];
                timeStamp = [NSString stringWithFormat:@"%@%@",dayStr,[KUtil smallTimewithTimeStr:timeStr]];
                }else{
                    //前天以后的显示"日期+具体时间",如"2月11日 20:19"
                    timeStamp = [NSString stringWithString:[KUtil  speTimewithTimeStr:timeStr]];
                    }
    return [timeStamp copy];
}
+(NSString *)smallTimeStrTotimeStamp:(NSString*)timeStr
{
    if ([timeStr longLongValue]==0) {
        return @"";
    }
    
    timeStr =[KUtil check:timeStr];
    
    long long nowTime = [[KUtil nowTimestampString]longLongValue]/1000;
    long long gapTime = nowTime - [timeStr longLongValue];
    
    NSString *timeStamp = nil;
    
    if (gapTime<60*60*24*3){
        //1小时以上三天以内的显示“今天/昨天/前天+具体时间”
        NSString *dayStr ;
        long long gapDay = gapTime/(60*60*24) ;
        switch (gapDay) {
            case 0:
            {
                //在24小时内,存在跨天的现象. 判断两个时间是否在同一天内.
                NSDate *date1 = [NSDate date];
                NSTimeInterval timeInterval = [timeStr intValue];
                NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
                BOOL idSameDay = [KUtil isSameDay:date1 date2:date2];
                if (idSameDay == YES) {
                    dayStr = [NSString stringWithFormat:@"今天"];
                }else{
                    dayStr = [NSString stringWithFormat:@"昨天"];
                }
            }
                break;
            case 1:
                dayStr = [NSString stringWithFormat:@"昨天"];
                break;
            case 2:
                dayStr = [NSString stringWithFormat:@"前天"];
                break;
            default:
                break;
        }
        //        timeStamp = [dayStr stringByAppendingString:[DSUtils smallTimewithTimeStr:timeStrs]];
        timeStamp = [NSString stringWithFormat:@"%@",dayStr];
    }else{
        //前天以后的显示"日期",如"2月11日"
        timeStamp = [NSString stringWithString:[KUtil  bigSmallTimewithTimeStr:timeStr]];
    }

    
    
    
    return [timeStamp copy];
}




+(NSString*)timeMSTransformation:(NSDate*)aDate
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
    
    NSString * dateString = [format stringFromDate:aDate];
    
    return dateString;
    
}

+(NSString *)check:(NSString *)str
{
    
    if ([str length]==13) {
        
        unsigned long long number = [str longLongValue];
        
        
       // NSLog(@"number = %lld",number);
        NSString *aStr = [NSString stringWithFormat:@"%lld",number/1000];
        
        return aStr;
        
    }
    
    return str;
}


@end
