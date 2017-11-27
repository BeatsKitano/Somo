//
//  UIView+Somo.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/23.
//  Copyright © 2017年 KINX. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+SomoSkeleton.h"
#import "SomoSkeletonLayoutProtocol.h"
#import "SomoView.h"
#import "SomoDefines.h"
  
static void * kSomoContainerKey = &kSomoContainerKey;
 
@implementation UIView (SomoSkeleton)

- (void)setSomoContainer:(UIView *)somoContainer{
	somoContainer.frame = self.bounds;
	
	UIColor * color = SomoColorFromRGBV(248.);
	
	if ([self respondsToSelector:@selector(somoSkeletonBackgroundColor)]) {
		
		color = [(UIView<SomoSkeletonLayoutProtocol> *)self somoSkeletonBackgroundColor];
	}
	
	somoContainer.backgroundColor = color;
	
	[self addSubview:somoContainer];
	
	objc_setAssociatedObject(self, kSomoContainerKey, somoContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)somoContainer{
	return objc_getAssociatedObject(self, kSomoContainerKey);
}

- (void)beginSomo{
	if ([self conformsToProtocol:@protocol(SomoSkeletonLayoutProtocol)] == NO) {
		return;
	}
	
	if ([self respondsToSelector:@selector(somoSkeletonLayout)] == NO) {
		return;
	}
	
	self.userInteractionEnabled = NO;
	
	[self buildContainer];
	
	[self bringSubviewToFront:self.somoContainer];
	
	NSArray<SomoView *> * somoViews = [(UIView<SomoSkeletonLayoutProtocol> *)self somoSkeletonLayout];
	
	[self buildSkeletonSubViews:somoViews];
}

- (void)buildContainer{
	[self clear];
	self.somoContainer = [UIView new];
}

- (void)buildSkeletonSubViews:(NSArray<SomoView *> *)views{
	__weak typeof(self) weakSelf = self;
	[views enumerateObjectsUsingBlock:^(SomoView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		__strong typeof(weakSelf) strongSelf = weakSelf;
		[strongSelf.somoContainer addSubview:obj];
	}];
}

- (void)endSomo{
	if (!self.somoContainer) {
		return;
	}
	self.userInteractionEnabled = YES;
	[self clear];
}

- (void)clear{
	[self.somoContainer removeFromSuperview];
	self.somoContainer = nil;
}

@end
