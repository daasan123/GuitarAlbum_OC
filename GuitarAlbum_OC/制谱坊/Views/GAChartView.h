//
//  GAChartView.h
//  GuitarAlbum_OC
//
//  Created by peter on 15/11/22.
//  Copyright © 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  曲谱种类
 */
typedef NS_ENUM(NSInteger, ChartType) {
    kChartTypeGuitar,
    kChartTypeUke,
    kChartTypeGuitarAndUke
};

/**
 *  曲谱图视图
 */
@interface GAChartView : UIView
@property (nonatomic, assign) ChartType type;
@end
