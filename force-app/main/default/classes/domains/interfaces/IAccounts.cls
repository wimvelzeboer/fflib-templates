/**
 * IAccounts domain interface
 *
 * This domain interface defines the public accessible methods for the Accounts
 * domain which is a wrapper around Account records,
 * containing getter, setter and filter (selector) methods
 *
 * When method accept or return objects (DTOs) then these should be publicly
 * accessible (avoid using sub-classes located in implementations)
 *
 * @see Accounts
 */
public interface IAccounts extends fflib_ISObjects
{
	/**
	 * Get the Account records the domain contains
	 *
	 * @return Returns the list of Account records
	 *
	 * @see Account
	 *
	 * @example
	 * List<Account> filteredAccounts =
	 *         Accounts.newInstance(recordIds)
	 *                 .selectBySomeField('Holland')
	 *                 .getAccounts();
	 */
    List<Account> getAccounts();

	/**
	 * Get the Account records by their Id
	 *
	 * @return Returns a map of the Account record by its Account.Id
	 *
	 * @see Account
	 *
	 * @example
	 * Map<Id, Account> AccountsById =
	 *         Accounts.newInstance(recordIds)
	 *                 .getById();
	 */
    Map<Id, Account> getById();

	/**
	 * Gets a sub-selection of the Account records matching the given ids
	 *
	 * @param ids A set of Account.Id values
	 *
	 * @return Returns a new instance of the Accounts domain containing the matching records
	 *
	 * @example IAccounts subset = Accounts.selectById(recordIds);
	 */
    IAccounts selectById(Set<Id> ids);
}
