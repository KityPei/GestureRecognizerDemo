//
//  SwipeGestureViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/2.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController ()

@end

@implementation SwipeGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 300, 40)];
    label.text = @"自左而右扫动，查看控制台";
    [self.view addSubview:label];
    
    
    UISwipeGestureRecognizer *swipeGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //轻扫的方向
    swipeGR.direction = UISwipeGestureRecognizerDirectionLeft;
    //手势需要的手指数
    swipeGR.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeGR];
}

- (void)swipe:(UISwipeGestureRecognizer *)swipGR
{
    if (swipGR.state == UIGestureRecognizerStateEnded) {
        NSLog(@"轻扫了一下");
        
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
