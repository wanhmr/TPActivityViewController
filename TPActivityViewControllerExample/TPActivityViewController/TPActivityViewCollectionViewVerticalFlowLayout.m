//
//  TPCollectionViewVerticalFlowLayout.m
//  WK
//
//  Created by Tpphha on 16/7/17.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewCollectionViewVerticalFlowLayout.h"
#import "TPActivityViewSeparatorCell.h"
#import "TPActivityViewCollectionViewLayoutAttributes.h"
static NSString *const TPFlowLayoutDecorationKindHorizontalSeparator = @"SDCAlertControllerDecorationKindHorizontalSeparator";
@implementation TPActivityViewCollectionViewVerticalFlowLayout
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
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
//    [self registerClass:[TPAlertViewSeparatorView class] forDecorationViewOfKind:TPFlowLayoutDecorationKindHorizontalSeparator];
}

//
//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSMutableArray *attributes = [super layoutAttributesForElementsInRect:rect].mutableCopy;
//    
//    [[attributes copy] enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *itemAttributes, NSUInteger idx, BOOL *stop) {
//        NSIndexPath *indexPath = itemAttributes.indexPath;
//        
//        [attributes addObject:[self layoutAttributesForDecorationViewOfKind:TPFlowLayoutDecorationKindHorizontalSeparator atIndexPath:indexPath]];
//        
//    }];
//    
//    return attributes;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
//    TPAlertViewCollectionViewLayoutAttributes *attributes = [TPAlertViewCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind
//                                                                                                                                 withIndexPath:indexPath];
//    
//    UICollectionViewLayoutAttributes *itemAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
////    attributes.zIndex = itemAttributes.zIndex + 1;
//    attributes.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
//    
//    CGRect decorationFrame = itemAttributes.frame;
//    if (elementKind == TPFlowLayoutDecorationKindHorizontalSeparator) {
//        decorationFrame.size.height = 1 / [UIScreen mainScreen].scale;
//    }
//    
//    attributes.frame = decorationFrame;
//    
//    return attributes;
//}



@end
