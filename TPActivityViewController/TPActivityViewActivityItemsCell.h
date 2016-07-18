//
//  TPAlertViewActivityItemsCell.h
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivitytViewCell.h"
#import "TPActivityViewActivityCell.h"
FOUNDATION_EXPORT CGFloat const kInteritemSpacing;
@interface TPActivityViewActivityItemsCell : TPActivitytViewCell
@property (nonatomic, copy) NSArray<UIActivity *> *activities;

@end
