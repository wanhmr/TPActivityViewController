//
//  TPAlertViewTitleCell.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewTitleCell.h"

@implementation TPActivityViewTitleCell
- (void)setup {
    [super setup];
    UILabel *titleLable = [UILabel new];
    titleLable.text = @"Label";
    titleLable.font = [UIFont systemFontOfSize:12];
    titleLable.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [self.contentView addSubview:titleLable];
    _titleLabel = titleLable;
}

- (void)configureWithTheme:(TPActivityViewTheme *)theme {
    self.backgroundColor = theme.titleCellBackgroundColor;
    self.titleLabel.font = theme.titleCellTextFont;
    self.titleLabel.textColor = theme.titleCellTextColor;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    self.titleLabel.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}
@end
