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
            NSArray *points = [each componentsSeparatedByString:@","];
            
            [tmpPoints addObject:[[self mutablePointsFromPoints:points] mutableCopy]];
        }
        beat.points = [tmpPoints mutableCopy];
    }
    return beat;
}

- (void)setPoints:(NSMutableArray *)points
{
    if (_points != points)
    {
        if (!_points)
        {
            _points = [[NSMutableArray alloc] init];
        }
        [_points removeAllObjects];
        [_points addObjectsFromArray:points];
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    GARhythm *rhythm = [[GARhythm allocWithZone:zone] init];
    rhythm.style = self.style;
    rhythm.type = self.type;
    
    NSMutableArray *mPointsGroup = [[NSMutableArray alloc] init];
    
    for (NSArray *points in self.points)
    {
        [mPointsGroup addObject:[[[self class] mutablePointsFromPoints:points] mutableCopy]];
    }
    rhythm.points = [mPointsGroup mutableCopy];
    return rhythm;
    
}

+ (NSMutableArray *)mutablePointsFromPoints:(NSArray *)points
{
    NSMutableArray *mPoints = [[NSMutableArray alloc] initWithCapacity:points.count];
    for (NSString *eachPoint in points)
    {
        NSMutableString *point = mString(eachPoint);
        [mPoints addObject:[point copy]];
    }
    return mPoints;
}

@end
