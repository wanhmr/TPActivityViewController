//
//  TPActivityViewTheme.h
//  QLChat
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPActivityViewTheme : NSObject
//actionCell
@property (nonatomic, strong) UIColor *actionCellBackgroundColor;
@property (nonatomic, strong) UIFont  *actionCellTextFont;
@property (nonatomic, strong) UIColor *actionCellTextColor;
@property (nonatomic, assign) CGFloat actionCellHeight;
//activityCell
@property (nonatomic, strong) UIColor *activityCellBackgroundColor;
//activityItemsCell
@property (nonatomic, assign) UIEdgeInsets activityItemsCellEdgeInsets;
@property (nonatomic, assign) CGFloat activityItemsCellInternalMarge; //items internal marge
@property (nonatomic, strong) UIColor *activityItemsCellBackgroundColor;
//TitleCell
@property (nonatomic, strong) UIColor *titleCellBackgroundColor;
@property (nonatomic, strong) UIFont  *titleCellTextFont;
@property (nonatomic, strong) UIColor *titleCellTextColor;
@property (nonatomic, assign) CGFloat titleCellHeight;
//separatorCell
@property (nonatomic, strong) UIColor *separatorCellBackgroundColor;
+ (instancetype)defaultActivityViewTheme;
@end
