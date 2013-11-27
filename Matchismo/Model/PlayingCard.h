//
//  PlayingCard.h
//  Matchismo
//
//  Created by Tyson Frederick on 2/26/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

