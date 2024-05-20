# How We Generated the genotype_expression.csv file

1.        Identify datasets
a.        STR from African GB dataset
https://datahub.ucsd.edu/user/dsi-student8/edit/project2/AFR_GB.txt

b.        Expression data from AFR-normalized expression
https://datahub.ucsd.edu/user/dsi-student8/edit/public/project2-association/dataset/AFR_normalized_and_filtered_hg38_chr11.csv

2.        Extract the right column from the dataset
a.        From African GB grep out the TIMM10 STR that was significant from the results. It ends with 57528517
b.        From Expression data filter out the expression column for the gene TIMM10

3.        Plot STR vs Expression
a.        Merge STR data with Expression data
b.        Sort by STR column
c.        Generate average Expression by each STR  variable e.g. if there are several -20s get just one average; one average for -18s all the way to 2
d.        Generate a plot of STR on x axis and Expression on y axis as the dependent variable
e.        Regression equation of y(expression) ~ STR
f.        Correlation coefficient of STR vs Expression

4.        Repeat the process for EUR data

5.        Plot both graphs on the same data
