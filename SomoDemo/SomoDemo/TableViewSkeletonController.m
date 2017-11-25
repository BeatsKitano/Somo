//
//  TableViewSkeletonController.m
//  SomoDemo
//
//  Created by 向小辉 on 2017/11/25.
//  Copyright © 2017年 KINX. All rights reserved.
//

#import "TableViewSkeletonController.h"
#import "TableViewCell.h"
#import "Somo.h"

@interface TableViewSkeletonController ()

@property (strong, nonatomic) NSMutableArray<NSNumber *> * dataSource;

@end

@implementation TableViewSkeletonController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.rowHeight = 100;
	[self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"id"];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(load)];
	
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
	self.navigationItem.titleView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)load{
	for (NSInteger i = 0; i < self.dataSource.count; i++) {
		self.dataSource[i] = @(NO);
	}
	[self.tableView reloadData];
	self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataSource.count;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.shouldLoading = self.dataSource[indexPath.row].boolValue;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableArray<NSNumber *> *)dataSource{
	if (!_dataSource) {
		_dataSource = [NSMutableArray array];
		for (NSInteger z = 0; z < 10; z++) {
			[_dataSource addObject:@(YES)];
		}
	}
	return _dataSource;
}

@end
