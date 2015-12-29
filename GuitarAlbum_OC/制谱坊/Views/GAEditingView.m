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


@implementation GAEditingView
{
    UITableView *_chordTableView;
    NSMutableArray *_chordArray;
    
    GAChordEditingView *_chordEditingView;
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
    _chordArray = [[NSMutableArray alloc] init];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];
    [_chordArray addObject:[GAChord chordByString:@"G:0:320003"]];
    [_chordArray addObject:[GAChord chordByString:@"C:0:032010"]];

}

- (void)viewInit
{
    // 和弦列表
    _chordTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 50, self.frame.size.height) style:UITableViewStylePlain];
    [_chordTableView registerClass:[GAEditingViewChordCell class] forCellReuseIdentifier:editingViewChordCellID];
    _chordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _chordTableView.delegate = self;
    _chordTableView.dataSource = self;
    _chordTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_chordTableView];
    
    // 和弦编辑
    _chordEditingView = [[GAChordEditingView alloc] initWithFrame:CGRectMake(100, 0, 200, 200) andChord:_chordArray[0]];
    [self addSubview:_chordEditingView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _chordArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GAEditingViewChordCell *cell = [tableView dequeueReusableCellWithIdentifier:editingViewChordCellID forIndexPath:indexPath];
    cell.chord = _chordArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"chord:%@", _chordArray[indexPath.row]);
    _chordEditingView.chord = _chordArray[indexPath.row];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
