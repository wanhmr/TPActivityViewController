//
//  TPAlertViewCollectionViewHorizontalFlowLayout.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewCollectionViewHorizontalFlowLayout.h"

@implementation TPActivityViewCollectionViewHorizontalFlowLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
}

@end
