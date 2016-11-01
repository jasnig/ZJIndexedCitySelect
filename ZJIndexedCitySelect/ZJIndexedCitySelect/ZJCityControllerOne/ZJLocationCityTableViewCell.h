//
//  ZJLocationCityTableViewCell.h
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZJCityLocationState) {
    ZJCityLocationStateIslocating,
    ZJCityLocationStateLocationFail,
    ZJCityLocationStateLocationSuccess
};
@interface ZJLocationCityTableViewCell : UITableViewCell
typedef void(^ZJCityClickHandler)(NSString *title);

@property (strong, nonatomic) UIButton *locationCityBtn;

- (void)setupCellWithLocationState:(ZJCityLocationState)locationState locationCityName:(NSString *)cityName cityClickHandler:(ZJCityClickHandler)cityClickHandler;


@end
