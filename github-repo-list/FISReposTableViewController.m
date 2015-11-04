//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISGithubRepository.h"
#import "FISReposDataStore.h"

@interface FISReposTableViewController ()

@property (strong, nonatomic)NSArray * storedData;

@end

@implementation FISReposTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    
    FISReposDataStore * data = [[FISReposDataStore alloc] init];
    [data getGithubRepos:^(NSArray *repoDataStoredArray) {
        NSLog(@"self.storedData ===== %@", repoDataStoredArray);
        self.storedData = [[NSArray alloc] initWithArray:repoDataStoredArray];
        NSLog(@"self.storedData ===== %@",self.storedData);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"-----------------%lu",self.storedData.count);
    return self.storedData.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    NSString * fullName = [self.storedData[indexPath.row] fullName];
    
    cell.textLabel.text = fullName;
    return cell;
}

@end
