public with sharing class PokedexCtrl {
    @AuraEnabled(cacheable=true scope='global')

    public static List<Pokemon__c> getFilteredPokemons(String searchText, String valueGeneracion, String valueTipo1, String valueTipo2){
        
        String lista;
        String condicion ='';

        if (String.isNotBlank(searchText)){
            condicion = 'Name LIKE \''+'%' + searchText + '%\'';
        }

        if (String.isNotBlank(valueGeneracion)) {
            if (String.isNotBlank(condicion)){
                condicion +=' AND Generacion__c = ' + valueGeneracion +'';
            } else {
                condicion +=' Generacion__c = ' + valueGeneracion +'';
            }
        }

        if (String.isNotBlank(valueTipo1)) {
            if(String.isNotBlank(condicion)) {
                condicion += ' AND Tipos__c INCLUDES ' + '(\'' + valueTipo1 +'\')';
            } else {
                condicion += ' Tipos__c INCLUDES ' + '(\'' + valueTipo1 +'\')';
            }
        }

        if (String.isNotBlank(valueTipo2)) {
            if(String.isNotBlank(condicion)) {
                condicion += ' AND Tipos__c INCLUDES ' + '(\'' + valueTipo2 +'\')';
            } else {
                condicion += ' Tipos__c INCLUDES ' + '(\'' + valueTipo2 +'\')';
            }
        }

        if (String.isNotBlank(condicion)) {
            lista =
                'SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c, Tipos__c FROM Pokemon__c WHERE ' +
                condicion +
                ' ORDER BY ExtId__c';
        } else {
            lista = 'SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c, Tipos__c FROM Pokemon__c ORDER BY ExtId__c';
        }

        List<Pokemon__c> pokemons = Database.query(lista);
        return pokemons;
    }
}



    
    /*public static List<Pokemon__c> getFilteredPokemons(String searchText, String valueGeneracion){

            // cambiar para agregar los filtros de generacion y tipos 
        String likeValue = '%' + searchText + '%';
        String value = '%' + valueGeneracion + '%';

        return [
            SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c
            FROM Pokemon__c
            WHERE Name 
            LIKE :likeValue
            ORDER BY ExtId__c
        ];
    }*/
   
    /*
		 public static List<Pokemon__c> getAllPokemons(){
        	return [
            SELECT Id, Name, Imagen__c, ExtId__c, Generacion__c
            FROM Pokemon__c
            ORDER BY ExtId__c
        ];
    }*/