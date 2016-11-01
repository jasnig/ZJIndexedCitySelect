//
//  ZJFlowLayoutTableViewCell.h
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJCitiesGroup;

typedef void(^ZJCityCellClickHandler)(NSString *title);
@interface ZJCityTableViewCellOne : UITableViewCell
@property (assign, nonatomic) CGFloat cellHeight;
@property (strong, nonatomic) ZJCitiesGroup *citiesGroup;

- (void)setupCityCellClickHandler:(ZJCityCellClickHandler)cityCellClickHandler;

@end
