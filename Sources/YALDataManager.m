//
//  YALDataManager.m
//  TableView
//
//  Created by yuwei on 2017/11/28.
//  Copyright © 2017年 yuwei. All rights reserved.
//

#import "YALDataManager.h"
#import "YALDataSource.h"

@interface YALDataManager()<UIToolbarDelegate>
@property (nonatomic,copy) NSArray *items;
@property (nonatomic,copy) NSString*cellIdentifier;
@property (nonatomic,weak) YALDataSource *dataSource;//防止循环引用,这里dataSource是从Controller来的所以用弱引用
@end
@implementation YALDataManager

#pragma mark - instancetype

-(instancetype)initWithDataSource:(YALDataSource *)dataSource cellIdentifier:(NSString *)cellIdentifier{
    if (self = [super init]) {
        self.dataSource = dataSource;
        self.cellIdentifier = cellIdentifier;
        self.items = nil;
    }
    return self;
}

-(instancetype) initWithItems:(NSArray*)anItems cellIdentifier:(NSString*)cellIdentifier{
    
    if (self = [super init]) {
        self.items = anItems;
        self.cellIdentifier = cellIdentifier;
        self.dataSource = nil;
    }
    return self;
}



#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:_cellIdentifier];
    }

    cell.textLabel.text = self.items[0];
    cell.detailTextLabel.text =self.items[1];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

#pragma mark - Instance Method
-(void)updateDataBack:(HaveGottenDataBlock)backBlock{
    if (self.dataSource == nil) {
        @throw [NSException exceptionWithName:@"WRONG CODING" reason:@"the property dataSource is nil ! please review your code soon. or you may want to use the method getNewData:" userInfo:nil];
    }
    //线程问题,要保证下载数据完成后 让controller刷新
   // __block NSArray *arr = self.items;
    [self.dataSource updateDataBack:^(NSArray *array) {
        self.items = array;
        backBlock();
    }];
    
}

-(void)getNewData:(NSArray *)newData{
    
    self.items = newData;
}
@end
