//
//  ViewController.m
//  GestureRecognizerDemo
//
//  Created by Kity_Pei on 16/6/1.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    
    NSArray *arrayData;
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 44.0f*7)];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    arrayData = [NSArray arrayWithObjects:@"点击：UITapGestureRecognizer",@"长按：UILongPressGestureRecognizer",@"拖动：UIPanGestureRecognizer",@"捏合：UIPinchGestureRecognizer",@"旋转：UIRotationGestureRecognizer",@"轻扫：UISwipeGestureRecognizer",@"自定义手势", nil];
    
    if ([table respondsToSelector:@selector(setSeparatorInset:)]) {
        [table setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([table respondsToSelector:@selector(setLayoutMargins:)])
    {
        [table setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

#pragma mark -
#pragma mark --uitableviewdelegate--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [arrayData objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [table deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            TapGestureViewController *vc = [[TapGestureViewController alloc] init];
            vc.title = @"点击";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            LongPressGestureViewController *vc = [[LongPressGestureViewController alloc] init];
            vc.title = @"长按";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            PanGestureViewController *vc = [[PanGestureViewController alloc] init];
            vc.title = @"拖动";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            PinchGestureViewController *vc = [[PinchGestureViewController alloc] init];
            vc.title = @"捏合";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            RotationGestureViewController *vc = [[RotationGestureViewController alloc] init];
            vc.title = @"旋转";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            SwipeGestureViewController *vc = [[SwipeGestureViewController alloc] init];
            vc.title = @"轻扫";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            CustomGestureViewController *vc = [[CustomGestureViewController alloc] init];
            vc.title = @"自定义手势";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
