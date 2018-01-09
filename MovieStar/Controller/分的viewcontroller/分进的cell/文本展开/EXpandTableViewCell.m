//
//  EXpandTableViewCell.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "EXpandTableViewCell.h"
#import "ListFrameModel.h"

@implementation EXpandTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    self.questionLb =[[UILabel alloc]init];
    self.questionLb.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.questionLb];
    self.questionLb.textAlignment =NSTextAlignmentLeft;
    
    self.arrowIv =[[UIImageView alloc]init];
    [self.contentView addSubview:self.arrowIv];
    
    self.line =[[UIView alloc]init];
    [self.contentView addSubview:self.line];
    self.line.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    self.answerLb =[[UILabel alloc]init];
    [self.contentView addSubview:self.answerLb];
    self.answerLb.font =[UIFont systemFontOfSize:15];
    self.answerLb.textAlignment =NSTextAlignmentLeft;
    self.answerLb.numberOfLines =0;
    
    self.lineI =[[UIView alloc]init];
    [self.contentView addSubview:self.lineI];
    self.lineI.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
}

- (void)setFrameModel:(ListFrameModel *)frameModel
{
    _frameModel =frameModel;
    self.questionLb.frame =frameModel.questionFrame;
    self.arrowIv.frame =frameModel.arrowFrame;
    self.line.frame =frameModel.firstLineFrame;
    self.answerLb.frame =frameModel.answerFrame;
    self.lineI.frame =frameModel.secondLineFrame;
    
    self.questionLb.text =[NSString stringWithFormat:@"%@",frameModel.listModel.question];
    self.answerLb.text =[NSString stringWithFormat:@"%@",frameModel.listModel.answer];
    if (frameModel.listModel.isSelected) {
        self.arrowIv.image =[UIImage imageNamed:@"arrowTop"];
    }else{
        self.arrowIv.image =[UIImage imageNamed:@"arrowdown"];
    }
}

@end
