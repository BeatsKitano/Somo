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

@property (assign, nonatomic,getter=isLoaded) BOOL loaded;

@end

@implementation TableViewSkeletonController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.rowHeight = 100;
	[self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"id"];
	 
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
	self.navigationItem.titleView.contentMode = UIViewContentModeScaleAspectFit;
	
	self.loaded = NO;
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	//随便写一个代表网络请求3秒
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	__weak typeof(self) weakSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		__strong typeof(weakSelf) strongSelf = weakSelf;
		[strongSelf load];
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	});
}

- (void)load{
	self.loaded = YES;
	for (NSInteger i = 0; i < self.dataSource.count; i++) {
		self.dataSource[i] = @(NO);
	}
	[self.tableView reloadData];
	self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (self.loaded) {
		return self.dataSource.count;
	}
	
	//随便多少，cell个数能铺满屏幕即可
	return 10;
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
