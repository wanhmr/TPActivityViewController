//
//  TPAlertViewActivityCell.h
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivitytViewCell.h"
FOUNDATION_EXPORT CGSize const kActivityCellSize;
@interface TPActivityViewActivityCell : TPActivitytViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@end
