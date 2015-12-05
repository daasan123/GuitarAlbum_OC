//
//  GAChordLibrary.m
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/5.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import "GAChordLibrary.h"

@implementation GAChordLibrary
+ (instancetype)sharedLibrary
{
    static GAChordLibrary *library;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        library = [[GAChordLibrary alloc] init];
    });
    return library;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Chords" ofType:@"plist"];
        _chords = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        NSLog(@"chordLibrary:%@", _chords);
    }
    return self;
}

- (NSString *)chordNameWithChord:(GAChord *)aChord
{
    NSString *searchChord = [aChord chordString];
    NSLog(@"searchChord:%@", searchChord);
    for (NSString *chord in _chords)
    {
        if ([chord isEqualToString:searchChord])
        {
            return _chords[chord];
        }
    }
    return nil;
}

@end
