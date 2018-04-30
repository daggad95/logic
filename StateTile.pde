class StateTile extends Tile {
  
  public StateTile(PVector pos, boolean high) {
    super(pos);
    this.high = high;
    this.type = TileType.STATE;
  }
  
  @Override
  public void draw() {

    if (high) {
      fill(255);
      stroke(255);
    }
    else {
       fill(0);
       stroke(0);
    }
    
    rect(pos.x, pos.y, SIZE, SIZE);
    
    for (Tile tile : connections) {
      if (tile.high)
        stroke(255);
       else
         stroke(0);
      line(pos.x, pos.y, tile.pos.x, tile.pos.y);
    }
  }
  
  @Override
  public void recieve() {
      high = !high;
  }
}