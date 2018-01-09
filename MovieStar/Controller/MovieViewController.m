//
//  MovieViewController.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/21.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieMenuView.h"
#import "HotMovieController.h"
#import "NewFileController.h"

@interface MovieViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) HotMovieController *hotVC;
@property (nonatomic, strong) NewFileController *newfilevc;
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
@property (nonatomic, strong) NSMutableArray *viewControllers;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"110";
    self.view.backgroundColor =[UIColor whiteColor];
    
    MovieMenuView *menuView =[[MovieMenuView alloc]init];
    menuView.backgroundColor =[UIColor whiteColor];
    menuView.frame =CGRectMake(0, NAV_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:menuView];
    [self loadController];
    [self loadScrollView];
    //接收者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieMenuBtnClick:) name:@"kMovieMenuBtnClick" object:nil];
    // Do any additional setup after loading the view.
}
- (void)loadController
{
    _viewControllers = [[NSMutableArray alloc] init];
    
    _hotVC = [[HotMovieController alloc] init];
    _newfilevc =[[NewFileController alloc]init];
    [self addChildViewController:_hotVC];
    [self addChildViewController:_newfilevc];
    
    _viewControllers = [NSMutableArray arrayWithObjects:_hotVC,_newfilevc,nil];

}
- (void)loadScrollView{
    
    NSInteger viewCounts = _viewControllers.count;
    
    //初始化最底部的scrollView,装tableView用
    self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAV_BAR_HEIGHT + MovieMenuHeight, SCREEN_WIDTH, SCREEN_HEIGHT - MovieMenuHeight - NAV_BAR_HEIGHT )];
    self.backgroundScrollView.backgroundColor = KBackgroundColor;
    self.backgroundScrollView.pagingEnabled = YES;
    self.backgroundScrollView.bounces = NO;
    self.backgroundScrollView.showsHorizontalScrollIndicator = NO;
    self.backgroundScrollView.delegate = self;
    self.backgroundScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * viewCounts, 0);
    [self.view addSubview:self.backgroundScrollView];
    
    
    for (int i = 0; i < viewCounts; i++) {
        UIViewController *listCtrl = self.viewControllers[i];
        listCtrl.view.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT - MovieMenuHeight - NAV_BAR_HEIGHT  );
        [self.backgroundScrollView addSubview:listCtrl.view];
    }
    
    [self.backgroundScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    
} //  KMovieMenuBtnClickNote 通知
- (void)movieMenuBtnClick:(NSNotification *)note{
    NSString *indexNum = note.userInfo[@"kMovieMenuBtnClick"];
    //是否有动画效果
    [self.backgroundScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*[indexNum intValue], 0) animated:YES];
}
#pragma UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger pageIndex =(NSInteger)scrollView.contentOffset.x/SCREEN_WIDTH;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kMovieScrollViewMove" object:nil userInfo:@{@"kMovieScrollViewMove":[NSString stringWithFormat:@"%ld",pageIndex]}];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
