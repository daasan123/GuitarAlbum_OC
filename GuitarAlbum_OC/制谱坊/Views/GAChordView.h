//
//  GAChordView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAChord.h"

/**
 *  和弦类型
 */
typedef NS_ENUM(NSInteger, ChordType) {
    kChordTypeGuitar,
    kChordTypeUke,
};

@interface GAChordView : UIView
- (instancetype)initWithFrame:(CGRect)frame andChord:(GAChord *)aChord;
@property (nonatomic, assign) ChordType type;
@end
