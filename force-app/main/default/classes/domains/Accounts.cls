/**
 * Accounts  domain class
 *
 * This domain is a wrapper around Account records, and it contains getter,
 * setter and filter (selector) methods.
 *
 * Getters retrieve field values from all the Account records in this domain
 * Setters change field values on all the Account records in this domain
 * Selectors filter the contents of this domain
 *
 * The getter, setter and selector methods always targets (iterate over)
 * all the records the domain contains.
 * First use a selector, when a certain setter or getter method should target
 * only a subset.
 *
 * The only concern/context known to this domain is the List of Account records
 * it encapsulates. It is not aware of anything outside this domain,
 * so there should be no references to other classes or object types besides
 * the classes it is extended from
 *
 * @see IAccounts
 *
 * @example
 * Map<Id, Account> AccountsById =
 *              Accounts.newInstance(recordIds)
 *                      .selectBySomeField('Holland')
 *                      .getById();
 */
public virtual inherited sharing class Accounts extends fflib_SObjects2 implements IAccounts
{
	/**
	 * Class constructor
	 *
	 * @param records Constructs the domain with the given records
	 *
	 * @return Returns a new instance of the Accounts domain
	 *
	 * @see IAccounts
	 */
	public static IAccounts newInstance(List<Account> records)
	{
		return new Accounts(records);
	}

	/**
	 * Class constructor
	 *
	 * @param ids Constructs the domain by querying the given record Ids
	 *
	 * @return Returns a new instance of the Accounts domain
	 *
	 * @see IAccounts
	 * @see AccountsSelector
	 */
	public static IAccounts newInstance(Set<Id> ids)
	{
		return new Accounts(
		        AccountsSelector.newInstance().selectById(ids));
	}

	/**
	 * Class constructor
	 *
	 * @param ids Constructs the domain by querying the given record Ids in a SYSTEM_MODE context
	 *
	 * @return Returns a new instance of the Accounts domain
	 *
	 * @see IAccounts
	 * @see AccountsSelector
	 */
	public static IAccounts newElevatedInstance(Set<Id> ids)
	{
		return new Accounts(
		        AccountsSelector.newElevatedInstance().selectById(ids));
	}

	/**
	 * Class constructor
	 *
	 * Avoid instantiating this constructor directly, instead use the static newInstance methods
	 *
	 * @param records A list of Account records
	 *
	 * @see Account
	 */
	@TestVisible
	private Accounts(List<Account> records)
	{
		super(records, Schema.Account.SObjectType);
	}

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
	public List<Account> getAccounts()
	{
		return getRecords();
	}

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
	public Map<Id, Account> getById()
	{
		return new Map<Id, Account>(getAccounts());
	}

	/**
	 * Gets a sub-selection of the Account records matching the given ids
	 *
	 * @param ids A set of Account.Id values
	 *
	 * @return Returns a new instance of the Accounts domain containing the matching records
	 *
	 * @see IAccounts
	 *
	 * @example IAccounts subset = Accounts.selectById(recordIds);
	 */
	public IAccounts selectById(Set<Id> ids)
	{
		return new Accounts(getRecords(ids));
	}

	/**
	 * Gets a sub-selection of the Accounts records where the given (String) field is blank
	 *
	 * @param sObjectField A String field on the Account object
	 *
	 * @return Returns a new instance of the Accounts domain containing only the matching records
	 *
	 * @see IAccounts
	 * @see Schema.SObjectField
	 *
	 * @example
	 * public IAccounts selectWithBlankName()
	 * {
	 *     return selectBlank(Schema.Account.Name);
	 * }
	 */
	@TestVisible
	private IAccounts selectBlank(Schema.SObjectField sObjectField)
	{
		List<Account> result = new List<Account>();
		for (Account record : getAccounts())
		{
			if (String.isNotBlank(String.valueOf(record.get(sObjectField)))) continue;

			result.add(record);
		}
		return new Accounts(result);
	}

	/**
	 * Gets a sub-selection of the Accounts records where the given (String) field is not blank
	 *
	 * @param sObjectField A String field on the Account object
	 *
	 * @return Returns a new instance of the Accounts domain containing only the matching records
	 *
	 * @see IAccounts
	 * @see Schema.SObjectField
	 *
	 * @example
	 * public IAccounts selectWithName()
	 * {
	 *     return selectNonBlank(Schema.Account.Name);
	 * }
	 */
	@TestVisible
	private IAccounts selectNonBlank(Schema.SObjectField sObjectField)
	{
		List<Account> result = new List<Account>();
		for (Account record : getAccounts())
		{
			if (String.isBlank(String.valueOf(record.get(sObjectField)))) continue;

			result.add(record);
		}
		return new Accounts(result);
	}

	/**
	 * Gets a sub-selection of the Accounts records where the given field is not null
	 * Tip: use selectNonBlank for String fields
	 *
	 * @param sObjectField A field on the Account object
	 *
	 * @return Returns a new instance of the Accounts domain containing only the matching records
	 *
	 * @see IAccounts
	 * @see Schema.SObjectField
	 *
	 * @example
	 * public IAccounts selectExistingRecords()
	 * {
	 *     return selectWith(Schema.Account.Id);
	 * }
	 */
	@TestVisible
	private IAccounts selectWith(Schema.SObjectField sObjectField)
	{
		List<Account> result = new List<Account>();
		for (Account record : getAccounts())
		{
			if (record.get(sObjectField) == null) continue;

			result.add(record);
		}
		return new Accounts(result);
	}

	/**
	 * Gets a sub-selection of the Accounts records where the given field is null
	 * Tip: use selectBlank for String fields
	 *
	 * @param sObjectField A field on the Account object
	 *
	 * @return Returns a new instance of the Accounts domain containing only the matching records
	 *
	 * @see IAccounts
	 * @see Schema.SObjectField
	 *
	 * @example
	 * public IAccounts selectNewRecords()
	 * {
	 *     return selectWithout(Schema.Account.Id);
	 * }
	 */
	@TestVisible
	private IAccounts selectWithout(Schema.SObjectField sObjectField)
	{
		List<Account> result = new List<Account>();
		for (Account record : getAccounts())
		{
			if (record.get(sObjectField) != null) continue;

			result.add(record);
		}
		return new Accounts(result);
	}
}
