//
//  EXpandTableViewCell.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListFrameModel;

@interface EXpandTableViewCell : UITableViewCell

@property (nonatomic, strong) ListFrameModel *frameModel;
@property (nonatomic, strong) UILabel *questionLb;
@property (nonatomic, strong) UILabel *answerLb;
@property (nonatomic, strong) UIImageView *arrowIv;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *lineI;

@end
