import Quick
import Nimble
import GameOfLife

class LocationTests: QuickSpec {
  override func spec() {
    describe("==") {
      it("returns true when compared locations have the same coordinates") {
        let location1 = Location(coordinates: (0, 0))
        let location2 = Location(coordinates: (0, 0))

        expect(location1).to(equal(location2))
      }

      it("returns false when compared locations do not have the same coordinates") {
        let location1 = Location(coordinates: (0, 0))
        let location2 = Location(coordinates: (0, 1))

        expect(location1).notTo(equal(location2))
      }
    }

    describe("neighbors") {
      it("returns 8 locations") {
        let location = Location(coordinates: (0, 0))

        expect(location.neighbors.count).to(equal(8))
      }

      it("returns locations with distinct coordinates") {
        let location = Location(coordinates: (0, 0))
        let uniqueNeighbors = Array(Set(location.neighbors))

        expect(location.neighbors).to(allPass({ uniqueNeighbors.contains($0!) }))
      }

      it("returns locations within 1 coordinate of target location") {
        let location = Location(coordinates: (0, 0))

        for neighbor in location.neighbors {
          expect(neighbor.row).to(beCloseTo(location.row, within: 1.00001))
          expect(neighbor.col).to(beCloseTo(location.col, within: 1.00001))
        }
      }
    }
  }
}
