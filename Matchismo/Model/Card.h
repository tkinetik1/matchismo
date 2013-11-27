//
//  Card.h
//  Matchismo
//
//  Created by Tyson Frederick on 2/26/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject 

- (int)match:(NSArray *)otherCards;

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter=isFaceUp)  BOOL faceUp;

@property (nonatomic, getter=isUnplayable)  BOOL unplayable;

@end