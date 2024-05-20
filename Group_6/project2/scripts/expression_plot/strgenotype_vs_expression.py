import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load your data
data = pd.read_csv('genotype_expression.csv')

# Filter data for African (AFR) and European (EUR) populations
afr_data = data[data['population'] == 'AFR']
eur_data = data[data['population'] == 'EUR']

# Create a scatter plot and line plot for AFR and EUR populations
plt.figure(figsize=(10, 6))

# AFR population
sns.scatterplot(x='STR_genotype', y='TIMM10_Expression', data=afr_data, alpha=0.5, color='red', label='AFR')
plt.plot(afr_data['STR_genotype'], afr_data['TIMM10_Expression'], marker='o', color='red')

# EUR population
sns.scatterplot(x='STR_genotype', y='TIMM10_Expression', data=eur_data, alpha=0.5, color='blue', label='EUR')
plt.plot(eur_data['STR_genotype'], eur_data['TIMM10_Expression'], marker='o', color='blue')

# Customize the plot
plt.title('STR_genotype  vs. TIMM10 Expression')
plt.xlabel('STR_genotype')
plt.ylabel('TIMM10 Expression')
plt.ylim(-3, 3)  # Set y-axis limits
plt.legend(title='Population')
plt.grid(True)
plt.show()
