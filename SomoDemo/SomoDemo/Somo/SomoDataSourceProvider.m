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

@implementation SomoDataSourceProvider{
	NSString * _reuseIdentifier;
	SomoTableViewCellBlock _tableViewCellBlock;
	SomoTableViewCellHeightBlock _heightBlock;
}

- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier{
	if (self = [super init]) {
		_reuseIdentifier = reuseIdentifier;
		_numberOfRowsInSection = 20;
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
		_numberOfRowsInSection = 20;
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return _numberOfRowsInSection;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	return [collectionView dequeueReusableCellWithReuseIdentifier:_reuseIdentifier forIndexPath:indexPath]; 
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
	[cell beginSomo];
}

@end
