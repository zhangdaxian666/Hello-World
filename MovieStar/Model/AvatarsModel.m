//
//  AvatarsModel.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "AvatarsModel.h"

@implementation AvatarsModel

- (id)initWithDictionary:(NSDictionary *)dic
{
    self =[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (id)valueForKeyPath:(NSString *)keyPath
{
    return nil;
}
@end
