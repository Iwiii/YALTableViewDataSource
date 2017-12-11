//
//  ViewController.m
//  YALExample
//
//  Created by yuwei on 2017/12/10.
//  Copyright © 2017年 yuwei. All rights reserved.
//

#import "ViewController.h"
#import "YALDataManager.h"
#import "YALDataSource.h"
@interface ViewController ()<UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) YALDataSource *dataSource;
@property (nonatomic,strong) YALDataManager *dataManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.dataSource = [YALDataSource new];
    //把dataSource 和dataManager 分开 是考虑到 dataManager 可以管理多个dataSource, 以后可以实现子类用协议来控制
    self.dataManager = [[YALDataManager alloc] initWithDataSource:self.dataSource cellIdentifier:@"cell" ];
    self.tableView.dataSource = self.dataManager;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    [self.dataManager updateDataBack:^{
        [weakSelf.tableView reloadData];
    }];
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.dataManager tableView:tableView heightForRowAtIndexPath:indexPath];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
