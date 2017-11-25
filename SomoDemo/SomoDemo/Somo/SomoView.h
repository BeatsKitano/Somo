//
//  SomoView.h
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/24.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *	The essence of the Skeleton effect is the view of the placeholders.
 *	For example, a Cell, when cells show the Skeleton effect,
 *	you want to display two dark rectangular bars on the cell,
 *	each rectangle is a SomoView
 */
@interface SomoView : UIView

@property (strong, nonatomic) UIColor *somoColor; 

/**
 * constructor
 *
 @return SomoView
 */
- (instancetype)initWithFrame:(CGRect)rect somoColor:(UIColor *)color;

@end
