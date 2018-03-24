//
//  SView.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/24.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "SView.h"
#import "SomoView.h"

@implementation SView

- (NSArray<SomoView *> *)somoSkeletonLayout{
	SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
	SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(90, 10, 130, 20)];
	SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(90, 50, 100, 20)];
	return @[s0,s1,s2];
}

@end
