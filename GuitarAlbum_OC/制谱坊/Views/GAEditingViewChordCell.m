//
//  GAEditingViewChordCell.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/29.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAEditingViewChordCell.h"
#import "GAChordView.h"

NSString * const editingViewChordCellID = @"EditingViewChordCellID";

@implementation GAEditingViewChordCell
{
    GAChordView *_chordView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setChord:(GAChord *)chord
{
    if (!_chordView)
    {
        _chordView = [[GAChordView alloc] initWithFrame:CGRectMake(0, 2, 50, 50) andChord:chord];
        [self.contentView addSubview:_chordView];
    }
    _chordView.chord = chord;
}

- (GAChord *)chord
{
    return _chordView.chord;
}

@end
