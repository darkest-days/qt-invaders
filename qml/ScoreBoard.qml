import QtQuick 2.9
import QtQuick.Controls 1.5

Item{
  id: root    
  
  property int score: 0;
  
  signal invaderKilled();

  FontLoader { id: customFont; source: "qrc:fonts/LcdSolid-VPzB.ttf" }

    Text{
      color:"#FFFFFF"
      font.pointSize:20
      font.family: customFont.name
      text: "score "+score
    }

  onInvaderKilled:{   
      score+=100;
  }

}