//
//  ZJCitiesGroup.m
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/11.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJCitiesGroup.h"
@implementation ZJCitiesGroup
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        _indexTitle = dict[@"title"];
        NSArray *cities = dict[@"cities"];
        NSMutableArray<ZJCity *> *temp = [NSMutableArray arrayWithCapacity:cities.count];
        for (NSString *name in cities) {
            ZJCity *city = [[ZJCity alloc] init];
            city.name = name;
            [temp addObject:city];
        }
        _cities = temp;
    }
    return self;
}
@end
