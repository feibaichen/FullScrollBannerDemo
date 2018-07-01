//
//  FullScrollBannerView.h
//  FullScrollBannerDemo
//
//  Created by Derek on 30/06/18.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>
// 滚动banner被点击，传出
@protocol FullScrollBannerView<NSObject>
-(void)ScrollBannerWasTapClick:(UITapGestureRecognizer *)tap;
@end

@interface FullScrollBannerView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSArray *bannerImageArray;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,assign) CGRect baseframe;
@property (nonatomic,assign) BOOL hideOrNot;
@property (nonatomic,strong) NSTimer *timer;

-(instancetype)initWithFrame:(CGRect)baseframe andHideBannnerTitle:(BOOL)hideOrNot andBannerImageArray:(NSArray *)bannerImageArray andTitleArray:(NSArray *)titleArray;

@end
