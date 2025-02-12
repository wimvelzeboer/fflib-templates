/**
 * AccountsService class
 *
 * This service class is providing a single access point for highlevel business services functionality,
 * every entry point (e.g. WebService, Trigger) should be able to invoke these service methods.
 * Therefore there are many method overloads, to support different entry points
 *
 * @see IAccountsService Interface with method definitions
 * @see AccountsServiceImpl The default implementation
 */
public with sharing class AccountsService
{
	/**
	 * The current implementation type of the service,
	 * defaults to AccountsServiceImpl.class
	 *
	 * @see AccountsServiceImpl
	 */
	private static System.Type implementationType = AccountsServiceImpl.class;

	/**
	 * The implementation replacement for the service,
	 */
	private static IAccountsService implementationReplacement;

	/**
	 * Sample
	 *
	 * @param idSet A set of Account.Id values
	 *
	 * @return Returns Something
	 *
	 * @throws AccountsService.ServiceException on invalid Ids
	 */
	public static Boolean doSomething(Id idSet)
	{
		return newInstance().doSomething(idSet);
	}

	/**
	 * Sample
	 *
	 * @param Accounts A List of Account records
	 *
	 * @return Returns Something
	 */
	public static Boolean doSomething(List<Account> Accounts)
	{
		return newInstance().doSomething(Accounts);
	}

	/**
	 * Sample
	 *
	 * @param Accounts A domain with Account records
	 *
	 * @return Returns Something
	 *
	 * @see	IAccounts{SUFFIX}
	 */
	public static Boolean doSomething(IAccounts{SUFFIX} Accounts)
	{
		return newInstance().doSomething(Accounts);
	}

	/**
	 * Sample
	 *
	 * @param Accounts A domain with Account records
	 * @param unitOfWork An instance of fflib_ISObjectUnitOfWork
	 *
	 * @return Returns Something
	 */
	public static Boolean doSomething(fflib_ISObjectUnitOfWork unitOfWork, IAccounts{SUFFIX} Accounts)
	{
		return newInstance().doSomething(unitOfWork, Accounts);
	}

	/**
	 * Replace the default implementation of the service
	 *
	 * @param systemType The System.Type of the replacement class which should be extended from IAccountsService
	 */
	public static void replaceWith(System.Type systemType)
	{
		AccountsService.implementationType = systemType;
	}

	/**
	 * Replace the default implementation of the service
	 *
	 * @param replacement A replacement which is an instance of IAccountsService
	 *
	 * @see IAccountsService
	 */
	@TestVisible
	private static void replaceWith(IAccountsService replacement)
	{
		AccountsService.implementationReplacement = replacement;
	}

	/**
	 * Creates a new instance of IAccountsService
	 *
	 * @return Returns either the default implementation AccountsServiceImpl or a replacement
	 *
	 * @see IAccountsService
	 */
	@TestVisible
	private static IAccountsService newInstance()
	{
		return (implementationReplacement == null) ? (IAccountsService) implementationType.newInstance() : implementationReplacement;
	}

	public class ServiceException extends System.Exception {}
}
 