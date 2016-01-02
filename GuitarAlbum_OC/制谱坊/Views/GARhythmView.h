//
//  GARhythmView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/23.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GARhythm.h"

@interface GARhythmView : UIView
{
@public
    CGFloat *p;
}
@property (nonatomic, strong) GARhythm *rhythm;
@property (nonatomic, assign) CGFloat rhythmLineGap;
@property (nonatomic, assign) CGFloat rhythmLineOffsetY;

- (instancetype)initWithFrame:(CGRect)aFrame andRhythm:(GARhythm *)aRhythm;
@end
