//
//  Person.h
//  ITBook
//
//  Created by SkyLORD on 29.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
// объявление переменных в проекте:
{
  NSString *_firstName;
	NSString *_lastName;
}

// НОВОЕ!!!
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
// Закрытое НОВОЕ!!!

// объявление методов обработки в проекте (не понятно почему так дублируем каждую новую строчку):
- (id)initWithFirstName:(NSString *)aFirstName;
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;


// не понятно для чего это:
- (void)setFirstName:(NSString *)aFirstName;
- (NSString *)firstName;
- (void)setLastName:(NSString *)aLastName;
- (NSString *)lastName;

// --
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict;
- (NSDictionary *)dictionaryRepresentation;
// --

- (NSString *)stringRepresentation;

// сортировка вводимых данных
+ (NSArray *)booksSortByFirstNameWithSet:(NSSet *)aPersons;
+ (NSArray *)booksSortByLastNameWithSet:(NSSet *)aPersons;

+ (NSArray *)booksSortByFirstNameWithArray:(NSArray *)aPersons;
+ (NSArray *)booksSortByLastNameWithArray:(NSArray *)aPersons;

@end
