/**
 * AccountsService interface
 *
 * This service class is providing a single access point for high level business services functionality,
 * every entry point (e.g. WebService, Trigger) should be able to invoke these service methods.
 * Therefore there are many method overloads, to support different entry points
 *
 * @see AccountsServiceImpl The default implementation
 */
public interface IAccountsService
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
	Boolean doSomething(Id idSet);

	/**
	 * Sample
	 *
	 * @param Accounts A List of Account records
	 *
	 * @return Returns Something
	 */
	Boolean doSomething(List<Account> Accounts);

	/**
	 * Sample
	 *
	 * @param Accounts A domain with Account records
	 *
	 * @return Returns Something
	 *
	 * @see	IAccounts{SUFFIX}
	 */
	Boolean doSomething(IAccounts{SUFFIX} Accounts);

	/**
	 * Sample
	 *
	 * @param Accounts A domain with Account records
	 * @param unitOfWork An instance of fflib_ISObjectUnitOfWork
	 *
	 * @return Returns Something
	 */
	Boolean doSomething(fflib_ISObjectUnitOfWork unitOfWork, IAccounts{SUFFIX} Accounts);
}
 