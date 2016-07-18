//
//  TPActivityViewTheme.m
//  QLChat
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewTheme.h"

@implementation TPActivityViewTheme
- (instancetype)init
{
    self = [super init];
    if (self) {
        //actionCell
        _actionCellBackgroundColor = [UIColor whiteColor];
        _actionCellTextFont = [UIFont systemFontOfSize:17];
        _actionCellHeight = 44;
        //activityCell
        _activityCellBackgroundColor = [UIColor clearColor];
        //activityItemsCell
        _activityItemsCellEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 16);
        _activityItemsCellInternalMarge = 16;
        _activityItemsCellBackgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        //TitleCell
        _titleCellBackgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        _titleCellTextFont = [UIFont systemFontOfSize:12];
        _titleCellTextColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _titleCellHeight = 30;
        //separatorCell
        _separatorCellBackgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0];
    }
    return self;
}

+ (instancetype)defaultActivityViewTheme {
    return [[self alloc] init];
}

@end
