var count = 0;
var maxCount = 40;
var direction = true;
var dy = 5;

function move(){
    if(count == maxCount){
        count = 0;
        direction = !direction;
    }
    else{
        count+=1;
    }

    for(var i = 0; i < invadersArr.length; i++){
        for(var j = 0; j < invadersArr[i].length; j++){
            if(invadersArr[i][j]){
                if(count == maxCount){
                    if(invadersArr[i][j].y+dy+32 >= appWindow.height){
                        gameState.invasionHappened();
                    }
                    else{
                        invadersArr[i][j].y+=dy;        
                    }
                }
                            
                if(direction){
                    invadersArr[i][j].x+=1;        
                
                }
                else{
                    invadersArr[i][j].x-=1;                     
                }
        }
       }
   }
}


function checkCollisions(bulletObject){
    for (var i = 0; i < invadersArr.length; i++) {
        for (var j = 0; j < invadersArr[i].length; j++) {
            if(invadersArr[i][j]){
                var x = invadersArr[i][j].x;
                var y = invadersArr[i][j].y;
                var x_ = bulletObject.x;
                var y_ = bulletObject.y;

                if (y_ < y + 32 && y_ >= y) {
                    if (x_ >= x && x_ <= x + 32) {
                        invadersArr[i][j].destroy();
                        --invadersCount;                        
                        invadersArr[i][j] = null;
                        bulletObject.destroyBullet(true);
                    }
                }
            }
        }
    }
    
    if(invadersCount === 0){        
        gameState.gameEnded();                  
    }
}