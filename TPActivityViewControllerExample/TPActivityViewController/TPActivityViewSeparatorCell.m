//
//  TPAlertViewSeparatorView.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewSeparatorCell.h"

@implementation TPActivityViewSeparatorCell
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    // By keeping this very generic, this class doesn't have to know about the class name of the custom layout attributes
    if ([layoutAttributes respondsToSelector:@selector(backgroundColor)]) {
        self.backgroundColor = [layoutAttributes performSelector:@selector(backgroundColor)];
    }
}

- (void)configureWithTheme:(TPActivityViewTheme *)theme {
    self.backgroundColor = theme.separatorCellBackgroundColor;
}

@end
