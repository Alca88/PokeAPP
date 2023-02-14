global class GetAbilities implements Database.Batchable<Integer>, Database.AllowsCallouts {
    
    private List<Integer> habi; //lista privada de la clase
    
    public getAbilities(List<Integer> habi){
        this.habi = habi;
    }
    global List<Integer> start(Database.BatchableContext bc) {
        // colecta de records del batch
        return habi;
    }
    global void execute(Database.BatchableContext bc, List<Integer> scope){
        // REST 

            HttpRequest req = new HttpRequest();
            req.setHeader('Accept', 'application/json');
            req.setEndpoint('https://pokeapi.co/api/v2/ability/' + scope[0]);
            req.setMethod('GET');
            HTTPResponse res = new Http().send(req);

            JSONAbility pokeApiAb = JSONAbility.parse(res.getBody());
            Habilidad__c ability = new Habilidad__c();

            // Name y ExtId__c
            ability.Name = pokeApiAb.name.Capitalize();
            ability.ExtId__c = Integer.valueOf(pokeApiAb.id);

            // Efecto__c
            Map<String,Object> abil =(Map<String,Object>) JSON.deserializeUntyped(res.getBody());
            List<Object> effectentries =(List<Object>) abil.get('effect_entries');
            if (effectentries.size() > 0 ){
                Map<String,Object> searchenglish = (Map<String,Object>) effectentries.get(0);
                Map<String,Object> language = (Map<String,Object>) searchenglish.get('language');
                String langname = (String) language.get('name');
                if (langname.equals('en')){
                    String shorteffect = (String) searchenglish.get('short_effect');
                    ability.Efecto__c = shorteffect;
                } else {
                    Map<String,Object> english = (Map<String,Object>) effectentries.get(1);
                    String shorteffect = (String) english.get('short_effect');
                    ability.Efecto__c = shorteffect;
                }
            }

            // Se inserta el objeto Habilidad__c
            insert ability;

    }
    
    global void finish(Database.BatchableContext bc){
        system.debug('batch end'); //confirmo finalización
    }
}