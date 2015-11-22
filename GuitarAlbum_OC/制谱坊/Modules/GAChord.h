//
//  GAChord.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GAChord : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger baseTone;
@property (nonatomic, strong) NSArray *points;

+ (GAChord *)chordByString:(NSString *)aString;
@end
