//
//  OtherTableViewCell.m
//  SomoDemo
//
//  Created by 向小辉 on 2018/3/24.
//  Copyright © 2018年 KINX. All rights reserved.
//

#import "OtherTableViewCell.h"

@implementation OtherTableViewCell

- (void)awakeFromNib{
	[super awakeFromNib];
	self.contentView.backgroundColor = [UIColor cyanColor];
}

- (void)setShouldLoading:(BOOL)shouldLoading{
	_shouldLoading = shouldLoading;
	if (_shouldLoading) {
		[self beginSomo];
	}else{
		[self endSomo];
	}
}

- (NSArray<SomoView *> *)somoSkeletonLayout{
	SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
	s0.layer.cornerRadius = 25.;
	
	SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 10)];
	SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 50, 100, 10)];
	
	return @[s0,s1,s2];
}

@end
