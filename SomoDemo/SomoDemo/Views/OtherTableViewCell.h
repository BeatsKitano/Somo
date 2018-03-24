//
//  OtherTableViewCell.h
//  SomoDemo
//
//  Created by 向小辉 on 2018/3/24.
//  Copyright © 2018年 KINX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Somo.h"

@interface OtherTableViewCell : UITableViewCell<SomoSkeletonLayoutProtocol>
@property (assign, nonatomic) BOOL shouldLoading;
@end
