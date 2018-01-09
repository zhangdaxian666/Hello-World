//
//  MovieTableViewCell.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/25.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *shadowBgView;  //阴影背景
@property (nonatomic, strong) UIView *cardBgView;    //背景颜色
@property (nonatomic, strong) UIView *miniLogBgView; //小logo的背景图标
@property (nonatomic, strong) UIImageView *miniLogo; //小图标
@property (nonatomic, strong) UILabel *bankNameLabel;//银行名字
@property (nonatomic, strong) UILabel *markValuelabel;//银行卡号
@property (nonatomic, strong) UIImageView *logoNewImageView; //最新的new标志
@property (nonatomic, strong) CAGradientLayer *gradientlayer; //渐变代码
@end
