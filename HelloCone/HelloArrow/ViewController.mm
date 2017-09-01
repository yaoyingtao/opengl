//
//  ViewController.m
//  HelloArrow
//
//  Created by tomy yao on 2017/8/31.
//  Copyright © 2017年 tomy yao. All rights reserved.
//

#import "ViewController.h"
#import "GLView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GLView *glView = [[GLView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:glView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
