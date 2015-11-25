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
    
    GABeatView *beat1 = [[GABeatView alloc] initWithFrame:CGRectMake(35, 0, 70, 200)];
    beat1.chord = [GAChord chordByString:@"G:0:320003"];
    beat1.rhythm = [GARhythm rhythmByString:@"2:8:,,,,,X-,,X,,,-,X,,,,-,,X,,,"];
    [chart1 addSubview:beat1];
    
    GABeatView *beat2 = [[GABeatView alloc] initWithFrame:CGRectMake(35 + 80, 0, 70, 200)];
    beat2.chord = [GAChord chordByString:@"C:0:032010"];
    beat2.rhythm = [GARhythm rhythmByString:@"1:8:,0-0,5-2,0-0,2"];
    [chart1 addSubview:beat2];
}
@end
