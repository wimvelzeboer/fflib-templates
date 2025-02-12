/**
 * AccountsSelector class
 *
 * Selector Class providing common database query support for abstracting and encapsulating query logic
 */
public virtual without sharing class AccountsSelector
		extends fflib_SObjectSelector
		implements IAccountsSelector
{
	/**
	 * The current implementation type of the service
	 */
	private static System.Type implementationType = AccountsSelector.class;

	/**
	 * The implementation replacement for the service,
	 */
	private static IAccountsSelector implementationReplacement;

	/**
	 * Runs the query in User Mode, respecting FLS, CRUD & sharing rules
	 *
	 * @return New instance of the selector
	 */
	public static IAccountsSelector newInstance()
	{
		IAccountsSelector selector =
				(implementationReplacement == null) ? (IAccountsSelector) implementationType.newInstance() : implementationReplacement;
		selector.setDataAccess(fflib_SObjectSelector.DataAccess.USER_MODE);
		return selector;
	}

	/**
	 * Runs the query in System Mode, disabling FLS, CRUD & sharing rules
	 *
	 * @return New instance of the selector
	 */
	public static IAccountsSelector newElevatedInstance()
	{
		IAccountsSelector selector =
				(implementationReplacement == null) ? (IAccountsSelector) implementationType.newInstance() : implementationReplacement;
		selector.setDataAccess(fflib_SObjectSelector.DataAccess.SYSTEM_MODE);
		return selector;
	}

	/**
	 * Class constructor
	 * This should not be used directly by an application but only by fflib
	 */
	public AccountsSelector()
	{
		super();
	}

	/**
	 * The fields to always include in all queries
	 *
	 * @return Returns a list of default fields that are always queried
	 */
	public virtual List<Schema.SObjectField> getSObjectFieldList()
	{
		List<SObjectField> result = new List<Schema.SObjectField>
		{
				Account.Id,
		};
		// Uncomment the line below if the selector is extend from another selector,
		// result.addAll(super.getSObjectFieldList());
		return result;
	}

    /**
     * Defines the SObjectType for this selector
     *
     * @returns the SObjectType of this selector
     */
	public Schema.SObjectType getSObjectType()
	{
		return Schema.Account.SObjectType;
	}

	/**
	 * Replace the default implementation of the service
	 *
	 * @param systemType The System.Type of the replacement class
	 */
	public static void replaceWith(System.Type systemType)
	{
		AccountsSelector.implementationType = systemType;
	}

	/**
	 * Replace the default implementation of the service
	 *
	 * @param replacement A replacement instance
	 *
	 * @see IAccountsSelector
	 */
	public static void replaceWith(IAccountsSelector replacement)
	{
		AccountsSelector.implementationReplacement = replacement;
	}

    /**
     * Queries Account records by their record Id
     *
     * @param idSet A set of Account.Id values
     *
     * @return A list of Account records
     */
	public virtual List<Account> selectById(Set<Id> idSet)
	{
		return Database.query(
				newQueryFactory()
						.setCondition('Id IN :idSet')
						.toSOQL()
		);
	}
}
