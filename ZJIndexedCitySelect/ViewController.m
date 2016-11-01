//
//  ViewController.m
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ViewController.h"
#import "ZJCityViewControllerOne.h"
#import "ZJCityViewControllerTwo.h"
#import "ZJCityViewControllerThree.h"
#import "ZJProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)tableViewBtnOnClick:(id)sender {
    ZJCityViewControllerOne *vc = [[ZJCityViewControllerOne alloc] initWithDataArray:nil];
//    __weak typeof(self) weakSelf = self;
    [vc setupCityCellClickHandler:^(NSString *title) {
        
        NSLog(@"选中的城市是: %@", title);
        [ZJProgressHUD showStatus:[NSString stringWithFormat:@"选中的城市是: %@", title] andAutoHideAfterTime:1.f];
//        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self.navigationController showViewController:vc sender:nil];
}
- (IBAction)collctionViewBtnOneOnClick:(id)sender {
    ZJCityViewControllerTwo *vc = [ZJCityViewControllerTwo new];
//    __weak typeof(self) weakSelf = self;
    [vc setupCityCellClickHandler:^(NSString *title) {
        
        NSLog(@"选中的城市是: %@", title);
        [ZJProgressHUD showStatus:[NSString stringWithFormat:@"选中的城市是: %@", title] andAutoHideAfterTime:1.f];

//        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];

    [self.navigationController showViewController:vc sender:nil];

}
- (IBAction)collectionViewTwoOnClick:(id)sender {
    ZJCityViewControllerThree *vc = [ZJCityViewControllerThree new];
//    __weak typeof(self) weakSelf = self;
    [vc setupCityCellClickHandler:^(NSString *title) {
        
        NSLog(@"选中的城市是: %@", title);
        [ZJProgressHUD showStatus:[NSString stringWithFormat:@"选中的城市是: %@", title] andAutoHideAfterTime:1.f];

//        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];

    [self.navigationController showViewController:vc sender:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
