//
//  Person.m
//  ITBook
//
//  Created by SkyLORD on 29.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import "Person.h"

//НОВОЕ!!! Обявление констант
static NSString *const sPersonDefaultFirstName = @"No Name";
static NSString *const sPersonDefaultLastName = @"No Name";
//Закрытие НОВОГО

NSString *const kPersonFirstNameKey = @"firstName";
NSString *const kPersonLastNameKey = @"lastName";

@implementation Person

//описание работы методов в проекте (пистолет прилагается)

//НОВОЕ!!!
@synthesize firstName = _firstName, lastName = _lastName;
//Закрытие НОВОГО!!!

- (id)initWithFirstName:(NSString *)aFirstName
{
  return [self initWithFirstName:aFirstName lastName:nil];
}

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName
{
	return [self initWithFirstName:aFirstName lastName:aLastName];
}

//НОВОЕ!!!
#pragma mark -

- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
{
	self = [super init];
	if (self)
	{
		self.firstName = [aDict objectForKey:kPersonFirstNameKey];
		self.lastName = [aDict objectForKey:kPersonLastNameKey];
	}
	
	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	
	if (nil != self.firstName || NO == [sPersonDefaultFirstName isEqualToString:self.firstName])
	{
		[theRepresentation setObject:self.firstName forKey:kPersonFirstNameKey];
	}
	
	if (nil != self.lastName)
	{
		[theRepresentation setObject:self.lastName forKey:kPersonLastNameKey];
	}
	
	return [[theRepresentation copy] autorelease];
}
//Закрытие НОВОЕ!!!


- (void)dealloc
{
	[_firstName release];
	[_lastName release];
	
	[super dealloc];
}


#pragma mark -
- (void)setFirstName:(NSString *)aFirstName
{
	if (_firstName != aFirstName)
	{
		[_firstName autorelease];
		_firstName = [aFirstName copy];
	}
}

- (NSString *)firstName
{
	return (nil == _firstName) ? sPersonDefaultFirstName : _firstName;
}

- (void)setLastName:(NSString *)aLastName
{
	if (_lastName != aLastName)
	{
		[_lastName autorelease];
		_lastName = [aLastName copy];
	}
}

- (NSString *)lastName
{
	return _lastName;
}

//#pragma mark -

 - (NSString *)stringRepresentation
{
	//NSString * theCoverTypeStringRepresentahion = self.isPaperback ? @"Paperback": @"Hardcover";
	
	return [NSString stringWithFormat:@"FirstName:%@. LastName:%@.", self.firstName, nil == self.lastName ? sPersonDefaultLastName : self.lastName];
}

#pragma mark -

+ (NSArray *)personsSortByFirstNameWithSet:(NSSet *)aPersons
{
	return [aPersons.allObjects sortedArrayUsingSelector:@selector(isEqualByFirstName:)];
}

+ (NSArray *)personSortByLastNameWithSet:(NSSet *)aPersons
{
	return [aPersons.allObjects sortedArrayUsingSelector:@selector(isEqualByLastName:)];
}

+ (NSArray *)personsSortByFirstNameWithArray:(NSArray *)aPersons
{
	return [aPersons sortedArrayUsingSelector:@selector(isEqualByFirstName:)];
}

+ (NSArray *)personsSortByLastNameWithArray:(NSArray *)aPersons
{
	return [aPersons sortedArrayUsingSelector:@selector(isEqualByLastName:)];
}


#pragma mark -
- (NSComparisonResult)isEqualByFirstName:(Person *)aPerson
{
	return [self.firstName compare:aPerson.firstName];
}

- (NSComparisonResult)isEqualByLastName:(Person *)aPerson
{
	return [self.lastName compare:aPerson.lastName];
}

@end
