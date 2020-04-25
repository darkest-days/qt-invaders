import QtQuick 2.9
import QtQuick.Controls 1.5

import "../js/Ship.js" as ShipLogic
import "../js/Utils.js" as Utils

Item {
        id: root
        focus: true
        x: parent.width / 2 - 32
        y: parent.height - 64

        property var bulletObject: null
        
        signal checkShipCollision(variant invaderBulletObj)

        Image {
            id: img
            height: 32
            width: 32            
            source: "qrc:images/Ship.png"            
        }

        Keys.onPressed: {
            if (event.key === Qt.Key_Left) {
                if (root.x - 16 >= 0) {
                    root.x -= 10
                }
            } 
            else if (event.key === Qt.Key_Right) {
                if (root.x + 48  <= parent.width) {
                    root.x += 10
                }
            }
            else if (event.key === Qt.Key_Space) {
                if(bulletObject === null){
                    bulletObject = Utils.createShipBullet(root.x, root)
                    if(invaders){
                        bulletObject.bulletMoved.connect(function() {
                            invaders.checkInvadersCollision(bulletObject)
                        })
                    }
                    bulletObject.bulletDestroyed.connect(function (kill) {
                        if(kill)  scoreBoard.invaderKilled()
                    })
                }
            }
        }

        onCheckShipCollision:{
            ShipLogic.checkCollision(invaderBulletObj)
        }
        
        Component.onCompleted:{
            root.visible = false;
            Keys.enabled = false;
        }
        
        Component.onDestruction:{
            if(bulletObject)
                bulletObject.destroyBullet(false);
        }
    }