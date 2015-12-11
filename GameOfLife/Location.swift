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
