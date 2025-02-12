/**
 * AccountsService interface
 *
 * This service class is providing a single access point for highlevel business services functionality,
 * every entry point (e.g. WebService, Trigger) should be able to invoke these service methods.
 * Therefore there are many method overloads, to support different entry points
 *
 * @see IAccountsService Interface with method definitions
 * @see AccountsService Static entry point for the application
 */
public inherited sharing class AccountsServiceImpl implements IAccountsService
{
    /**
	 * Sample
	 *
	 * @param idSet A set of Account.Id values
	 *
	 * @return Returns Something
	 *
	 * @throws AccountsService.ServiceException on invalid Ids
	 */
	public Boolean doSomething(Id idSet)
	{
		return doSomething(Accounts{SUFFIX}.newInstance(idSet));
	}

	/**
	 * Sample
	 *
	 * @param Accounts A List of Account records
	 *
	 * @return Returns Something
	 */
	public Boolean doSomething(List<Account> Accounts)
	{
		return doSomething(Accounts{SUFFIX}.newInstance(Accounts));
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
	public Boolean doSomething(IAccounts{SUFFIX} Accounts)
	{
	    fflib_ISObjectUnitOfWork = new fflib_SObjectUnitOfWork(List<SObjectType> {Account});
	    Boolean result = doSomething(unitOfWork, Accounts);
	    unitOfWork.commitWork();
		return result;
	}

	/**
	 * Sample
	 *
	 * @param Accounts A domain with Account records
	 * @param unitOfWork An instance of fflib_ISObjectUnitOfWork
	 *
	 * @return Returns Something
	 */
	public Boolean doSomething(fflib_ISObjectUnitOfWork unitOfWork, IAccounts{SUFFIX} Accounts)
	{
		return true;
	}
}
