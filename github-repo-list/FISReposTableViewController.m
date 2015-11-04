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
@property (strong, nonatomic)FISReposDataStore * dataStore;

@end

@implementation FISReposTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    
    self.dataStore = [FISReposDataStore sharedDataStore];
    
    [self.dataStore getGithubRepos:^(BOOL success) {
        //if (success == YES) {
        
        if (success) {
            
            NSLog(@"self.storedData ===== %@",self.dataStore.repositories);
            NSLog(@"self.storedData ===== %@",self.storedData);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];

            
            
        }
            
       // }
    }];
    
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"-----------------%lu",self.storedData.count);
    return self.dataStore.repositories.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    NSString * fullName = [self.dataStore.repositories[indexPath.row] fullName];
    
    cell.textLabel.text = fullName;
    return cell;
}

@end
