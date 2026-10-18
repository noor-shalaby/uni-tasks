import pandas as pd

data = {
    'Name': ['Edward', 'Alphonse', 'Winry', 'Roy', 'Riza'],
    'Age': [16, 15, 16, 30, 28],
    'Score': [49, 70, 92, 80, 95]
}

df = pd.DataFrame(data)
df['Pass/Fail'] = ['Pass' if score > 50 else 'Fail' for score in df['Score']]
print(df)

average_score = df['Score'].mean()
print(f'Average Score: {average_score}')

highest_score = df['Score'].max()
highest_scorers = df[df['Score'] == highest_score]
print(f'Highest Scorers:\n{highest_scorers}')
