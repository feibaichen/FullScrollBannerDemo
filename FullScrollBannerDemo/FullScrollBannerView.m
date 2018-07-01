//
//  FullScrollBannerView.m
//  FullScrollBannerDemo
//
//  Created by Derek on 30/06/18.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "FullScrollBannerView.h"

@implementation FullScrollBannerView

- (instancetype)initWithFrame:(CGRect)baseframe andHideBannnerTitle:(BOOL)hideOrNot andBannerImageArray:(NSArray *)bannerImageArray andTitleArray:(NSArray *)titleArray{
    self = [super initWithFrame:baseframe];
    
    if (self) {
        _baseframe = baseframe;
        _hideOrNot = hideOrNot;
        _bannerImageArray = bannerImageArray;
        _titleArray = titleArray;
        //创建banner
        [self creatBanner];
    }
    return self;
}
-(void)creatBanner{
    //添加到视图中
    [self addSubview:self.mainScrollView];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithArray:self.bannerImageArray];
    NSMutableArray *myTitleArray = [NSMutableArray arrayWithArray:self.titleArray];
    [imageArray insertObject:_bannerImageArray[_bannerImageArray.count - 1] atIndex:0];
    NSLog(@"%ld",imageArray.count);

    [myTitleArray insertObject:myTitleArray[myTitleArray.count - 1] atIndex:0];
    
     NSLog(@"%ld",myTitleArray.count);
    
    for (int i = 0; i < imageArray.count; i++) {
        
        UIImageView *bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _baseframe.size.width, 0, _baseframe.size.width, _baseframe.size.height)];
        bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]]];
        [_mainScrollView addSubview:bannerImageView];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, _baseframe.size.height - 30, _baseframe.size.width, 30)];
        titleLable.font = [UIFont systemFontOfSize:14];
        titleLable.text = [NSString stringWithFormat:@"%@",myTitleArray[i]];
        titleLable.textColor = [UIColor whiteColor];
        [bannerImageView addSubview:titleLable];
    }
    [self addSubview:self.pageControl];
    //[self.timer setFireDate:[NSDate distantPast]];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(timerEverySecond:) userInfo:_mainScrollView repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
//计时器
-(void)timerEverySecond:(NSTimer *)timer{
    

        if (_mainScrollView.contentOffset.x > (_bannerImageArray.count - 1) * _baseframe.size.width) {
            [_mainScrollView setContentOffset:CGPointZero];
            _pageControl.currentPage = _mainScrollView.contentOffset.x/_baseframe.size.width - 1;
            [self.timer setFireDate:[NSDate distantPast]];
            return;
        }
        //_pageControl.currentPage = whichX - 1;
        
        [_mainScrollView setContentOffset:CGPointMake(_mainScrollView.contentOffset.x + _baseframe.size.width, 0)];
        _pageControl.currentPage = _mainScrollView.contentOffset.x/_baseframe.size.width - 1;
    
}
//代理事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}
-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _baseframe.size.width, _baseframe.size.height)];
        _mainScrollView.contentSize = CGSizeMake(_bannerImageArray.count * _baseframe.size.width, _baseframe.size.height);
        _mainScrollView.contentOffset = CGPointMake(_baseframe.size.width, 0);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.delegate = self;
    }
    return _mainScrollView;
}
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        _pageControl.numberOfPages = _bannerImageArray.count;
        //_pageControl.tintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPage = 0;
        _pageControl.center = CGPointMake(_baseframe.size.width/2, _baseframe.size.height/2 + _baseframe.size.height/2 * 0.66);
    }
    return _pageControl;
}
-(NSArray *)bannerImageArray{
    if (!_bannerImageArray) {
        _bannerImageArray = [[NSArray alloc] init];
    }
    return _bannerImageArray;
}
-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSArray alloc] init];
    }
    return _titleArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
