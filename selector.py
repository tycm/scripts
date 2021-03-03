import random

f = (open('employees.txt'))
hold = f.read().splitlines()
employees = hold[1:]
numEmployees = int(hold[0])

if numEmployees > (len(employees)):
    print(f"Trying to choose {numEmployees} when only {len(employees)} to choose from")
else:
    print(random.sample(employees,numEmployees))

input("Press enter to close")