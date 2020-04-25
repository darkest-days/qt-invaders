import QtQuick 2.9
import QtQuick.Controls 1.5
Item{
        id: bullet;
        property int direction : 1;
        property alias interval: moveTimer.interval
     
        signal bulletMoved();        
        signal bulletDestroyed(bool kill);        
        
        Rectangle {
            // id: bulletRect
            width: 2;
            height: 12;
            color: "#FFFFFF";                                             
        }

        function destroyBullet(arg){
            bullet.bulletDestroyed(arg);            
            bullet.destroy();
        }
        
        Timer{
            id:moveTimer

            interval: 10; running: true; repeat: true
            onTriggered: {
                            
                if(bullet.y >= 0 && bullet.y < 542){
                    bullet.bulletMoved();
                    bullet.y+= direction*2;                     
                }
                else{
                    destroyBullet(false);
                }
            }               
        }
}       