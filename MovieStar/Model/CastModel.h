//
//  CastModel.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//  演员信息模型

#import <Foundation/Foundation.h>
@class AvatarsModel;

@interface CastModel : NSObject
//演员图片
@property (nonatomic, strong) AvatarsModel *avatars;
//演员主页
@property (nonatomic, strong) NSString *alt;
//ID
@property (nonatomic, strong) NSString *ID;
//名字
@property (nonatomic, strong) NSString *name;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
