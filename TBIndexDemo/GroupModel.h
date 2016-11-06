//
//  GroupModel.h
//  TBIndexDemo
//
//  Created by 何华均 on 2016/11/1.
//  Copyright © 2016年 hhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property(nonatomic,strong)NSArray *cars;
@property(nonatomic,strong)NSString *title;
+ (instancetype)modelWithDic:(NSDictionary *)dic;
@end
