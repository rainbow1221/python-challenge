import os
import csv

total_month=0
total_amount=[]
total_amount_1 =0
change_profit =[]
month=[]

csvpath=os.path.join('/Users/asun/Home_work/python-challenge/PyBank/Budget_data.csv')

with open(csvpath) as csvfile:
    csvreader=csv.reader(csvfile,delimiter=',')
    csv_header=next(csvreader)

    for row in csvreader:
    
        month.append(row[0])

        total_month = total_month + 1
        total_amount.append(int(row[1]))
        #print(f"{total_amount}")

    for i in range(len(total_amount) -1):
        change_profit.append(total_amount[i+1] - total_amount[i])

max_increase=max(change_profit)
max_increase_index=change_profit.index(max(change_profit))+ 1
max_decrease=min(change_profit)
max_decrease_index=change_profit.index(min(change_profit))+1
Ave_Change= round(sum(change_profit)/len(change_profit))

print("Financial Analysis")
print("---------------------------------------------------------------------------")
print(f"Total Months:  {total_month}") 
print(f"Total Profit/Losses:    ${sum(total_amount)}")
print(f"Average change:  {Ave_Change}")
print(f"Greast Increase In Profit:  {month[max_increase_index]} (${max_increase})")
print(f"Greast Decrease in Profit:  {month[max_decrease_index]} (${max_decrease})")
