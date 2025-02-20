/**
 * AccountsService interface
 *
 * This service class is providing a single access point for highlevel business services functionality,
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
	 * @param accounts A List of Account records
	 *
	 * @return Returns Something
	 */
	Boolean doSomething(List<Account> accounts);

	/**
	 * Sample
	 *
	 * @param accounts A domain with Account records
	 *
	 * @return Returns Something
	 *
	 * @see	IAccounts
	 */
	Boolean doSomething(IAccounts accounts);

	/**
	 * Sample
	 *
	 * @param accounts A domain with Account records
	 * @param unitOfWork An instance of fflib_ISObjectUnitOfWork
	 *
	 * @return Returns Something
	 */
	Boolean doSomething(fflib_ISObjectUnitOfWork unitOfWork, IAccounts accounts);
}
 