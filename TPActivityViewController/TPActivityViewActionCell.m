//
//  TPAlertViewActionCell.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewActionCell.h"

@implementation TPActivityViewActionCell
- (void)setup {
    [super setup];
    UILabel *titleLable = [UILabel new];
    titleLable.text = @"取消";
    [self.contentView addSubview:titleLable];
    _actionTitleLabel = titleLable;
    self.backgroundColor = [UIColor whiteColor];
}


- (void)configureWithTheme:(TPActivityViewTheme *)theme {
    [super configureWithTheme:theme];
    self.actionTitleLabel.font = theme.actionCellTextFont;
    self.actionTitleLabel.textColor = theme.actionCellTextColor;
    self.backgroundColor = theme.actionCellBackgroundColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.actionTitleLabel sizeToFit];
    self.actionTitleLabel.center = CGPointMake(ceil(self.frame.size.width * 0.5), ceil(self.frame.size.height * 0.5));;
}

@end
