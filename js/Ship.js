function checkCollision(invaderBulletObj){
    var x_ = invaderBulletObj.x;
    var y_ = invaderBulletObj.y;

    if(x_ >= x && x_ <= x+32){
        if(y_ + 9 >= y && y_<= y+32){            
            invaderBulletObj.destroy();
            gameState.shipDestroyed();
        }
    }
}