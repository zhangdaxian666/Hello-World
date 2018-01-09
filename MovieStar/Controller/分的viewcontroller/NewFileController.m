//
//  NewFileController.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/25.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "NewFileController.h"
#import "MovieHttpTool.h"
#import "MovieModel.h"
#import "HotMovieCell.h"
#import <MJRefresh.h>

#import "EXpandController.h"

@interface NewFileController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation NewFileController

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
- (void)addRefreshView
{
    __weak typeof(self) weakSelf =self;
    // 下拉刷新
    _tableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf requestData];
    }];
    // 上啦加载
    _tableview.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}
//下拉刷新
- (void)requestData
{
    __weak NewFileController *weakSelf =self;
    [MovieHttpTool getComingsoonWithStart:0 arrayBlock:^(NSMutableArray *resultArray) {
        _resultArray =resultArray;
        [weakSelf.tableview.mj_header endRefreshing];
        [self.tableview reloadData];
    }];
}
//上啦加载
- (void)loadMoreData
{
    __weak NewFileController *weakSelf =self;
    [MovieHttpTool getComingsoonWithStart:_resultArray.count arrayBlock:^(NSMutableArray *resultArray) {
        [_resultArray addObjectsFromArray:resultArray];
        [weakSelf.tableview.mj_footer endRefreshing];
        [self.tableview reloadData];
    }];
}
- (void)initTableView
{
    self.view.backgroundColor =[UIColor whiteColor];
    self.tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-MovieMenuHeight-NAV_BAR_HEIGHT)];
    self.tableview.delegate =self;
    self.tableview.dataSource =self;
    self.tableview.showsVerticalScrollIndicator =NO;
    self.tableview.showsHorizontalScrollIndicator =NO;
    self.tableview.backgroundColor =KBackgroundColor;
    self.tableview.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
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
    EXpandController *vc =[[EXpandController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
