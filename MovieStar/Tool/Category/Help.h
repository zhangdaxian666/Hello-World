//
//  Help.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Help : NSObject

// 计算文本的宽度
+ (float)getStringWidth:(NSString *)text andFont:(float)font;
// 计算文本的高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width;

@end
