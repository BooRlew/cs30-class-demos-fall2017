JSONObject json;

void setup() {

  json = loadJSONObject("data/new.json");

  int id = json.getInt("id");
  String species = json.getString("species");
  String name = json.getString("name");

  println(id + ", " + species + ", " + name);
}