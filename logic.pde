import java.util.LinkedList;
ArrayList<Tile> tiles;
Tile link1;
Tile link2;

void setup(){
  size(1000, 500);
  
  tiles = new ArrayList<Tile>();
}

void draw() {
  background(120);
  
  for (Tile tile : tiles) {
    tile.draw();
  }
  
  stroke(255);
  noFill();
  rect((int) (mouseX - Tile.SIZE / 2) / (int) Tile.SIZE * (int) Tile.SIZE, 
       (int) (mouseY - Tile.SIZE / 2) / (int) Tile.SIZE * (int) Tile.SIZE,
       Tile.SIZE, Tile.SIZE);
}

void keyPressed() {
  if (key == ' ') {
    link1.propagate();
  }
}

Tile selectTile() {
  for (Tile tile : tiles) {
    PVector mPos = getGridCoords(mouseX, mouseY);
    
    if (mPos.x == tile.pos.x && mPos.y == tile.pos.y) 
      return tile;
  }
  return null;
}

public PVector getGridCoords(float x, float y) {
  float newX = (int) (x - Tile.SIZE / 2) / (int) Tile.SIZE * (int) Tile.SIZE;
  float newY = (int) (y - Tile.SIZE / 2) / (int) Tile.SIZE * (int) Tile.SIZE;
  
  return new PVector(newX, newY);
}

void mousePressed() {
  if (mouseButton == LEFT)
    tiles.add(new StateTile(getGridCoords(mouseX, mouseY), false));
  if (mouseButton == RIGHT) {
    if (link1 == null) {
      link1 = selectTile();
    }
    else {
      link2 = selectTile();
      
      if (link2 != null) {
        link1.linkTo(link2);
        link1 = null;
        link2 = null;
      }
    }
  }
}