//
//  GAChordLibrary.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/5.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAChord.h"
@interface GAChordLibrary : NSObject
@property (nonatomic, strong) NSMutableDictionary *chords;
+ (instancetype)sharedLibrary;

- (NSString *)chordNameWithChord:(GAChord *)aChord;

@end
