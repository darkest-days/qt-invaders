import QtQuick 2.9
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4

ApplicationWindow {

    id: "appWindow"
    width: 542
    height: 574
    title: "qt-invaders"
    color: "#ffffff"
    style: ApplicationWindowStyle {
        background: Rectangle {
            color: "#000000"
        }
    }

    Invaders {
        id: invaders               
    }

    Ship {
        id: ship
    }

    ScoreBoard {
        id: scoreBoard
    }
    
    GameState {
        id: gameState    
    }
}
