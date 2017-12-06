//
//  SomoDataSourceProvider.h
//  SomoDemo
//
//  Created by 向小辉 on 2017/12/6.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SomoDataSourceProvider : NSObject<UITableViewDataSource,UITableViewDelegate>

/**
 default 15
 */
@property (assign, nonatomic) NSInteger numberOfRowsInSection;

- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier;
+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier;

@end
