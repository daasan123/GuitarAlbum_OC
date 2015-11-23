//
//  UIView+Extension.h
//  BaseClass
//
//  Created by Peter on 15/5/21.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewFrameGeometry)

@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat top;
@property(nonatomic,assign) CGFloat left;
@property(nonatomic,assign) CGFloat bottom;
@property(nonatomic,assign) CGFloat right;

@end

@interface UIView(ViewBorderDebug)

#define ENABLE_UI_BORDER_DEBUG      1

/**
 * @brief 根据RGB数组和宽度显示边框
 */
-(void)showBorderWithRGB:(CGFloat *)color width:(CGFloat)width;
/**
 * @brief 显示红色宽度为2的边框
 */
-(void)showBorder;
/**
 * @brief 根据UIColor和宽度显示边框
 */
-(void)showBorderWithColor:(UIColor *)aColor andWidth:(CGFloat)aWidth;

@end