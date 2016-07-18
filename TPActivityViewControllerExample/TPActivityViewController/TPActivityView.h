//
//  TPAlertView.h
//  WK
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPActivityViewTheme;
@interface TPActivityView : UIView
@property (nonatomic, copy) void(^didSelectItemAtIndexPath)(NSIndexPath *indexPath, BOOL isCancel);
+ (instancetype)viewWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities theme:(TPActivityViewTheme *)theme;

- (CGFloat)preferHeight;
@end
