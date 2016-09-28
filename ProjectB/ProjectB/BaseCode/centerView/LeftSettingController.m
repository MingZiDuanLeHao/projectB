//
//  CenterTableViewController.m
//  Project-A
//
//  Created by lanou on 16/5/30.
//  Copyright © 2016年 苏  华. All rights reserved.
//

#import "LeftSettingController.h"



@interface LeftSettingController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic,strong ) NSArray *array;
@property (nonatomic,strong ) UITableView *tableView;

@end

@implementation LeftSettingController

-(id)init{
    
    self = [super init];
    if (self) {
        [self setRestorationIdentifier:@"center"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];

    
}
-(void)viewWillAppear:(BOOL)animated
{

 
}

-(void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _array = @[@"主页",@"本地", @"清理缓存", @"设置",@"关于"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sugar"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
    
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sugar" forIndexPath:indexPath];
    
    cell.textLabel.text = _array[indexPath.row];
    
    return cell; 
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    switch (indexPath.row) {
        case 0://阅读
        {
            
    
        }
            break;
        case 1://电台
        {
           // vc = [RadioViewController new];
        }
            break;
        case 2://话题
        {
            //vc =  [TopicViewController new];
        }
            break;
        case 3://良品
        {
           // vc = [GoodsViewController new];
        }
            break;
            
        default:
            break;
    }
    

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
