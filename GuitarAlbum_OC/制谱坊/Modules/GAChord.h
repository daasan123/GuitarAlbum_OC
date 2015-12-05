//
//  GAChord.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  和弦类型
 */
typedef NS_ENUM(NSInteger, ChordType) {
    kChordTypeGuitar,
    kChordTypeUke,
};

@interface GAChord : NSObject
@property (nonatomic, assign) ChordType type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger baseTone;
@property (nonatomic, strong) NSMutableArray *points;

+ (GAChord *)chordByString:(NSString *)aString;
- (NSString *)chordString;
@end
