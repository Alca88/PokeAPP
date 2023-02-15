@isTest
private class GetAbilitiesTest {
 
    //@testSetup

    @isTest 
    static void abiilitiesGet() {
         // Set mock callout class 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                             'Complete',
                                                              '{"name": "stench","effect_entries": [{"language": {"name": "en"},"short_effect": "Has a 10% chance of making target Pokémon flinch with each hit."}],"id":"1"}',
                                                               null); //code , status , json, null (from singlemuck)
        Test.setMock(HttpCalloutMock.class, fakeResponse); 
        
        Test.startTest();

        list<integer> habi = new list<integer>();
            for (integer i = 1 ; i <= 1 ; i++){
                habi.add(i);
            }
        GetAbilities batch = new GetAbilities (habi);
        database.executeBatch(batch, 1);
        
        Test.stopTest();

        Habilidad__c hab = [SELECT id
                     		FROM Habilidad__c
                           LIMIT 1];

        system.assertEquals(1, hab.ExtId__c);
        system.assertEquals('stench', hab.Name);
        system.assertEquals('Has a 10% chance of making target Pokémon flinch with each hit.', hab.Efecto__c);
    }
    
    @isTest 
    static void laAPIDeberiaRetornarUnError(){
        String error;
		SingleRequestMock fakeResponse = new SingleRequestMock(500,
                                                                'error',
                                                                'error',
                                                                null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
        
        Test.startTest();
            try{
                list<integer> habi = new list<integer>();
                    for (integer i = 1 ; i <= 1 ; i++){
                    habi.add(i);
                }
                GetAbilities batch = new GetAbilities (habi);
                database.executeBatch(batch, 1);
            }catch(Exception ex){
                error = ex.getMessage();
            }
        Test.stopTest();

        system.assertEquals('Script-thrown exception', error, 
                            'el error no es el esperado, es: ' + error);
	}
}