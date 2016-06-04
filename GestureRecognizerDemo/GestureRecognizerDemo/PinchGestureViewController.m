//
//  PinchGestureViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/2.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "PinchGestureViewController.h"

@interface PinchGestureViewController ()
{
    UIImageView *imageView;
}
@end

@implementation PinchGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-240)/2, (DEVICE_HEIGHT-320)/2, 240, 320)];
    imageView.image = [UIImage imageNamed:@"flower.jpg"];
    imageView.userInteractionEnabled = YES;//让imageview有交互性
    imageView.multipleTouchEnabled = YES;//让imageview能够多点触碰
    [self.view addSubview:imageView];
    
    
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imageView addGestureRecognizer:pinchGR];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinchGR
{
    if (pinchGR.state == UIGestureRecognizerStateEnded) {
        CGSize targetSize = CGSizeMake(imageView.frame.size.width * pinchGR.scale,imageView.frame.size.height * pinchGR.scale);
        // 对图片进行缩放
        imageView.frame = CGRectMake((DEVICE_WIDTH-targetSize.width)/2, (DEVICE_HEIGHT - targetSize.height)/2, targetSize.width, targetSize.height);
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
