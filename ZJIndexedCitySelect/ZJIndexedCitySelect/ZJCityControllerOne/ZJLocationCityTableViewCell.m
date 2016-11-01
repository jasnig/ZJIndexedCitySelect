//
//  ZJLocationCityTableViewCell.m
//  ZJIndexedCitySelect
//
//  Created by ZeroJ on 16/10/12.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJLocationCityTableViewCell.h"

@interface ZJLocationCityTableViewCell ()
@property (copy, nonatomic) ZJCityClickHandler cityClickHandler;

@end

@implementation ZJLocationCityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.locationCityBtn];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.locationCityBtn sizeToFit];
    CGRect btnFrame = self.locationCityBtn.bounds;
    btnFrame.origin.x = 20.f;
    btnFrame.origin.y = 5.f;
    btnFrame.size.width += 10.f;
    self.locationCityBtn.frame = btnFrame;
}

- (void)setupCellWithLocationState:(ZJCityLocationState)locationState locationCityName:(NSString *)cityName cityClickHandler:(ZJCityClickHandler)cityClickHandler {
    
    switch (locationState) {
        case ZJCityLocationStateIslocating:
            [self.locationCityBtn setTitle:@"正在定位中..." forState:UIControlStateNormal];
            self.locationCityBtn.userInteractionEnabled = NO;
            break;
        case ZJCityLocationStateLocationFail:
            [self.locationCityBtn setTitle:@"获取当前位置失败, 请手动选择城市" forState:UIControlStateNormal];
            self.locationCityBtn.userInteractionEnabled = NO;
            break;
            
        case ZJCityLocationStateLocationSuccess:
            [self.locationCityBtn setTitle:cityName forState:UIControlStateNormal];
            self.locationCityBtn.userInteractionEnabled = YES;
            break;
    }
    _cityClickHandler = [cityClickHandler copy];
    [self setNeedsLayout];
}

- (void)locationCityBtnOnClick:(UIButton *)btn {
    if (_cityClickHandler) {
        _cityClickHandler(btn.titleLabel.text);
    }
}

- (UIButton *)locationCityBtn {
    if (!_locationCityBtn) {
        UIButton *locationCityBtn = [[UIButton alloc] init];
        [locationCityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        locationCityBtn.layer.masksToBounds = YES;
        locationCityBtn.layer.cornerRadius = 5.f;
        locationCityBtn.backgroundColor = [UIColor lightGrayColor];
        locationCityBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
        locationCityBtn.userInteractionEnabled = NO;

        _locationCityBtn = locationCityBtn;
    }
    return _locationCityBtn;
}

@end
