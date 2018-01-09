//
//  HttpTools.h
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpSuccess)(id json);
typedef void (^HttpFailure)(NSError *error);
typedef void (^ArrayBlock)(NSMutableArray *resultArray);

@interface HttpTools : NSObject
/**
 *  POST请求
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;
/**
 *  GET请求
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

@end
