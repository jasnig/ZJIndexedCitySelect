//
//  ZJFlowLayoutTableViewCell.m
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJCityTableViewCellTwo.h"
#import "ZJCityCollectionViewCell.h"
#import "ZJCitiesGroup.h"
#import "ZJCity.h"
static NSString *const kZJCityCellID = @"kZJCityCellID";
static CGFloat kCityBtnHeight = 44.f;
static int kCityLineCount = 3;
static CGFloat kCityXmargin = 20.f;
static CGFloat kCityYmargin = 10.f;

@interface ZJCityTableViewCellTwo ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *cityCollectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *cityCollectionViewFlowLayout;
@property (copy, nonatomic) ZJCityCellClickHandler cityCellClickHandler;

@end

@implementation ZJCityTableViewCellTwo


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.cityCollectionView];

    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cityCollectionView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.citiesGroup.cities.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJCityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZJCityCellID forIndexPath:indexPath];
    cell.titleLabel.text = self.citiesGroup.cities[indexPath.row].name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_cityCellClickHandler) {
        ZJCity *city = self.citiesGroup.cities[indexPath.row];
        _cityCellClickHandler(city.name);
    }
}

- (CGFloat)cellHeight {
    int rowCount = ceil((float)self.citiesGroup.cities.count/kCityLineCount);
    return rowCount*(kCityBtnHeight+kCityYmargin)+kCityYmargin;
}

- (void)setCitiesGroup:(ZJCitiesGroup *)citiesGroup {
    _citiesGroup = citiesGroup;
    [self.cityCollectionView reloadData];
}

- (void)setupCityCellClickHandler:(ZJCityCellClickHandler)cityCellClickHandler {
    _cityCellClickHandler = [cityCellClickHandler copy];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.bounds.size.width==0) {
        return;
    }
    self.cityCollectionView.frame = self.bounds;
    CGFloat btnWidth = (self.bounds.size.width - (kCityLineCount+1)*kCityXmargin)/kCityLineCount;
    self.cityCollectionViewFlowLayout.itemSize = CGSizeMake(btnWidth, kCityBtnHeight);

}

- (UICollectionViewFlowLayout *)cityCollectionViewFlowLayout {
    if (!_cityCollectionViewFlowLayout) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(100, 64);
        // 行间距
        layout.minimumLineSpacing = kCityYmargin;
        // 列间距
        layout.minimumInteritemSpacing = kCityXmargin;
        // section的上左下右间距
        layout.sectionInset = UIEdgeInsetsMake(kCityYmargin, kCityXmargin, kCityYmargin, kCityXmargin);
        _cityCollectionViewFlowLayout = layout;
    }
    return _cityCollectionViewFlowLayout;
}

- (UICollectionView *)cityCollectionView {
    if (_cityCollectionView == nil) {
        UICollectionView *cityCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.cityCollectionViewFlowLayout];
        cityCollectionView.delegate = self;
        cityCollectionView.dataSource = self;
        [cityCollectionView registerClass:[ZJCityCollectionViewCell class] forCellWithReuseIdentifier:kZJCityCellID];
        cityCollectionView.backgroundColor = [UIColor whiteColor];
        _cityCollectionView = cityCollectionView;
    }
    return _cityCollectionView;
}

@end
