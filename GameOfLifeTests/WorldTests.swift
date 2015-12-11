import Quick
import Nimble
import GameOfLife

class WorldTests: QuickSpec {
  override func spec() {

    describe("aliveAt") {
      it("returns false when there is not a live cell at given location") {
        let location = Location(coordinates: (0, 0))

        expect(World().aliveAt(location)).to(beFalse())
      }

      it("returns true when there is a live cell at given location") {
        let location = Location(coordinates: (0, 0))
        let livingLocations = [location]

        expect(World(livingLocations: livingLocations).aliveAt(location)).to(beTrue())
      }
    }

    describe("advanceGeneration") {
      it("returns a new world") {
        let world = World()

        expect(world.advanceGeneration()).notTo(beIdenticalTo(world))
      }

      it("returns a world in which a live cell with less than 2 live neighbors is now dead") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0))
        ]
        let noNeighborsWorld = World(livingLocations: [targetLocation])
        let oneNeighborWorld = World(livingLocations: [targetLocation] + neighbors)

        expect(noNeighborsWorld.advanceGeneration().aliveAt(targetLocation)).to(beFalse())
        expect(oneNeighborWorld.advanceGeneration().aliveAt(targetLocation)).to(beFalse())
      }

      it("returns a world in which a live cell with 2 live neighbors is still alive") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 1))
        ]
        let twoNeighborsWorld = World(livingLocations: [targetLocation] + neighbors)

        expect(twoNeighborsWorld.advanceGeneration().aliveAt(targetLocation)).to(beTrue())
      }

      it("returns a world in which a live cell with 3 live neighbors is still alive") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 1)),
          Location(coordinates: (0, 2))
        ]
        let threeNeighborsWorld = World(livingLocations: [targetLocation] + neighbors)

        expect(threeNeighborsWorld.advanceGeneration().aliveAt(targetLocation)).to(beTrue())
      }

      it("returns a world in which a live cell with more than 3 live neighbors is now dead") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 1)),
          Location(coordinates: (0, 2)),
          Location(coordinates: (1, 2))
        ]
        let fourNeighborsWorld = World(livingLocations: [targetLocation] + neighbors)

        expect(fourNeighborsWorld.advanceGeneration().aliveAt(targetLocation)).to(beFalse())
      }

      it("returns a world in which a dead cell with fewer than 3 live neighbors is still dead") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 2))
        ]
        let world = World(livingLocations: neighbors)

        expect(world.advanceGeneration().aliveAt(targetLocation)).to(beFalse())
      }

      it("returns a world in which a dead cell with exactly 3 live neighbors is now alive") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 2)),
          Location(coordinates: (2, 2))
        ]
        let world = World(livingLocations: neighbors)

        expect(world.advanceGeneration().aliveAt(targetLocation)).to(beTrue())
      }

      it("returns a world in which a dead cell with more than 3 live neighbors is still dead") {
        let targetLocation = Location(coordinates: (1, 1))
        let neighbors = [
          Location(coordinates: (0, 0)),
          Location(coordinates: (0, 2)),
          Location(coordinates: (2, 2)),
          Location(coordinates: (2, 0))
        ]
        let world = World(livingLocations: neighbors)

        expect(world.advanceGeneration().aliveAt(targetLocation)).to(beFalse())
      }
    }
  }
}
