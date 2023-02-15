@isTest
private class GetMovesTest {//@testSetup

     
    //@testSetup

    @isTest 
    static void movesGet() {
         // Set mock callout class 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"accuracy":100,"effect_chance":null,"effect_entries":[{"effect":"Inflicts regular damage.","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"short_effect":"Inflicts regular damage with no additional effect."}],"id":1,"name":"pound","power":40,"pp":35,"priority":0,"target":{"name":"selected-pokemon","url":"https://pokeapi.co/api/v2/move-target/10/"},"type":{"name":"normal","url":"https://pokeapi.co/api/v2/type/1/"}}',
                                                                null); //code , status , json, null (from singlemuck)
        Test.setMock(HttpCalloutMock.class, fakeResponse); 
        
        Test.startTest();

        list<integer> movi = new list<integer>();
            for (integer i = 1 ; i <= 1 ; i++){
                movi.add(i);
            }
        GetMoves batch = new GetMoves (movi);
        database.executeBatch(batch, 1);
        
        Test.stopTest();

         Movimiento__c mov = [SELECT Id
                             FROM Movimiento__c
                             LIMIT 1];

        System.assertEquals('Pound', mov.Name );
        System.assertEquals(1, mov.ExtId__c);
        System.assertEquals(35, mov.pp__c);
        System.assertEquals(100, mov.Punteria__c);
        System.assertEquals(0, mov.Prioridad__c);
        System.assertEquals(40, mov.Poder__c);
        System.assertEquals(null, mov.Chance_de_Efecto__c);
        System.assertEquals('Inflicts regular damage with no additional effect.', mov.Efecto__c);
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
                list<integer> movi = new list<integer>();
                    for (integer i = 1 ; i <= 1 ; i++){
                        movi.add(i);
                }
                GetMoves batch = new GetMoves (movi);
                database.executeBatch(batch, 1);
            }catch(Exception ex){
                error = ex.getMessage();
            }
        Test.stopTest();

        system.assertEquals('Script-thrown exception', error, 
                            'el error no es el esperado, es: ' + error);
	}
}