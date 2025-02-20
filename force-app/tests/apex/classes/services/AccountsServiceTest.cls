/**
 * AccountsService test class
 *
 * This class tests the static entry point of the AccountsService class
 *
 * @see AccountsService
 */
@IsTest
private class AccountsServiceTest
{
	@IsTest
	static void itShouldCallTheImplementation()
	{
		fflib_ApexMocks mocks = new fflib_ApexMocks();
		IAccountsService serviceMock = (IAccountsService) mocks.mock(IAccountsService.class);

		AccountsService.replaceWith(AccountsServiceImpl.class);
		AccountsService.replaceWith(serviceMock);

		final Id accountsId = fflib_IDGenerator.generate(Schema.Account.SObjectType);

		System.Test.startTest();
		Boolean result = AccountsService.doSomething(new Set<Id> {accountsId});
		System.Test.stopTest();

		((IAccountsService) mocks.verify(serviceMock)).doSomething(new Set<Id> {accountsId});
	}
}
