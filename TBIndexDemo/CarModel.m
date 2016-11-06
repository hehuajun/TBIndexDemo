//
//  CarModel.m
//  TBIndexDemo
//
//  Created by 何华均 on 2016/11/1.
//  Copyright © 2016年 hhj. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel
+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    CarModel *car = [[self alloc]init];
    [car setValuesForKeysWithDictionary:dic];
    return car;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
