//
//  RatingModel.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "RatingModel.h"

@implementation RatingModel

- (id)initWithDictionary:(NSDictionary *)dic
{
    self =[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        self.max =[NSString stringWithFormat:@"%@",dic[@"max"]];
        self.average = [NSString stringWithFormat:@"%@",dic[@"average"]];
        self.stars = [NSString stringWithFormat:@"%@",dic[@"stars"]];
        self.min = [NSString stringWithFormat:@"%@",dic[@"min"]];
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
