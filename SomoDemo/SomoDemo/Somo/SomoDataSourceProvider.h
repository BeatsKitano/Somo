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
typedef UICollectionViewCell<SomoSkeletonLayoutProtocol> *(^SomoCollectionViewCellBlock)(UICollectionView *tableview, NSIndexPath *indexPath);

typedef CGFloat(^SomoTableViewCellHeightBlock)(UITableView *tableview, NSIndexPath *indexPath);

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
- (instancetype)initWithTableViewCellBlock:(SomoTableViewCellBlock)block heightBlock:(SomoTableViewCellHeightBlock)heightBlock;
- (instancetype)initWithCollectionViewCellBlock:(SomoCollectionViewCellBlock)block;

@end
