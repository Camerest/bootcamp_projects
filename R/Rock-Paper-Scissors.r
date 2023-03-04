https://replit.com/@annoptechajongc/RHomeworkPaoYingChub#main.r


cat ("< Welcome to Pao Ying Chub Game > \n")
cat ("## Please entry your name ## \n")
name <- readLines("stdin", n=1)
print(paste("Hi,", name))
print("Welcome to my game ")

cat ("The rule is : \n", 
     "1. Stone    >   Scissors \n" , 
     "2. Scissors >   Paper \n", 
     "3. Paper    >   Stone  \n",
     ".......Let's get started!....... \n")

#player
u_weapons <- c("Stone", "Scissors", "Paper")
win <- 0
lose <- 0
draw <- 0
play <- 1
while(play) {
  while(1) {
    print("What's your weapon?")
    print("[1] Stone [2] Scissors [3] Paper")
    u_choose <- readLines("stdin", n=1)
        if(u_choose == "1"){
            print("You: Stone")
            break
        } else if(u_choose == "2"){
            print("You: Scissors")
            break
        } else if(u_choose == "3"){
            print("You: Paper")
            break
        } else{
            print("Please select your weapon.")
        }
    }

#bot
  bot <- c(u_weapons)
    b_choose <- sample(bot, 1)
    print(paste("Bot: ", b_choose))
    if(u_weapons[as.numeric(u_choose)] == "Stone") {
      if(b_choose == "Scissors"){
        win <- win +1
        print("Win")
    } else if(b_choose == "Paper"){
        lose <- lose + 1
        print("Lose")
    } else{
        draw <- draw + 1
        print("Draw")
    }
    } else if(u_weapons[as.numeric(u_choose)] == "Scissors"){
        if(b_choose == "Paper"){
            win <- win + 1
            print("Win")
        } else if(b_choose == "Stone"){
            lose <- lose + 1
            print("Lose")
        } else{
            draw <- draw + 1
            print("Draw")
        }
    } else {
        if(b_choose == "Stone"){
            win <- win + 1
            print("Win")
        } else if(b_choose == "Scissors"){
             lose <- lose + 1
            print("Lose")
        } else{
        draw <- draw + 1
        print("Draw")
        }
    }

  print("Do you want to Continue ?")
  print("[1] Yes [2] No")
  u_ans <- readLines("stdin", n=1)
  if(u_ans == "1"){
    print("Let's play again !!")
  } else if(u_ans == "2"){
    print(paste("Congrate",name, "your scored Is !! "))
    break
  } else {
    print("Please select the choice.")
  }
}

print(paste("Played: ", win+lose+draw))
print(paste("Win: ", win))
print(paste("Lose: ", lose))
print(paste("Draw: ", draw))
