global class GetPokemons implements Database.Batchable<Integer>, Database.AllowsCallouts {
    private List<Integer> pokemons;
    public GetPokemons(List<Integer> pokemons){
        this.pokemons = pokemons;
    }
    global List<Integer> start(Database.BatchableContext bc) {
        // colecta de records del batch
        return pokemons;
    }
    global void execute(Database.BatchableContext bc, List<Integer> scope){
        // REST

            HttpRequest req = new HttpRequest();
            req.setHeader('Accept', 'application/json');
            req.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + scope[0]);
            req.setMethod('GET');
            HTTPResponse res = new Http().send(req);
   
            JSONPoke pokeApi = JSONPoke.parse(res.getBody());
            Pokemon__c pokemon = new Pokemon__c();

            // Name, Altura__c, ExtId__c, Numero_de_Pokemon__c y Peso__c
            pokemon.Name = pokeApi.name.capitalize();
            pokemon.Altura__c = Double.valueOf(pokeApi.height)/10;
            pokemon.ExtId__c = Integer.valueOf(pokeApi.id);
            pokemon.Peso__c = Double.valueOf(pokeApi.weight)/10;

            // Mapa que contiene el JSON
            Map<String,Object> pok =(Map<String,Object>) JSON.deserializeUntyped(res.getBody());

            /// Tipos__c.
            List<Object> types =(List<Object>) pok.get('types');
            Map<String,Object> type0 =(Map<String,Object>) types.get(0);
            Map<String,Object> type00 = (Map<String,Object>) type0.get('type');
            String typename0 = (String) type00.get('name');
            pokemon.Tipos__c = typename0.capitalize();
            if (types.size() > 1){
                Map<String,Object> type1 =(Map<String,Object>) types.get(1);
                Map<String,Object> type01 = (Map<String,Object>) type1.get('type');
                String typename1 = (String) type01.get('name');
                pokemon.Tipos__c = typename0.capitalize()+';'+typename1.capitalize();
            }
            // Lista que contiene el valor de la key 'stats' dentro del JSON
            List<Object> stats = (List<Object>) pok.get('stats');

            // Vida__c
            Map<String,Object> stat0 = (Map<String,Object>) stats.get(0);
            Integer hpvalue = (Integer) stat0.get('base_stat');
            pokemon.Vida__c = hpvalue;

            // Ataque__c 
            Map<String,Object> stat1 = (Map<String,Object>) stats.get(1);
            Integer attackvalue = (Integer) stat1.get('base_stat');
            pokemon.Ataque__c = attackvalue;

            // Defensa__c
            Map<String,Object> stat2 = (Map<String,Object>) stats.get(2);
            Integer defensevalue = (Integer) stat2.get('base_stat');
            pokemon.Defensa__c = defensevalue;

            // Velocidad__c 
            Map<String,Object> stat5 = (Map<String,Object>) stats.get(5);
            Integer speedvalue = (Integer) stat5.get('base_stat');
            pokemon.Velocidad__c = speedvalue;

            // Imagen__c artwork
            Map<String,Object> sprites = (Map<String,Object>) pok.get('sprites');
            Map<String,Object> other = (Map<String,Object>) sprites.get('other');
            Map<String,Object> official_artwork = (Map<String,Object>) other.get('official-artwork');
            String front_default = (String) official_artwork.get('front_default');
            pokemon.Imagen__c = front_default;

            /* Imagen__c dreamworld
            Map<String,Object> sprites = (Map<String,Object>) pok.get('sprites');
            Map<String,Object> other = (Map<String,Object>) sprites.get('other');
            Map<String,Object> official_artwork = (Map<String,Object>) other.get('dream_world');
            String front_default = (String) dream_world.get('front_default');
            pokemon.Imagen__c = front_default;*/

            /* Imagen__c Home
            Map<String,Object> sprites = (Map<String,Object>) pok.get('sprites');
            Map<String,Object> other = (Map<String,Object>) sprites.get('other');
            //Map<String,Object> official_artwork = (Map<String,Object>) other.get('home');
            //String front_default = (String) home.get('front_default');
            pokemon.Imagen__c = front_default;*/

            // Campo tipo lookup al objeto Habilidad__c
            List<Object> abilities = (List<Object>) pok.get('abilities');
            Map<String,Object> abilitiesn = (Map<String,Object>) abilities.get(Integer.valueOf(Math.random()*abilities.size()));
            Map<String,Object> ability = (Map<String,Object>) abilitiesn.get('ability');
            String abilityname = (String) ability.get('name');
            Habilidad__c habid = [SELECT Id 
                                  FROM Habilidad__c 
                                  WHERE Name = :abilityname.capitalize()
                                  LIMIT 1];
            
            pokemon.Habilidad__c = habid.id;

            // Campo Slot(n)__c de tipo lookup a Movimiento__c
            System.debug(pokemon.Name); //busco en que pokemon está fallando la carga
            try {
                List<Object> moves = (List<Object>) pok.get('moves');
                Integer count = 0;
                List<Integer> numMovi = new List<Integer>();
                while ( count < moves.size() && count < 4 ){
                    Integer numero = Integer.valueOf(Math.random()*moves.size());
                    if (count == 0){
                        numMovi.add(numero);
                        count++;
                    }
                    if (count == 1 && numMovi.get(0) != numero){
                        numMovi.add(numero);
                        count++;
                    }
                    if (count == 2 && numMovi.get(0) != numero && numMovi.get(1) != numero){
                        numMovi.add(numero);
                        count++;
                    }
                    if (count == 3 && numMovi.get(0) != numero && numMovi.get(1) != numero && numMovi.get(2) != numero){
                        numMovi.add(numero);
                        count++;
                    }
                }

                if (moves.size() > 0){
                    Map<String,Object> moves0 = (Map<String,Object>) moves.get(numMovi.get(0));
                    Map<String,Object> move0 = (Map<String, Object>) moves0.get('move');
                    String movename0 = (String) move0.get('name');
                    Movimiento__c movi0 = [SELECT Id 
                                        FROM Movimiento__c 
                                        WHERE Name = :movename0.capitalize()
                                        LIMIT 1];
                    if (movi0 != null){
                        pokemon.Slot1__c = movi0.Id;             
                    }                  
                    else {
                        pokemon.Slot1__c = ' ';
                    }       
                }
                if (moves.size() > 1){
                    Map<String,Object> moves1 = (Map<String,Object>) moves.get(numMovi.get(1));
                    Map<String,Object> move1 = (Map<String, Object>) moves1.get('move');
                    String movename1 = (String) move1.get('name');
                    Movimiento__c movi1 = [SELECT Id 
                                        FROM Movimiento__c 
                                        WHERE Name = :movename1.capitalize()
                                        LIMIT 1];
                    if (movi1 != null){
                        pokemon.Slot2__c = movi1.Id;             
                    }                  
                    else {
                        pokemon.Slot2__c = ' ';
                    }  
                }
                if (moves.size() > 2){
                        Map<String,Object> moves2 = (Map<String,Object>) moves.get(numMovi.get(2));
                        Map<String,Object> move2 = (Map<String, Object>) moves2.get('move');
                        String movename2 = (String) move2.get('name');
                        Movimiento__c movi2 = [SELECT Id 
                                                FROM Movimiento__c 
                                                WHERE Name = :movename2.capitalize()
                                                LIMIT 1
                                                ];
                    	if (movi2 != null){
                        	pokemon.Slot3__c = movi2.Id;             
                    	}                  
                    	else {
                        	pokemon.Slot3__c = ' ';
                    	}  
                }
                
                if (moves.size() > 3){
                    Map<String,Object> moves3 = (Map<String,Object>) moves.get(numMovi.get(3));
                    Map<String,Object> move3 = (Map<String, Object>) moves3.get('move');
                    String movename3 = (String) move3.get('name');
                    Movimiento__c movi3 = [SELECT Id 
                                        FROM Movimiento__c 
                                        WHERE Name = :movename3.capitalize()
                                        LIMIT 1];
                    if (movi3 != null){
                        	pokemon.Slot4__c = movi3.Id;             
                    	}                  
                    	else {
                        	pokemon.Slot4__c = ' ';
                    	}  
                }
            } catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }

            // Se inserta el objeto Pokemon__c
            insert pokemon;
            
            
        }
    
    global void finish(Database.BatchableContext bc){
        system.debug('batch end');//confirmo finalización
    }
}