//
//  ListModel.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, assign) BOOL isSelected;

@end
