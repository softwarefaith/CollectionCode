//
//  UIImage+UIImageExt.h
//  SmartAssist
//
//  Created by 蔡杰 on 14-8-2.
//  Copyright (c) 2014年 ZTSpeech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageExt)
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end
