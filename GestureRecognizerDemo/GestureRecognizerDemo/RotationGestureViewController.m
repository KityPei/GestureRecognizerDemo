//
//  RotationGestureViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/2.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "RotationGestureViewController.h"

@interface RotationGestureViewController ()
{
    UIImageView *imageView;
}
@end

@implementation RotationGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-240)/2, (DEVICE_HEIGHT-320)/2, 240, 320)];
    imageView.image = [UIImage imageNamed:@"flower.jpg"];
    imageView.userInteractionEnabled = YES;//让imageview有交互性
    imageView.multipleTouchEnabled = YES;//让imageview能够多点触碰
    [self.view addSubview:imageView];
    
    
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotationGR];
}

- (void)rotation:(UIRotationGestureRecognizer *)rotationGR
{
    if (rotationGR.state == UIGestureRecognizerStateEnded) {
        NSLog(@"%f",rotationGR.rotation);
        CGAffineTransform transform = CGAffineTransformMakeRotation(rotationGR.rotation*180/M_PI);
        [imageView setTransform:transform];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
