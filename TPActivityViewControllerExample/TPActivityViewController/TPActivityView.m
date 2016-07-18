//
//  TPActivityView.m
//  WK
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityView.h"
#import "TPActivityViewCollectionViewVerticalFlowLayout.h"
#import "TPActivityViewActionCell.h"
#import "TPActivityViewActivityItemsCell.h"
#import "TPActivityViewTitleCell.h"
#import "TPActivityViewSeparatorCell.h"
#import "TPActivityViewTheme.h"
static NSString *const kTPActivityViewActionCellIdentify = @"TPActivityViewActionCell";
static NSString *const kTPActivityViewTitleCellIdentify  = @"TPActivityViewTitleCell";
static NSString *const kTPActivityViewActivityItemsCellShareIdentify = @"kTPActivityViewActivityItemsCellShareIdentify";
static NSString *const kTPActivityViewActivityItemsCellActionIdentify = @"kTPActivityViewActivityItemsCellActionIdentify";
static NSString *const KTPActivityViewSeparatorCellIdentify = @"KTPActivityViewSeparatorCellIdentify";
@interface TPActivityView () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray *activityItems;
@property (nonatomic, copy) NSArray<__kindof UIActivity *> *applicationActivities;
@property(nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) TPActivityViewTheme *theme;
@end
@implementation TPActivityView

#pragma mark - init

+ (instancetype)viewWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities theme:(TPActivityViewTheme *)theme {
    NSParameterAssert(theme);
    TPActivityView *activityView = [self new];
    activityView.message = message;
    activityView.activityItems = activityItems;
    activityView.applicationActivities = applicationActivities;
    activityView.theme = theme;
    return activityView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
    TPActivityViewCollectionViewVerticalFlowLayout *verticalFlowLayout = [TPActivityViewCollectionViewVerticalFlowLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:verticalFlowLayout];
    [collectionView registerClass:[TPActivityViewTitleCell class] forCellWithReuseIdentifier:kTPActivityViewTitleCellIdentify];
    [collectionView registerClass:[TPActivityViewActivityItemsCell class] forCellWithReuseIdentifier:kTPActivityViewActivityItemsCellShareIdentify];
    
    [collectionView registerClass:[TPActivityViewActivityItemsCell class] forCellWithReuseIdentifier:kTPActivityViewActivityItemsCellActionIdentify];
    
    [collectionView registerClass:[TPActivityViewActionCell class] forCellWithReuseIdentifier:kTPActivityViewActionCellIdentify];
    [collectionView registerClass:[TPActivityViewSeparatorCell class] forCellWithReuseIdentifier:KTPActivityViewSeparatorCellIdentify];
    [self addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    _collectionView = collectionView;

}


- (NSArray<__kindof UIActivity *> *)activitiesWithActivityCategory:(UIActivityCategory)activityCategory {
    if (!self.applicationActivities.count) {
        return nil;
    }
    NSMutableArray *activities = [NSMutableArray new];
    for (UIActivity *activity in self.applicationActivities) {
        if ([[activity class] activityCategory] == activityCategory) {
            if ([activity canPerformWithActivityItems:self.activityItems]) {
                [activity prepareWithActivityItems:self.activityItems];
                [activities addObject:activity];
            }
        }
    }
    if (activities.count) {
        return activities;
    }else {
        return nil;
    }
}


- (NSArray<NSString *> *)cellsIdentify {
    NSMutableArray *cellsIdentify = [NSMutableArray new];
    if (self.message) {
        [cellsIdentify addObject:kTPActivityViewTitleCellIdentify];
    }
    NSArray *categoryShareActivities = [self activitiesWithActivityCategory:UIActivityCategoryShare];
    NSArray *categoryActionActivities = [self activitiesWithActivityCategory:UIActivityCategoryAction];
    if (categoryShareActivities && categoryActionActivities) {
        [cellsIdentify addObject:kTPActivityViewActivityItemsCellShareIdentify];
        [cellsIdentify addObject:KTPActivityViewSeparatorCellIdentify];
        [cellsIdentify addObject:kTPActivityViewActivityItemsCellActionIdentify];
    }else if (categoryShareActivities || categoryActionActivities) {
        if (categoryShareActivities) {
            [cellsIdentify addObject:kTPActivityViewActivityItemsCellShareIdentify];
        }else {
            [cellsIdentify addObject:kTPActivityViewActivityItemsCellActionIdentify];
        }
    }
    [cellsIdentify addObject:kTPActivityViewActionCellIdentify];
    return cellsIdentify;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.frame;
    frame.size.height = [self preferHeight];
    frame.size.width = self.superview.frame.size.width;
    self.frame = frame;
    self.collectionView.frame = self.bounds;
}

- (CGFloat)preferHeight {
    CGFloat preferHeight = 0;
    
    for (NSString *identify in [self cellsIdentify]) {
        if ([identify isEqualToString:kTPActivityViewTitleCellIdentify]) {
            preferHeight += self.theme.titleCellHeight;
        }else if ([identify isEqualToString:kTPActivityViewActivityItemsCellActionIdentify] ||
                  [identify isEqualToString:kTPActivityViewActivityItemsCellShareIdentify]) {
            preferHeight += [self activityCellSize].height;
        }else if ([identify isEqualToString:KTPActivityViewSeparatorCellIdentify]) {
            preferHeight += 1 / [UIScreen mainScreen].scale;
        }else if ([identify isEqualToString:kTPActivityViewActionCellIdentify]) {
            preferHeight += self.theme.actionCellHeight;
        }else {
            preferHeight += 0;
        }
    }
    return preferHeight;
}


- (CGSize)activityCellSize {
    CGFloat height = 0;
    height += self.theme.activityItemsCellEdgeInsets.top;
    height += kActivityCellSize.height;
    height += self.theme.activityItemsCellEdgeInsets.bottom;
    return CGSizeMake(CGRectGetWidth(self.frame), height);
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self cellsIdentify].count;
}



// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = [self cellsIdentify][indexPath.item];
    return [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(TPActivitytViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = [self cellsIdentify][indexPath.item];
    
    if ([identify isEqualToString:kTPActivityViewTitleCellIdentify]) {
        TPActivityViewTitleCell *titleCell  = (TPActivityViewTitleCell *)cell;
        titleCell.titleLabel.text = self.message;
    }
    else if ([identify isEqualToString:kTPActivityViewActivityItemsCellActionIdentify]) {
        TPActivityViewActivityItemsCell *itemsCell = (TPActivityViewActivityItemsCell *)cell;
        itemsCell.activities = [self activitiesWithActivityCategory:UIActivityCategoryAction];
    }
    else if ([identify isEqualToString:kTPActivityViewActivityItemsCellShareIdentify]) {
        TPActivityViewActivityItemsCell *itemsCell = (TPActivityViewActivityItemsCell *)cell;
        itemsCell.activities = [self activitiesWithActivityCategory:UIActivityCategoryShare];
    }
    
    else if ([identify isEqualToString:KTPActivityViewSeparatorCellIdentify]) {
        
    }
    
    else if ([identify isEqualToString:kTPActivityViewActionCellIdentify]) {
        
    }
    
    [cell configureWithTheme:self.theme];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = self.bounds.size;
    NSString *identify = [self cellsIdentify][indexPath.item];
    if ([identify isEqualToString:kTPActivityViewTitleCellIdentify]) {
        return CGSizeMake(size.width, self.theme.titleCellHeight);
        
    }else if ([identify isEqualToString:kTPActivityViewActivityItemsCellActionIdentify] ||
              [identify isEqualToString:kTPActivityViewActivityItemsCellShareIdentify]) {
        return CGSizeMake(size.width, [self activityCellSize].height);
        
    }else if ([identify isEqualToString:KTPActivityViewSeparatorCellIdentify]) {
        return CGSizeMake(size.width, 1 / [UIScreen mainScreen].scale);
        
    }else if ([identify isEqualToString:kTPActivityViewActionCellIdentify]) {
        return CGSizeMake(size.width, self.theme.actionCellHeight);
    }else {
        return CGSizeZero;
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BOOL isCancel = NO;
    NSString *identify = [self cellsIdentify][indexPath.item];
    if ([identify isEqualToString:kTPActivityViewActionCellIdentify]) {
        isCancel = YES;
    }
    !self.didSelectItemAtIndexPath ? : self.didSelectItemAtIndexPath(indexPath, isCancel);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
