//
//  UIView+Extension.m
//  BaseClass
//
//  Created by Peter on 15/5/21.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView(ViewFrameGeometry)

// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

@end

@implementation UIView(ViewBorderDebug)

-(void)showBorderWithRGB:(CGFloat *)color width:(CGFloat)width;
{
#ifdef DEBUG
#if ENABLE_UI_BORDER_DEBUG
    self.layer.borderColor=[UIColor colorWithRed:color[0] green:color[1] blue:color[2] alpha:color[3]].CGColor;
    self.layer.borderWidth=width;
#endif
#endif
}

-(void)showBorder
{
    CGFloat c[4]={1.0,0,0,1.0};
    [self showBorderWithRGB:c width:2];
}

-(void)showBorderWithColor:(UIColor *)aColor andWidth:(CGFloat)aWidth
{
    CGFloat c[4]={0.0,0.0,0.0,1.0};
    [aColor getRed:c green:c+1 blue:c+2 alpha:c+3];
    [self showBorderWithRGB:c width:aWidth];
}

@end