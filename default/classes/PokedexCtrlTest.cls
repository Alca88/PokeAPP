@isTest
public with sharing class PokedexCtrlTest {
    
    @testSetup 
    static void makeData(){
        Pokemon__c Pikachu = new Pokemon__c(Name = 'Pikachu');
        insert Pikachu;
        Pokemon__c Charmander = new Pokemon__c(Name = 'Charmander');
        insert Charmander;
    }
      
    @isTest
    static void shouldRetriveAmountOfPokemonInserted(){

        Test.startTest();
            List<Pokemon__c> cuentalst = PokedexCtrl.getFilteredPokemons('');
        Test.stopTest();
        System.assertEquals(2, cuentalst.size());
    }

    @isTest
    static void shouldNoRetriveAmountOfPokemon(){
        
    delete [SELECT Id FROM Pokemon__c];
    String error = '';
    Test.startTest();
        try{
            List<Pokemon__c> cuentalst = PokedexCtrl.getFilteredPokemons('');
        }Catch(Exception e){
            error = e.getMessage();
        }
    Test.stopTest();
    System.assertEquals('Ups! no se enocontraron pokemons', error);
}
}