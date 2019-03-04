import pandas as pd


vote_summary_table=[]
total_vote=0.0
candi1_count=0.0
candi2_count=0.0
candi3_count=0.0
candi4_count=0.0

#csvpath=os.path.join("..", "PyBank","Resources","")

df=pd.read_csv("/Users/asun/Home_work/python-challenge/PyPoll/election_data.csv")
df=df.groupby(['Candidate']).count()
#vote_summary_table =df.drop(['County'], axis=1)
df=df.rename(columns={'Voter ID': 'Counts'})
#vote_summary_table=vote_summary_table.rename(columns={vote_summary_table.columns[0]:"Candidates"})
df=df.sort_values('Counts',ascending=False)
#df1=pd.DATAFRAM(columns='Candidates','Counts')
#df1=df1['Candidate1'].append('Khan1')
#df1=df1['Candidates'].append('Correy')
#df1=df1['Candidates'].append('Li')
#df1=df1['Candidates'].append("O'Tooley")
#print(df)

total_vote=df['Counts'].sum()
#candi1_count=vote_summary_table.loc[vote_summary_table.Candidate=='Khan','Counts']
#print(str(total_vote))
candi1_count=df['Counts'].iloc[0]
candi2_count=df['Counts'].iloc[1]
candi3_count=df['Counts'].iloc[2]
candi4_count=df['Counts'].iloc[3]
winner='Khan'
#print(str(candi1_count))
#print(str(candi2_count))
#print(str(candi3_count))
#Liprint(str(candi4_count))

print('Election Results')
print('--------------------')
print('Total Votes:  ' + str(total_vote))
print(f'Khan: {round(candi1_count/total_vote *100)}''%' + '  ' +  (str(candi1_count)))
print(f'Correy: {round(candi2_count/total_vote *100)}''%' + '  ' +  (str(candi2_count)))
print(f'Li: {round(candi3_count/total_vote *100)}''%' + '  ' +  str(candi3_count))
print(f"O'Tooley: {round(candi4_count/total_vote *100)}"'%' + '  ' +  str(candi4_count))
print('-------------------------')
print(f'winner:  {winner}')
