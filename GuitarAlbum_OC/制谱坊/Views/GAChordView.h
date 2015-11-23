//
//  GAChordView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAChord.h"



@interface GAChordView : UIView
- (instancetype)initWithFrame:(CGRect)frame andChord:(GAChord *)aChord;

@end
