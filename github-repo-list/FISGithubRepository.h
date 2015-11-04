//
//  FISGithubRepository.h
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISGithubAPIClient.h"

@interface FISGithubRepository : NSObject

@property(nonatomic, strong)NSString * fullName;
@property(nonatomic, strong)NSURL * htmlURL;
@property(nonatomic, strong)NSString * repositoryID;



@end
