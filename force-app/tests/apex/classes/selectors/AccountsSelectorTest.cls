/**
 * AccountsSelectorTest{$SUFFIX} selector test class
 *
 * This class is testing the selector AccountsSelector and all its methods.
 *
 * @see AccountsSelector
 */
@IsTest(IsParallel=true)
private class AccountsSelectorTest
{
	@IsTest
	static void testBehavior()
	{
		AccountsSelector.replaceWith(IAccountsSelector.class);
		AccountsSelector.replaceWith(new AccountsSelector());
		AccountsSelector.newInstance();
		IAccountsSelector selector = AccountsSelector.newElevatedInstance();

		selector.selectById(new Set<Id>());
		selector.selectSObjectsById(new Set<Id>());
	}
}
