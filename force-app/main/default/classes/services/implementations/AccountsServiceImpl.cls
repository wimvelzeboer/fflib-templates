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
		return doSomething(Accounts.newInstance(idSet));
	}

	/**
	 * Sample
	 *
	 * @param accounts A List of Account records
	 *
	 * @return Returns Something
	 */
	public Boolean doSomething(List<Account> accounts)
	{
		return doSomething(Accounts.newInstance(accounts));
	}

	/**
	 * Sample
	 *
	 * @param accounts A domain with Account records
	 *
	 * @return Returns Something
	 *
	 * @see	IAccounts
	 */
	public Boolean doSomething(IAccounts accounts)
	{
	    fflib_ISObjectUnitOfWork unitOfWork = new fflib_SObjectUnitOfWork(List<SObjectType> {Account});
	    Boolean result = doSomething(unitOfWork, accounts);
	    unitOfWork.commitWork();
		return result;
	}

	/**
	 * Sample
	 *
	 * @param accounts A domain with Account records
	 * @param unitOfWork An instance of fflib_ISObjectUnitOfWork
	 *
	 * @return Returns Something
	 */
	public Boolean doSomething(fflib_ISObjectUnitOfWork unitOfWork, IAccounts{SUFFIX} accounts)
	{
		return true;
	}
}
