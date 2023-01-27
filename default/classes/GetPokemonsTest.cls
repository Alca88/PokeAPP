@isTest
private class GetPokemonsTest {//@testSetup

     
    //@testSetup

    @isTest 
    static void abiilitiesGet() {
         // Set mock callout class 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                             'Complete',
                                                              '{"name": "bulbasaur","height": "7","weight": "69","order":"1","id":"1"}',
                                                               null); //code , status , json, null (from singlemuck)
        Test.setMock(HttpCalloutMock.class, fakeResponse); 
        
        Test.startTest();

        list<integer> pokemons = new list<integer>();
            for (integer i = 1 ; i <= 1 ; i++){
                pokemons.add(i);
            }
        GetAbilities batch = new GetAbilities (pokemons);
        database.executeBatch(batch, 1);
        
        Test.stopTest();

        Habilidad__c poke = [SELECT id, name
                     FROM Habilidad__c];

        system.assertEquals(1, poke.ExtId__c);
        system.assertEquals('bulbasaur', poke.Name);
        //system.assertEquals(7, poke.height);
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
                list<integer> pokemons = new list<integer>();
                    for (integer i = 1 ; i <= 1 ; i++){
                        pokemons.add(i);
                }
                GetAbilities batch = new GetAbilities (pokemons);
                database.executeBatch(batch, 1);
            }catch(Exception ex){
                error = ex.getMessage();
            }
        Test.stopTest();

        system.assertEquals('Script-thrown exception', error, 
                            'el error no es el esperado, es: ' + error);
	}
}