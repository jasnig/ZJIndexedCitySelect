//
//  ZJFlowLayoutTableViewCell.m
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJCityTableViewCellOne.h"
#import "ZJCityCollectionViewCell.h"
#import "ZJCitiesGroup.h"
#import "ZJCity.h"
static NSString *const kZJCityCellID = @"kZJCityCellID";
static CGFloat kCityBtnHeight = 44.f;
static int kCityLineCount = 3;
static CGFloat kCityXmargin = 20.f;
static CGFloat kCityYmargin = 10.f;

@interface ZJCityTableViewCellOne ()
@property (strong, nonatomic) UIView *citiesView;
@property (strong, nonatomic) NSArray<UIButton *> *cityBtns;
@property (copy, nonatomic) ZJCityCellClickHandler cityCellClickHandler;

@end

@implementation ZJCityTableViewCellOne


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.citiesView];

    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.citiesView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)setupCityCellClickHandler:(ZJCityCellClickHandler)cityCellClickHandler {
    _cityCellClickHandler = [cityCellClickHandler copy];
}

- (CGFloat)cellHeight {
    int rowCount = ceil((float)self.citiesGroup.cities.count/kCityLineCount);
    return rowCount*(kCityBtnHeight+kCityYmargin)+kCityYmargin;
}

- (void)setCitiesGroup:(ZJCitiesGroup *)citiesGroup {
    _citiesGroup = citiesGroup;
    [self addCityBtns];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (self.bounds.size.width==0 || _cityBtns.count == 0) return;

    // int/int 结果为int(向下取整)
    // 所以这里需要转为float才能得到正确float结果
    // ceil() 向上取整函数
    int rowCount = ceil((float)_cityBtns.count/kCityLineCount);
    CGFloat btnWidth = (self.bounds.size.width - (kCityLineCount+1)*kCityXmargin)/kCityLineCount;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    for (int i = 0; i<_cityBtns.count; i++) {
        // 第几列 取模
        int line = i%kCityLineCount;
        // 第几行 取商
        int row = i/kCityLineCount;
        btnX = line*(kCityXmargin+btnWidth) + kCityXmargin;
        btnY = row*(kCityYmargin+kCityBtnHeight) + kCityYmargin;
        
        UIButton *btn = _cityBtns[i];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, kCityBtnHeight);
        
    }
    _citiesView.frame = CGRectMake(0.f, 0.f, self.bounds.size.width, (kCityBtnHeight+kCityYmargin)*rowCount + kCityYmargin);

}

- (void)addCityBtns {
    [_citiesView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *citys = [NSMutableArray arrayWithCapacity:self.citiesGroup.cities.count];
    for (int i = 0; i<self.citiesGroup.cities.count; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(hotCitiesDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.citiesGroup.cities[i].name forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        [_citiesView addSubview:btn];
        [citys addObject:btn];
    }
    _cityBtns = citys;
}

- (void)hotCitiesDidSelected:(UIButton *)btn {
    if (_cityCellClickHandler) {
        _cityCellClickHandler(btn.titleLabel.text);
    }
}

- (UIView *)citiesView {
    if (!_citiesView) {
        UIView *citiesView = [[UIView alloc] init];
        
        _citiesView = citiesView;
    }
    return _citiesView;
}


@end
