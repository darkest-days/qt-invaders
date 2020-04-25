import QtQuick 2.9
import QtQuick.Controls 1.5

Item{
    id: root

    property string text: "START"

    signal buttonClicked(string arg);

    
    FontLoader { id: customFont; source: "qrc:fonts/LcdSolid-VPzB.ttf" }
        
    Text{
        id: message
        y: root.y - message.contentHeight/2
        x: root.x - message.contentWidth/2
        color: "#00FF00"
        font.family: customFont.name
        font.pointSize: 64
        text: root.text
    }
 
    MouseArea {
        anchors.fill: message
        hoverEnabled: true    
        onClicked: { buttonClicked(text) }
        onEntered: { message.color = "#FF0000" }
        onExited:  { message.color = "#00FF00" }
    }
}