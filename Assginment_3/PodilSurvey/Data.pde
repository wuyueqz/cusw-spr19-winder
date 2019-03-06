Table table;

void loadData() {
  background = loadImage("data/Kyiv_Area.jpg");
  background.resize(width, height);
  table = loadTable("data/surveyDataSample.csv", "header");
  bubbles = new Bubble[table.getRowCount()];
  for (int i = 0; i<table.getRowCount(); i++) {
    // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);
  
    // Access the fields via their column name (or index).
    float x = float(row.getString("most_time_x"));
    float y = float(row.getString("most_time_y"));
    float d = float(row.getString("duration"))*1.5;
    String n = row.getString("last_name");
    String g = row.getString("gender");
    String a = row.getString("age");
    String l = row.getString("live");
    String w = row.getString("work");
    bubbles[i] = new Bubble(x, y, d, n, g, a, l, w);
    println(bubbles[i].gender.equals("Male"));
  }  
}
