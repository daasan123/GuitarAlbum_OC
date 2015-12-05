//
//  GAChordEditingView.m
//  GuitarAlbum_OC
//
//  Created by wubing on 15/11/25.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChordEditingView.h"

@implementation GAChordEditingView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
    NSLog(@"point:%@", NSStringFromCGPoint(point));
    
    
    NSInteger lineCount;
    switch (self.chord.type)
    {
        case kChordTypeGuitar: lineCount = 6;break;
        default:lineCount = 4;break;
    }
    CGFloat lineWidth = 1;
    CGFloat deltX = (self.width - 6.0*lineWidth)/6.0;
    CGFloat deltY = (self.height*(1-nameLabelPercent) - 4.0*lineWidth)/3.0;
    
    NSInteger x = (point.x)/(deltX + lineWidth);
    NSInteger y = (point.y - self.height * nameLabelPercent)/deltY;
    
    if ([self.chord.points[x] isEqualToString:@"0"])
    {
        [self.chord.points replaceObjectAtIndex:x withObject:[NSString stringWithFormat:@"%zd", y + 1]];
    }
    else
    {
        
        NSString *current = [NSString stringWithFormat:@"%zd", y + 1];
        // 取消
        if ([self.chord.points[x] isEqualToString:current])
        {
            current = @"0";
        }
        [self.chord.points replaceObjectAtIndex:x withObject:current];
    }
    NSLog(@"array:%@", self.chord.points);
    self.chord.name = [[GAChordLibrary sharedLibrary] chordNameWithChord:self.chord];
    [self setNeedsDisplay];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
