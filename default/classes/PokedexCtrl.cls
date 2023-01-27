public with sharing class PokedexCtrl {
    @AuraEnabled(cacheable=true scope='global')
    
    public static List<Pokemon__c> getFilteredPokemons(String searchText){

            // cambiar para agregar los filtros de generacion y tipos 
        String likeValue = '%' + searchText + '%';
        return [
            SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c
            FROM Pokemon__c
            WHERE Name 
            LIKE :likeValue
            ORDER BY ExtId__c
        ];
    }
   
    /*
		 public static List<Pokemon__c> getAllPokemons(){
        	return [
            SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c
            FROM Pokemon__c
            ORDER BY ExtId__c
        ];
    }*/
    
}