//
//  GARhythmView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/23.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GARhythmView.h"

CGFloat const rhythmMarkHeight = 10;
CGFloat const rhythmMarkBottomGap = 40;
CGFloat const rhythmPointCountMax = 4;

CGFloat const RhythmLineOffsetY = 10;
CGFloat const rhythmLineGap = 10;

@implementation GARhythmView
{
   
}

- (instancetype)initWithFrame:(CGRect)aFrame andRhythm:(GARhythm *)aRhythm
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        p = (CGFloat *)malloc(sizeof(CGFloat) * rhythmPointCountMax);
        memset(p, 0, sizeof(CGFloat) * rhythmPointCountMax);
        _rhythm = aRhythm;
        self.backgroundColor = [UIColor clearColor];
        [self showBorderWithColor:[UIColor blueColor] andWidth:2];
        
        _rhythmLineGap = rhythmLineGap;
        _rhythmLineOffsetY = RhythmLineOffsetY;
    }
    return self;
}

- (void)setRhythm:(GARhythm *)rhythm
{
    if (_rhythm != rhythm)
    {
        _rhythm = nil;
        _rhythm = [rhythm copy];
        [self setNeedsDisplay];
    }
    
}

- (void)setRhythmLineGap:(CGFloat)rhythmLineGap
{
    if (_rhythmLineGap != rhythmLineGap)
    {
        _rhythmLineGap = rhythmLineGap;
        [self setNeedsDisplay];
    }
}

- (void)setRhythmLineOffsetY:(CGFloat)rhythmLineOffsetY
{
    if (_rhythmLineOffsetY != rhythmLineOffsetY)
    {
        _rhythmLineOffsetY = rhythmLineOffsetY;
        [self setNeedsDisplay];
    }
}

- (void)dealloc
{
    free(p);
}

- (void)drawRect:(CGRect)rect
{
    CGFloat lineWidth = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGFloat width = self.width;
    CGFloat height  = self.height;
    CGFloat yTop = self.rhythmLineOffsetY + self.rhythmLineGap * 6;
    CGFloat yBottom = yTop + rhythmMarkHeight;
    CGFloat gap = width / 4.0;
    CGFloat deltHeight = rhythmMarkHeight/3.0;// 双线高度增量
    
    for (NSInteger i = 0; i < 4; i ++)
    {
        p[i] = 0;
    }
    
    switch (_rhythm.type)
    {
        // |
        case kRhythmType1:
            p[0] = gap * 2;
            CGContextMoveToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[0], yTop);
            break;
        // |_|
        case kRhythmType2:
            p[0] = gap;
            p[1] = gap * 3;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            break;
        // |._|
        case kRhythmType2_pointLeft:
        {
            p[0] = gap;
            p[1] = gap * 3;
            CGFloat tmp = width / 8.0;
            CGContextMoveToPoint(context, p[0], yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextMoveToPoint(context, p[0] + tmp / 2.0, yBottom);
            CGContextAddArc(context, p[0] + tmp / 2.0, yBottom, tmp / 4.0, 0, 2 * M_PI, 1);
            CGContextMoveToPoint(context, p[0] + tmp, yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            break;
        }
        // |_.|
        case kRhythmType2_pointRight:
        {
            p[0] = gap;
            p[1] = gap * 3;
            CGFloat tmp = width / 8.0;
            CGContextMoveToPoint(context, p[1], yTop);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextMoveToPoint(context, p[1] - tmp / 2.0, yBottom);
            CGContextAddArc(context, p[1] - tmp / 2.0, yBottom, tmp / 4.0, 0, 2 * M_PI, 1);
            CGContextMoveToPoint(context, p[1] - tmp, yBottom);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[0], yTop);
            break;
        }
        // |_|_|
        case kRhythmType3:
        {
            p[0] = gap;
            p[1] = gap * 2;
            p[2] = gap * 3;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            CGContextMoveToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[2], yBottom);
            CGContextAddLineToPoint(context, p[2], yTop);
            break;
        }
        // |=|_|
        case kRhythmType3_2left:
        {
            p[0] = gap;
            p[1] = gap * 2;
            p[2] = gap * 3;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            CGContextMoveToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[2], yBottom);
            CGContextAddLineToPoint(context, p[2], yTop);
            
            CGContextMoveToPoint(context, p[0], yBottom - rhythmMarkHeight/3.0);
            CGContextAddLineToPoint(context, p[1], yBottom - rhythmMarkHeight/3.0);
            break;
        }
        // |_|=|
        case kRhythmType3_2right:
        {
            p[0] = gap;
            p[1] = gap * 2;
            p[2] = gap * 3;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            CGContextMoveToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[2], yBottom);
            CGContextAddLineToPoint(context, p[2], yTop);
            
            CGContextMoveToPoint(context, p[1], yBottom - deltHeight);
            CGContextAddLineToPoint(context, p[2], yBottom - deltHeight);
            break;
        }
        // |=|=|=|
        case kRhythmType4:
        {
            gap = width / 5.0;
            p[0] = gap;
            p[1] = gap * 2;
            p[2] = gap * 3;
            p[3] = gap * 4;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, p[0], yBottom);
            CGContextAddLineToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[1], yTop);
            CGContextMoveToPoint(context, p[1], yBottom);
            CGContextAddLineToPoint(context, p[2], yBottom);
            CGContextAddLineToPoint(context, p[2], yTop);
            CGContextMoveToPoint(context, p[2], yBottom);
            CGContextAddLineToPoint(context, p[3], yBottom);
            CGContextAddLineToPoint(context, p[3], yTop);
            
            CGFloat tmp = yBottom - deltHeight;
            CGContextMoveToPoint(context, gap, tmp);
            CGContextAddLineToPoint(context, p[1], tmp);
            CGContextAddLineToPoint(context, p[1], yTop);
            CGContextMoveToPoint(context, p[1], tmp);
            CGContextAddLineToPoint(context, p[2], tmp);
            CGContextAddLineToPoint(context, p[2], yTop);
            CGContextMoveToPoint(context, p[2], tmp);
            CGContextAddLineToPoint(context, p[3], tmp);
            CGContextAddLineToPoint(context, p[3], yTop);
            break;
        }
    }
    CGContextStrokePath(context);
    
    // 扫弦（@"1:8:6,1-1,6-3,1-1,3"）
    if (_rhythm.style == kRhythmStyleStrum)
    {
        for (NSInteger i = 0; i < rhythmPointCountMax; i ++)
        {
            if (_rhythm.points.count > i)
            {
                NSArray *group = _rhythm.points[i];
                if (group.count < 2)
                {
                    NSLog(@"扫弦格式错误");
                    return;
                }
                // 扫弦延音
                if ([group[0] length] == 0 || [group[1] length] == 0)
                {
                    continue;
                }
                NSInteger start = [group[0] integerValue];
                if (start > 5) start = 5;if (start < 0) start = 0;
                NSInteger end = [group[1] integerValue];
                if (end > 5) end = 5;if (end < 0) end = 0;
                CGFloat tmp = _rhythmLineOffsetY + end * _rhythmLineGap;
                CGFloat tmpDelt = ((end > start) ? -10 : 10);
                CGContextMoveToPoint(context, p[i], _rhythmLineOffsetY + start * _rhythmLineGap);
                CGContextAddLineToPoint(context, p[i], tmp);
                // 箭头
                CGContextAddLineToPoint(context, p[i] - 5, tmp + tmpDelt);
                CGContextMoveToPoint(context, p[i], tmp);
                CGContextAddLineToPoint(context, p[i] + 5, tmp + tmpDelt);
                
            }
        }
        CGContextStrokePath(context);
    }
    // 分解和弦绘制落点（@"2:8:,,,,,X-,,X,,,-,X,,,,-,,X,,,"）
    else if (_rhythm.style == kRhythmStylePoint)
    {
        CGFloat textHeight = _rhythmLineGap;
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setAlignment:NSTextAlignmentCenter];
        NSDictionary *styleDict = @{NSFontAttributeName:[UIFont systemFontOfSize:textHeight/1.193], NSParagraphStyleAttributeName:style};
        
        for (NSInteger i = 0; i < rhythmPointCountMax; i ++)
        {
            if (_rhythm.points.count > i)
            {
                NSArray *group = _rhythm.points[i];
                for (NSInteger j = 0; j < group.count; j ++)
                {
                    NSString *each = group[j];
                    if (each.length > 0)
                    {
    //                    CGContextMoveToPoint(context, p[i], chartLineOffsetY - width + _rhythmLineGap * j);
    //                    CGContextAddArc(context, p[i], chartLineOffsetY - width + _rhythmLineGap * j, 2, 0, 2 * M_PI, 1);
                    
                        [each drawInRect:[self rectForPoint:CGPointMake(p[i], _rhythmLineOffsetY + _rhythmLineGap * j) withWidth:textHeight height:textHeight] withAttributes:styleDict];
                    }
                }
            }
        }
    }
    
    
}

- (CGRect)rectForPoint:(CGPoint)aPoint withWidth:(CGFloat)w height:(CGFloat)h
{
    return  CGRectMake(aPoint.x - w/2.0, aPoint.y - h/2.0, w, h);
}

@end
