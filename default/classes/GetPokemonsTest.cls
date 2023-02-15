@isTest
private class GetPokemonsTest {//@testSetup

     
    @testSetup//CARGAR HABILIDADES Y MOVIMIENTOS
    static void setup() {      
        Habilidad__c hab1 = new Habilidad__c(Name = 'Overgrow');
        insert hab1;
        Movimiento__c mov1 = new Movimiento__c(Name = 'Bind');
        insert mov1;
        Movimiento__c mov2 = new Movimiento__c(Name = 'Cut');
        insert mov2;
        Movimiento__c mov3 = new Movimiento__c(Name = 'Swords-dance');
        insert mov3;
        Movimiento__c mov4 = new Movimiento__c(Name = 'Razor-wind');
        insert mov4;   
    }

    @isTest 
    static void abiilitiesGet() {
         // Set mock callout class 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                             'Complete',
                                                               '{"abilities":[{"ability":{"name":"overgrow","url":"https://pokeapi.co/api/v2/ability/65/"},"is_hidden":false,"slot":1},{"ability":{"name":"chlorophyll","url":"https://pokeapi.co/api/v2/ability/34/"},"is_hidden":true,"slot":3}],"height":7,"id":1,"moves":[{"move":{"name":"razor-wind","url":"https://pokeapi.co/api/v2/move/13/"}},{"move":{"name":"swords-dance","url":"https://pokeapi.co/api/v2/move/14/"}},{"move":{"name":"cut","url":"https://pokeapi.co/api/v2/move/15/"}},{"move":{"name":"bind","url":"https://pokeapi.co/api/v2/move/20/"}},{"move":{"name":"vine-whip","url":"https://pokeapi.co/api/v2/move/22/"}}],"name":"bulbasaur","sprites":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png","front_shiny_female":null,"other":{"dream_world":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg","front_female":null},"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png","front_shiny_female":null},"official-artwork":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"}}},"stats":[{"base_stat":45,"effort":0,"stat":{"name":"hp","url":"https://pokeapi.co/api/v2/stat/1/"}},{"base_stat":49,"effort":0,"stat":{"name":"attack","url":"https://pokeapi.co/api/v2/stat/2/"}},{"base_stat":49,"effort":0,"stat":{"name":"defense","url":"https://pokeapi.co/api/v2/stat/3/"}},{"base_stat":65,"effort":1,"stat":{"name":"special-attack","url":"https://pokeapi.co/api/v2/stat/4/"}},{"base_stat":65,"effort":0,"stat":{"name":"special-defense","url":"https://pokeapi.co/api/v2/stat/5/"}},{"base_stat":45,"effort":0,"stat":{"name":"speed","url":"https://pokeapi.co/api/v2/stat/6/"}}],"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}},{"slot":2,"type":{"name":"poison","url":"https://pokeapi.co/api/v2/type/4/"}}],"weight":69}',
                                                                null); //code , status , json, null (from singlemuck)
        Test.setMock(HttpCalloutMock.class, fakeResponse); 
        
        Test.startTest();

        list<integer> pokemons = new list<integer>();
            for (integer i = 1 ; i <= 1 ; i++){
                pokemons.add(i);
            }
        GetPokemons batch = new GetPokemons (pokemons);
        database.executeBatch(batch, 1);
        
        Test.stopTest();

        Pokemon__c poke = [SELECT Id, Name, ExtId__c, Altura__C,Peso__c, Tipos__c, Generacion__c, Vida__c, Defensa__c, Ataque__c,
                           Velocidad__c, Habilidad__c, Slot1__c, Slot2__c, Slot3__c, Slot4__c
                           FROM Pokemon__c	
                          LIMIT 1];

        System.assertEquals('Bulbasaur', poke.Name );
        System.assertEquals('Poison;Grass', poke.Tipos__c);
        System.assertEquals(1, poke.ExtId__c);
        System.assertEquals(1, poke.Generacion__c);
        System.assertEquals(6.9, poke.Peso__c);
        System.assertEquals(0.7, poke.Altura__c);
        System.assertEquals(45, poke.Vida__c);
        System.assertEquals(45, poke.Velocidad__c);
        System.assertEquals(49, poke.Defensa__c);
        System.assertEquals(49, poke.Ataque__c);
        System.assertNotEquals(null, poke.Habilidad__c);
        System.assertNotEquals(null, poke.Slot1__c);
        System.assertNotEquals(null, poke.Slot2__c);
        System.assertNotEquals(null, poke.Slot3__c);
        System.assertNotEquals(null, poke.Slot4__c);
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