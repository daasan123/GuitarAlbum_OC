//
//  GABeatView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GABeatView.h"
#import "GAChordView.h"

@implementation GABeatView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
    }
    return self;
}
- (void)setChord:(GAChord *)chord
{
    if (_chord != chord)
    {
        _chord = nil;
        _chord = chord;
        
        GAChordView *chordView = [[GAChordView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width) andChord:chord];
        [self addSubview:chordView];
    }
}
@end
