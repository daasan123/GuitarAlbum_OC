//
//  GARhythmView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/23.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GARhythmView.h"

CGFloat const rhythmMarkHeight = 10;
CGFloat const rhythmMarkBottomGap = 20;

@implementation GARhythmView
{
    GARhythm *_rhythm;
}

- (instancetype)initWithFrame:(CGRect)aFrame andRhythm:(GARhythm *)aRhythm
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        _rhythm = aRhythm;
        self.backgroundColor = [UIColor clearColor];
        [self showBorder];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat lineWidth = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGFloat width = self.width;
    CGFloat height  = self.height;
    CGFloat yTop = height - rhythmMarkBottomGap - rhythmMarkHeight;
    CGFloat yBottom = height - rhythmMarkBottomGap;
    CGFloat gap = width / 4.0;
    CGFloat deltHeight = rhythmMarkHeight/3.0;// 双线高度增量
    switch (_rhythm.type)
    {
        // |
        case kRhythmType1:
            CGContextMoveToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            break;
        // |_|
        case kRhythmType2:
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            break;
        // |._|
        case kRhythmType2_pointLeft:
        {
            CGFloat tmp = width / 8.0;
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextMoveToPoint(context, gap + tmp / 2.0, yBottom);
            CGContextAddArc(context, gap + tmp / 2.0, yBottom, tmp / 4.0, 0, 2 * M_PI, 1);
            CGContextMoveToPoint(context, gap + tmp, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            break;
        }
        // |_.|
        case kRhythmType2_pointRight:
        {
            CGFloat tmp = width / 8.0;
            CGContextMoveToPoint(context, gap * 3, yTop);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextMoveToPoint(context, gap * 3 - tmp / 2.0, yBottom);
            CGContextAddArc(context, gap * 3 - tmp / 2.0, yBottom, tmp / 4.0, 0, 2 * M_PI, 1);
            CGContextMoveToPoint(context, gap * 3 - tmp, yBottom);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap, yTop);
            break;
        }
        // |_|_|
        case kRhythmType3:
        {
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            CGContextMoveToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            break;
        }
        // |=|_|
        case kRhythmType3_2left:
        {
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            CGContextMoveToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            
            CGContextMoveToPoint(context, gap, yBottom - rhythmMarkHeight/3.0);
            CGContextAddLineToPoint(context, gap * 2, yBottom - rhythmMarkHeight/3.0);
            break;
        }
        // |_|=|
        case kRhythmType3_2right:
        {
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            CGContextMoveToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            
            CGContextMoveToPoint(context, gap * 2, yBottom - deltHeight);
            CGContextAddLineToPoint(context, gap * 3, yBottom - deltHeight);
            break;
        }
        // |=|=|
        case kRhythmType4:
        {
            CGContextMoveToPoint(context, gap, yTop);
            CGContextAddLineToPoint(context, gap, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            CGContextMoveToPoint(context, gap * 2, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yBottom);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            
            CGFloat tmp = yBottom - deltHeight;
            CGContextMoveToPoint(context, gap, tmp);
            CGContextAddLineToPoint(context, gap * 2, tmp);
            CGContextAddLineToPoint(context, gap * 2, yTop);
            CGContextMoveToPoint(context, gap * 2, tmp);
            CGContextAddLineToPoint(context, gap * 3, tmp);
            CGContextAddLineToPoint(context, gap * 3, yTop);
            break;
        }
    }
    CGContextStrokePath(context);
}

@end
