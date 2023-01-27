public class JSONPoke{
	public String id;
	//public String generation;
	//public String ability;
	public String height;
	public String weight;
	public String name;
	//public String image;
	//public String hp;
	//public String velocity;
	//public String defense;
	//public String attack;
    public String order;  //revisar = ExtId
 
	public static JSONPoke parse(String json){
		return (JSONPoke) System.JSON.deserialize(json, JSONPoke.class);
	}

}