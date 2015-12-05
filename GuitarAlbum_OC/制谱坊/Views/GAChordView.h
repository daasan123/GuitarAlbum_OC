//
//  GAChordView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAChord.h"

extern CGFloat const nameLabelPercent;

@interface GAChordView : UIView
- (instancetype)initWithFrame:(CGRect)frame andChord:(GAChord *)aChord;
@property (nonatomic, strong) GAChord *chord;
@end
