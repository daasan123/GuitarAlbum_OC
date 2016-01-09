//
//  GAEditingViewRhythmCell.h
//  GuitarAlbum_OC
//
//  Created by peter on 16/1/3.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GARhythm.h"

extern NSString * const editingViewRhythmCellID;

@interface GAEditingViewRhythmCell : UITableViewCell
@property (nonatomic, strong) GARhythm *rhythm;
@end
