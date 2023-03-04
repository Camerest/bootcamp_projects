# baisc build class in Python

class atm :
    
    def __init__(self, name, balance, pin) :
        self.name = name
        self.balance = balance
        self.pin = int(pin)

    def check_balance(self) :
        print(f"Your name : {self.name}\nYour balance : {self.balance}")
       
    def deposit(self, deposit_amount) :
        self.balance += deposit_amount
    
    def withdraw(self, withdraw_amount) :
        self.balance -= withdraw_amount
        
    def change_name(self, new_name):
        self.name = new_name
        print(f"Your new name : {new_name}")
        
    def change_pin(self, new_pin):
        self.pin = new_pin
        print(f"Your new pin : {new_pin}")
# -----------------------
atm1 = atm("turk",1000, 2222)
print(atm1.name, atm1.balance, atm1.pin)

atm1.change_name("Kiddy")

atm1.change_pin(1234)

atm1.deposit(500)

atm1.withdraw(200)

atm1.check_balance()
