import QtQuick 2.9
import QtQuick.Controls 1.5

import "../js/Invaders.js" as InvadersLogic
import "../js/Utils.js" as Utils

Item{

    id: root

    signal checkInvadersCollision(variant bulletObject)

    property var invadersArr: []
    property int invadersCount: 30
    property alias shootTimerRuning: shootTimer.running
    
    property alias moveTimerRuning: moveTimer.running
    property alias moveTimerInterval: moveTimer.interval

    Timer {
        id: moveTimer
        interval: 40; running: true; repeat: true
        onTriggered:  InvadersLogic.move()        
    }

    Timer {
        id: shootTimer
        interval: 600
        running: false
        repeat: true
        onTriggered: Utils.invadersAttack()
     }

    onCheckInvadersCollision: InvadersLogic.checkCollisions(bulletObject)
    
    Component.onCompleted: {
        shootTimer.running = false
        moveTimer.running = false
    }

    Component.onDestruction:{
        Utils.destroyInvaders();
    }
}