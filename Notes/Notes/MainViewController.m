//
//  ViewController.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "MainViewController.h"
#import "ChangesViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewCellStyleValue1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddMethod:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEditMethod:)];
    self.navigationItem.leftBarButtonItem = editButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.array = [NSMutableArray arrayWithObjects:@"first",@"second",@"third",@"forth",@"five",@"six",@"seven", nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addConstraint];
}

#pragma mark - Action Button

- (void) actionAddMethod: (UIBarButtonItem *) sender {
    ChangesViewController *secondViewController = [[ChangesViewController alloc] init];
    secondViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void) actionEditMethod: (UIBarButtonItem *) sender {
    NSLog(@"Edit");
}

#pragma mark - Add Constraint
- (void) addConstraint {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

#pragma mark - UITableViewDataSourse
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"New section";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSString *stringForCell = [self.array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = stringForCell;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

@end
