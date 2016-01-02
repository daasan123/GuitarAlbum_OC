//
//  GARhythmEditingView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/6.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GARhythmEditingView.h"

CGFloat const rhythmLineOffsetY = 50;

@implementation GARhythmEditingView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
    NSLog(@"point:%@", NSStringFromCGPoint(point));
    
    NSInteger verticalCount = 0;
    for (NSInteger i = 0; i < 4; i ++)
    {
        verticalCount += self->p[i] > 0 ? 1 : 0;
    }
    NSInteger lineCount = 6;
//    switch (self.chord.type)
//    {
//        case kChordTypeGuitar: lineCount = 6;break;
//        default:lineCount = 4;break;
//    }
    
    CGFloat lineWidth = 1;
    CGFloat deltX = (self.width - 2.0*self->p[0])/(verticalCount - 1);
    CGFloat deltY = self.rhythmLineGap + lineWidth;
    NSLog(@"deltX:%lf, deltY:%lf", deltX, deltY);
    
    NSInteger x = (point.x - self->p[0] + deltX/2.0)/deltX;
    NSInteger y = (point.y - self.rhythmLineOffsetY + deltY/2.0)/deltY;
    
    NSLog(@"x:%zd, y:%zd", x, y);
    
    NSArray *points = self.rhythm.points;
    NSString *tmpPoint = points[x][y];
    NSLog(@"tmpPoint:%@", tmpPoint);
    if ([tmpPoint isEqualToString:@""])
    {
        points[x][y] = @"X";
    }
    else
    {
        points[x][y] = @"";
    }
    [self setNeedsDisplay];
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    NSInteger lineCount  = 6;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i < lineCount; i++)
    {
        CGFloat y = self.rhythmLineOffsetY + i * self.rhythmLineGap;
        CGContextMoveToPoint(context, 0 , y);
        CGContextAddLineToPoint(context, self.width, y);
    }
    CGContextStrokePath(context);
    
}


@end
