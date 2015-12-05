//
//  GAChordView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChordView.h"

CGFloat const nameLabelPercent = 0.4;

@implementation GAChordView
{
    UILabel *nameLabel;
}

- (instancetype)initWithFrame:(CGRect)frame andChord:(GAChord *)aChord
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _chord = aChord;
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat labelHeight = frame.size.height * nameLabelPercent;
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, labelHeight)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont systemFontOfSize:labelHeight / 1.2];
        nameLabel.text = _chord.name;
        [self addSubview:nameLabel];
        
        [self showBorder];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    nameLabel.text = _chord.name;
    
    
    NSInteger lineCount;
    CGFloat lineWidth = 1;
    switch (_chord.type)
    {
        case kChordTypeGuitar: lineCount = 6;break;
        default:lineCount = 4;break;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, lineWidth);
    
    CGFloat deltX = (self.width - 6.0*lineWidth)/6.0;
    CGFloat deltY = (self.height*(1-nameLabelPercent) - 4.0*lineWidth)/3.0;
    CGPoint p1 = CGPointMake(lineWidth/2.0 + deltX/2.0, self.height*nameLabelPercent + lineWidth/2.0);
    CGPoint p2 = CGPointMake(self.width - lineWidth/2.0 - deltX/2.0, self.height*nameLabelPercent + lineWidth/2.0);
    CGFloat tmp;
    // 和弦横线
    for (NSInteger i = 0; i <= 3; i ++)
    {
        tmp = (deltY + lineWidth) * i;
        CGContextMoveToPoint(context, p1.x, p1.y + tmp);
        CGContextAddLineToPoint(context, p2.x, p2.y + tmp);
    }
    // 和弦竖线
    p2 = CGPointMake(p1.x, self.height - lineWidth / 2.0);
    for (NSInteger i = 0; i < lineCount; i ++)
    {
        tmp = (deltX + lineWidth) * i;
        CGContextMoveToPoint(context, p1.x + tmp, p1.y);
        CGContextAddLineToPoint(context,p2.x + tmp, p2.y);
        
        // 画和弦点
        NSInteger point = [_chord.points[i] integerValue];
        if (point > 0)
        {
            CGPoint p = CGPointMake(p1.x + tmp, p1.y + (lineWidth + deltY) * (2 * point - 1) / 2.0);
            CGContextMoveToPoint(context, p.x, p.y);
            CGContextAddArc(context, p.x, p.y, deltX * 2.0 / 6.0, 0, 2 * M_PI, 1);
        }
    }
    
    //CGContextStrokePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}
@end
