public with sharing class JSONAbility {
    public String id;
    public String name;   
    public static JSONAbility parse(String json){
        return (JSONAbility) System.JSON.deserialize(json, JSONAbility.class);
    }
}