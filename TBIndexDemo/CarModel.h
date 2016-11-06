//
//  CarModel.h
//  TBIndexDemo
//
//  Created by 何华均 on 2016/11/1.
//  Copyright © 2016年 hhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
+ (instancetype)modelWithDic:(NSDictionary *)dic;
@end
