//
//  HttpTools.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "HttpTools.h"
#import <AFNetworking.h>

@implementation HttpTools

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data =responseObject;
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (success) {
            success(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data =responseObject;
        id dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (success) {
            success(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
