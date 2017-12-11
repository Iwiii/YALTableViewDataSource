//
//  YALDataSource.m
//  TableView
//
//  Created by yuwei on 2017/11/28.
//  Copyright © 2017年 yuwei. All rights reserved.
//

#import "YALDataSource.h"
@interface YALDataSource()
@property (nonatomic,copy,readonly) NSMutableArray *dataOrigin;
@property (nonatomic,copy,readonly) NSArray *dataOutput;
@end

@implementation YALDataSource

-(void)updateDataBack:(DatabackBlock)backBlock{
    _dataOrigin = [NSMutableArray arrayWithObjects:@"YALTableViewDataSource",@"by Iwiii Please inherit the YAL class and rewrite the corresponding method",@"...", nil];
    _dataOutput = [_dataOrigin copy];
    backBlock(_dataOutput);
}
@end
