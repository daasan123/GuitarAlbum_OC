//
//  GAChord.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChord.h"

@implementation GAChord
// G:0:320003
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
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
        NSMutableArray *tmpPoints = [NSMutableArray array];
        for (NSInteger i = 0; i < pointsString.length; i++)
        {
            [tmpPoints addObject:[pointsString substringWithRange:NSMakeRange(i, 1)]];
        }
        chord.points = [NSArray arrayWithArray:tmpPoints];
    }
    
    return chord;
}
@end
