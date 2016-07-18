//
//  TPActivityViewActivityItemsCell.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewActivityItemsCell.h"
#import "TPActivityViewCollectionViewHorizontalFlowLayout.h"
static NSString *const kTPActivityViewActivityCellIdentify = @"TPActivityViewActivityCell";
CGFloat const kInteritemSpacing = 8;
@interface TPActivityViewActivityItemsCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, weak) UICollectionView *collectionView;
@end
@implementation TPActivityViewActivityItemsCell
- (void)setup {
    [super setup];
    TPActivityViewCollectionViewHorizontalFlowLayout *horizontalFlowLayout = [TPActivityViewCollectionViewHorizontalFlowLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:horizontalFlowLayout];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TPActivityViewActivityCell class]) bundle:[NSBundle bundleForClass:[TPActivityViewActivityCell class]]] forCellWithReuseIdentifier:kTPActivityViewActivityCellIdentify];
    [self.contentView addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView = collectionView;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark - public
- (void)configureWithTheme:(TPActivityViewTheme *)theme {
    self.backgroundColor = theme.activityItemsCellBackgroundColor;
    TPActivityViewCollectionViewHorizontalFlowLayout *horizontalFlowLayout = (TPActivityViewCollectionViewHorizontalFlowLayout *)self.collectionView.collectionViewLayout;
    horizontalFlowLayout.sectionInset = theme.activityItemsCellEdgeInsets;
    horizontalFlowLayout.minimumLineSpacing = theme.activityItemsCellInternalMarge;
}

#pragma mark - property
- (void)setActivities:(NSArray<UIActivity *> *)activities {
    _activities = [activities copy];
    [self.collectionView reloadData];
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.activities.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:kTPActivityViewActivityCellIdentify forIndexPath:indexPath];
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(TPActivityViewActivityCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    UIActivity *activity = self.activities[indexPath.item];
    cell.imageView.image = activity.activityImage;
    cell.descLabel.text = activity.activityTitle;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return kActivityCellSize;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIActivity *activity = self.activities[indexPath.item];
    [activity performActivity];
}




@end
