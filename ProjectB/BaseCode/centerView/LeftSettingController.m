//
//  CenterTableViewController.m
//  Project-A
//
//  Created by lanou on 16/5/30.
//  Copyright © 2016年 苏  华. All rights reserved.
//

#import "LeftSettingController.h"
#import "AppDelegate.h"
#import "SDImageCache.h"



@interface LeftSettingController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic,strong ) NSArray *array;
@property (nonatomic,strong ) NSArray *imgArray;
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
    _array = @[@"主页",@"清理缓存",@"关于"];
    _imgArray = @[[UIImage imageNamed:@"主页"],[UIImage imageNamed:@"清理"],[UIImage imageNamed:@"关于"]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sugar"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
    
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(130/2, 35, 150, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:30];
    label.text = @"蓝瘦香菇";
    label.textColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 99, 280, 1)];
    view.backgroundColor = _tableView.separatorColor;
    [_tableView.tableHeaderView addSubview:label];
    [_tableView.tableHeaderView addSubview:view];
    self.tableView.tableFooterView = [UIView new];
    
    //毛玻璃
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
//    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.jpg"]];
    imageview.userInteractionEnabled = YES;
//    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:imageview belowSubview:_tableView];
    
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    
//    effectview.frame = [UIScreen mainScreen].bounds;
//    
//    [self.view insertSubview:effectview aboveSubview:imageview];
    //把tableView和cell改透明
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor whiteColor];
    
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    [_tableView setLayoutMargins:UIEdgeInsetsZero];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sugar" forIndexPath:indexPath];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:_array[indexPath.row]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, str.length)];
    
    cell.textLabel.attributedText = str;
    cell.imageView.image = _imgArray[indexPath.row];
    
    
    cell.backgroundColor = [UIColor clearColor];
   
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];

    
    return cell; 
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    switch (indexPath.row) {
        case 0://阅读
        {
             [self.mm_drawerController setCenterViewController:((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble withCloseAnimation:YES completion:nil];
    
        }
            break;
        case 1://电台
        {
            CGFloat cacheM = [[SDImageCache sharedImageCache]getSize]/1024/1024.0;
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.label.text = NSLocalizedString(@"清理中...", @"HUD loading title");
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [hud hideAnimated:YES];
                
            
            [[SDImageCache sharedImageCache]clearDisk];
            //推出警告框
           
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"已为你清理%.2fM缓存",cacheM]  preferredStyle:UIAlertControllerStyleAlert];  //mark alertControllerWith  sheet
            
        //UIAlertControllerStyleAlert 是居中显示的文本框
        UIAlertAction *queren = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {       //mark actionWith
            //UIAlertActionStyleDestructive 红色
            //UIAlertActionStyleDefault 蓝色
            //UIAlertActionStyleCancel 蓝色加粗 且在提示框外
            //是点击确定时的操作
            
        }];
        [alertVC addAction:queren];
        
        
        //推出警告框
        [self presentViewController:alertVC animated:YES completion:nil];
        });
            
            
        }
            break;
        case 2://话题
        {
            //vc =  [TopicViewController new];
            //推出警告框
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"关于" message:[NSString stringWithFormat:@"来自瓶子和蠢欢,么么哒😘"]  preferredStyle:UIAlertControllerStyleAlert];  //mark alertControllerWith  sheet
            
            //UIAlertControllerStyleAlert 是居中显示的文本框
            UIAlertAction *queren = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {       //mark actionWith
                //UIAlertActionStyleDestructive 红色
                //UIAlertActionStyleDefault 蓝色
                //UIAlertActionStyleCancel 蓝色加粗 且在提示框外
                //是点击确定时的操作
                
            }];
            [alertVC addAction:queren];
            
            
            //推出警告框
            [self presentViewController:alertVC animated:YES completion:nil];
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
