/**
 * AccountsTest{$SUFFIX} domain test class
 *
 * This class is testing the domain Accounts and all its methods.
 *
 * @see Accounts
 */
@IsTest(IsParallel=true)
private class AccountsTest
{
	@IsTest
	static void testNewInstanceWithIds()
	{
		final Id id = fflib_IDGenerator.generate(Schema.Account.SObjectType);
		final Set<Id> ids = new Set<Id>{ id };
		final List<Account> records = new List<Account>{ new Account(Id = id) };

		fflib_ApexMocks mocks = new fflib_ApexMocks();
		IAccountsSelector selectorMock = (IAccountsSelector) mocks.mock(IAccountsSelector.class);

		mocks.startStubbing();
		mocks.when(selectorMock.selectById(ids)).thenReturn(records);
		mocks.stopStubbing();

        AccountsSelector.replaceWith(selectorMock);

		System.Test.startTest();
		IAccounts result = Accounts.newInstance(ids);
		System.Test.stopTest();

		System.assertEquals(records, result.getAccounts());
	}

	@IsTest
	static void testNewElevatedInstanceWithIds()
	{
		final Id id = fflib_IDGenerator.generate(Schema.Account.SObjectType);
		final Set<Id> ids = new Set<Id>{ id };
		final List<Account> records = new List<Account>{ new Account(Id = id) };

		fflib_ApexMocks mocks = new fflib_ApexMocks();
		IAccountsSelector selectorMock = (IAccountsSelector) mocks.mock(IAccountsSelector.class);

		mocks.startStubbing();
		mocks.when(selectorMock.selectById(ids)).thenReturn(records);
		mocks.stopStubbing();

        AccountsSelector.replaceWith(selectorMock);

		System.Test.startTest();
		IAccounts result = Accounts.newElevatedInstance(ids);
		System.Test.stopTest();

		System.Assert.areEqual(records, result.getAccounts());
	}

	@IsTest
	static void testNewInstanceWithRecords()
	{
	    // GIVEN a Account record
	    final Id recordId = fflib_IDGenerator.generate(Schema.Account.SObjectType);
		final List<Account> records =
		        new List<Account> {new Account(Id = recordId)};

        // WHEN we create a domain with the record
		System.Test.startTest();
		IAccounts result =  Accounts.newInstance(records);
		System.Test.stopTest();

        // THEN the records should be added to the domain
		System.Assert.areEqual(records, result.getAccounts());
		System.Assert.isTrue(result.getById().containsKey(recordId));
		System.Assert.isTrue(result.selectById(new Set<Id> {recordId}).getRecordIds().contains(recordId));
    }

	@IsTest
	static void itShouldSelectRecords_blankAndWith()
	{
	    // GIVEN a Account record with an Id and blank name and one dummy record
	    final Id recordId = fflib_IDGenerator.generate(Schema.Account.SObjectType);
		final List<Account> records =
		        new List<Account>
		        {
				        new Account(Id = recordId, Name = '  '),
				        new Account(Name = 'Test')
		        };

        // WHEN we create a domain with the records
		System.Test.startTest();
		Accounts result = new Accounts(records);
		System.Test.stopTest();

        // THEN only the records with a blank name should be in to the domain
		IAccounts blank = result.selectBlank(Schema.Account.Name);
		System.Assert.areEqual(1, blank.getAccounts().size());
		System.Assert.isTrue(blank.getById().containsKey(recordId));

        // THEN only the records with a Id should be in to the domain
		IAccounts with = result.selectWith(Schema.Account.Id);
		System.Assert.areEqual(1, with.getAccounts().size());
		System.Assert.isTrue(with.getById().containsKey(recordId));
    }

	@IsTest
	static void itShouldSelectRecords_nonBlankAndWithout()
	{
	    // GIVEN a Account record without an Id and non-blank name and one other dummy record
	    final Id recordId = fflib_IDGenerator.generate(Schema.Account.SObjectType);
		final List<Account> records =
		        new List<Account>
		        {
				        new Account(Id = recordId, Name = '  '),
				        new Account(Name = 'Test')
		        };

        // WHEN we create a domain with the records
		System.Test.startTest();
		Accounts result = new Accounts(records);
		System.Test.stopTest();

        // THEN only the records with a non-blank name should be in to the domain
		IAccounts nonBlank = result.selectNonBlank(Schema.Account.Name);
		System.Assert.areEqual(1, nonBlank.getAccounts().size());
		System.Assert.areEqual('Test', nonBlank.getAccounts().get(0).Name);

        // THEN only the records without an id should be in to the domain
		IAccounts without = result.selectWithout(Schema.Account.Id);
		System.Assert.areEqual(1, without.getAccounts().size());
		System.Assert.areEqual('Test', without.getAccounts().get(0).Name);
    }
}
