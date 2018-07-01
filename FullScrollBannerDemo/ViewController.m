//
//  ViewController.m
//  FullScrollBannerDemo
//
//  Created by Derek on 30/06/18.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "ViewController.h"
#import "FullScrollBannerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FullScrollBannerView *fs = [[FullScrollBannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 0.5625) andHideBannnerTitle:NO andBannerImageArray:@[@"s1.jpg",@"s2.jpg",@"s3.jpg",@"s4.jpg",@"s5.jpg"] andTitleArray:@[@"购物优惠活动来了，快来买吧！",@"世界那么大，钱多没处花吗！",@"精品购物推荐，错过了就没有了",@"双十二狂购不停，做好准备了吗！",@"买买买！不要停，不要剁手！就是要买！"]];
    [self.view addSubview:fs];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
