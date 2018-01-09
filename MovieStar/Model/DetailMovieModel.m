//
//  DetailMovieModel.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/20.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "DetailMovieModel.h"
#import "RatingModel.h"
#import "CastModel.h"
#import "AvatarsModel.h"

@implementation DetailMovieModel

- (id)initWithDictionary:(NSDictionary *)dic
{
    self =[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        self.rating =[[RatingModel alloc]initWithDictionary:dic[@"rating"]];
        self.ID =[NSString stringWithFormat:@"%@",dic[@"id"]];
        self.collect_count =[NSString stringWithFormat:@"%@",dic[@"collect_count"]];
        
        self.genres =[[NSMutableArray alloc]initWithArray:dic[@"genres"]];
        
        if (dic[@"casts"]) {
            NSArray *casts = dic[@"casts"];
            NSMutableArray *resArr = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dict in casts) {
                CastModel *castM = [[CastModel alloc] initWithDictionary:dict];
                [resArr addObject:castM];
            }
            self.casts = resArr;
        }
        if (dic[@"directors"]) {
            NSArray *directors = dic[@"directors"];
            NSMutableArray *resArr = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in directors) {
                CastModel *castM = [[CastModel alloc] initWithDictionary:dict];
                [resArr addObject:castM];
            }
            self.directors = resArr;
        }
        if (dic[@"images"]) {
            self.images = [[AvatarsModel alloc] initWithDictionary:dic[@"images"]];
        }
        self.aka = [[NSMutableArray alloc] initWithArray:dic[@"aka"]];
        self.countries = [[NSMutableArray alloc] initWithArray:dic[@"countries"]];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(id)valueForKeyPath:(NSString *)keyPath
{
    return nil;
}
@end
