//
//  ZJCitiesGroup.h
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/11.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJCity.h"
@interface ZJCitiesGroup : NSObject
@property (copy, nonatomic) NSString *indexTitle;
@property (strong, nonatomic) NSArray<ZJCity *> *cities;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
