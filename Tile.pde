class Tile {
  final static float SIZE = 20;
  PVector pos;
  ArrayList<Tile> connections;
  LinkedList<Tile> pTiles;
  TileType type;
  boolean high;
  
  public Tile(PVector pos) {
    this.pos = pos; 
    this.connections = new ArrayList<Tile>();
    this.pTiles = new LinkedList<Tile>();
  }
  
  public void draw() {
    rect(pos.x, pos.y, SIZE, SIZE);
  }
  
    
  public void linkTo(Tile tile) {
    connections.add(tile);
  }
  
  public void propagate() {
    ArrayList<Tile> adjacent = new ArrayList<Tile>();
    
    if (pTiles.isEmpty()) {
      for (Tile tile : connections) {
        pTiles.add(tile);
      }
    }
    
    while (!pTiles.isEmpty()) {
      Tile tile = pTiles.remove();
      tile.recieve();
      
      for (Tile adjTile : tile.connections) {
        adjacent.add(adjTile);
      }
    }
    
    for (Tile tile : adjacent) {
      pTiles.add(tile);
    }
  }
  
  void recieve() { println("this does nothing"); }
}