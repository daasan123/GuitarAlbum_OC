//
//  FactoryVC.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "FactoryVC.h"
#import "GAChartView.h"
#import "GAChordView.h"
#import "GABeatView.h"

@implementation FactoryVC
{
    UIScrollView *_scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 200)];
    [_scrollView showBorder];
    [self.view addSubview:_scrollView];
    
    GAChartView *chart1 = [[GAChartView alloc] initWithFrame:CGRectMake(0, 100, _scrollView.width, 200)];
    [chart1 showBorderWithColor:[UIColor blueColor] andWidth:1];
    
    [_scrollView addSubview:chart1];
    
    GABeatView *beatView = [[GABeatView alloc] initWithFrame:CGRectMake(35, 0, 70, 200)];
    beatView.chord = [GAChord chordByString:@"G:0:320003"];
    beatView.rhythm = [GARhythm rhythmByString:@"2:2:x,,,,,-,x,,,,"];
    [chart1 addSubview:beatView];
}
@end
