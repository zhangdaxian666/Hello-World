//
//  AvatarsModel.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
// 图片信息模型

#import <Foundation/Foundation.h>

@interface AvatarsModel : NSObject

@property (nonatomic, strong) NSString *small; //小
@property (nonatomic, strong) NSString *large; //大
@property (nonatomic, strong) NSString *medium; //中

- (id)initWithDictionary:(NSDictionary *)dic;

@end
