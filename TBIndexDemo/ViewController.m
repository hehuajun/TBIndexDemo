//
//  ViewController.m
//  TBIndexDemo
//
//  Created by 何华均 on 2016/11/1.
//  Copyright © 2016年 hhj. All rights reserved.
//

#import "ViewController.h"
#import "GroupModel.h"
#import "CarModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tb;
@property(nonatomic,strong)NSArray *arrayGroupModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tb = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tb.delegate = self;
    self.tb.dataSource = self;
    [self.tb registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tb];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.arrayGroupModel valueForKey:@"title"];
}

- (NSArray *)arrayGroupModel
{
    if (!_arrayGroupModel) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars" ofType:@"plist"];
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in dataArray) {
            GroupModel *groupModel = [GroupModel modelWithDic:dic];
            [tempArray addObject:groupModel];
        }
        _arrayGroupModel = [tempArray copy];
    }
    return _arrayGroupModel;
}

#pragma mark- table view datasource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GroupModel *groupModel = self.arrayGroupModel[section];
    return groupModel.cars.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    GroupModel *groupModel = self.arrayGroupModel[section];
    return groupModel.title;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayGroupModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    GroupModel *groupModel = self.arrayGroupModel[indexPath.section];
    CarModel *carModel = groupModel.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:carModel.icon];
    cell.textLabel.text = carModel.name;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
