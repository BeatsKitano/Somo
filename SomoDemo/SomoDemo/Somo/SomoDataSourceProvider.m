/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "SomoDataSourceProvider.h"
#import "UIView+SomoSkeleton.h"

@implementation SomoDataSourceProvider
{
	NSString * _reuseIdentifier;
	SomoCollectionViewNumberOfSectionBlock _sectionsBlock;
	SomoCollectionViewNumberOfRowInsSections _rowsBlock;
	SomoTableViewCellBlock _tableViewCellBlock;
	SomoTableViewCellHeightBlock _heightBlock;
	SomoCollectionViewCellBlock _collectionViewCellBlock;
	SomoCollectionViewLayoutSize _sizeBlock;
	SomoCollectionViewLayoutEdgeInsets _insetsBlock;
	SomoCollectionViewLayoutMinimumLineSpacing _minimumLineSpacingBlock;
	SomoCollectionViewLayoutMinimumInteritemSpacing _minimumInteritemSpacingBlock;
	SomoCollectionViewLayoutReferenceSizeForHeader _referenceSizeForHeaderBlock;
	SomoCollectionViewLayoutReferenceSizeForFooter _referenceSizeForFooterBlock;
}

- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier{
	if (self = [super init]) {
		_reuseIdentifier = reuseIdentifier;
		_numberOfRowsInSection = 30;
	}
	return self;
}

+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier{
	return [[[self class] alloc] initWithCellReuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithTableViewCellBlock:(SomoTableViewCellBlock)block heightBlock:(SomoTableViewCellHeightBlock)heightBlock{
	if (self = [super init]) {
		_tableViewCellBlock = block;
		_heightBlock = heightBlock;
		_numberOfRowsInSection = 30;
	}
	return self;
}

- (instancetype)initWithCollectionViewCellBlock:(SomoCollectionViewCellBlock)block
									   sections:(SomoCollectionViewNumberOfSectionBlock)sections
										   rows:(SomoCollectionViewNumberOfRowInsSections)rows
										   size:(SomoCollectionViewLayoutSize)size
									 edgeInsets:(SomoCollectionViewLayoutEdgeInsets)edgeInsets
							 minimumLineSpacing:(SomoCollectionViewLayoutMinimumLineSpacing)minimumLineSpacing
						minimumInteritemSpacing:(SomoCollectionViewLayoutMinimumInteritemSpacing)minimumInteritemSpacing
						 referenceSizeForHeader:(SomoCollectionViewLayoutReferenceSizeForHeader)referenceSizeForHeader
						 referenceSizeForFooter:(SomoCollectionViewLayoutReferenceSizeForFooter)referenceSizeForFooter{
	if (self = [super init]) {
		_collectionViewCellBlock = block;
		_sectionsBlock = sections;
		_rowsBlock = rows;
		_numberOfRowsInSection = 30;
		_sizeBlock = size;
		_insetsBlock = edgeInsets;
		_minimumLineSpacingBlock = minimumLineSpacing;
		_minimumInteritemSpacingBlock = minimumInteritemSpacing;
		_referenceSizeForHeaderBlock = referenceSizeForHeader;
		_referenceSizeForFooterBlock = referenceSizeForFooter;
	}
	return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.numberOfRowsInSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (_reuseIdentifier) {
		return tableView.rowHeight;
	}else{
		return _heightBlock(tableView, indexPath);
	}
}
  
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (_reuseIdentifier) {
		return [tableView dequeueReusableCellWithIdentifier:_reuseIdentifier forIndexPath:indexPath];
	}else{
		return _tableViewCellBlock(tableView,indexPath);
	}
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	[cell beginSomo];
}

#pragma mark - collection

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
	return _sectionsBlock(collectionView);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return _rowsBlock(collectionView,section);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	if (_reuseIdentifier) {
		return [collectionView dequeueReusableCellWithReuseIdentifier:_reuseIdentifier forIndexPath:indexPath];
	}else{
		return _collectionViewCellBlock(collectionView, indexPath);
	}
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
	[cell beginSomo];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
	return _sizeBlock ? _sizeBlock(collectionView,collectionViewLayout,indexPath) : CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
	return _insetsBlock ? _insetsBlock(collectionView,collectionViewLayout,section) : UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
	return _minimumLineSpacingBlock ? _minimumLineSpacingBlock(collectionView,collectionViewLayout,section) : 0.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
	return _minimumInteritemSpacingBlock ? _minimumInteritemSpacingBlock(collectionView,collectionViewLayout,section) : 0.f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
	return _referenceSizeForHeaderBlock ? _referenceSizeForHeaderBlock(collectionView,collectionViewLayout,section) : CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
	return _referenceSizeForFooterBlock ? _referenceSizeForFooterBlock(collectionView,collectionViewLayout,section) : CGSizeZero;
}

@end
