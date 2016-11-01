//
//  ZJSearchResultController.m
//  ZJIndexContacts
//
//  Created by ZeroJ on 16/10/11.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJSearchResultController.h"
#import "ZJCity.h"
@interface ZJSearchResultController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) ZJCitySearchCellClickHandler searchCityCellClickHandler;

@end

@implementation ZJSearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

}

- (void)dealloc {
    NSLog(@"ZJSearchResultController ---- dealloc");
}
- (void)setupCityCellClickHandler:(ZJCitySearchCellClickHandler)searchCityCellClickHandler {
    _searchCityCellClickHandler = [searchCityCellClickHandler copy];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const kCellId = @"kCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    cell.textLabel.text = _data[indexPath.row].name;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZJCity *city = _data[indexPath.row];
    if (_searchCityCellClickHandler) {
        _searchCityCellClickHandler(city.name);
    }
}

- (void)setData:(NSArray<ZJCity *> *)data {
    _data = data;
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
        // 行高度
        tableView.rowHeight = 44.f;
        _tableView = tableView;
    }
    return _tableView;
}

@end
