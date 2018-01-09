//
//  EXpandController.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/26.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "EXpandController.h"
#import "EXpandTableViewCell.h"

@interface EXpandController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation EXpandController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource =[NSMutableArray array];
    [self createUI];
    [self initData];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EXpandTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[EXpandTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle =UITableViewCellSeparatorStyleNone;
    ListFrameModel *framemodel =self.dataSource[indexPath.row];
    if (framemodel.listModel.isSelected) {
        cell.answerLb.hidden =NO;
        cell.lineI.hidden =NO;
    }else{
        cell.answerLb.hidden =YES;
        cell.lineI.hidden =YES;
    }
    cell.frameModel =framemodel;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListFrameModel *frameModel =self.dataSource[indexPath.row];
    if (frameModel.listModel.isSelected) {
        return [self.dataSource[indexPath.row] expandCellHeight];
    }else{
        return [self.dataSource[indexPath.row] unExpandCellHeight];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListFrameModel *frameModel =self.dataSource[indexPath.row];
    frameModel.listModel.isSelected =!frameModel.listModel.isSelected;
    [self.tableView reloadData];
}
- (void)initData{
    for (int i=0; i<8; i++) {
        ListModel *model =[[ListModel alloc]init];
        model.question =[NSString stringWithFormat:@"这是第%d个问题",i];
        model.answer =[NSString stringWithFormat:@"这是第%d个问题，答案是什么呢，话说一一得一，二二得四，三三得九，四四十六，五五二十五，六六三十六，七七二十一，八八六十四，九九归一，乘法口诀真奇妙，淡淡箫声淡淡愁，淡淡清酒醉南楼",i];
        model.isSelected =NO;
        ListFrameModel *frameModel =[[ListFrameModel alloc]init];
        frameModel.listModel =model;
        [self.dataSource addObject:frameModel];
    }
    [self.tableView reloadData];
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
