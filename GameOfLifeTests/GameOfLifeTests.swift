import Quick
import Nimble
import GameOfLife

class GridTests: QuickSpec {
  override func spec() {
    describe("isAliveAt") {
      it("") {
        expect(Grid(livingCellLocations: []).isAliveAt([0, 0])).to(beFalse())
      }
    }
  }
}

class CellTests: QuickSpec {
  override func spec() {
    describe("Cell") {
      describe("isAlive") {
        it("returns true when it is alive") {
          expect(Cell(alive: true).isAlive).to(beTrue())
        }

        it("returns false when it is not alive") {
          expect(Cell(alive: false).isAlive).to(beFalse())
        }
      }

      describe("nextGenerationCell") {
        it("returns a new cell") {
          let cell = Cell(alive: true)
          let numberOfLivingNeighbors = 0

          expect(cell.nextGenerationCell(numberOfLivingNeighbors)).notTo(beIdenticalTo(cell))
        }

        it("returns a cell that is not alive if it has less than 2 living neighbors") {
          let cell = Cell(alive: true)
          let numberOfLivingNeighbors = 1

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beFalse())
        }

        it("returns a cell that is alive if an alive cell has 2 alive neighbors"){
          let cell = Cell(alive: true)
          let numberOfLivingNeighbors = 2

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beTrue())
        }

        it("returns a cell that is alive if an alive cell has 3 alive neighbors"){
          let cell = Cell(alive: true)
          let numberOfLivingNeighbors = 3

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beTrue())
        }

        it("returns a cell that is not alive if it has more than 3 living neighbors") {
          let cell = Cell(alive: true)
          let numberOfLivingNeighbors = 4

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beFalse())
        }

        it("returns a cell that is alive if a dead cell has 3 alive neighbors"){
          let cell = Cell(alive: false)
          let numberOfLivingNeighbors = 3

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beTrue())
        }

        it("returns a cell that is dead if a dead cell has less than 3 alive neighbors"){
          let cell = Cell(alive: false)
          let numberOfLivingNeighbors = 2

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beFalse())
        }

        it("returns a cell that is dead if a dead cell has more than 3 alive neighbors"){
          let cell = Cell(alive: false)
          let numberOfLivingNeighbors = 4

          expect(cell.nextGenerationCell(numberOfLivingNeighbors).isAlive).to(beFalse())
        }

      }
    }
  }
}