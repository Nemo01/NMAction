//
//  ViewController.m
//  ActivityDemo
//
//  Created by nemo on 15/11/18.
//  Copyright © 2015年 nemo. All rights reserved.
//

#import "ViewController.h"
#import "NMActionView.h"

@interface ViewController ()
@property(nonatomic,strong) NMActionView *actionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _actionView=[[NMActionView alloc] init];
    [self.view addSubview:_actionView];
    
//    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 320, 200)];
//    [imageView setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:imageView];
    
    NSArray *selectedArray=@[@"refresh_pressed.png",@"share_pressed.png",@"copy_pressed.png",@"delete_pressed.png",@"safari_pressed.png"];
    NSArray *dataArray=@[@{ImageKey:@"refresh_ios.png",TextKey:@"刷新"},@{ImageKey:@"share_ios.png",TextKey:@"转发"},@{ImageKey:@"copy_ios.png",TextKey:@"复制链接"},@{ImageKey:@"delete_ios.png",TextKey:@"删除"},@{ImageKey:@"safari_ios.png",TextKey:@"Safari打开"}];
    _actionView.dataArray=dataArray;
    _actionView.selectedArray=selectedArray;
    [_actionView loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAciton:(id)sender {
    [self.actionView showActionView];

//    NSString *fresh=@"fresh";
//    UIImage *image=[UIImage imageNamed:@"200235995-001_423b4e0.png"];
//    NSArray *array=@[fresh,image];
//    UIActivityViewController *activityView=[[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:nil];
//    activityView.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
//                                           
//                                           UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
//    [self presentViewController:activityView animated:YES completion:nil];
}
@end
