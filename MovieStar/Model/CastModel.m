//
//  CastModel.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "CastModel.h"
#import "AvatarsModel.h"

@implementation CastModel

- (id)initWithDictionary:(NSDictionary *)dic
{
    self =[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        self.ID =[NSString stringWithFormat:@"%@",dic[@"id"]];
        self.alt =[NSString stringWithFormat:@"%@",dic[@"alt"]];
        self.name =[NSString stringWithFormat:@"%@",dic[@"name"]];

        if ([dic[@"avatars"] isKindOfClass:[NSDictionary class]]) {
            self.avatars = [[AvatarsModel alloc]initWithDictionary:dic[@"avatars"]];
        }
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
