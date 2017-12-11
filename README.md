# YALTableViewDataSource
## purpose
To separate UITableViewDataSource from UIController that we can reduce lots of codes in controller.

you'd better inherit the two class `YALDataManager` and `YALDataSource` and implement your own class.


## structrue
### YALDataManager
```objc
    self.dataSource = [YALDataSource new];
    self.dataManager = [[YALDataManager alloc] initWithDataSource:self.dataSource cellIdentifier:@"cell" ];
    self.tableView.dataSource = self.dataManager;
```
when you want to reload Data you can code :
```objc
  __weak typeof(self) weakSelf = self;
    [self.dataManager updateDataBack:^{
        [weakSelf.tableView reloadData];
    }];
```
### YALDataSource
do anything which you should do for data in this class

