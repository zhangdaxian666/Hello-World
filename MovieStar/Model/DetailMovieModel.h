//
//  DetailMovieModel.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//  详情页电影模型

#import <Foundation/Foundation.h>
@class RatingModel,CastModel,AvatarsModel;

@interface DetailMovieModel : NSObject

@property (nonatomic, strong) RatingModel *rating;        //电影评分
@property (nonatomic, strong) NSString *collect_count;    //评分人数
@property (nonatomic, strong) NSMutableArray *genres;     //电影类型
@property (nonatomic, strong) NSMutableArray *casts;      //演员
@property (nonatomic, strong) NSString *title;            //名字
@property (nonatomic, strong) NSString *original_title;   //原始名字
@property (nonatomic, strong) NSString *subtype;          //类型
@property (nonatomic, strong) NSMutableArray *directors;  //导演
@property (nonatomic, strong) NSString *year;             //年份
@property (nonatomic, strong) AvatarsModel *images;       //图片
@property (nonatomic, strong) NSString *alt;              //电影地址
@property (nonatomic, strong) NSString *ID;               //电影ID

@property (nonatomic, strong) NSString *ratings_count;    //
@property (nonatomic, strong) NSString *comments_count;   //
@property (nonatomic, strong) NSString *reviews_count;    //
@property (nonatomic, strong) NSString *wish_count;       //

@property (nonatomic, strong) NSString *douban_site;      //豆瓣电影主页
@property (nonatomic, strong) NSString *mobie_url;        //手机url
@property (nonatomic, strong) NSString *share_url;        //分享地址url
@property (nonatomic, strong) NSString *schedule_url;     //购票地址url
@property (nonatomic, strong) NSMutableArray *countries;  //所属国家
@property (nonatomic, strong) NSString *summary;          //电影简介
@property (nonatomic, strong) NSMutableArray *aka;        //

@property (nonatomic, assign) BOOL isExpanded;            //

- (id)initWithDictionary:(NSDictionary *)dic;

@end
