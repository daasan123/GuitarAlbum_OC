//
//  GARhythmView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/23.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GARhythmView.h"

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
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
}

@end
