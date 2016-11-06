//
//  GroupModel.m
//  TBIndexDemo
//
//  Created by 何华均 on 2016/11/1.
//  Copyright © 2016年 hhj. All rights reserved.
//

#import "GroupModel.h"
#import "CarModel.h"

@implementation GroupModel
+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    GroupModel *groupModel = [[self alloc]init];
    [groupModel setValuesForKeysWithDictionary:dic];
    return groupModel;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (void)setCars:(NSArray *)cars
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *car in cars) {
        CarModel *carModel = [CarModel modelWithDic:car];
        [tempArray addObject:carModel];
    }
    _cars = [tempArray copy];
}
@end
