//
//  MMNavigationController.m
//  Project-A
//
//  Created by lanou on 16/5/30.
//  Copyright © 2016年 苏  华. All rights reserved.
//

#import "MMNavigationController.h"
#import "UIViewController+MMDrawerController.h"

@interface MMNavigationController ()

@end

@implementation MMNavigationController

-(UIStatusBarStyle)preferredStatusBarStyle{
    if(self.mm_drawerController.showsStatusBarBackgroundView){
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
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
