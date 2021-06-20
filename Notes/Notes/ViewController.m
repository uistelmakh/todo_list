//
//  ViewController.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Node";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddMethod:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addConstraint];
}

#pragma mark - Action Button

- (void) actionAddMethod: (UIBarButtonItem *) sender {
    NSLog(@"actionAddMethod");
}

#pragma mark - Add Constraint
- (void) addConstraint {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

@end
