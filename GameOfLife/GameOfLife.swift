//  Any live cell with fewer than two live neighbours dies, as if caused by under-population.
//  Any live cell with two or three live neighbours lives on to the next generation.
//  Any live cell with more than three live neighbours dies, as if by over-population.
//  Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

public class Grid {
  public init(livingCellLocations: [[Int]]) {

  }

  public func isAliveAt(coordinates: [Int]) -> Bool {
    return false
  }
}

public class Cell {
  let state: Bool

  public init(alive: Bool) {
    self.state = alive
  }

  public var isAlive: Bool {
    return state
  }

  public func nextGenerationCell(numberOfLivingNeighbors: Int) -> Cell {

    return Cell(alive: (numberOfLivingNeighbors == 2 && isAlive) || numberOfLivingNeighbors == 3)
  }
}