//
//  CommonViewController.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/25.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "CommonViewController.h"
#import "SView.h"
#import "Somo.h"

@interface CommonViewController ()
@property (weak, nonatomic) IBOutlet SView *sview;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
	self.navigationItem.titleView.contentMode = UIViewContentModeScaleAspectFit;
	
	[self.sview beginSomo];
}
 

@end
