//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Tyson Frederick on 3/5/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property(nonatomic, readonly) int score;
@property(nonatomic, readonly) NSArray *history;

@end

