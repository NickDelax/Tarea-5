import UIKit

class GameBoard {
    var limit: Int
    var queens = [Queen]()
    init(limit: Int) {
        self.limit = limit
    }
    func PositionCheck (atRow row: Int, col: Int) -> Bool { // Checa la posicion
        for queen in queens {
            if queen.row == row { return false }
            if queen.col == col { return false }
            if abs(queen.row-row) == abs(queen.col-col) { return false }
        }
        return true
    }
    func QueenSearch(atRow row: Int) {
        if queens.count < limit {
            for col in 0...limit-1 {
                if PositionCheck(atRow: row, col: col) {
                    let queen = Queen(row: row, col: col)
                    queens.append(queen)
                    QueenSearch(atRow: row+1)
                    if queens.count == limit {
                        print(output())
                    }
                    queens.removeLast()
                }
            }
        }
    }
    func Jugar() {
    QueenSearch(atRow: 0) //inicio del juego
    }
    func output() -> String {
        var s = ""
        for q in queens {
            s += "(\(q.row),\(q.col))"
        }
        return s
    }
}
struct Queen {
    var row: Int
    var col: Int
}
let b = GameBoard(limit: 4)
b.Jugar()

