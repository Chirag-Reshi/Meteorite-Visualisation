PImage worldImage;
Table table;

int currentYear = 1800;

void setup() {
  size(1200, 600);
  worldImage = loadImage("Data/world_12000.jpg");
  table = loadTable("data/Meteorite_Landings.csv", "header");
  
  
}

void draw(){

  background(worldImage);
  smooth();
  currentYear++;
  println(currentYear);
  for(TableRow row: table.rows()){
  
    String name = row.getString("name");    
    float mass = row.getFloat("mass");
    float reclat = row.getFloat("reclat");
    float reclong = row.getFloat("reclong");
    int year = row.getInt("year");
    
    float mapX = map(reclong,-180, 180,0,width);
    float mapY = map(reclat,90, -90,0,height);
    float mapMass = map(mass,0,5000000,6.0,8.0);
    /*if(currentYear == year){
      stroke(255,0,0);
      strokeWeight(mapMass);
      point(mapX,mapY);
    }*/
    if(mapMass<3){
    stroke(255,0,0);
    strokeWeight(1);
    point(mapX,mapY);
    }else{
    noFill();
    ellipse(mapX,mapY,mapMass,mapMass);
    }
    
  }
  
}
