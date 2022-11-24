
import random
import time
def fish_riddle():
    fish_dict = {1: "I Always eat other fishes who am i ?",
                 2: "I the blackest fish in world who am i ?",
                 3: "I the biggest Fish in the world. ?"}
    rand = random.randint(1, 3)
    print("============RIDDLE===============")
    print(f"{fish_dict.get(rand)} Who am I?")
    fish_menu()

    riddle_answer = int(input("ANSWER: "))

    while True:
        if riddle_answer not in [1, 2, 3]:
            error_display()
            riddle_answer = int(input("ENTER ANSWER(1 OR 2 OR 3): "))

        if rand == riddle_answer:
            print("Congratulations You Got it Right!!!")
            break
        else:
            error_display()
            riddle_answer = int(input("ENTER ANSWER(1 OR 2 OR 3): "))
            for i in range(3):
                print("You have",3-i,"chances left")
                riddle_answer = int(input("ENTER ANSWER(1 OR 2 OR 3): "))
                if rand == riddle_answer:
                    print("Congratulations You Got it Right!!!")
                    break
                else:
                    error_display()
                    riddle_answer = int(input("ENTER ANSWER(1 OR 2 OR 3): "))
                    if i==2:
                        print("You have no more chances left")
                        break
# displays a menu of fish type
def fish_menu():
    print("\t\t1:Shark Fish")
    print("\t\t2:Mad Fish")
    print("\t\t3:Whale")
#  displays the Try Again message
def error_display():
    print("=====================")
    print("PLEASE TRY AGAIN")
    print("=====================")\
#  displays the game over message  
    
def level1():
    print()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("\t\t\t Level One")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print()
    name = input("What is your name?: ")
    if name == "" or name == " ":
        error_display()
        name = input("What is your name?: ")
    print("Hello", name, "Welcome to the Fish Tale Game")

    print()

    print(f"Hello {name}  I have a riddle for you.")
    time.sleep(2)
    fish_riddle()
if __name__ == "__main__":
    level1()
    