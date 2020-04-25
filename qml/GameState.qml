import QtQuick 2.9
import QtQuick.Controls 1.5

import "../js/Utils.js" as Utils

Item{
    id: root
    x: parent.width/2
    y: parent.height/2

    signal gameEnded()
    signal shipDestroyed()
    signal invasionHappened()

    property var buttonObject: null

    onGameEnded:{
        Utils.destroyInvaders();
        Utils.gameEnded();
    }

    onShipDestroyed:{
        invaders.shootTimerRuning = false;
        invaders.moveTimerInterval = 5;
        Utils.hideShip();
        Utils.gameEnded();
    }   
    onInvasionHappened:{
        Utils.destroyInvaders();
        Utils.gameEnded();
    }

    Component.onCompleted:{
        buttonObject = Utils.createButton()
        buttonObject.buttonClicked.connect(function(arg){            
            if(arg === "START"){            
                Utils.startGame();
            }
            else if(arg === "AGAIN?"){
                Utils.reStartGame();
            }
        });
    }
}