# ZJIndexedCitySelect
一个常用的带索引的城市选择列表, 已经处理了拼音首字母搜索城市, 以及热门城市的显示. 美团等经常用到的城市选择


![citySelecte.gif](http://upload-images.jianshu.io/upload_images/1271831-3e660b99b37c45d2.gif?imageMogr2/auto-orient/strip)


```
    ZJCityViewControllerOne *vc = [[ZJCityViewControllerOne alloc] initWithDataArray:nil];
//    __weak typeof(self) weakSelf = self;
    [vc setupCityCellClickHandler:^(NSString *title) {
        
        NSLog(@"选中的城市是: %@", title);
        [ZJProgressHUD showStatus:[NSString stringWithFormat:@"选中的城市是: %@", title] andAutoHideAfterTime:1.f];
//        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self.navigationController showViewController:vc sender:nil];
```