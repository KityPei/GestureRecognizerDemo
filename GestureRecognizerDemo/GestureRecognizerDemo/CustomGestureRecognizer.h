//
//  CustomGestureRecognizer.h
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/3.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef enum {
    DirectionUnknown = 0,
    DirectionLeft,
    DirectionRight
} Direction;

@interface CustomGestureRecognizer : UIGestureRecognizer  

@property (nonatomic,assign) CGPoint recognizerStartPoint;
@property (nonatomic,assign) int numberOfClick;
@property (nonatomic,assign) Direction lastDirection;


@end
