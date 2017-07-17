//
//  ViewController.m
//  GitHubRepos
//
//  Created by Endeavour2 on 7/17/17.
//  Copyright © 2017 SamOg. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Repo.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <Repo*> *githubRepos;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  
  self.githubRepos = [[NSMutableArray alloc]init];
  // Do any additional setup after loading the view, typically from a nib.
  
  
  // 1. Create a new NSURL object from the github url string.
  NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/jtsamog/repos"];
  
  NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
  
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
  
  NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error) {
      NSLog(@"error: %@", error.localizedDescription);
      return ;
    }
    NSError *jsonError = nil;
    NSArray *jsonRepos = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    //3. If there was an error getting JSON from the NSData, like if the server actually returned XML to us, then we want to handle it here.
    if (jsonError) {
      NSLog(@"jsonError: %@", jsonError.localizedDescription);
      return;
    }
    
    
    for (NSDictionary *info in jsonRepos) { //using fast enumeration
      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        Repo *repo = [[Repo alloc] initWithJSONInfo:info];
        
        [self.githubRepos addObject:repo];
        
        [self.tableView reloadData];
        
        //      [self.githubRepos addObject:repoName]; //populate the githubRepos array with data from the repos array - using/calling the addObject method
      }];
    }
  }];
  
  
  //6. A task is created in a suspended state, so we need to resume it
  [dataTask resume];
    }



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
  //    return  repos.count;
  
  return self.githubRepos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  
  Repo *repo = self.githubRepos[indexPath.row];
  
  cell.labelCell.text = repo.name;
  cell.repoIDLabel.text = [NSString stringWithFormat:@"%@", @(repo.repoID)];
  cell.repoDescriptionLabel.text = repo.repoDescription;
  cell.repoURLLabel.text = repo.repoURLString;
  
  return cell;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
