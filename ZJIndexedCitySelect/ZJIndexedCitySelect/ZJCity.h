//
//  ZJContact.h
//  ZJIndexContacts
//
//  Created by ZeroJ on 16/10/10.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJCity : NSObject
@property (copy, nonatomic) NSString *name;
// 搜索联系人的方法 (拼音/拼音首字母缩写/汉字)
+ (NSArray<ZJCity *> *)searchText:(NSString *)searchText inDataArray:(NSArray<ZJCity *> *)dataArray;
@end
