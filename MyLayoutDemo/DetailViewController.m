//
//  DetailViewController.m
//  MyLayout
//
//  Created by oybq on 15/6/13.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "DetailViewController.h"
#import "CFTool.h"
#import "MyLayout.h"

@interface DetailViewController ()

@property(nonatomic, strong) NSArray *demoVCList;

@end


@implementation DetailViewController

-(instancetype)initWithDemoVCList:(NSArray*)vcList
{
    self = [super init];
    if (self != nil)
    {
        self.demoVCList = vcList;
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[CFTool font:15],NSForegroundColorAttributeName:[CFTool color:4]};
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoVCList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.font = [CFTool font:15];
    cell.textLabel.textColor = [CFTool color:4];
    cell.textLabel.text = self.demoVCList[indexPath.row][@"title"];
    cell.textLabel.textAlignment = [MyBaseLayout isRTL] ? NSTextAlignmentRight : NSTextAlignmentLeft;
    return cell;
    
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *demoVC = [[self.demoVCList[indexPath.row][@"class"] alloc] init];
    demoVC.title = self.demoVCList[indexPath.row][@"title"];
   [self.navigationController pushViewController:demoVC animated:YES];

   //[self.navigationController presentViewController:demoVC animated:YES completion:nil];
}





@end
