@isTest
public with sharing class PokedexCtrlTest {
    
    @testSetup 
    static void makeData(){
        Pokemon__c Bulbasaur = new Pokemon__c (Name = 'Bulbasaur', /*Generacion__c = 1,*/ Tipos__c = 'Poison;Grass', ExtId__c = 1);
        insert Bulbasaur;
        Pokemon__c Charizard = new Pokemon__c (Name = 'Charizard', /*Generacion__c = 1,*/ Tipos__c = 'Flying;Fire', ExtId__c = 1);
        insert Charizard;
    }
      
    @isTest
    static void shouldRetriveAmountOfPokemonInserted(){

        Test.startTest();
            List<Pokemon__c> cuentalst = PokedexCtrl.getFilteredPokemons('','','','');
        Test.stopTest();
        System.assertEquals(2, cuentalst.size());
    }

    @isTest
    static void shouldNoRetriveAmountOfPokemon(){
        
    delete [SELECT Id FROM Pokemon__c];
    String error = null;
        
    Test.startTest();
        try{
            List<Pokemon__c> cuentalst = PokedexCtrl.getFilteredPokemons('','','','');
        }Catch(Exception e){
            error = e.getMessage();
        }
    Test.stopTest();
     system.assertEquals('Ups! no se enocontraron pokemons', error);
	}
}