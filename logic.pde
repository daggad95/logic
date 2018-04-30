import java.util.LinkedList;
ArrayList<Tile> tiles;

void setup(){
  size(1000, 500);
  
  tiles = new ArrayList<Tile>();
  
  StateTile tile = new StateTile(new PVector(100, 100), true);
  tiles.add(tile);
  for (int i = 1; i < 10; i++) {
    tile = new StateTile(new PVector(100 + 50 * i, 100), false);
    tiles.add(tile);
    tiles.get(i - 1).linkTo(tile);
  }
  
  StateTile tile2 = new StateTile(new PVector(200, 150), false);
  StateTile tile3 = new StateTile(new PVector(200, 200), false);
  StateTile tile4 = new StateTile(new PVector(200, 250), false);
  tiles.add(tile2);
  tiles.add(tile3);
  tiles.add(tile4);
  tiles.get(2).linkTo(tile2);
  tile2.linkTo(tile3);
  tile3.linkTo(tile4);
}

void draw() {
  background(120);
  
  for (Tile tile : tiles) {
    tile.draw();
  }
}

void keyPressed() {
  if (key == ' ') {
    tiles.get(0).propagate();
  }
}