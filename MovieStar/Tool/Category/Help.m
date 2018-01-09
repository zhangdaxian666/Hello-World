//
//  Help.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "Help.h"

@implementation Help

// 计算文本宽度
+ (float)getStringWidth:(NSString *)text andFont:(float)font
{
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName];
    CGSize size =[text boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.width+1;
}
// 计算文本高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width
{
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName];
    CGSize size =[text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height+1;
}
@end
