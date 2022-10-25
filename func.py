print("Functions are a way to reuse code")

#write a function to get the details of human 
def get_human_details():
    name=input("Enter your name  ")
    age=int(input("Enter the age  "))
    profession=input("Enter the profession  ")
    phone_no=int(input("Enter the phone number  "))
    email=input("Enter the email")
    location=input("Enter the location")
    return name,age,profession,phone_no,email,location
#call the function
name,age,profession,phone_no,email,location=get_human_details()
print("The name of the human is",name)
print("The age of the human is",age)
print("The profession of the human is",profession)
print("The phone number of the human is",phone_no)
print("The email of the human is",email)
print("The location of the human is",location)