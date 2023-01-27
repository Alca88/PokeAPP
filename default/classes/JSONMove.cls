public with sharing class JSONMove {
	public String accuracy;
	public String effect_chance;
	public String id;
	public String name;
	public String power;
	public String pp;
	public String priority;

	public static JSONMove parse(String json){
		return (JSONMove) System.JSON.deserialize(json, JSONMove.class);
	}
}