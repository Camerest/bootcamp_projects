https://replit.com/@annoptechajongc/Batch06ChatbotPizza#main.r


fri_shine <- "1.Brista Pizza,2. KFC"

pizza_id <- c(1,2,3)
pizza_menu <- c("Peperoni" ,"Double Cheese","Chicken Sausage")
Menu <- data.frame(pizza_id,pizza_menu)

size_piz <- c("S","M","L")
size_price <- c(150,200,290)
size <- data.frame(size_piz,size_price)

drink_menu <- c("Coke","Splite","Punch")
drink_price <- c(45,30,25)
drinks <- data.frame(drink_menu,drink_price)

dipping_menu <- c("Tomato","Mayonnaise","Cheese")
dippings <- data.frame(dipping_menu)


print("Welcome to our App :p")

print("Hello There! ")

#question 01
print ("What is your name ?")
user_name <- readLines("stdin",n=1)
print(paste("Hi",user_name))

#question 02
print("What would your want to order today ")
print(fri_shine)
action <- readLines("stdin",n=1)
if (action == 1){
  print("Choose your topping ")
  print(Menu)
topping <- readLines("stdin",n=1)
  #Peperoni
  if (topping == 1) {
    topping <- "Peperoni Pizza"
    print("Your topping is Peperoni")
  }
  #Double Cheese
  else if (topping ==2) {
    topping <- "Double Cheese Pizza"
    print("Your topping is Double Cheesey")
  }
  #Chicken Sausage
  else if (topping == 3) {
  topping <- "Chicken Sausage Pizza"
  print ("Your topping is Chicken Sausage")
  }
  #Need to order KFC
} else {
  print("Please call at the number 1777,thank you :)")  
  quit()
}
#question 03  Size [S,M,L]
print("What size you want ?")
print(size)
order1 <- readLines("stdin", n=1)
  if (order1 == 1) {
  print("You choose S Size.")
  total_price1 <- size_price[1]
  } else if (order1 == 2) {
  print("You choose M Size.")
  total_price1 <- size_price[2]
  } else if (order1 == 3) {
  print("You choose L Size.")
  total_price1 <- size_price[3]
  } else {
    print("Please Try run Again")
  } 
#question 04 Quantity
print("-----------------------------")  
  print(paste("How many you want", topping))
  amount <- readLines("stdin", n=1) 
  jointotal1 <- (total_price1 * as.numeric(amount))
  print(paste("Total price:", jointotal1))


#question 05 drink
print ("Would you want some drink ?")
print (drinks)
drink <- readLines("stdin",n=1)
  if(drink ==1) {
  print ("Your coke is selected")
  drink <- "coke"
  total_price2 <- drink_price[1]
  } else if(drink ==2) {
  print ("Your splite is selected")
  drink <- "splite"
  total_price2 <- drink_price[2]
  } else if(drink ==3) {
  print ("Your punch is selected")
  drink <- "punch"
  total_price2 <- drink_price[3]
  } else {
    print("Please Try run Again")
  }
  

#question 05 Quantity

print("-----------------------------")  
  print(paste("How many you want", drink))
  amount2 <- readLines("stdin", n=1) 
  jointotal2 <- (total_price2 * as.numeric(amount))
  print(paste("Total price:", jointotal2))

#question 06 dipping

  print("Which your dipping sorce ?")
  print(dippings)
dipping <- readLines("stdin",n=1)
  if (dipping == 1) {
  print("Your sorce is selected")
  dipping <- "Tomato Dipping sorce"
  } else if (dipping == 2) {
  print("Your sorce is selected")
  dipping <- "Mayonnaise Dipping sorce"
  } else if ( dipping == 3) {
  print("Your sorce is selected")
  dipping <- "Cheese Dipping sorce"
  } else {
    print("Please Try run Again")
  } 
#question 07 Repeat order
#Data Repeat menu
amt_pizza <- jointotal1
amt_drink <- jointotal2
repeat_menu <- 
data.frame(topping,amt_pizza,drink,amt_drink)
repeat_price <- (jointotal1 + jointotal2)

  print("-----------------------------")
  print("This is your total order.")
  print(repeat_menu)
  print(paste("Total price:",repeat_price,"$"))
  print("-----------------------------")

  print("Your order is correct ?")
  print ("Y,N")
repeat_order <- readLines("stdin",n=1)
  if (repeat_order == "Y") {
  print("Please select your Payment Method")
  } else {
  print("Please Select your order again !)")  
  quit()
  } 
#question 08 Payment 
print("1.Cash, 2.Promptpay , 3.Credit Card ")
  payment <- readLines("stdin", n = 1)
    if (payment == "1"){
    payment <- "Cash "
    } else if (payment == "2"){
    payment <- "Promptpay"
    } else if (payment == "3"){
    payment <- "Credit Card"
    } else {
    print("Please Try run Again")
  } 

#quesiton 09 
#check score if < 3  required comment from customer
print("Please rate: 1-5, 1 is very bad, 5 is very good:")
comm <- readLines("stdin", n=1)
  if (comm < 3) {
  print("Please Enter your comment:")
  comment_chatbot <-  readLines("stdin", n=1)
  print("Your comment is received, Thanks") 
  } else {
    quit()
  }
