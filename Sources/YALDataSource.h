//
//  YALDataSource.h
//  TableView
//
//  Created by yuwei on 2017/11/28.
//  Copyright © 2017年 yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^DatabackBlock)(NSArray * array);
@interface YALDataSource : NSObject
//be careful of retain cyle
-(void)updateDataBack:(DatabackBlock)backBlock;
@end
