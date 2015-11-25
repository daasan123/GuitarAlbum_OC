//
//  GAChartView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChartView.h"

CGFloat const chartLineGap = 10;
CGFloat const chartLineOffsetX = 25;
CGFloat const chartLineOffsetY = 80;


@implementation GAChartView
{
    NSInteger _sectionCount;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _sectionCount = 4;
        _type = kChartTypeGuitar;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSInteger lineCount;
    switch (_type)
    {
        case kChartTypeGuitar:
            lineCount = 6;
            break;
        case kChartTypeUke:lineCount = 4;
            break;
        default:lineCount = 10;
            break;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i < lineCount; i++)
    {
        CGFloat delt = i * chartLineGap;
        CGContextMoveToPoint(context, chartLineOffsetX , chartLineOffsetY + delt);
        CGContextAddLineToPoint(context, self.width - chartLineOffsetX, chartLineOffsetY + delt);
    }
    
    CGFloat sectionWidth = (self.width - chartLineOffsetX * 2)/_sectionCount;
     for (int i = 0; i <= _sectionCount; i++)
    {
        CGFloat delt = i * sectionWidth;
        CGContextMoveToPoint(context, chartLineOffsetX + delt, chartLineOffsetY);
        CGContextAddLineToPoint(context, chartLineOffsetX + delt, chartLineOffsetY + (lineCount - 1) * chartLineGap);
    }
    
    CGContextStrokePath(context);
}
@end
