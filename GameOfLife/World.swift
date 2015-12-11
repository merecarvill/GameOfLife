public class World {
  let livingLocations: [Location]

  public init(livingLocations: [Location] = []) {
    self.livingLocations = livingLocations
  }

  public func advanceGeneration() -> World {
    let potentiallyLivingLocations = livingLocations.flatMap({ $0.neighbors })
    let nextGenerationCells = potentiallyLivingLocations.filter(aliveInNextGeneration)
    return World(livingLocations: nextGenerationCells)
  }

  public func aliveInNextGeneration(location: Location) -> Bool {
    let numNeighbors = numberOfLiveNeighbors(location)
    return (numNeighbors == 2 && aliveAt(location)) || numNeighbors == 3
  }

  public func aliveAt(location: Location) -> Bool {
    return livingLocations.contains(location)
  }

  private func numberOfLiveNeighbors(location: Location) -> Int {
    return location.neighbors.filter({ aliveAt($0) }).count
  }

}
