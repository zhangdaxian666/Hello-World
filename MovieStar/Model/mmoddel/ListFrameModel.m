//
//  ListFrameModel.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ListFrameModel.h"

@implementation ListFrameModel

- (void)setListModel:(ListModel *)listModel
{
    _listModel =listModel;
    
    self.questionFrame =CGRectMake(10, 18, Width-60, 15);
    self.arrowFrame =CGRectMake(Width-30, 18, 15, 15);
    self.firstLineFrame =CGRectMake(0, 43, Width, 1);
    self.unExpandCellHeight =CGRectGetMaxY(self.firstLineFrame)+5;
    
    CGFloat answerH =[Help getStringHeight:listModel.answer andFont:15 andWidth:Width-20];
    self.answerFrame =CGRectMake(10, 50, Width -20, answerH);
    self.secondLineFrame =CGRectMake(0, CGRectGetMaxY(self.answerFrame)+5, Width, 1);
    
    self.expandCellHeight =CGRectGetMaxY(self.secondLineFrame);
}
@end
