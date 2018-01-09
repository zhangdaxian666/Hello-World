//
//  MovieHttpTool.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//  32

#import "MovieHttpTool.h"
#import "MovieModel.h"
#import "DetailMovieModel.h"

@implementation MovieHttpTool

+ (void)getHotMovieWithStart:(NSInteger)start arrayBlock:(ArrayBlock)arrayBlock
{
    NSString *urlString =[NSString stringWithFormat:@"%@?count=10&start=%ld",HotMovie_URL,start];
    NSLog(@"HotMovie_URL = %@",urlString);
    [HttpTools getWithURL:urlString params:nil success:^(id json) {
        NSMutableArray *resArray =[[NSMutableArray alloc]init];
        if ([json[@"subjects"] isKindOfClass:[NSArray class]]) {
            NSArray *subjectsArr =json[@"subjects"];
            for (NSDictionary *dict in subjectsArr) {
                MovieModel *movieM =[[MovieModel alloc]initWithDictionary:dict];
                [resArray addObject:movieM];
            }
        }
        if (arrayBlock) {
            arrayBlock(resArray);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络出错"];
    }];
}

+ (void)getComingsoonWithStart:(NSInteger)start arrayBlock:(ArrayBlock)arrayBlock
{
    NSString *urlString =[NSString stringWithFormat:@"%@?count=10&start=%ld",ComingsoonMovie_URL,start];
    NSLog(@"ComingsoonMovie_URL = %@",urlString);
    [HttpTools getWithURL:urlString params:nil success:^(id json) {
        NSMutableArray *resArray =[[NSMutableArray alloc]init];
        if ([json[@"subjects"] isKindOfClass:[NSArray class]]) {
            NSArray *subjectsArr =json[@"subjects"];
            for (NSDictionary *dict in subjectsArr) {
                MovieModel *movieM =[[MovieModel alloc]initWithDictionary:dict];
                [resArray addObject:movieM];
            }
        }
        if (arrayBlock) {
            arrayBlock(resArray);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络出错"];
    }];
}

+ (void)getMovieInfoWithID:(NSString *)movieID movieInfoBlock:(MovieInfoBlock)movieInfoBlock
{
    NSString *urlString =[NSString stringWithFormat:@"%@%@",MovieInfo_URL,movieID];
    NSLog(@"MovieInfo_URL = %@",urlString);
    [HttpTools getWithURL:urlString params:nil success:^(id json) {
        DetailMovieModel *model =[[DetailMovieModel alloc]init];
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict =json;
            DetailMovieModel *m =[[DetailMovieModel alloc]initWithDictionary:dict];
            model = m;
        }
        movieInfoBlock(model);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络出错"];
    }];
}
@end
