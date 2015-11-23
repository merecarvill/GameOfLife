//  Any live cell with fewer than two live neighbours dies, as if caused by under-population.
//  Any live cell with two or three live neighbours lives on to the next generation.
//  Any live cell with more than three live neighbours dies, as if by over-population.
//  Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

public class Location: Equatable, Hashable {
  public let row: Int
  public let col: Int

  public init(coordinates: (Int, Int)) {
    self.row = coordinates.0
    self.col = coordinates.1
  }

  public var hashValue: Int {
    return row.hashValue ^ col.hashValue
  }

  public var neighbors: [Location] {
    return [
      (row - 1, col), (row + 1, col),
      (row, col - 1), (row, col + 1),
      (row + 1, col + 1), (row - 1, col - 1),
      (row + 1, col - 1), (row - 1, col + 1)
      ].map({ Location(coordinates: $0) })
  }
}

public func ==(lhs: Location, rhs: Location) -> Bool {
  return lhs.row == rhs.row && lhs.col == rhs.col
}

public class World {
  let livingLocations: [Location]

  public init(livingLocations: [Location] = []) {
    self.livingLocations = livingLocations
  }

  public func advanceGeneration() -> World {
    let potentiallyLivingLocations = self.livingLocations + livingLocations.flatMap({ $0.neighbors })
    let nextLivingCells = potentiallyLivingLocations.filter { location in
      if numberOfLiveNeighbors(location) == 2 {
        return aliveAt(location)
      } else {
        return numberOfLiveNeighbors(location) == 3
      }
    }
    return World(livingLocations: nextLivingCells)
  }

  public func aliveAt(location: Location) -> Bool {
    return livingLocations.contains(location)
  }

  private func numberOfLiveNeighbors(location: Location) -> Int {
    return location.neighbors.filter({ aliveAt($0) }).count
  }

}