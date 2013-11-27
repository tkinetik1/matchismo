//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Tyson Frederick on 3/5/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards;
//@property (strong,nonatomic) NSMutableArray *history;
@property (nonatomic) NSUInteger matchBonus;
@property (nonatomic) NSUInteger mismatchPenalty;
@property (nonatomic) NSUInteger flipCost;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
    
}

#define FLIP_COST 1
// #define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
// string variable for status of last card
    NSString *status = nil;
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            status = [NSString stringWithFormat:@"lost 1 point for flipping %@", card];

            // instantiate otherCards[] array
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    
                    [otherCards addObject:otherCard];
                    
                    int matchScore = [card match:otherCards];
                    
                    if (matchScore) {
                        
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        status = [NSString stringWithFormat:@"matched %@ %@ for %d points",
                                  card,
                                  [otherCards componentsJoinedByString:@" "],
                                  matchScore * self.matchBonus];
                    } else {
                        
                        otherCard.faceUp = NO;
                        self.score -= self.mismatchPenalty;
                        status = [NSString stringWithFormat:@"%@ %@ don't match: -%d points", card,
                                  [otherCards componentsJoinedByString:@" "],
                                  self.mismatchPenalty];
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
    
        card.faceUp = !card.isFaceUp;
    }
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if(self) {
        //set game variables
        self.flipCost = 1;
        self.matchBonus = 5;
        self.mismatchPenalty = 2;
        
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}


@end