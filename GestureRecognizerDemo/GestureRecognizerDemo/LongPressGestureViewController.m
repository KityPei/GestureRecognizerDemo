//
//  LongPressGestureViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/2.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "LongPressGestureViewController.h"

@interface LongPressGestureViewController ()

@end

@implementation LongPressGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-100)/2, (DEVICE_HEIGHT-100)/2, 100, 100)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//    设置长按时间
    longPressGR.minimumPressDuration = 0.5;
    [imageView addGestureRecognizer:longPressGR];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPressGR
{
    if (longPressGR.state == UIGestureRecognizerStateEnded) {
        NSLog(@"结束");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *collectBtn = [UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了收藏");
        }];
        [alert addAction:collectBtn];
        UIAlertAction *saveBtn = [UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了保存");
        }];
        [alert addAction:saveBtn];
        UIAlertAction *identifyBtn = [UIAlertAction actionWithTitle:@"识别图中二维码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了识别");
        }];
        [alert addAction:identifyBtn];
        UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [alert addAction:cancelBtn];
        
        [self presentViewController:alert animated:YES completion:nil];
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
