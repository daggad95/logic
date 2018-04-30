class StateTile extends Tile {
  
  public StateTile(PVector pos, boolean high) {
    super(pos);
    this.high = high;
    this.type = TileType.STATE;
  }
  
  @Override
  public void draw() {
    
    for (Tile tile : connections) {
      if (tile.high)
        stroke(255);
       else
         stroke(0);
      line(pos.x + SIZE / 2, pos.y + SIZE / 2, 
           tile.pos.x + SIZE / 2, tile.pos.y + SIZE / 2);
    }
    
    
    if (high) {
      fill(255);
      stroke(255);
    }
    else {
       fill(0);
       stroke(0);
    }
    
    rect(pos.x, pos.y, SIZE, SIZE);
  }
  
  @Override
  public void recieve() {
      high = !high;
  }
}