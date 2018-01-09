//
//  AppTools.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/21.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "AppTools.h"

@implementation AppTools

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString =[[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] <6) {
        return [UIColor blackColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString =[cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString =[cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor blackColor];
    }
    //r，g，b
    //scanHexInt 扫描十六进制无符整型，unsigned int指针指 扫描到的值
    NSRange range;
    range.location = 0;  //location位置
    range.length =2;
    NSString *rString =[cString substringWithRange:range];
    range.location =2;
    NSString *gString =[cString substringWithRange:range];
    range.location =4;
    NSString *bString =[cString substringWithRange:range];
    
    //Scan values 扫描值
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:1.0f];
}

+ (NSMutableAttributedString *)setLineSpacingWith:(NSString *)contentText lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc]initWithString:contentText];
    NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentText length])];
    return attributedString;
}

+ (NSString *)formatCount:(NSString *)count
{
    NSString *title;
    if ([count intValue] >=10000) { // 得出title内容
        NSString *old =[NSString stringWithFormat:@"%.1f万",[count intValue]/10000.0];
        //   将。0换成空符
        title =[old stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else if (count != 0){
        title =[NSString stringWithFormat:@"%d",[count intValue]];
    }
    return title;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect =CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSString *)formatRating:(NSString *)rating
{
    float ratingInt =[rating floatValue]*0.5;
    if (ratingInt >0.000000 && ratingInt <=0.5) {
        return @"home_star1_img";
    }else if(ratingInt > 0.500000 && ratingInt <= 1.000000){
        return @"home_star2_img";
    }else if(ratingInt > 1.000000 && ratingInt <= 1.500000){
        return @"home_star3_img";
    }else if(ratingInt > 1.500000 && ratingInt <= 2.000000){
        return @"home_star4_img";
    }else if(ratingInt > 2.000000 && ratingInt <= 2.500000){
        return @"home_star5_img";
    }else if(ratingInt > 2.500000 && ratingInt <= 3.000000){
        return @"home_star6_img";
    }else if(ratingInt > 3.000000 && ratingInt <= 3.500000){
        return @"home_star7_img";
    }else if(ratingInt > 3.500000 && ratingInt <= 4.000000){
        return @"home_star8_img";
    }else if(ratingInt > 4.000000 && ratingInt <= 4.500000){
        return @"home_star9_img";
    }else{
        return @"home_star10_img";
    }
}

+ (NSString *)formatCountstr:(NSString *)countStr
{
    int count = [countStr intValue];
    NSString *title = @"";
    if (count >= 10000) { // 1.得出title的内容
        NSString *old = [NSString stringWithFormat:@"%.1f万", count/10000.0];
        // 将.0换成空串
        return title = [old stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else if (count != 0){
        if (count < 0) {
            return title = [NSString stringWithFormat:@"%d", 0];
        }else{
            return title = [NSString stringWithFormat:@"%d", count];
        }
    }else{
        return @"0";
    }
}

@end


