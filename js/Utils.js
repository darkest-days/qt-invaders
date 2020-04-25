function createCustomObject(namePath,args,parent){
    
    var component = Qt.createComponent(namePath,Component.PreferSynchronous)//,root);

    if (component.status == Component.Ready) {
        var obj = component.createObject(appWindow, args);
        if (obj !== null) {
            return obj;
        }
        else{            
            // Error Handling
            console.log("Error creating object: {}",namePath);
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
    
    return null;
}

/*Ship*/

function createShipBullet(x,parent){
    
    return createCustomObject("../qml/Bullet.qml", {"x": x + 16,"y":574-32-16,"direction": -1,"interval":1}, parent);
}

function hideShip(){
    ship.visible = false;
    ship.Keys.enabled = false;
}


/*Invaders */

function createInvaderBullet(x,y,parent){
    return createCustomObject("../qml/Bullet.qml", {"x": x + 16,"y":y+20,"direction": 1}, parent);    
}


function invadersAttack(){
    var bottomRow = invadersArr[invadersArr.length - 1]
    if (bottomRow) {
        var rand = Math.floor(Math.random()*(10))
        
            for(var i = invadersArr.length - 1; i >= 0; --i){
                var temp = invadersArr[i][rand]
                if(temp !== undefined && temp !== null){
                    var invaderBulletObj = createInvaderBullet(temp.x,temp.y);                            
                    invaderBulletObj.bulletMoved.connect(function () {
                        if(ship !== null)
                            ship.checkShipCollision(invaderBulletObj)
                    })        
                    break;
                }
            }
    }
}


function createInvader(i,j){    
    return createCustomObject("../qml/Invader.qml",{x:j*48+32,y:48*i+32})   
}


function createInvaders(){            
    var invadersArr = [];
    for(var i = 0; i < 3; i++){
        invadersArr.push([]);
        for(var j = 0; j < 10; j++){
            invadersArr[i].push(
                createInvader(i,j)
            );
        }
    }
    return invadersArr;
}

function destroyInvaders(){
    for(var i = 0; i < invaders.invadersArr.length; ++i){
        for(var j = 0; j < invaders.invadersArr[i].length;++j){
            if(invaders.invadersArr[i][j] !== null){
                invaders.invadersArr[i][j].destroy();
            }
        }
    }
    invaders.invadersArr = [];
}

/* GameState */


function startGame(){
    
    invaders.invadersArr = Utils.createInvaders();
    invaders.invadersCount = 30;
    invaders.shootTimerRuning = true;
    invaders.moveTimerRuning = true;

    ship.visible = true;
    ship.Keys.enabled = true;
    buttonObject.visible = false;
}

function reStartGame(){

    Utils.destroyInvaders();
    ship.x = appWindow.width/2-32
    invaders.moveTimerInterval = 40;
    startGame();
}

function gameEnded(){
    buttonObject.text  = "AGAIN?"
    buttonObject.visible = true;
}

function createButton(x,y,parent){
    return Utils.createCustomObject("../qml/OverlayMessage.qml",{"x":appWindow.width/4,"y":appWindow.width/4,"z":1},"invaders");      
}