//
//  GAEditingViewChordCell.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/12/29.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAChord.h"

extern NSString * const editingViewChordCellID;

@interface GAEditingViewChordCell : UITableViewCell
@property (nonatomic, strong) GAChord *chord;
@end
