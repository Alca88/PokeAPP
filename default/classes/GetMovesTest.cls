@isTest
private class GetMovesTest {//@testSetup

     
    //@testSetup

    @isTest 
    static void movesGet() {
         // Set mock callout class 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                             'Complete',
                                                              '{"name": "pound","effect_entries": ["short_effect": "Inflicts regular damage with no additional effect.","accuracy": 100}],"id":"1","power": "40","pp": "35","prioriy": "0"}',
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

        Movimiento__c mov = [SELECT id, name
                     FROM Movimiento__c];

        system.assertEquals(1, mov.ExtId__c);
        system.assertEquals('pound', mov.Name);
        //system.assertEquals(100, mov.accuracy);
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