public with sharing class accountHandler {
 
    public STATIC void updateAccounts(List<Account> lstNewAccouts, Map<Id, Account> mapOldAccounts){

        for(Account acc : lstNewAccouts){
            Account oldAcc = mapOldAccounts.get(acc.id);

            if(acc.name != oldAcc.Name){
                acc.Name = acc.Name + ' - Updated'; 
            }

            if(acc.AnnualRevenue > 1000){
                acc.Rating = 'Hot';
            }
        }
    }

    public STATIC void validateIndustry(List<Account> lstNewAccouts) {
        Map<String, blockIndustry__mdt> blockInd = blockIndustry__mdt.getAll();
        List<String> lstBlockedIndustries = new List<String>();

        for(blockIndustry__mdt ind : blockInd.values()){
            lstBlockedIndustries.add(ind.Industry__c);
        }

        for(Account acc : lstNewAccouts){
            if(lstBlockedIndustries.contains(acc.Industry)){
                acc.addError('INVALID INDUSTRY');                
            }
        }
    }
}
