 
Somo is a Skeleton-style animation library that's simple enough.

## Introduction
![Example1](https://github.com/xorshine/Somo/blob/master/SomoDemo/somo.mov)

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

