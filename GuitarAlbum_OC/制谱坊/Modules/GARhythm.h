//
//  GARhythm.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RhythmStyle)
{
    kRhythmStyleStrum = 1,    // 扫弦
    kRhythmStylePoint,        // 分解
    kRhythmStylePat,          // 拍弦
    kRhythmStylearpeggio      // 琶音
};

typedef NS_ENUM(NSInteger, RhythmType)
{
    kRhythmType1 = 1,             //  |
    kRhythmType2,                 // |_|
    kRhythmType2_pointLeft,       // |._|
    kRhythmType2_pointRight,      // |_.|
    kRhythmType3_2left,           // |=|-|
    kRhythmType3_2right,          // |-|=|
    kRhythmType4,                 // |=|=|
    kRhythmType6                  // |===|===|
};

@interface GARhythm : NSObject
@property (nonatomic, assign) RhythmStyle style;
@property (nonatomic, assign) RhythmType type;
@property (nonatomic, strong) NSArray *points;

+ (GARhythm *)rhythmByString:(NSString *)aString;
@end
