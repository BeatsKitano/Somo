//
//  SomoDataSourceProvider.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/12/6.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "SomoDataSourceProvider.h"
#import "UIView+SomoSkeleton.h"

@implementation SomoDataSourceProvider
{
	NSString * _reuseIdentifier;
}

- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier{
	if (self = [super init]) {
		_reuseIdentifier = reuseIdentifier;
		_numberOfRowsInSection = 15;
	}
	return self;
}

+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier{
	return [[[self class] alloc] initWithCellReuseIdentifier:reuseIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.numberOfRowsInSection;
}
  
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseIdentifier forIndexPath:indexPath];
	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	[cell beginSomo];
}

@end
