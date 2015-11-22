//
//  GABeatView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAChord.h"
#import "GARhythm.h"

@interface GABeatView : UIView
@property (nonatomic, strong) GAChord *chord;
@property (nonatomic, strong) GARhythm *rhythm;
@end
