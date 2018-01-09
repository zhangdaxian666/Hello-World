//
//  HotMovieController.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/22.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "HotMovieController.h"
#import "MovieModel.h"
#import "MovieHttpTool.h"
#import "HotMovieCell.h"
#import <MJRefresh.h>

@interface HotMovieController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation HotMovieController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self =[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.resultArray =[NSMutableArray arrayWithCapacity:1];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];  //初始化tableview
    [self addRefreshView]; //添加上拉加载和下拉刷新
    [self requestData];    //请求初始数据
    // Do any additional setup after loading the view.
}
- (void)initTableView{
    self.view.backgroundColor =[UIColor whiteColor];
    _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-MovieMenuHeight-NAV_BAR_HEIGHT)];
    _tableview.delegate =self;
    _tableview.dataSource =self;
    _tableview.showsHorizontalScrollIndicator =NO;
    _tableview.showsVerticalScrollIndicator =NO;
    _tableview.backgroundColor =KBackgroundColor;
    _tableview.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
}
- (void)addRefreshView{
    __weak typeof(self) weakSelf =self;
    //下拉刷新
    _tableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf requestData];
    }];
    //上啦加载
    _tableview.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
}
#pragma 下拉刷新
- (void)requestData{
    __weak HotMovieController *weakSelf =self;
    [MovieHttpTool getHotMovieWithStart:0 arrayBlock:^(NSMutableArray *resultArray) {
        _resultArray =resultArray;
        [weakSelf.tableview.mj_header endRefreshing];
        [self.tableview reloadData];
    }];
}
#pragma 上拉加载
- (void)loadData{
    __weak HotMovieController *weakSelf =self;
    [MovieHttpTool getHotMovieWithStart:_resultArray.count arrayBlock:^(NSMutableArray *resultArray) {
        [_resultArray addObjectsFromArray:resultArray];
        [weakSelf.tableview.mj_footer endRefreshing];
        [self.tableview reloadData];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieModel *model =[_resultArray objectAtIndex:indexPath.row];
    return [HotMovieCell getCellHeight:model];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotMovieCell *hotCell =[HotMovieCell cellWithTableView:tableView];
    hotCell.model =[_resultArray objectAtIndex:indexPath.row];
    return hotCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailController *detailVc =[[MovieDetailController alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
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
