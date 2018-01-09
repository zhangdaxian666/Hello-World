//
//  MovieHttpTool.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DetailMovieModel;

typedef void(^MovieInfoBlock)(DetailMovieModel *movieModel);

@interface MovieHttpTool : NSObject

//获取热映电影。 开始页。 返回数组
+ (void)getHotMovieWithStart:(NSInteger)start arrayBlock:(ArrayBlock)arrayBlock;
//即将上映的电影  开始页。返回数组
+(void)getComingsoonWithStart:(NSInteger)start arrayBlock:(ArrayBlock)arrayBlock;
//电影详细信息。   电影ID
+(void)getMovieInfoWithID:(NSString *)movieID movieInfoBlock:(MovieInfoBlock)movieInfoBlock;
@end
