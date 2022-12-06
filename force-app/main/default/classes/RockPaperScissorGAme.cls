public class RockPaperScissorGAme {
    public void gameStarted(String player1, String player2){
        if(player1 == player2){
            system.debug('Tie');
        } else{
            switch on player1{
            when 'rock'{
                if(player2=='scissor'){
                    System.debug('Player 1 wins');
                }else{
                    System.debug('Player 2 wins');
                }
            }
            when 'paper'{
                if(player2 == 'rock'){
                    System.debug('Player 1 wins');
                } else{
                    System.debug('Player 2 wins');
                }
            }
            when 'scissor'{
                if (player2 == 'paper'){
                   System.debug('player 1 wins');
                }else{
                    System.debug('Player 2 wins');
                }
            }
        }
            
        }
        
       
    }

}