//
//  TPAlertViewActivityCell.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewActivityCell.h"
CGSize const kActivityCellSize = (CGSize){60, 93};
@interface TPActivityViewActivityCell ()

@end
@implementation TPActivityViewActivityCell
- (void)configureWithTheme:(TPActivityViewTheme *)theme {
    self.backgroundColor = theme.activityCellBackgroundColor;
}

@end
