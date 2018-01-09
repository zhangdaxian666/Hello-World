//
//  AppTools.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/21.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppTools : NSObject

// 字符串转换颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
// 设置行间距为6的字符   contentText传入的字符串
+ (NSMutableAttributedString *)setLineSpacingWith:(NSString *)contentText lineSpacing:(CGFloat)lineSpacing;
// 格式化一个数量。 count传入的数量。
+ (NSString *)formatCount:(NSString *)count;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (NSString *)formatRating:(NSString *)rating;
+ (NSString *)formatCountstr:(NSString *)countStr;

@end
