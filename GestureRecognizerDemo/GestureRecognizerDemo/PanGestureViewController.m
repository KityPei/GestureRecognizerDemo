//
//  PanGestureViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/2.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "PanGestureViewController.h"

@interface PanGestureViewController ()
{
    UILabel *label;
}
@end

@implementation PanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-200)/2, 100, 200, 30)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"拖动我";
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [label addGestureRecognizer:panGR];
    
}

- (void)pan:(UIPanGestureRecognizer *)panGR
{
    if (panGR.state == UIGestureRecognizerStateEnded) {
        CGPoint point = [panGR locationInView:panGR.view.superview];
        label.frame = CGRectMake(point.x, point.y, 200, 30);
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
