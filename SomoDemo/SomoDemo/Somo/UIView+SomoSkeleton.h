//
//  UIView+Somo.h
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/23.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SomoSkeleton)

@property (strong, nonatomic, readonly) UIView * somoContainer;

/**
 *	When this method is called, the view will have a Skeleton effect,
 *	and the view's subview will be completely obscured.
 */
- (void)beginSomo;

/**
 *	When this method is called and the view is restored to the state you set,
 *	the Skeleton effect disappears.
 */
- (void)endSomo;

@end
