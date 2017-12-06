//
//  SomoListController.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/25.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "SomoListController.h"

@interface SomoListController ()

@end

@implementation SomoListController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.tableFooterView = [UIView new];
	self.tableView.rowHeight = 80;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.row == 1) {
		UIViewController * vc = [[NSClassFromString(@"TableViewSkeletonController") alloc] init];
		[self.navigationController pushViewController:vc animated:YES];
	}
	else if (indexPath.row == 2){
		UIViewController * vc = [[NSClassFromString(@"DataSourceTableViewController") alloc] init];
		[self.navigationController pushViewController:vc animated:YES];
	}
	else{
		UIViewController * vc = [[NSClassFromString(@"CommonViewController") alloc] init];
		[self.navigationController pushViewController:vc animated:YES];
	}
}

@end
