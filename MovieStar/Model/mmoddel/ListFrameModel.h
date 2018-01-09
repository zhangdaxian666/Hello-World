//
//  ListFrameModel.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ListModel.h"

@interface ListFrameModel : NSObject

@property (nonatomic, assign) CGRect questionFrame;
@property (nonatomic, assign) CGRect arrowFrame;
@property (nonatomic, assign) CGRect firstLineFrame;
@property (nonatomic, assign) CGRect answerFrame;
@property (nonatomic, assign) CGRect secondLineFrame;

//未展开的高度
@property (nonatomic, assign) CGFloat unExpandCellHeight;
//展开的高度
@property (nonatomic, assign) CGFloat expandCellHeight;

@property (nonatomic, strong) ListModel *listModel;
@end
