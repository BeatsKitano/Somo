//
//  DataSourceTableViewCell.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/12/6.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "DataSourceTableViewCell.h"
#import "Somo.h"

@implementation DataSourceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (NSArray<SomoView *> *)somoSkeletonLayout{
	SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
	s0.layer.cornerRadius = 35.;
	
	SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 15)];
	SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 100, 15)];
	
	return @[s0,s1,s2];
}

@end
