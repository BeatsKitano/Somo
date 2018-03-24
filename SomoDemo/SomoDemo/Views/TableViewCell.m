//
//  TableViewCell.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/25.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "TableViewCell.h"
#import "Somo.h"

@implementation TableViewCell
 
- (void)setShouldLoading:(BOOL)shouldLoading{
	_shouldLoading = shouldLoading;
	if (_shouldLoading) {
		[self beginSomo];
	}else{
		[self endSomo];
	}
}

- (NSArray<SomoView *> *)somoSkeletonLayout{
	SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
	s0.layer.cornerRadius = 35.;
	SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 20, 200, 15)];
	SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 45, 150, 15)];
	SomoView * s3 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 170, 15)];
	return @[s0,s1,s2,s3];
}

@end
