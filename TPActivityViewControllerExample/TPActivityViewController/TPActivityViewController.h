//
//  TPAlertViewController.h
//  WK
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPActivityViewTheme;
@interface TPActivityViewController : UIViewController
- (instancetype)initWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities theme:(TPActivityViewTheme *)theme;

//theme is the default theme
- (instancetype)initWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities;
@end
