/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol SomoSkeletonLayoutProtocol;

typedef UITableViewCell<SomoSkeletonLayoutProtocol> *(^SomoTableViewCellBlock)(UITableView *tableview, NSIndexPath *indexPath);
typedef UICollectionViewCell<SomoSkeletonLayoutProtocol> *(^SomoCollectionViewCellBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

typedef NSInteger(^SomoTableViewNumberOfSectionsBlock)(UITableView *tableview, NSIndexPath *indexPath);
typedef CGFloat(^SomoTableViewCellHeightBlock)(UITableView *tableview);
typedef NSInteger(^SomoTableViewNumberOfRowsInSectionsSectionsBlock)(UITableView *tableview,NSInteger section);

//typedef NSInteger(^SomoCollectionViewNumberOfSectionBlock)(UICollectionView *collectionView);
//
//typedef NSInteger(^SomoCollectionViewNumberOfRowInsSections)(UICollectionView *collectionView,NSInteger section);
//
//typedef CGSize(^SomoCollectionViewLayoutSize)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSIndexPath *indexPath);
//
//typedef UIEdgeInsets(^SomoCollectionViewLayoutEdgeInsets)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSInteger section);
//
//typedef CGFloat(^SomoCollectionViewLayoutMinimumLineSpacing)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSInteger section);
//
//typedef CGFloat(^SomoCollectionViewLayoutMinimumInteritemSpacing)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSInteger section);
//
//typedef CGSize(^SomoCollectionViewLayoutReferenceSizeForHeader)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSInteger section);
//
//typedef CGSize(^SomoCollectionViewLayoutReferenceSizeForFooter)(UICollectionView *collectionView,UICollectionViewLayout*collectionViewLayout,NSInteger section);


@interface SomoDataSourceProvider : NSObject<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

/**
 default 15
 */
@property (assign, nonatomic) NSInteger numberOfRowsInSection;

/**
 If you have only one cell style, use the following method
 */
- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier;
+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier;

/**
 If you have different cell styles, use the following method
 */
//- (instancetype)initWithTableViewCellBlock:(SomoTableViewCellBlock)block
//							   heightBlock:(SomoTableViewCellHeightBlock)heightBlock;
//
//- (instancetype)initWithCollectionViewCellBlock:(SomoCollectionViewCellBlock)block
//									   sections:(SomoCollectionViewNumberOfSectionBlock)sections
//										   rows:(SomoCollectionViewNumberOfRowInsSections)rows
//										   size:(SomoCollectionViewLayoutSize)size
//									 edgeInsets:(SomoCollectionViewLayoutEdgeInsets)edgeInsets
//							 minimumLineSpacing:(SomoCollectionViewLayoutMinimumLineSpacing)minimumLineSpacing
//						minimumInteritemSpacing:(SomoCollectionViewLayoutMinimumInteritemSpacing)minimumInteritemSpacing
//						 referenceSizeForHeader:(SomoCollectionViewLayoutReferenceSizeForHeader)referenceSizeForHeader
//						 referenceSizeForFooter:(SomoCollectionViewLayoutReferenceSizeForFooter)referenceSizeForFooter;

@end
