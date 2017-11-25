//
//  SomoView.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/24.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "SomoView.h"
#import "SomoDefines.h"
 
static const CGFloat kShadowWidth = 60.;

@interface SomoView()

@property (strong, nonatomic) CAGradientLayer * somoLayer;

@end

@implementation SomoView

- (instancetype)initWithFrame:(CGRect)rect somoColor:(UIColor *)color{
	if (self = [super initWithFrame:rect]) {
		self.somoColor = color;
		[self setup];
	}
	return self;
}

- (instancetype)init{
	self = [super init];
	if (self) {
		[self setup];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		[self setup];
	}
	return self;
}

- (void)setup{
	if (!self.somoColor) {
		self.somoColor = SomoColorFromRGBV(200);
	}
	self.backgroundColor = self.somoColor;
	self.layer.masksToBounds = YES;
	[self.layer addSublayer:self.somoLayer];
	
	[self animate];
}

- (void)animate{
	CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"position"];
	basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(-kShadowWidth/2., self.bounds.size.height/2.)];
	basic.toValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width+kShadowWidth/2., self.bounds.size.height/2.)];
	basic.duration = 1.5;
	basic.repeatCount = INFINITY;
	[self.somoLayer addAnimation:basic forKey:basic.keyPath];
}

-(CAGradientLayer *)somoLayer{
	if (!_somoLayer) {
		_somoLayer = [CAGradientLayer layer];
		_somoLayer.frame = CGRectMake(0, 0, kShadowWidth, self.bounds.size.height);
		_somoLayer.colors = @[(id)[self.somoColor colorWithAlphaComponent:0.1].CGColor,
							  (id)[[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor,
							  (id)[[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor,
							  (id)[[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor,
							  (id)[self.somoColor colorWithAlphaComponent:0.1].CGColor];
		_somoLayer.startPoint = CGPointMake(0, 0.5);
		_somoLayer.endPoint = CGPointMake(1, 0.5);
		
	}
	return _somoLayer;
}

@end
