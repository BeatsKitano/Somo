### 目录

### 
 * [简介](#somo_intro)
 * [集成](#somo_integrate)
 * [用法](#somo_usage)
 * [UITableView-skeleton](#somo_uitableview)


### <a id="somo_intro"></a>简介 
![](https://github.com/xorshine/Somo/blob/master/Somo.gif)

### <a id="somo_integrate"></a>集成
```pod 'Somo'```

### <a id="somo_usage"></a>使用
```objective-c
#import "Somo.h" 
```
* 当需要某一个UIView拥有Skeleton效果时，只需遵守<SomoSkeletonLayoutProtocol>协议，实现一个必要方法：
	
```objective-c
@required
/**
 *  Example:
	 SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
	 SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 15)];
	 SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 100, 15)];

	return @[s0,s1,s2];
 *
 @return array of SomoViews
 */
- (NSArray<SomoView *> *)somoSkeletonLayout;
```
* Somo对UIView进行了扩展，开发者扩展方法即可拥有Skeleton效果：
```objective-c
- (void)beginSomo;
- (void)endSomo; 
```
### <a id="somo_uitableview"></a>UITableView-skeleton

在常见场景中，数据请求未着陆前，UITableView中所有visibleCells都应该呈现skeleton效果。为了达到这种效果，您不必再编写更多的代码。Somo中有一个遵循<UITableViewDataSource,UITableViewDelegate>协议的SomoDataSourceProvider类，您只需要按照该类指定的初始化方法构造一个实例，数据未着陆前，将tableview实例的datasource和delegate指向构造出的SomoDataSourceProvider实例。当数据着陆后，将tableview的datasource和delegate指向controller或其他。

* 数据着陆前：
```objective-c
#pragma mark - provider
//将tableview的datasource指向SomoDataSourceProvider
//当数据加载完成后，将tableview的datasource指向self
self.provider = [SomoDataSourceProvider dataSourceProviderWithCellReuseIdentifier:@"id"];
self.tableView.dataSource = self.provider;
self.tableView.delegate = self.provider;
```
* 数据着陆后：
```objective-c
#pragma mark - 
self.tableView.dataSource = self;
self.tableView.delegate = self;
//============================
[self.tableView reloadData];
```
#### 注意点:
你必须实现<UITableViewDelegate>中的一个方法：
	
```objective-c
#pragma mark - 在这里必调用 endSomo
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	[cell endSomo];
}
```

*** 
* Somo is a Skeleton-style animation library that's simple enough.
