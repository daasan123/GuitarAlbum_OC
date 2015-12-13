//
//  GAChord.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChord.h"

@implementation GAChord

#pragma mark - LifeCycle
// G:0:320003
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _points = [[NSMutableArray alloc] init];
        _name = @"";
    }
    return self;
}

+ (GAChord *)chordByString:(NSString *)aString
{
    GAChord *chord = [[GAChord alloc] init];
    NSArray *tmpArray = [aString componentsSeparatedByString:@":"];
    if (tmpArray.count >= 3)
    {
        chord.name = tmpArray[0];
        chord.baseTone = [tmpArray[1] integerValue];
        NSString *pointsString = tmpArray[2];
        for (NSInteger i = 0; i < pointsString.length; i ++)
        {
            [chord.points addObject:[pointsString substringWithRange:NSMakeRange(i, 1)]];
        }
        chord.type = chord.points.count >4 ? kChordTypeGuitar : kChordTypeUke;
    }
    
    return chord;
}

- (NSString *)chordString
{
    NSMutableString *chordString = [[NSMutableString alloc] init];
    //[chordString appendString:_name];
    [chordString appendString:[NSString stringWithFormat:@"%zd", _baseTone]];
    [chordString appendString:@":"];
    for (NSInteger i = 0; i < _points.count; i ++)
    {
        [chordString appendString:_points[i]];
    }
    return chordString;
}

@end
