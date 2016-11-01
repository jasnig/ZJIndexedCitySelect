//
//  ViewController.h
//  ZJIndexContacts
//
//  Created by ZeroJ on 16/10/10.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJCityViewControllerThree : UIViewController
typedef void(^ZJCitySelectedHandler)(NSString *title);

- (void)setupCityCellClickHandler:(ZJCitySelectedHandler)citySelectedHandler;


@end

