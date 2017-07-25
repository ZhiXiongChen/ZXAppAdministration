//
//  AppListTableViewController.m
//  ZXAppAdministration
//
//  Created by zhixiongchen on 2017/7/25.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "AppListTableViewController.h"
#import "ZXApp.h"
#import "AppCell.h"
@interface AppListTableViewController ()<AppCellDelegate>
@property(nonatomic,strong)NSArray * apps;
@end

@implementation AppListTableViewController
#pragma mark - 懒加载
-(NSArray *)apps
{
    if(!_apps)
    {
        NSString * path=[[NSBundle mainBundle]pathForResource:@"apps_full.plist" ofType:nil];
        NSArray * array=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray * arrayM=[[NSMutableArray alloc]init];
        for(NSDictionary * dict in array)
        {
            ZXApp * model=[ZXApp appWithDict:dict];
            [arrayM addObject:model];
        }
        _apps=arrayM;
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=60;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXApp * model=self.apps[indexPath.row];
    static NSString * ID=@"app_cell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];//如果缓存池中没有就在mainstoryboard中找这个Cell有没有重用Id和它一样的
    //如果有的话就直接用这个Cell进行创建,就可以不用判断cell==nil的情况了
    cell.app=model;
    //设置cell的代理对象为控制器
    cell.delegate=self;
    return cell;
}
-(void)appCellButtonDownloadClick:(AppCell *)cell
{
    self.view.userInteractionEnabled=NO;
    //创建Label
    UILabel * label=[[UILabel alloc]init];
    //设置文字
    label.text=@"正在下载...";
    //设置背景颜色
    label.backgroundColor=[UIColor blackColor];
    //设置文字的颜色
    label.textColor=[UIColor whiteColor];
    //设置label的frame
    CGFloat labelW=215;
    CGFloat labelH=45;
    CGFloat labelX=(self.view.frame.size.width-labelW)/2;
    CGFloat labelY=(self.view.frame.size.height-labelH)/2;
    label.frame=CGRectMake(labelX, labelY, labelW, labelH);

    //把label加入self.view中其实就是加入到了UITableView中，所以当UITableView发生滚动的时候label也会随着滚动，这样的话我们在滚动到下面的时候，label会明显往上偏移了。所以这里我们应该换个容器添加进label
    //[self.view addSubview:label];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    //设置文字居中显示
    label.textAlignment=NSTextAlignmentCenter;
    //设置labelD的透明度
    label.alpha=0.0;
    //设置圆角显示
    label.layer.cornerRadius=15;
    label.layer.masksToBounds=YES;
    [UIView animateWithDuration:1.0 animations:^{
        label.alpha=0.6;
    } completion:^(BOOL finished) {
        if(finished)
        {
        [UIView animateWithDuration:0.8 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha=0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
             self.view.userInteractionEnabled=YES;
        }];
            //UIViewAnimationOptionCurveLinear表示匀速执行这个动画
        }
    }];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
