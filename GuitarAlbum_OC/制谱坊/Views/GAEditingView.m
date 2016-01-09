//
//  GAEditingView.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/29.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAEditingView.h"
#import "GAEditingViewChordCell.h"
#import "GAChordEditingView.h"
#import "GARhythmEditingView.h"
#import "GAEditingViewRhythmCell.h"

@implementation GAEditingView
{
    UITableView *_chordTableView;
    NSMutableArray *_chordArray;
    
    GAChordEditingView *_chordEditingView;
    GARhythmEditingView *_rhythmEditingView;
    
    UITableView *_rhythmTableView;
    NSMutableArray *_rhythmArray;
    
    CGFloat width;
    CGFloat height;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self dataInit];
    
        [self viewInit];
    }
    return self;
}

- (void)dataInit
{
    width = self.frame.size.width;
    height = self.frame.size.height;
    
    _chordArray = [[NSMutableArray alloc] init];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    
    _rhythmArray = [[NSMutableArray alloc] init];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:1:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:2:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:3:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:4:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:5:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:6:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:7:,,,,,-,,,,,-,,,,,-,,,,,"]];
    [_rhythmArray addObject:[GARhythm rhythmByString:@"2:8:,,,,,-,,,,,-,,,,,-,,,,,"]];
    
}

- (void)viewInit
{
    // 和弦列表
    _chordTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 50, height) style:UITableViewStylePlain];
    [_chordTableView registerClass:[GAEditingViewChordCell class] forCellReuseIdentifier:editingViewChordCellID];
    _chordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _chordTableView.delegate = self;
    _chordTableView.dataSource = self;
    _chordTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_chordTableView];
    
    // 和弦编辑
    _chordEditingView = [[GAChordEditingView alloc] initWithFrame:CGRectMake(100, 0, 200, height) andChord:_chordArray[0]];
    [self addSubview:_chordEditingView];
    
    // 节奏编辑视图
    _rhythmEditingView = [[GARhythmEditingView alloc] initWithFrame:CGRectMake(500, 0, 100, height) andRhythm:[GARhythm rhythmByString:@"2:8:,,,,,X-,,X,,,-,X,,,,-,,X,,,"]];
    _rhythmEditingView.rhythmLineOffsetY = 30;
    _rhythmEditingView.rhythmLineGap = 25;
    [self addSubview:_rhythmEditingView];
    
    // 和弦列表
    _rhythmTableView = [[UITableView alloc] initWithFrame:CGRectMake(width - 50, 0, 50, height) style:UITableViewStylePlain];
    [_rhythmTableView registerClass:[GAEditingViewRhythmCell class] forCellReuseIdentifier:editingViewRhythmCellID];
    _rhythmTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _rhythmTableView.delegate = self;
    _rhythmTableView.dataSource = self;
    _rhythmTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_rhythmTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _chordTableView)
    {
        return _chordArray.count;
    }
    else
    {
         return _rhythmArray.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _chordTableView)
    {
        GAEditingViewChordCell *cell = [tableView dequeueReusableCellWithIdentifier:editingViewChordCellID forIndexPath:indexPath];
        cell.chord = _chordArray[indexPath.row];
        return cell;
    }
    else
    {
        GAEditingViewRhythmCell *cell = [tableView dequeueReusableCellWithIdentifier:editingViewRhythmCellID forIndexPath:indexPath];
        GARhythm *rhythm = _rhythmArray[indexPath.row];
        NSLog(@"points:%@", rhythm.points);
        cell.rhythm = rhythm;
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _chordTableView)
    {
        NSLog(@"chord:%@", _chordArray[indexPath.row]);
        _chordEditingView.chord = _chordArray[indexPath.row];
    }
    else
    {
        _rhythmEditingView.rhythm = _rhythmArray[indexPath.row];
        NSLog(@"rhythm:%p", [_rhythmArray[indexPath.row] points]);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
