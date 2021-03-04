# This script expects a text document titled 'employees.txt' to work.
# It should be formatted as follows
# The first line is the number of employees that you would like to select. Please keep this as a number with no extra characters on this line.
# Every subsequent line is an employee, please only use letters, as I am not sure how it will react to different characters.
"""
2
Employee One
Employee Two
Employee Three
"""


import random

with open('employees.txt') as f:
    hold = f.read().splitlines()
    employees = hold[1:]
    numEmployees = int(hold[0])

    if numEmployees > (len(employees)):
        print(f"Trying to choose {numEmployees} when only {len(employees)} to choose from")
    else:
        print(random.sample(employees,numEmployees))

    input("Press enter to close")