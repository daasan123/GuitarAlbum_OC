//
//  GARhythm.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GARhythm.h"

@implementation GARhythm
// 2:1:x,x,x,,,x
// 2:2:x,,,,,-,x,,,,
+ (GARhythm *)rhythmByString:(NSString *)aString
{
    GARhythm *beat = [[GARhythm alloc] init];
    NSArray *tmpArray = [aString componentsSeparatedByString:@":"];
    if (tmpArray.count >= 3)
    {
        beat.style = [tmpArray[0] integerValue];
        beat.type = [tmpArray[1] integerValue];
        NSMutableArray *tmpPoints = [NSMutableArray array];
        NSString *tmpString = tmpArray[2];
        NSArray *tmpArray = [tmpString componentsSeparatedByString:@"-"];
        for (NSString *each in tmpArray)
        {
            [tmpPoints addObject:[each componentsSeparatedByString:@","]];
        }
        beat.points = tmpPoints;
        NSLog(@"beatPoints:%@", beat.points);
    }
    return beat;
}
@end
