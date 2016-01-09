//
//  GAEditingViewRhythmCell.m
//  GuitarAlbum_OC
//
//  Created by peter on 16/1/3.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import "GAEditingViewRhythmCell.h"
#import "GARhythmView.h"

NSString * const editingViewRhythmCellID = @"EditingViewRhythmCellID";


@implementation GAEditingViewRhythmCell
{
    GARhythmView *_rhythmView;
}
- (void)setRhythm:(GARhythm *)rhythm
{
    if (!_rhythmView)
    {
        _rhythmView = [[GARhythmView alloc] initWithFrame:CGRectMake(0, 2, 50, 50) andRhythm:rhythm];
        _rhythmView.rhythmLineGap = 4;
        _rhythmView.rhythmLineOffsetY = 0;
        [self.contentView addSubview:_rhythmView];
    }
    _rhythmView.rhythm = rhythm;
}

- (GARhythm *)rhythm
{
    return _rhythmView.rhythm;
}


@end
