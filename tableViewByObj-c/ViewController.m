//
//  ViewController.m
//  tableViewByObj-c
//
//  Created by Mahmoud on 7/16/22.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
// it's like you're making an optional array
@property NSMutableArray *male;
@property NSMutableArray *female;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = UIColor.systemTealColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _male   = [NSMutableArray arrayWithObjects:@"Andrew", @"Sam" ,@"Jim", nil];
    _female = [NSMutableArray arrayWithObjects:@"Linda",@"Jane", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return _male.count;
            break;
        case 1:
            return _female.count;
            break;
        default:
            return 0;
            break;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId forIndexPath:indexPath];

    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = _male[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = _female[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}

@end
