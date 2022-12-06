({
    doInit : function(component, event, helper) {
     //basing upon mode number of columns are set
     let gameMode = component.get("v.mode");
     let col =0;
     if(gameMode&&gameMode==='hard'){
            col = 6;
     }else if(gameMode&&gameMode==='medium'){
            col = 4;}
        else{
            col = 3;
        }
        //block  width size is being calculated and set to the attribute.
        let blockSize = 12/col;
        component.set("v.blockSize",blockSize);
        //getting the number of words to be displayed
        let words= helper.getWords(col*col);
        //getting the winning word
     let winWord = helper.getWinWord(words);
       // setting the list of words to be displayed
     component.set("v.words", words);
      //setting the winning word to the attribute
     component.set("v.winWord", winWord);
     helper.resetBoard(component);
     
    },
    // doRender: function(component, event, helper) {
    //     alert("Hii From render");
    // }
    blockClickHandler: function(component, event, helper) {
        let moveLeft = component.get("v.movesLeft")+1;
    const value = event.getParam("value");
    if(value===component.get("v.winWord")){
        //win logic
        component.set("v.result", "You Won");
      //  console.log("You Won");
        helper.disableBoard(component);
        //firing application event to display the result
     helper.fireResultEvent("Win");
    }else if(moveLeft===3){
        //lose logic
        component.set("v.result", "You Lost");
        //console.log("You Lost");
        helper.disableBoard(component);
        //firing application event to display the result
     helper.fireResultEvent("Lose");
    }
    component.set("v.movesLeft", moveLeft);
    },
    reshuffleBoard: function(component, event, helper) {
        const words = component.get("v.words");
        const randomizeWords = helper.randomizeArray(words);
        component.set("v.words", randomizeWords);
        helper.resetBoard(component); 
    }
})