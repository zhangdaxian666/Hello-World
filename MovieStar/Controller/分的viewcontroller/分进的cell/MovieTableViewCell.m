//
//  MovieTableViewCell.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/25.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "MovieTableViewCell.h"
#import <Masonry.h>
#define KArcColor  arc4random_uniform(255)

@implementation MovieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
        [self makeConstraint];
    }
    return self;
}
- (void)setUpViews
{
    self.backgroundColor =[UIColor clearColor];
    [self.contentView addSubview:self.shadowBgView];
    [self.shadowBgView addSubview:self.cardBgView];
    [self.cardBgView addSubview:self.miniLogBgView];
    [self.cardBgView addSubview:self.miniLogo];
    [self.cardBgView addSubview:self.bankNameLabel];
    [self.cardBgView addSubview:self.markValuelabel];
    [self.cardBgView addSubview:self.logoNewImageView];
    self.contentView.backgroundColor =[UIColor clearColor];
}
- (void)makeConstraint
{
    [self.shadowBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(12.5);
        make.right.mas_equalTo(self.contentView).offset(-12.5);
        make.height.mas_equalTo(100);
    }];
    [self.cardBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shadowBgView);
        make.left.mas_equalTo(self.shadowBgView);
        make.right.mas_equalTo(self.shadowBgView);
        make.height.mas_equalTo(100);
    }];
    [self.miniLogBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cardBgView).offset(29);
        make.left.mas_equalTo(self.cardBgView).offset(20);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    [self.miniLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.miniLogBgView);
        make.size.mas_equalTo(CGSizeMake(32, 32));
    }];
    [self.bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(30);
        make.left.mas_equalTo(self.miniLogo.mas_right).offset(10);
        make.right.mas_equalTo(self.cardBgView).offset(-15);
        make.height.mas_equalTo(16);
    }];
    [self.markValuelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bankNameLabel.mas_bottom).offset(6);
        make.left.right.mas_equalTo(self.bankNameLabel);
        make.height.mas_equalTo(20);
    }];
    [self.logoNewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cardBgView);
        make.right.mas_equalTo(self.cardBgView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
}
- (UIView *)shadowBgView
{
    if (!_shadowBgView) {
        _shadowBgView =[[UIView alloc]init];
        _shadowBgView.backgroundColor =[UIColor clearColor];
        _shadowBgView.layer.shadowOffset =CGSizeMake(0, -2);
        _shadowBgView.layer.shadowOpacity =0.2;
        _shadowBgView.layer.shadowRadius =4;
    }
    return _shadowBgView;
}
- (UIView *)cardBgView
{
    if (!_cardBgView) {
        _cardBgView =[[UIView alloc]init];
        [_cardBgView.layer addSublayer:self.gradientlayer];
        _cardBgView.layer.shadowColor =[UIColor blackColor].CGColor;
        _cardBgView.layer.cornerRadius =7.0f;
        _cardBgView.layer.masksToBounds =YES;
    }
    return _cardBgView;
}
- (UIView *)miniLogBgView
{
    if (!_miniLogBgView) {
        _miniLogBgView =[[UIView alloc]init];
        _miniLogBgView.backgroundColor =[UIColor whiteColor];
        _miniLogBgView.layer.cornerRadius =21.0f;
        _miniLogBgView.layer.masksToBounds =YES;
    }
    return _miniLogBgView;
}
- (UIImageView *)miniLogo
{
    if (!_miniLogo) {
        _miniLogo =[[UIImageView alloc]init];
        _miniLogo.image =[UIImage imageNamed:@"bankVerify_cmb"];
    }
    return _miniLogo;
}
- (UILabel *)bankNameLabel
{
//    int i;
//    for (i=1; i<11; i++) {
////        NSLog(@"%d",i);
//    }
    int y =1 +arc4random()%100;
    
    if (!_bankNameLabel) {
        _bankNameLabel =[[UILabel alloc]init];
        _bankNameLabel.textAlignment =NSTextAlignmentLeft;
        _bankNameLabel.font =[UIFont systemFontOfSize:16.f];
        _bankNameLabel.textColor =[UIColor grayColor];
        _bankNameLabel.text =[NSString stringWithFormat:@"招商银行:%d",y];
    }
    return _bankNameLabel;
}
- (UILabel *)markValuelabel
{
    if (!_markValuelabel) {
        _markValuelabel = [[UILabel alloc] init];
        _markValuelabel.font = [UIFont systemFontOfSize:15.f];
        _markValuelabel.textColor = [UIColor greenColor];
        _markValuelabel.adjustsFontSizeToFitWidth = YES;
        _markValuelabel.textAlignment = NSTextAlignmentLeft;
        
        _markValuelabel.attributedText =[self bankCardNoAttriStr];
    }
    return _markValuelabel;
}
- (UIImageView *)logoNewImageView
{
    if (!_logoNewImageView) {
        _logoNewImageView =[[UIImageView alloc]init];
    }
    return _logoNewImageView;
}
//  渐变色
- (CAGradientLayer *)gradientlayer
{
    if (!_gradientlayer) {
        _gradientlayer = [CAGradientLayer layer];
        _gradientlayer.colors = @[(__bridge id)RGB(KArcColor, KArcColor, KArcColor).CGColor, (__bridge id)RGB(KArcColor, KArcColor, KArcColor).CGColor];
        _gradientlayer.startPoint = CGPointMake(0, 0); //开始
        _gradientlayer.endPoint = CGPointMake(1.0, 0); //结束
        _gradientlayer.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - 25, 100);
    }
    return _gradientlayer;
}
- (NSMutableAttributedString *)bankCardNoAttriStr
{
    int x =7777 +arc4random()%100;
    //可变字符串
//    NSString *bankcardSub = @"";
    
    NSMutableAttributedString *attriStr =[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"**** **** **** %d",x]];
    [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.f] range:[attriStr.string rangeOfString:@"**** **** ****"]];
//    [attriStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.f] range:[attriStr.string rangeOfString:x]];
    return attriStr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
