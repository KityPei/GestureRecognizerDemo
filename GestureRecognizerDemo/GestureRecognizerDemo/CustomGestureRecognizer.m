//
//  CustomGestureRecognizer.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/3.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "CustomGestureRecognizer.h"

#define kMinTickleSpacing 20.0
#define kMaxTickleCount 3

@implementation CustomGestureRecognizer

- (void)reset
{
    self.numberOfClick = 0;
    self.recognizerStartPoint = CGPointZero;
    self.lastDirection = DirectionUnknown;

    if (self.state == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    self.recognizerStartPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint ticklePoint = [touch locationInView:self.view];
    CGFloat moveAmt = ticklePoint.x - self.recognizerStartPoint.x;
    //判断是否达到手势成功的逻辑，以及手势成后的逻辑
    Direction curDirection;
    
    if (moveAmt < 0) {
        curDirection = DirectionLeft;
        
    } else {
        curDirection = DirectionRight;
        
    }
    
    if (ABS(moveAmt) < kMinTickleSpacing){
        return;
    }
    
    if (self.lastDirection == DirectionUnknown ||
        (self.lastDirection == DirectionLeft && curDirection == DirectionRight) ||
        (self.lastDirection == DirectionRight && curDirection == DirectionLeft)) {
        // w00t we've got a tickle!
        self.numberOfClick++;
        self.recognizerStartPoint = ticklePoint;
        self.lastDirection = curDirection;
    
        if (self.state == UIGestureRecognizerStatePossible && self.numberOfClick > kMaxTickleCount) {
            [self setState:UIGestureRecognizerStateEnded];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reset];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reset];
}


@end
