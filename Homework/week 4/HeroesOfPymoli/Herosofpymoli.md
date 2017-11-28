

```python
import pandas as pd
import numpy as np
import json

#jsonpath = os.path.join('', 'purchase_data.json')



df = pd.read_json('purchase_data.json')
df_2 = pd.read_json('purchase_data2.json')

df = pd.merge(df,df_2,how='outer')
df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
    </tr>
  </tbody>
</table>
</div>




```python
player_count = len(df['SN'].unique())
player_count
```




    612




```python
#Purchasing Analysis
unique_items = len(df['Item Name'].unique())
avg_purchase_price = df['Price'].mean()
total_purchases = df['Item ID'].count()
total_revenue = df['Price'].sum()


print('Number of unique items are ' + str(unique_items))
print('The average purchase price is ' + '$' + str(avg_purchase_price))
print('Number of purchases are ' + str(total_purchases))
print('The total value is ' + '$' + str(total_revenue))
```

    Number of unique items are 180
    The average purchase price is $2.9305710955710915
    Number of purchases are 858
    The total value is $2514.4299999999967



```python
#Gender Demographics

male = df['Gender'] == 'Male'
female = df['Gender'] == 'Female'

df_groupby_gender = df.groupby(['Gender'])

gender_count = df_groupby_gender['SN'].nunique()
gender_percent = round(gender_count/player_count*100,2).map("{0:.2f}%".format)

df_gender_demo = pd.DataFrame({'Purchasers Count':gender_count,
                         'Percent':gender_percent})
df_gender_demo = df_gender_demo[['Purchasers Count','Percent']]
df_gender_demo
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Purchasers Count</th>
      <th>Percent</th>
    </tr>
    <tr>
      <th>Gender</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>112</td>
      <td>18.30%</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>498</td>
      <td>81.37%</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>9</td>
      <td>1.47%</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Purchasing Analysis (gender)

df_groupby_gender = df.groupby(['Gender'])

gender_purchase_count = df['Gender'].value_counts()
gender_avg_purchase_price = df_groupby_gender['Price'].mean().map("$ {:,.2f}".format)
gender_total_value = df_groupby_gender['Price'].sum().map("$ {:,.2f}".format)

df_gender = pd.DataFrame({'Purchase Count':gender_purchase_count,
                         'Average Purchase Price':gender_avg_purchase_price,
                         'Total Value':gender_total_value})
df_gender = df_gender[['Purchase Count','Average Purchase Price','Total Value']]
df_gender
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Purchase Count</th>
      <th>Average Purchase Price</th>
      <th>Total Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>149</td>
      <td>$ 2.85</td>
      <td>$ 424.29</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>697</td>
      <td>$ 2.94</td>
      <td>$ 2,052.28</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>12</td>
      <td>$ 3.15</td>
      <td>$ 37.86</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Age demographics

bins = np.arange(df['Age'].min(),df['Age'].max()+df['Age'].min(),4)
label = ['7-11','11-15','15-19','19-23','23-27','27-31','31-35','35-39','39-43','43-47','47-51']

df['Age Groups'] = pd.cut(df['Age'],bins,labels=label)
df_groupby_age = df.groupby(['Age Groups'])
age_purchase_count = df_groupby_age['Age'].count()
age_avg_purchase = df_groupby_age['Price'].mean().map("$ {:,.2f}".format)
age_total_revenue = df_groupby_age['Price'].sum().map("$ {:,.2f}".format)


df_age = pd.DataFrame({'Purchase Count':age_purchase_count,
                      'Average Purchase':age_avg_purchase,
                      'Total Value':age_total_revenue})
df_age = df_age[['Purchase Count','Average Purchase','Total Value']]
df_age
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Purchase Count</th>
      <th>Average Purchase</th>
      <th>Total Value</th>
    </tr>
    <tr>
      <th>Age Groups</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7-11</th>
      <td>28</td>
      <td>$ 3.12</td>
      <td>$ 87.28</td>
    </tr>
    <tr>
      <th>11-15</th>
      <td>71</td>
      <td>$ 2.86</td>
      <td>$ 202.76</td>
    </tr>
    <tr>
      <th>15-19</th>
      <td>96</td>
      <td>$ 2.85</td>
      <td>$ 273.22</td>
    </tr>
    <tr>
      <th>19-23</th>
      <td>295</td>
      <td>$ 2.91</td>
      <td>$ 858.33</td>
    </tr>
    <tr>
      <th>23-27</th>
      <td>183</td>
      <td>$ 2.98</td>
      <td>$ 544.95</td>
    </tr>
    <tr>
      <th>27-31</th>
      <td>64</td>
      <td>$ 2.94</td>
      <td>$ 188.17</td>
    </tr>
    <tr>
      <th>31-35</th>
      <td>49</td>
      <td>$ 3.00</td>
      <td>$ 147.11</td>
    </tr>
    <tr>
      <th>35-39</th>
      <td>34</td>
      <td>$ 2.87</td>
      <td>$ 97.45</td>
    </tr>
    <tr>
      <th>39-43</th>
      <td>17</td>
      <td>$ 3.28</td>
      <td>$ 55.68</td>
    </tr>
    <tr>
      <th>43-47</th>
      <td>1</td>
      <td>$ 2.72</td>
      <td>$ 2.72</td>
    </tr>
    <tr>
      <th>47-51</th>
      <td>0</td>
      <td>$ nan</td>
      <td>$ nan</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Top Spenders
df_groupby_sn = df.groupby(['SN'])
purchaser_count = df['SN'].value_counts()
purchaser_avg_price = round(df_groupby_sn['Price'].mean(),2)
purchaser_total_revenue = round(df_groupby_sn['Price'].sum(),2)
df_sn = pd.DataFrame({'Purchases': purchaser_count,
                     'Average Purchase Price':purchaser_avg_price,
                     'Total Value':purchaser_total_revenue})
df_sn = df_sn[['Purchases','Average Purchase Price','Total Value']]
df_sn = df_sn.sort_values(['Total Value'],ascending = False)
df_sn.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Purchases</th>
      <th>Average Purchase Price</th>
      <th>Total Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Undirrala66</th>
      <td>5</td>
      <td>3.41</td>
      <td>17.06</td>
    </tr>
    <tr>
      <th>Aerithllora36</th>
      <td>4</td>
      <td>3.78</td>
      <td>15.10</td>
    </tr>
    <tr>
      <th>Saedue76</th>
      <td>4</td>
      <td>3.39</td>
      <td>13.56</td>
    </tr>
    <tr>
      <th>Sondim43</th>
      <td>4</td>
      <td>3.26</td>
      <td>13.02</td>
    </tr>
    <tr>
      <th>Mindimnya67</th>
      <td>4</td>
      <td>3.18</td>
      <td>12.74</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Most Popular items
df_groupby_item = df.groupby(['Item ID','Item Name'])
#item_id = round(df_groupby_item['Item ID'].mean(),0)
item_count = df_groupby_item['Item Name'].count()
item_price = round(df_groupby_item['Price'].mean(),2)
item_purchase_value = round(df_groupby_item['Price'].sum(),2)

df_item = pd.DataFrame({
                        'Purchases':item_count,
                       'Price':item_price,
                       'Total Value':item_purchase_value})
df_item = df_item[['Purchases','Price','Total Value']]
df_item = df_item.sort_values(['Purchases'],ascending=False)
df_item.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>Purchases</th>
      <th>Price</th>
      <th>Total Value</th>
    </tr>
    <tr>
      <th>Item ID</th>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>84</th>
      <th>Arcane Gem</th>
      <td>12</td>
      <td>2.45</td>
      <td>29.34</td>
    </tr>
    <tr>
      <th>39</th>
      <th>Betrayal, Whisper of Grieving Widows</th>
      <td>11</td>
      <td>2.35</td>
      <td>25.85</td>
    </tr>
    <tr>
      <th>31</th>
      <th>Trickster</th>
      <td>10</td>
      <td>2.32</td>
      <td>23.22</td>
    </tr>
    <tr>
      <th>44</th>
      <th>Bonecarvin Battle Axe</th>
      <td>9</td>
      <td>2.67</td>
      <td>24.04</td>
    </tr>
    <tr>
      <th>154</th>
      <th>Feral Katana</th>
      <td>9</td>
      <td>2.62</td>
      <td>23.55</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Most Profitable items
df_item_profit = df_item.sort_values(['Total Value'],ascending=False)
df_item_profit.head(5)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>Purchases</th>
      <th>Price</th>
      <th>Total Value</th>
    </tr>
    <tr>
      <th>Item ID</th>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>34</th>
      <th>Retribution Axe</th>
      <td>9</td>
      <td>4.14</td>
      <td>37.26</td>
    </tr>
    <tr>
      <th>107</th>
      <th>Splitter, Foe Of Subtlety</th>
      <td>9</td>
      <td>3.67</td>
      <td>33.03</td>
    </tr>
    <tr>
      <th>115</th>
      <th>Spectral Diamond Doomblade</th>
      <td>7</td>
      <td>4.25</td>
      <td>29.75</td>
    </tr>
    <tr>
      <th>32</th>
      <th>Orenmir</th>
      <td>6</td>
      <td>4.95</td>
      <td>29.70</td>
    </tr>
    <tr>
      <th>84</th>
      <th>Arcane Gem</th>
      <td>12</td>
      <td>2.45</td>
      <td>29.34</td>
    </tr>
  </tbody>
</table>
</div>




```python
print('Purchasing Analysis')
print('----------------------------')
print('Number of unique items are ' + str(unique_items))
print('The average purchase price is ' + '$' + str(avg_purchase_price))
print('Number of purchases are ' + str(total_purchases))
print('The total value is ' + '$' + str(total_revenue))
print('----------------------------')
print('Gender Demographics')
print('----------------------------')
print('The male count is ' + str(male_count))
print('The female count is ' + str(female_count))
print('The male percentage is ' + str(male_percent) + '%')
print('The female percentage is ' + str(female_percent) + '%')
print('----------------------------')
print('Purchasing Analysis by Gender')
print('----------------------------')
print(df_gender)
print('----------------------------')
print('Purchasing Analysis by Age')
print('----------------------------')
print(df_age)
print('----------------------------')
print('Top Spenders')
print('----------------------------')
print(df_sn.head(5))
print('----------------------------')

print('Most Popular Items')
print('----------------------------')
print(df_item.head(5))
print('----------------------------')
print('Most Profitable Items')
print('----------------------------')
print(df_item_profit.head(5))
```

    Purchasing Analysis
    ----------------------------
    Number of unique items are 180
    The average purchase price is $2.9305710955710915
    Number of purchases are 858
    The total value is $2514.4299999999967
    ----------------------------
    Gender Demographics
    ----------------------------
    The male count is 498
    The female count is 112
    The male percentage is 81%
    The female percentage is 18%
    ----------------------------
    Purchasing Analysis by Gender
    ----------------------------
                           Purchase Count Average Purchase Price Total Value
    Female                            149                 $ 2.85    $ 424.29
    Male                              697                 $ 2.94  $ 2,052.28
    Other / Non-Disclosed              12                 $ 3.15     $ 37.86
    ----------------------------
    Purchasing Analysis by Age
    ----------------------------
                Purchase Count Average Purchase Total Value
    Age Groups                                             
    7-11                    28           $ 3.12     $ 87.28
    11-15                   71           $ 2.86    $ 202.76
    15-19                   96           $ 2.85    $ 273.22
    19-23                  295           $ 2.91    $ 858.33
    23-27                  183           $ 2.98    $ 544.95
    27-31                   64           $ 2.94    $ 188.17
    31-35                   49           $ 3.00    $ 147.11
    35-39                   34           $ 2.87     $ 97.45
    39-43                   17           $ 3.28     $ 55.68
    43-47                    1           $ 2.72      $ 2.72
    47-51                    0            $ nan       $ nan
    ----------------------------
    Top Spenders
    ----------------------------
                   Purchases  Average Purchase Price  Total Value
    Undirrala66            5                    3.41        17.06
    Aerithllora36          4                    3.78        15.10
    Saedue76               4                    3.39        13.56
    Sondim43               4                    3.26        13.02
    Mindimnya67            4                    3.18        12.74
    ----------------------------
    Most Popular Items
    ----------------------------
                                                  Purchases  Price  Total Value
    Item ID Item Name                                                          
    84      Arcane Gem                                   12   2.45        29.34
    39      Betrayal, Whisper of Grieving Widows         11   2.35        25.85
    31      Trickster                                    10   2.32        23.22
    44      Bonecarvin Battle Axe                         9   2.67        24.04
    154     Feral Katana                                  9   2.62        23.55
    ----------------------------
    Most Profitable Items
    ----------------------------
                                        Purchases  Price  Total Value
    Item ID Item Name                                                
    34      Retribution Axe                     9   4.14        37.26
    107     Splitter, Foe Of Subtlety           9   3.67        33.03
    115     Spectral Diamond Doomblade          7   4.25        29.75
    32      Orenmir                             6   4.95        29.70
    84      Arcane Gem                         12   2.45        29.34

