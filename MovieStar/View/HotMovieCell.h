//
//  HotMovieCell.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/22.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;

@interface HotMovieCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableview;

+ (CGFloat)getCellHeight:(MovieModel *)model;

@property (nonatomic, strong) MovieModel *model;

@end
