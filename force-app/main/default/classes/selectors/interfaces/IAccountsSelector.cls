/**
 * IAccountsSelector interface class
 *
 * Selector Class providing common database query support for abstracting and encapsulating query logic
 */
public interface IAccountsSelector
		extends fflib_ISObjectSelector
{
    /**
     * Queries ProductOption__c records by their record Id
     *
     * @param idSet A set of ProductOption__c.Id values
     *
     * @return A list of ProductOption__c records
     */
	List<Account> selectById(Set<Id> idSet);

	fflib_SObjectSelector setDataAccess(fflib_SObjectSelector.DataAccess access);
}
