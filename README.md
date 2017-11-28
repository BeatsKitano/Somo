### 介绍
iOS数据加载时的UI，在前几年，UI效果太过于局限。直到Skeleton出现,<br/>
这种效果是预先加载布局，用户不是面对一片空白，或者面对一个简单的旋转效果。<br/>
Somo对UIView进行了扩展，开发者只需要调用一个方法即可开始或者结束Skeleton效果。

![](https://github.com/xorshine/Somo/blob/master/Somo.gif)

***
### 用法

① 集成：```pod 'Somo'```<br/>
***
② 当需要某一个UIView拥有Skeleton效果时，只需遵守<SomoSkeletonLayoutProtocol>协议

```objective-c
/**
 *	SomoSkeletonLayoutProtocol
 *
 *	When you need a view that has a Skeleton effect
 *  set the view to follow the protocol
**/
@protocol SomoSkeletonLayoutProtocol<NSObject>
```
***
③ <SomoSkeletonLayoutProtocol>你必须实现一个@required方法
```objective-c
@required
/**
 *  Example:
		 SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
		 SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 15)];
		 SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 100, 15)];
 
		return @[s0,s1,s2];
 *
 *
 @return array of SomoViews
 */
- (NSArray<SomoView *> *)somoSkeletonLayout;
```
***
④调用UIView的SomoSkeleton扩展方法
```objective-c
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
```

*** 
Somo is a Skeleton-style animation library that's simple enough.

### Cocoapods

Get [Cocoapods](https://cocoapods.org/)
Add the pod to your podfile
```
pod 'Somo'
```
run
```
pod install
```
After installing the cocoapod into your project import Lottie with
Objective C
`#import "Somo.h"` 

## Objective C Examples

```objective-c

- (NSArray<SomoView *> *)somoSkeletonLayout{
	SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
	SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 15)];
	SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 100, 15)];
	
	return @[s0,s1,s2];
}

#import "Somo.h"
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
```

