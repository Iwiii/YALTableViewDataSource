//
//  YALDataManager.h
//  TableView
//
//  Created by yuwei on 2017/11/28.
//  Copyright © 2017年 yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class YALDataSource;
//这个block回调 严格来说没必要 不建议使用 因为又把datasource 逻辑带回了Controller 与初衷相悖
//typedef void (^TableViewCellCongifureBlock)(id cell,id item);
typedef void (^HaveGottenDataBlock)(void);
@interface YALDataManager : NSObject<UITableViewDataSource,UITableViewDelegate>


//-(instancetype) initWithItems:(NSArray*)anItems cellIdentifier:(NSString*)cellIdentifier configureCellBlock:(TableViewCellCongifureBlock)configureCellBlock;


//-(instancetype) initWithDataSource:(YALDataSource *)dataSource cellIdentifier:(NSString*)cellIdentifier configureCellBlock:(TableViewCellCongifureBlock)configureCellBlock;


//如果TableView的数据由DataSource管理 那么用DataSource管理
-(instancetype) initWithDataSource:(YALDataSource *)dataSource cellIdentifier:(NSString*)cellIdentifier;

//刷新并通过backBlock回调,这里Block只是考虑到多线程问题
//注意防止内存泄漏
-(void)updateDataBack:(HaveGottenDataBlock)backBlock;


//如果Tableview的数据由Controller管理 那么用这个建立DataManager
-(instancetype) initWithItems:(NSArray*)anItems cellIdentifier:(NSString*)cellIdentifier;


-(void)getNewData:(NSArray *) newData;


@end
