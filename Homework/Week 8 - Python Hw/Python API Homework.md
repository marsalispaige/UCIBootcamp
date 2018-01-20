

```python
# Dependencies
import tweepy
import json
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Import and Initialize Sentiment Analyzer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyzer = SentimentIntensityAnalyzer()
```


```python
# Twitter API Keys
consumer_key = "TqOF9ZYzQza9yOiLM6GSuR45G"
consumer_secret = "vjXRABuQk8KCp3Hz1zQaGbfP2paKFRMtIra7CbSUdBIU3c3Vg7"
access_token = "2742898378-R10jqQ6RrwIMr890LHgFetxqMIGEQhQzchAH4jk"
access_token_secret = "G13clTyAFvLsXr6Jgaar9SXeaw2Ze31MUq9pXImJnQyKs"
# Setup Tweepy API Authentication
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, parser=tweepy.parsers.JSONParser())
```


```python
# Setting Up Variables
target_users = ['@BBCworld','@CBSnews','@CNN','@Foxnews','@nytimes']

tweet_collect = []
```


```python
#creating loop to loop through each news organization handle and to pull the last 100 tweets for each account
for user in target_users:
    
    counter = 0
    
    #pulling the last 100 tweets for each news organization
    for x in range(5):
        
        public_tweets = api.user_timeline(user, page = x)
        
        #looping through the x page of tweets
        for tweet in public_tweets:
            
            #storing sentiment scores for news organization's tweets
            compound = analyzer.polarity_scores(tweet['text'])['compound']
            pos = analyzer.polarity_scores(tweet['text'])['pos']
            neg = analyzer.polarity_scores(tweet['text'])['neg']
            neu = analyzer.polarity_scores(tweet['text'])['neu']
            
            #appending each tweet and score to collective dictionary
            tweet_collect.append({'source':user,
                                'timestamp':tweet['created_at'],
                               'tweet text':tweet['text'],
                                'tweets ago': counter,
                                'compound score': compound,
                                'positive score': pos,
                                'negative score': neg,
                                'neutral score': neu
                               })
            
            counter = counter + 1
            #printing results of each for error checking
            print("The source is %s" % user)
            print('The tweet is %s' % tweet['text'])
            print('This tweet was tweeted at %s' % tweet['created_at'])
            print('The compound score is %s' % compound)
            print('The postive score is %s' % pos)
            print('The Negative score is %s' % neg)
            print('The Neutral score is %s' % neu)
            print('Tweet count is %s' % counter)
            print('-----------------------------------')
```

    The source is @BBCworld
    The tweet is Why is Turkey attacking Syria? https://t.co/UWNSU6LpBx
    This tweet was tweeted at Sat Jan 20 18:59:56 +0000 2018
    The compound score is -0.4588
    The postive score is 0.0
    The Negative score is 0.375
    The Neutral score is 0.625
    Tweet count is 1
    -----------------------------------
    The source is @BBCworld
    The tweet is At the beginning of Donald Trump's presidency, there was concern over his potential conflicts of interest as presid… https://t.co/AkdMzDZxSK
    This tweet was tweeted at Sat Jan 20 18:46:41 +0000 2018
    The compound score is 0.1027
    The postive score is 0.133
    The Negative score is 0.115
    The Neutral score is 0.752
    Tweet count is 2
    -----------------------------------
    The source is @BBCworld
    The tweet is The Brazilian man who lives in a sandcastle https://t.co/3qhGDqAPqk
    This tweet was tweeted at Sat Jan 20 18:15:46 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 3
    -----------------------------------
    The source is @BBCworld
    The tweet is Football president George Weah puts Liberian army to the test https://t.co/RizGdiNWuo
    This tweet was tweeted at Sat Jan 20 17:42:16 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 4
    -----------------------------------
    The source is @BBCworld
    The tweet is Gunmen 'attacking major Kabul hotel' https://t.co/5hMWar4rzM
    This tweet was tweeted at Sat Jan 20 17:24:17 +0000 2018
    The compound score is -0.4588
    The postive score is 0.0
    The Negative score is 0.375
    The Neutral score is 0.625
    Tweet count is 5
    -----------------------------------
    The source is @BBCworld
    The tweet is India police 'failed to help injured teenagers' https://t.co/Tuu7HBGMWv
    This tweet was tweeted at Sat Jan 20 16:08:05 +0000 2018
    The compound score is -0.5106
    The postive score is 0.197
    The Negative score is 0.438
    The Neutral score is 0.365
    Tweet count is 6
    -----------------------------------
    The source is @BBCworld
    The tweet is The Brazilian man who lives in a sandcastle https://t.co/vGI7oUfZl4
    This tweet was tweeted at Sat Jan 20 16:04:22 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 7
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCSteveR: A pro-Kremlin paper today reports that real incomes in Russia have fallen &amp; that "people continue to skimp on almost everyth…
    This tweet was tweeted at Sat Jan 20 14:13:12 +0000 2018
    The compound score is -0.3612
    The postive score is 0.0
    The Negative score is 0.106
    The Neutral score is 0.894
    Tweet count is 8
    -----------------------------------
    The source is @BBCworld
    The tweet is Nigeria: Kidnapped US and Canadian citizens freed https://t.co/dZzRGB62J5
    This tweet was tweeted at Sat Jan 20 13:51:40 +0000 2018
    The compound score is 0.4019
    The postive score is 0.278
    The Negative score is 0.0
    The Neutral score is 0.722
    Tweet count is 9
    -----------------------------------
    The source is @BBCworld
    The tweet is Syria: Turkey ground operation in Afrin begins 'de facto' https://t.co/w058FNSZ76
    This tweet was tweeted at Sat Jan 20 13:45:00 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 10
    -----------------------------------
    The source is @BBCworld
    The tweet is Australian Open: Roger Federer and Novak Djokovic into fourth round https://t.co/94lbTR21jQ
    This tweet was tweeted at Sat Jan 20 13:34:21 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 11
    -----------------------------------
    The source is @BBCworld
    The tweet is Top French chef Paul Bocuse dies at 91 https://t.co/78dZtU3V4v
    This tweet was tweeted at Sat Jan 20 13:30:49 +0000 2018
    The compound score is 0.2023
    The postive score is 0.184
    The Negative score is 0.0
    The Neutral score is 0.816
    Tweet count is 12
    -----------------------------------
    The source is @BBCworld
    The tweet is US shutdown: Trump and Democrats blame each other https://t.co/PavJjbsiCs
    This tweet was tweeted at Sat Jan 20 13:20:19 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.231
    The Neutral score is 0.769
    Tweet count is 13
    -----------------------------------
    The source is @BBCworld
    The tweet is Why Italians are saying 'No' to takeaway coffee https://t.co/KA2KSf7lzZ
    This tweet was tweeted at Sat Jan 20 13:02:23 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 14
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope sends gift to police woman thrown from horse https://t.co/iGCmCfdqX2
    This tweet was tweeted at Sat Jan 20 12:38:41 +0000 2018
    The compound score is 0.4404
    The postive score is 0.244
    The Negative score is 0.0
    The Neutral score is 0.756
    Tweet count is 15
    -----------------------------------
    The source is @BBCworld
    The tweet is Winter Olympics 2018: North Korea will send 22 athletes to Pyeongchang https://t.co/YdmSfiH46g
    This tweet was tweeted at Sat Jan 20 12:34:10 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 16
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCOS: You might have seen Cindy Garcia and her family in a viral video. After living in the US for 30 years Cindy's husband Jorge was…
    This tweet was tweeted at Sat Jan 20 12:08:33 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 17
    -----------------------------------
    The source is @BBCworld
    The tweet is Syria conflict: 15 refugees found frozen to death https://t.co/OdunaDREzJ
    This tweet was tweeted at Sat Jan 20 12:03:24 +0000 2018
    The compound score is -0.7351
    The postive score is 0.0
    The Negative score is 0.47
    The Neutral score is 0.53
    Tweet count is 18
    -----------------------------------
    The source is @BBCworld
    The tweet is Pad Man: A man's 'period poverty' rescue becomes a film https://t.co/QgJEtrdtTh
    This tweet was tweeted at Sat Jan 20 11:22:42 +0000 2018
    The compound score is 0.0
    The postive score is 0.243
    The Negative score is 0.243
    The Neutral score is 0.515
    Tweet count is 19
    -----------------------------------
    The source is @BBCworld
    The tweet is What is Trumpism?
    
    https://t.co/Ks53fkoyoW
    This tweet was tweeted at Sat Jan 20 11:18:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 20
    -----------------------------------
    The source is @BBCworld
    The tweet is Why is Turkey attacking Syria? https://t.co/UWNSU6LpBx
    This tweet was tweeted at Sat Jan 20 18:59:56 +0000 2018
    The compound score is -0.4588
    The postive score is 0.0
    The Negative score is 0.375
    The Neutral score is 0.625
    Tweet count is 21
    -----------------------------------
    The source is @BBCworld
    The tweet is At the beginning of Donald Trump's presidency, there was concern over his potential conflicts of interest as presid… https://t.co/AkdMzDZxSK
    This tweet was tweeted at Sat Jan 20 18:46:41 +0000 2018
    The compound score is 0.1027
    The postive score is 0.133
    The Negative score is 0.115
    The Neutral score is 0.752
    Tweet count is 22
    -----------------------------------
    The source is @BBCworld
    The tweet is The Brazilian man who lives in a sandcastle https://t.co/3qhGDqAPqk
    This tweet was tweeted at Sat Jan 20 18:15:46 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 23
    -----------------------------------
    The source is @BBCworld
    The tweet is Football president George Weah puts Liberian army to the test https://t.co/RizGdiNWuo
    This tweet was tweeted at Sat Jan 20 17:42:16 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 24
    -----------------------------------
    The source is @BBCworld
    The tweet is Gunmen 'attacking major Kabul hotel' https://t.co/5hMWar4rzM
    This tweet was tweeted at Sat Jan 20 17:24:17 +0000 2018
    The compound score is -0.4588
    The postive score is 0.0
    The Negative score is 0.375
    The Neutral score is 0.625
    Tweet count is 25
    -----------------------------------
    The source is @BBCworld
    The tweet is India police 'failed to help injured teenagers' https://t.co/Tuu7HBGMWv
    This tweet was tweeted at Sat Jan 20 16:08:05 +0000 2018
    The compound score is -0.5106
    The postive score is 0.197
    The Negative score is 0.438
    The Neutral score is 0.365
    Tweet count is 26
    -----------------------------------
    The source is @BBCworld
    The tweet is The Brazilian man who lives in a sandcastle https://t.co/vGI7oUfZl4
    This tweet was tweeted at Sat Jan 20 16:04:22 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 27
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCSteveR: A pro-Kremlin paper today reports that real incomes in Russia have fallen &amp; that "people continue to skimp on almost everyth…
    This tweet was tweeted at Sat Jan 20 14:13:12 +0000 2018
    The compound score is -0.3612
    The postive score is 0.0
    The Negative score is 0.106
    The Neutral score is 0.894
    Tweet count is 28
    -----------------------------------
    The source is @BBCworld
    The tweet is Nigeria: Kidnapped US and Canadian citizens freed https://t.co/dZzRGB62J5
    This tweet was tweeted at Sat Jan 20 13:51:40 +0000 2018
    The compound score is 0.4019
    The postive score is 0.278
    The Negative score is 0.0
    The Neutral score is 0.722
    Tweet count is 29
    -----------------------------------
    The source is @BBCworld
    The tweet is Syria: Turkey ground operation in Afrin begins 'de facto' https://t.co/w058FNSZ76
    This tweet was tweeted at Sat Jan 20 13:45:00 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 30
    -----------------------------------
    The source is @BBCworld
    The tweet is Australian Open: Roger Federer and Novak Djokovic into fourth round https://t.co/94lbTR21jQ
    This tweet was tweeted at Sat Jan 20 13:34:21 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 31
    -----------------------------------
    The source is @BBCworld
    The tweet is Top French chef Paul Bocuse dies at 91 https://t.co/78dZtU3V4v
    This tweet was tweeted at Sat Jan 20 13:30:49 +0000 2018
    The compound score is 0.2023
    The postive score is 0.184
    The Negative score is 0.0
    The Neutral score is 0.816
    Tweet count is 32
    -----------------------------------
    The source is @BBCworld
    The tweet is US shutdown: Trump and Democrats blame each other https://t.co/PavJjbsiCs
    This tweet was tweeted at Sat Jan 20 13:20:19 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.231
    The Neutral score is 0.769
    Tweet count is 33
    -----------------------------------
    The source is @BBCworld
    The tweet is Why Italians are saying 'No' to takeaway coffee https://t.co/KA2KSf7lzZ
    This tweet was tweeted at Sat Jan 20 13:02:23 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 34
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope sends gift to police woman thrown from horse https://t.co/iGCmCfdqX2
    This tweet was tweeted at Sat Jan 20 12:38:41 +0000 2018
    The compound score is 0.4404
    The postive score is 0.244
    The Negative score is 0.0
    The Neutral score is 0.756
    Tweet count is 35
    -----------------------------------
    The source is @BBCworld
    The tweet is Winter Olympics 2018: North Korea will send 22 athletes to Pyeongchang https://t.co/YdmSfiH46g
    This tweet was tweeted at Sat Jan 20 12:34:10 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 36
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCOS: You might have seen Cindy Garcia and her family in a viral video. After living in the US for 30 years Cindy's husband Jorge was…
    This tweet was tweeted at Sat Jan 20 12:08:33 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 37
    -----------------------------------
    The source is @BBCworld
    The tweet is Syria conflict: 15 refugees found frozen to death https://t.co/OdunaDREzJ
    This tweet was tweeted at Sat Jan 20 12:03:24 +0000 2018
    The compound score is -0.7351
    The postive score is 0.0
    The Negative score is 0.47
    The Neutral score is 0.53
    Tweet count is 38
    -----------------------------------
    The source is @BBCworld
    The tweet is Pad Man: A man's 'period poverty' rescue becomes a film https://t.co/QgJEtrdtTh
    This tweet was tweeted at Sat Jan 20 11:22:42 +0000 2018
    The compound score is 0.0
    The postive score is 0.243
    The Negative score is 0.243
    The Neutral score is 0.515
    Tweet count is 39
    -----------------------------------
    The source is @BBCworld
    The tweet is What is Trumpism?
    
    https://t.co/Ks53fkoyoW
    This tweet was tweeted at Sat Jan 20 11:18:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 40
    -----------------------------------
    The source is @BBCworld
    The tweet is Turkey bus crash: Eleven killed in motorway accident https://t.co/34TTJzTVGD
    This tweet was tweeted at Sat Jan 20 10:49:46 +0000 2018
    The compound score is -0.8834
    The postive score is 0.0
    The Negative score is 0.632
    The Neutral score is 0.368
    Tweet count is 41
    -----------------------------------
    The source is @BBCworld
    The tweet is The Silent Child: The deaf six-year-old actress hoping for an Oscar https://t.co/QsV9RpEI5C
    This tweet was tweeted at Sat Jan 20 10:25:55 +0000 2018
    The compound score is 0.4215
    The postive score is 0.203
    The Negative score is 0.0
    The Neutral score is 0.797
    Tweet count is 42
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @bbctennis: Kerber! 👏
    
    She knocks Maria Sharapova out of the #AusOpen with a 6-1, 6-3 win!
    
    🎾📻https://t.co/3kH48yOnmR #bbctennis https:/…
    This tweet was tweeted at Sat Jan 20 09:52:39 +0000 2018
    The compound score is 0.658
    The postive score is 0.205
    The Negative score is 0.0
    The Neutral score is 0.795
    Tweet count is 43
    -----------------------------------
    The source is @BBCworld
    The tweet is Asian wildlife trafficking 'kingpin' Boonchai Bach arrested https://t.co/VzAOSaie6m
    This tweet was tweeted at Sat Jan 20 09:05:16 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.307
    The Neutral score is 0.693
    Tweet count is 44
    -----------------------------------
    The source is @BBCworld
    The tweet is US government begins shutting down many of its services after Senate fails to agree on new budget… https://t.co/iFNARt8uyK
    This tweet was tweeted at Sat Jan 20 08:40:03 +0000 2018
    The compound score is -0.0772
    The postive score is 0.117
    The Negative score is 0.131
    The Neutral score is 0.751
    Tweet count is 45
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCSport: Christian Coleman has broken the 60m indoor world record.
    
    It was 17 years old ⚡
    
    More: https://t.co/MioIoFQoom https://t.co/…
    This tweet was tweeted at Sat Jan 20 08:36:20 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.147
    The Neutral score is 0.853
    Tweet count is 46
    -----------------------------------
    The source is @BBCworld
    The tweet is US shutdown begins as Senate fails to pass new budget https://t.co/NUe0i4f46p
    This tweet was tweeted at Sat Jan 20 05:06:27 +0000 2018
    The compound score is -0.4215
    The postive score is 0.0
    The Negative score is 0.219
    The Neutral score is 0.781
    Tweet count is 47
    -----------------------------------
    The source is @BBCworld
    The tweet is Huge Brazil rubbish dump closes after six decades https://t.co/RVDtR0mCzR
    This tweet was tweeted at Sat Jan 20 02:21:03 +0000 2018
    The compound score is -0.0772
    The postive score is 0.193
    The Negative score is 0.218
    The Neutral score is 0.588
    Tweet count is 48
    -----------------------------------
    The source is @BBCworld
    The tweet is Lac-Megantic: The runaway train that destroyed a town https://t.co/hNo7Bk0qBe
    This tweet was tweeted at Sat Jan 20 01:17:30 +0000 2018
    The compound score is -0.4939
    The postive score is 0.0
    The Negative score is 0.314
    The Neutral score is 0.686
    Tweet count is 49
    -----------------------------------
    The source is @BBCworld
    The tweet is How can parents torture their children? https://t.co/basHomJMGs
    This tweet was tweeted at Sat Jan 20 01:17:27 +0000 2018
    The compound score is -0.5994
    The postive score is 0.0
    The Negative score is 0.394
    The Neutral score is 0.606
    Tweet count is 50
    -----------------------------------
    The source is @BBCworld
    The tweet is US musician Tom Petty died of 'accidental drug overdose' https://t.co/Kpb5OtIgsF
    This tweet was tweeted at Sat Jan 20 01:13:42 +0000 2018
    The compound score is -0.6908
    The postive score is 0.0
    The Negative score is 0.489
    The Neutral score is 0.511
    Tweet count is 51
    -----------------------------------
    The source is @BBCworld
    The tweet is Donald Trump won 42% of the female vote in the 2016 US election.
    Now, the president's approval rating among women i… https://t.co/PNVpQ5CanB
    This tweet was tweeted at Sat Jan 20 01:03:03 +0000 2018
    The compound score is 0.7783
    The postive score is 0.254
    The Negative score is 0.0
    The Neutral score is 0.746
    Tweet count is 52
    -----------------------------------
    The source is @BBCworld
    The tweet is New Zealand debates access to dead sea life footage https://t.co/ib2vOSeJUO
    This tweet was tweeted at Sat Jan 20 00:29:13 +0000 2018
    The compound score is -0.6486
    The postive score is 0.0
    The Negative score is 0.323
    The Neutral score is 0.677
    Tweet count is 53
    -----------------------------------
    The source is @BBCworld
    The tweet is France: Emmanuel Macron’s marvellous manoeuvres this week https://t.co/zxKptoiHqL
    This tweet was tweeted at Sat Jan 20 00:22:18 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 54
    -----------------------------------
    The source is @BBCworld
    The tweet is Is the Women's March from 2017 the same marches we'll see in 2018? 
    What's happened to the movement in one year?… https://t.co/tKXhOii3CV
    This tweet was tweeted at Sat Jan 20 00:20:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 55
    -----------------------------------
    The source is @BBCworld
    The tweet is Trump travel ban: Supreme Court to rule on legality https://t.co/8V753mcJQQ
    This tweet was tweeted at Fri Jan 19 22:47:47 +0000 2018
    The compound score is 0.0
    The postive score is 0.237
    The Negative score is 0.237
    The Neutral score is 0.526
    Tweet count is 56
    -----------------------------------
    The source is @BBCworld
    The tweet is Trump vows abortion opposition in speech to March for Life https://t.co/yHyNjK2hf1
    This tweet was tweeted at Fri Jan 19 22:28:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 57
    -----------------------------------
    The source is @BBCworld
    The tweet is The Bollywood film breaking the taboo around periods https://t.co/04DR0Rug4L
    This tweet was tweeted at Fri Jan 19 22:03:52 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 58
    -----------------------------------
    The source is @BBCworld
    The tweet is Women's march: Where, when and why will protests happen? https://t.co/FXcNhFEvHZ
    This tweet was tweeted at Fri Jan 19 22:03:36 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.174
    The Neutral score is 0.826
    Tweet count is 59
    -----------------------------------
    The source is @BBCworld
    The tweet is The man risking his life to save pink dolphins https://t.co/zdJMMOoD8C
    This tweet was tweeted at Fri Jan 19 22:00:39 +0000 2018
    The compound score is 0.2263
    The postive score is 0.237
    The Negative score is 0.17
    The Neutral score is 0.593
    Tweet count is 60
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope sends gift to woman thrown from horse https://t.co/PXXWmAKwyG
    This tweet was tweeted at Fri Jan 19 21:56:39 +0000 2018
    The compound score is 0.4404
    The postive score is 0.266
    The Negative score is 0.0
    The Neutral score is 0.734
    Tweet count is 61
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope sends gift to woman thrown from horse 
    https://t.co/FWBPiGLfvR
    This tweet was tweeted at Fri Jan 19 21:47:51 +0000 2018
    The compound score is 0.4404
    The postive score is 0.266
    The Negative score is 0.0
    The Neutral score is 0.734
    Tweet count is 62
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope Francis warns of threat to Amazon peoples on Peru visit https://t.co/ur6uErJKUK
    This tweet was tweeted at Fri Jan 19 21:46:43 +0000 2018
    The compound score is -0.4767
    The postive score is 0.11
    The Negative score is 0.31
    The Neutral score is 0.581
    Tweet count is 63
    -----------------------------------
    The source is @BBCworld
    The tweet is Colombia says 550,000 Venezuelans have fled to the country https://t.co/GM8VDGnf52
    This tweet was tweeted at Fri Jan 19 21:04:26 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 64
    -----------------------------------
    The source is @BBCworld
    The tweet is Las Vegas shooting: Police say gunman's girlfriend won't face charges https://t.co/QvLkmUuh0h
    This tweet was tweeted at Fri Jan 19 20:36:50 +0000 2018
    The compound score is 0.2057
    The postive score is 0.154
    The Negative score is 0.0
    The Neutral score is 0.846
    Tweet count is 65
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCNewsNI: Irish Prime Minister Leo Varadkar said he expected the wording of the referendum on the 8th amendment to be made public "in…
    This tweet was tweeted at Fri Jan 19 20:34:31 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 66
    -----------------------------------
    The source is @BBCworld
    The tweet is Chicago West: Kim Kardashian West and Kanye West name daughter https://t.co/FdDrs1ITZm
    This tweet was tweeted at Fri Jan 19 20:02:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 67
    -----------------------------------
    The source is @BBCworld
    The tweet is The future of high-speed travel? 
    
    https://t.co/Q3OOnLvX5H https://t.co/wmHAZGnYlU
    This tweet was tweeted at Fri Jan 19 19:53:38 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 68
    -----------------------------------
    The source is @BBCworld
    The tweet is Workers cleared over Canada rail disaster https://t.co/kt8TNzdhIw
    This tweet was tweeted at Fri Jan 19 19:53:12 +0000 2018
    The compound score is -0.5719
    The postive score is 0.133
    The Negative score is 0.39
    The Neutral score is 0.476
    Tweet count is 69
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCNorthAmerica: Las Vegas shooting: Police say gunman's girlfriend won't face charges https://t.co/YhKvAFI58n
    This tweet was tweeted at Fri Jan 19 19:38:30 +0000 2018
    The compound score is 0.2057
    The postive score is 0.131
    The Negative score is 0.0
    The Neutral score is 0.869
    Tweet count is 70
    -----------------------------------
    The source is @BBCworld
    The tweet is Larry Nassar case: Olympic champ Jordyn Wieber reveals abuse https://t.co/brtAkm1l3p
    This tweet was tweeted at Fri Jan 19 19:02:22 +0000 2018
    The compound score is -0.2732
    The postive score is 0.203
    The Negative score is 0.275
    The Neutral score is 0.523
    Tweet count is 71
    -----------------------------------
    The source is @BBCworld
    The tweet is Gold medallists Aly Raisman and Jordyn Wieber face abuser https://t.co/uvJFwHxs0J
    This tweet was tweeted at Fri Jan 19 18:58:26 +0000 2018
    The compound score is -0.5574
    The postive score is 0.0
    The Negative score is 0.286
    The Neutral score is 0.714
    Tweet count is 72
    -----------------------------------
    The source is @BBCworld
    The tweet is Philippines stops sending workers to Kuwait over abuse fears https://t.co/VukKEG4kaT
    This tweet was tweeted at Fri Jan 19 17:37:23 +0000 2018
    The compound score is -0.8225
    The postive score is 0.0
    The Negative score is 0.551
    The Neutral score is 0.449
    Tweet count is 73
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCBusiness: Coca-Cola pledges to recycle all packaging by 2030 https://t.co/pLRSb3fq5f
    This tweet was tweeted at Fri Jan 19 17:14:57 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 74
    -----------------------------------
    The source is @BBCworld
    The tweet is "I think there are some ironies to point out..." White House Director of Legislative Affairs, Marc Short, quotes Na… https://t.co/cOQayHgAPo
    This tweet was tweeted at Fri Jan 19 16:45:58 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 75
    -----------------------------------
    The source is @BBCworld
    The tweet is Kenya investigates 'sex attacks' on new mothers at hospital https://t.co/o34HhYr9KN
    This tweet was tweeted at Fri Jan 19 16:43:53 +0000 2018
    The compound score is -0.4404
    The postive score is 0.0
    The Negative score is 0.244
    The Neutral score is 0.756
    Tweet count is 76
    -----------------------------------
    The source is @BBCworld
    The tweet is "It is frustrating to all of us that we are in this position," says White House Director of Legislative Affairs, as… https://t.co/MABEGfFkXK
    This tweet was tweeted at Fri Jan 19 16:34:41 +0000 2018
    The compound score is -0.4404
    The postive score is 0.0
    The Negative score is 0.121
    The Neutral score is 0.879
    Tweet count is 77
    -----------------------------------
    The source is @BBCworld
    The tweet is Czech PM Andrej Babis stripped of immunity amid fraud claims https://t.co/aOFJuOaVl7
    This tweet was tweeted at Fri Jan 19 16:27:42 +0000 2018
    The compound score is -0.5859
    The postive score is 0.0
    The Negative score is 0.275
    The Neutral score is 0.725
    Tweet count is 78
    -----------------------------------
    The source is @BBCworld
    The tweet is Nasa removes US astronaut from ISS mission https://t.co/DO5fyKQPbW
    This tweet was tweeted at Fri Jan 19 16:15:37 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 79
    -----------------------------------
    The source is @BBCworld
    The tweet is Mattis: US national security focus no longer terrorism https://t.co/9hwgWHnlW5
    This tweet was tweeted at Fri Jan 19 15:59:50 +0000 2018
    The compound score is -0.6597
    The postive score is 0.158
    The Negative score is 0.447
    The Neutral score is 0.395
    Tweet count is 80
    -----------------------------------
    The source is @BBCworld
    The tweet is Russian President Vladimir Putin plunges into icy water to mark Epiphany https://t.co/yinB6Bag8P
    This tweet was tweeted at Fri Jan 19 15:32:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 81
    -----------------------------------
    The source is @BBCworld
    The tweet is Russian social media defends air cadets dancing in underwear https://t.co/oH0nDh6vBe
    This tweet was tweeted at Fri Jan 19 15:14:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 82
    -----------------------------------
    The source is @BBCworld
    The tweet is Crocodile found in weapons raid https://t.co/wFuchiLgan
    This tweet was tweeted at Fri Jan 19 15:14:13 +0000 2018
    The compound score is -0.4404
    The postive score is 0.0
    The Negative score is 0.367
    The Neutral score is 0.633
    Tweet count is 83
    -----------------------------------
    The source is @BBCworld
    The tweet is Smiling Macron and May pose for selfie https://t.co/2qp4hFR5Z0
    This tweet was tweeted at Fri Jan 19 14:55:24 +0000 2018
    The compound score is 0.4588
    The postive score is 0.3
    The Negative score is 0.0
    The Neutral score is 0.7
    Tweet count is 84
    -----------------------------------
    The source is @BBCworld
    The tweet is US shutdown: Senate bill on verge of collapse amid rancour https://t.co/JoHC7SHH2S
    This tweet was tweeted at Fri Jan 19 14:55:24 +0000 2018
    The compound score is -0.4939
    The postive score is 0.0
    The Negative score is 0.242
    The Neutral score is 0.758
    Tweet count is 85
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCNews: 'Extreme kayaker' sets 128ft waterfall record 😮
    
    Just incredible! https://t.co/5Sy3gbaAAR
    This tweet was tweeted at Fri Jan 19 14:36:51 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 86
    -----------------------------------
    The source is @BBCworld
    The tweet is Data-stealing spyware 'traced to Lebanon' https://t.co/vM3MJE5gz5
    This tweet was tweeted at Fri Jan 19 14:11:12 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 87
    -----------------------------------
    The source is @BBCworld
    The tweet is President Putin takes a dip into icy water https://t.co/vHGdVfKIyQ
    This tweet was tweeted at Fri Jan 19 13:26:17 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 88
    -----------------------------------
    The source is @BBCworld
    The tweet is Turkey steps up Syria shelling as invasion of Afrin looms https://t.co/LcFIAYfxpU
    This tweet was tweeted at Fri Jan 19 12:59:55 +0000 2018
    The compound score is -0.1531
    The postive score is 0.0
    The Negative score is 0.138
    The Neutral score is 0.862
    Tweet count is 89
    -----------------------------------
    The source is @BBCworld
    The tweet is British 'extreme kayaker' sets 128ft waterfall record https://t.co/tM3tp0G5IB
    This tweet was tweeted at Fri Jan 19 12:34:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 90
    -----------------------------------
    The source is @BBCworld
    The tweet is Pope Francis 'slander' comment angers Chile abuse victims https://t.co/FMOymysP23
    This tweet was tweeted at Fri Jan 19 11:55:48 +0000 2018
    The compound score is -0.8689
    The postive score is 0.0
    The Negative score is 0.62
    The Neutral score is 0.38
    Tweet count is 91
    -----------------------------------
    The source is @BBCworld
    The tweet is Michael Douglas: Former employee accuses actor of sexual harassment https://t.co/SHfYdzNP9F
    This tweet was tweeted at Fri Jan 19 11:41:59 +0000 2018
    The compound score is -0.7096
    The postive score is 0.0
    The Negative score is 0.424
    The Neutral score is 0.576
    Tweet count is 92
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @bbctennis: Game set and match 💪
    
    Kyrgios is through to the Aussie Open fourth round after beating Tsonga 7-6 (7-5) 4-6 7-6 (8-6) 7-6 (7…
    This tweet was tweeted at Fri Jan 19 11:39:58 +0000 2018
    The compound score is -0.4588
    The postive score is 0.0
    The Negative score is 0.111
    The Neutral score is 0.889
    Tweet count is 93
    -----------------------------------
    The source is @BBCworld
    The tweet is Pakistan Zainab murder: DNA suggests suspect in other case was 'innocent' https://t.co/PSqsP3jREa
    This tweet was tweeted at Fri Jan 19 11:09:43 +0000 2018
    The compound score is -0.7845
    The postive score is 0.0
    The Negative score is 0.408
    The Neutral score is 0.592
    Tweet count is 94
    -----------------------------------
    The source is @BBCworld
    The tweet is Fake-bomb TV crew held at New Jersey airport https://t.co/t17ynz6Ve4
    This tweet was tweeted at Fri Jan 19 11:09:43 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 95
    -----------------------------------
    The source is @BBCworld
    The tweet is Europe storm: Germany in huge clean-up as trains run again https://t.co/J0Dvwj22fU
    This tweet was tweeted at Fri Jan 19 10:33:43 +0000 2018
    The compound score is 0.3182
    The postive score is 0.187
    The Negative score is 0.0
    The Neutral score is 0.813
    Tweet count is 96
    -----------------------------------
    The source is @BBCworld
    The tweet is Yu Wensheng: China human rights lawyer arrested on school run https://t.co/ehmjjn6bW8
    This tweet was tweeted at Fri Jan 19 10:30:15 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.237
    The Neutral score is 0.763
    Tweet count is 97
    -----------------------------------
    The source is @BBCworld
    The tweet is South Korea to reward 'dogparazzi' informers https://t.co/EyIrdIMIGh
    This tweet was tweeted at Fri Jan 19 10:12:30 +0000 2018
    The compound score is 0.5719
    The postive score is 0.381
    The Negative score is 0.0
    The Neutral score is 0.619
    Tweet count is 98
    -----------------------------------
    The source is @BBCworld
    The tweet is Patricia Dagorn: France's 'Black Widow' jailed for poisonings https://t.co/nhamoSrcro
    This tweet was tweeted at Fri Jan 19 10:08:38 +0000 2018
    The compound score is -0.765
    The postive score is 0.0
    The Negative score is 0.485
    The Neutral score is 0.515
    Tweet count is 99
    -----------------------------------
    The source is @BBCworld
    The tweet is RT @BBCSteveR: One Russian paper today predicts "increased repression &amp; isolationism" in Vladimir Putin's next Kremlin term; another claims…
    This tweet was tweeted at Fri Jan 19 09:45:31 +0000 2018
    The compound score is -0.0258
    The postive score is 0.158
    The Negative score is 0.118
    The Neutral score is 0.724
    Tweet count is 100
    -----------------------------------
    The source is @CBSnews
    The tweet is Commentary: Why this is the "Trump shutdown" https://t.co/C4R9kFqh4v https://t.co/C4ASgrmOGl
    This tweet was tweeted at Sat Jan 20 20:50:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 1
    -----------------------------------
    The source is @CBSnews
    The tweet is One year after President Trump's inauguration, the #WomensMarch is returning to the streets -- and aiming to become… https://t.co/KWdTINhZk6
    This tweet was tweeted at Sat Jan 20 20:30:37 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 2
    -----------------------------------
    The source is @CBSnews
    The tweet is "We need more time [to negotiate DACA] and that should not be used to put the country through this shutdown," Rep.… https://t.co/54wKUWS3Yu
    This tweet was tweeted at Sat Jan 20 20:14:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 3
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: House Republicans are speaking on Capitol Hill, after OMB Director Mick Mulvaney briefed reporters on t… https://t.co/YVgIzOfajL
    This tweet was tweeted at Sat Jan 20 20:03:47 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 4
    -----------------------------------
    The source is @CBSnews
    The tweet is Turkish jets bomb Kurdish-controlled city of Afrin in northern Syria, as President Recep Tayyip Erdogan promises to… https://t.co/FZcTR4bcC7
    This tweet was tweeted at Sat Jan 20 19:51:01 +0000 2018
    The compound score is -0.1531
    The postive score is 0.119
    The Negative score is 0.147
    The Neutral score is 0.734
    Tweet count is 5
    -----------------------------------
    The source is @CBSnews
    The tweet is "In 2013 we were being asked to vote for something that we did not like,” Mick Mulvaney says. “We have a funding bi… https://t.co/hvOOvgrmBb
    This tweet was tweeted at Sat Jan 20 19:40:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 6
    -----------------------------------
    The source is @CBSnews
    The tweet is "We are taking Davos, both from the president's perspective and the cabinet's perspective, on a day-by-day basis,"… https://t.co/TgHt01afdf
    This tweet was tweeted at Sat Jan 20 19:33:33 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 7
    -----------------------------------
    The source is @CBSnews
    The tweet is "Mr. Schumer is going to have to up his game a little bit and be more honest with the president of the United State… https://t.co/9bvu695hoM
    This tweet was tweeted at Sat Jan 20 19:31:14 +0000 2018
    The compound score is 0.7501
    The postive score is 0.225
    The Negative score is 0.0
    The Neutral score is 0.775
    Tweet count is 8
    -----------------------------------
    The source is @CBSnews
    The tweet is "Early this morning, federal workers got notices from their various agencies as to whether they were exempt or furl… https://t.co/FLQadxn7X9
    This tweet was tweeted at Sat Jan 20 19:26:49 +0000 2018
    The compound score is 0.1027
    The postive score is 0.069
    The Negative score is 0.0
    The Neutral score is 0.931
    Tweet count is 9
    -----------------------------------
    The source is @CBSnews
    The tweet is "We continue to remain anxious to reach a deal on DACA, and we look forward to resuming those negotiations as soon… https://t.co/bM4MtdIMMX
    This tweet was tweeted at Sat Jan 20 19:24:26 +0000 2018
    The compound score is -0.2263
    The postive score is 0.05
    The Negative score is 0.09
    The Neutral score is 0.86
    Tweet count is 10
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: White House officials hold a press briefing to give an update on the government shutdown… https://t.co/h8stKSKayV
    This tweet was tweeted at Sat Jan 20 19:21:11 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 11
    -----------------------------------
    The source is @CBSnews
    The tweet is In his first year in office, President Trump proved to be a singular figure, casting aside norms and traditions:… https://t.co/EolX6C5dZ5
    This tweet was tweeted at Sat Jan 20 19:01:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 12
    -----------------------------------
    The source is @CBSnews
    The tweet is UPDATE: A group of gunmen have launched an attack on the Intercontinental Hotel in Kabul, authorities say; kitchen… https://t.co/kGCgYEFOpc
    This tweet was tweeted at Sat Jan 20 18:41:01 +0000 2018
    The compound score is -0.3818
    The postive score is 0.073
    The Negative score is 0.15
    The Neutral score is 0.777
    Tweet count is 13
    -----------------------------------
    The source is @CBSnews
    The tweet is Paul Bocuse, the master chef who defined French cuisine for nearly half a century and put it on tables around the w… https://t.co/3HhPSWGU4b
    This tweet was tweeted at Sat Jan 20 18:21:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 14
    -----------------------------------
    The source is @CBSnews
    The tweet is Sen. Schumer on meetings with Pres. Trump: "The lunch that seemed so promising was quickly overtaken by hard-right… https://t.co/KTzatzs79T
    This tweet was tweeted at Sat Jan 20 18:08:09 +0000 2018
    The compound score is 0.541
    The postive score is 0.162
    The Negative score is 0.0
    The Neutral score is 0.838
    Tweet count is 15
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: Senate Minority Leader Chuck Schumer holds a press conference amid government shutdown… https://t.co/XGBD5pkqTt
    This tweet was tweeted at Sat Jan 20 18:02:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 16
    -----------------------------------
    The source is @CBSnews
    The tweet is The governor of California once again denies parole for Leslie Van Houten, the youngest follower of Charles Manson… https://t.co/ov9ecXsHeK
    This tweet was tweeted at Sat Jan 20 18:00:01 +0000 2018
    The compound score is -0.4215
    The postive score is 0.0
    The Negative score is 0.135
    The Neutral score is 0.865
    Tweet count is 17
    -----------------------------------
    The source is @CBSnews
    The tweet is 2 Americans and 2 Canadians who were kidnapped in Nigeria on Tuesday have been freed and are in good condition, pol… https://t.co/xhmL25NrxQ
    This tweet was tweeted at Sat Jan 20 17:50:01 +0000 2018
    The compound score is 0.6808
    The postive score is 0.237
    The Negative score is 0.0
    The Neutral score is 0.763
    Tweet count is 18
    -----------------------------------
    The source is @CBSnews
    The tweet is DEVELOPING: At least 4 gunmen launched an attack on the Intercontinental Hotel in Kabul, according to Afghan offici… https://t.co/N5iQJqT6By
    This tweet was tweeted at Sat Jan 20 17:40:01 +0000 2018
    The compound score is -0.3818
    The postive score is 0.073
    The Negative score is 0.15
    The Neutral score is 0.777
    Tweet count is 19
    -----------------------------------
    The source is @CBSnews
    The tweet is Thousands of activists are taking to the streets around the world for the #WomensMarch2018. Here's a look at some o… https://t.co/IwOsLZ8oQt
    This tweet was tweeted at Sat Jan 20 17:30:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 20
    -----------------------------------
    The source is @CBSnews
    The tweet is Commentary: Why this is the "Trump shutdown" https://t.co/C4R9kFqh4v https://t.co/C4ASgrmOGl
    This tweet was tweeted at Sat Jan 20 20:50:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 21
    -----------------------------------
    The source is @CBSnews
    The tweet is One year after President Trump's inauguration, the #WomensMarch is returning to the streets -- and aiming to become… https://t.co/KWdTINhZk6
    This tweet was tweeted at Sat Jan 20 20:30:37 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 22
    -----------------------------------
    The source is @CBSnews
    The tweet is "We need more time [to negotiate DACA] and that should not be used to put the country through this shutdown," Rep.… https://t.co/54wKUWS3Yu
    This tweet was tweeted at Sat Jan 20 20:14:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 23
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: House Republicans are speaking on Capitol Hill, after OMB Director Mick Mulvaney briefed reporters on t… https://t.co/YVgIzOfajL
    This tweet was tweeted at Sat Jan 20 20:03:47 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 24
    -----------------------------------
    The source is @CBSnews
    The tweet is Turkish jets bomb Kurdish-controlled city of Afrin in northern Syria, as President Recep Tayyip Erdogan promises to… https://t.co/FZcTR4bcC7
    This tweet was tweeted at Sat Jan 20 19:51:01 +0000 2018
    The compound score is -0.1531
    The postive score is 0.119
    The Negative score is 0.147
    The Neutral score is 0.734
    Tweet count is 25
    -----------------------------------
    The source is @CBSnews
    The tweet is "In 2013 we were being asked to vote for something that we did not like,” Mick Mulvaney says. “We have a funding bi… https://t.co/hvOOvgrmBb
    This tweet was tweeted at Sat Jan 20 19:40:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 26
    -----------------------------------
    The source is @CBSnews
    The tweet is "We are taking Davos, both from the president's perspective and the cabinet's perspective, on a day-by-day basis,"… https://t.co/TgHt01afdf
    This tweet was tweeted at Sat Jan 20 19:33:33 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 27
    -----------------------------------
    The source is @CBSnews
    The tweet is "Mr. Schumer is going to have to up his game a little bit and be more honest with the president of the United State… https://t.co/9bvu695hoM
    This tweet was tweeted at Sat Jan 20 19:31:14 +0000 2018
    The compound score is 0.7501
    The postive score is 0.225
    The Negative score is 0.0
    The Neutral score is 0.775
    Tweet count is 28
    -----------------------------------
    The source is @CBSnews
    The tweet is "Early this morning, federal workers got notices from their various agencies as to whether they were exempt or furl… https://t.co/FLQadxn7X9
    This tweet was tweeted at Sat Jan 20 19:26:49 +0000 2018
    The compound score is 0.1027
    The postive score is 0.069
    The Negative score is 0.0
    The Neutral score is 0.931
    Tweet count is 29
    -----------------------------------
    The source is @CBSnews
    The tweet is "We continue to remain anxious to reach a deal on DACA, and we look forward to resuming those negotiations as soon… https://t.co/bM4MtdIMMX
    This tweet was tweeted at Sat Jan 20 19:24:26 +0000 2018
    The compound score is -0.2263
    The postive score is 0.05
    The Negative score is 0.09
    The Neutral score is 0.86
    Tweet count is 30
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: White House officials hold a press briefing to give an update on the government shutdown… https://t.co/h8stKSKayV
    This tweet was tweeted at Sat Jan 20 19:21:11 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 31
    -----------------------------------
    The source is @CBSnews
    The tweet is In his first year in office, President Trump proved to be a singular figure, casting aside norms and traditions:… https://t.co/EolX6C5dZ5
    This tweet was tweeted at Sat Jan 20 19:01:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 32
    -----------------------------------
    The source is @CBSnews
    The tweet is UPDATE: A group of gunmen have launched an attack on the Intercontinental Hotel in Kabul, authorities say; kitchen… https://t.co/kGCgYEFOpc
    This tweet was tweeted at Sat Jan 20 18:41:01 +0000 2018
    The compound score is -0.3818
    The postive score is 0.073
    The Negative score is 0.15
    The Neutral score is 0.777
    Tweet count is 33
    -----------------------------------
    The source is @CBSnews
    The tweet is Paul Bocuse, the master chef who defined French cuisine for nearly half a century and put it on tables around the w… https://t.co/3HhPSWGU4b
    This tweet was tweeted at Sat Jan 20 18:21:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 34
    -----------------------------------
    The source is @CBSnews
    The tweet is Sen. Schumer on meetings with Pres. Trump: "The lunch that seemed so promising was quickly overtaken by hard-right… https://t.co/KTzatzs79T
    This tweet was tweeted at Sat Jan 20 18:08:09 +0000 2018
    The compound score is 0.541
    The postive score is 0.162
    The Negative score is 0.0
    The Neutral score is 0.838
    Tweet count is 35
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: Senate Minority Leader Chuck Schumer holds a press conference amid government shutdown… https://t.co/XGBD5pkqTt
    This tweet was tweeted at Sat Jan 20 18:02:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 36
    -----------------------------------
    The source is @CBSnews
    The tweet is The governor of California once again denies parole for Leslie Van Houten, the youngest follower of Charles Manson… https://t.co/ov9ecXsHeK
    This tweet was tweeted at Sat Jan 20 18:00:01 +0000 2018
    The compound score is -0.4215
    The postive score is 0.0
    The Negative score is 0.135
    The Neutral score is 0.865
    Tweet count is 37
    -----------------------------------
    The source is @CBSnews
    The tweet is 2 Americans and 2 Canadians who were kidnapped in Nigeria on Tuesday have been freed and are in good condition, pol… https://t.co/xhmL25NrxQ
    This tweet was tweeted at Sat Jan 20 17:50:01 +0000 2018
    The compound score is 0.6808
    The postive score is 0.237
    The Negative score is 0.0
    The Neutral score is 0.763
    Tweet count is 38
    -----------------------------------
    The source is @CBSnews
    The tweet is DEVELOPING: At least 4 gunmen launched an attack on the Intercontinental Hotel in Kabul, according to Afghan offici… https://t.co/N5iQJqT6By
    This tweet was tweeted at Sat Jan 20 17:40:01 +0000 2018
    The compound score is -0.3818
    The postive score is 0.073
    The Negative score is 0.15
    The Neutral score is 0.777
    Tweet count is 39
    -----------------------------------
    The source is @CBSnews
    The tweet is Thousands of activists are taking to the streets around the world for the #WomensMarch2018. Here's a look at some o… https://t.co/IwOsLZ8oQt
    This tweet was tweeted at Sat Jan 20 17:30:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 40
    -----------------------------------
    The source is @CBSnews
    The tweet is "Like the president, the House, the bipartisan majority of senators, the American people cannot begin to understand… https://t.co/N3wKxBBZO1
    This tweet was tweeted at Sat Jan 20 17:23:58 +0000 2018
    The compound score is 0.3612
    The postive score is 0.128
    The Negative score is 0.0
    The Neutral score is 0.872
    Tweet count is 41
    -----------------------------------
    The source is @CBSnews
    The tweet is Senate Majority Leader Mitch McConnell on Democrats: "These rhetorical gymnastics are simply not persuasive. The Am… https://t.co/O7mSgQhLhS
    This tweet was tweeted at Sat Jan 20 17:19:35 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 42
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: Senate Majority Leader Mitch McConnell speaks on Senate floor amid government shutdown… https://t.co/6ZW0axuzLj
    This tweet was tweeted at Sat Jan 20 17:13:38 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 43
    -----------------------------------
    The source is @CBSnews
    The tweet is The government shutdown may be the first since 2013 -- but it isn't unheard of
    https://t.co/Tg5r4IkVgy https://t.co/Mt117WTmJj
    This tweet was tweeted at Sat Jan 20 17:00:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 44
    -----------------------------------
    The source is @CBSnews
    The tweet is "Consistently, the strategy of the Republican Party has been to take America hostage and shut down the government,"… https://t.co/hlb86FFEAW
    This tweet was tweeted at Sat Jan 20 16:52:23 +0000 2018
    The compound score is 0.4019
    The postive score is 0.13
    The Negative score is 0.0
    The Neutral score is 0.87
    Tweet count is 45
    -----------------------------------
    The source is @CBSnews
    The tweet is "The buck stops here. Happy anniversary, Mr. President, your wish came true. You wanted to shut down -- the Trump s… https://t.co/aymfVeFNuP
    This tweet was tweeted at Sat Jan 20 16:48:17 +0000 2018
    The compound score is 0.8225
    The postive score is 0.319
    The Negative score is 0.056
    The Neutral score is 0.625
    Tweet count is 46
    -----------------------------------
    The source is @CBSnews
    The tweet is President Trump "promised infrastructure. He gave us a train wreck. He promised to love the 'dreamers' from his hea… https://t.co/l13qhK0HrD
    This tweet was tweeted at Sat Jan 20 16:44:48 +0000 2018
    The compound score is 0.743
    The postive score is 0.339
    The Negative score is 0.107
    The Neutral score is 0.554
    Tweet count is 47
    -----------------------------------
    The source is @CBSnews
    The tweet is The Trump administration plans to gut the drug prevention office by slashing more than $340 million from its budget… https://t.co/nCIZIti9dp
    This tweet was tweeted at Sat Jan 20 16:40:01 +0000 2018
    The compound score is -0.2732
    The postive score is 0.0
    The Negative score is 0.1
    The Neutral score is 0.9
    Tweet count is 48
    -----------------------------------
    The source is @CBSnews
    The tweet is "I think the American people smart enough to realize who takes the blame. Republicans control the House, they contr… https://t.co/qDbBbyPnCC
    This tweet was tweeted at Sat Jan 20 16:39:42 +0000 2018
    The compound score is 0.0772
    The postive score is 0.117
    The Negative score is 0.104
    The Neutral score is 0.779
    Tweet count is 49
    -----------------------------------
    The source is @CBSnews
    The tweet is "Republicans struggled in September to keep government doors open. They struggled in December, and yesterday they f… https://t.co/rZ35ATo4jk
    This tweet was tweeted at Sat Jan 20 16:30:59 +0000 2018
    The compound score is -0.5859
    The postive score is 0.0
    The Negative score is 0.231
    The Neutral score is 0.769
    Tweet count is 50
    -----------------------------------
    The source is @CBSnews
    The tweet is WATCH LIVE: House Democratic leadership holds a press conference, just hours after the government shut down at midn… https://t.co/n51vd13VWH
    This tweet was tweeted at Sat Jan 20 16:27:56 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 51
    -----------------------------------
    The source is @CBSnews
    The tweet is “For the first time, I sense a desire, not only to avoid a shutdown, but to find a solution.” Sen. Lindsey Graham s… https://t.co/QPhqpxDdKb
    This tweet was tweeted at Sat Jan 20 16:20:44 +0000 2018
    The compound score is 0.3169
    The postive score is 0.155
    The Negative score is 0.0
    The Neutral score is 0.845
    Tweet count is 52
    -----------------------------------
    The source is @CBSnews
    The tweet is President Trump took to Twitter Saturday morning to blame Democrats for the government shutdown that began hours ea… https://t.co/XpFmfdunfM
    This tweet was tweeted at Sat Jan 20 16:00:01 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.118
    The Neutral score is 0.882
    Tweet count is 53
    -----------------------------------
    The source is @CBSnews
    The tweet is Vice President Mike Pence arrives in Egypt for security and counterterrorism talks, leaving behind the U.S. governm… https://t.co/oIR3d3ESrc
    This tweet was tweeted at Sat Jan 20 15:40:01 +0000 2018
    The compound score is 0.34
    The postive score is 0.124
    The Negative score is 0.0
    The Neutral score is 0.876
    Tweet count is 54
    -----------------------------------
    The source is @CBSnews
    The tweet is Activists are returning to the streets this weekend, hoping to create an enduring political movement that will elec… https://t.co/HXsSJUwqcM
    This tweet was tweeted at Sat Jan 20 15:20:01 +0000 2018
    The compound score is 0.5994
    The postive score is 0.224
    The Negative score is 0.0
    The Neutral score is 0.776
    Tweet count is 55
    -----------------------------------
    The source is @CBSnews
    The tweet is Every January, we hear the word "Davos" thrown around economic, environmental and scientific circles. But what does… https://t.co/KRqDBZzDDT
    This tweet was tweeted at Sat Jan 20 15:00:33 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 56
    -----------------------------------
    The source is @CBSnews
    The tweet is 22 North Korean athletes will compete in the Pyeongchang Olympics and both Korean teams will march together in the… https://t.co/1yn7msbXDG
    This tweet was tweeted at Sat Jan 20 14:40:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 57
    -----------------------------------
    The source is @CBSnews
    The tweet is The federal government stopped operating at midnight, halting all but essential services. What's closed, who is aff… https://t.co/mpmUES641A
    This tweet was tweeted at Sat Jan 20 14:20:01 +0000 2018
    The compound score is -0.1154
    The postive score is 0.0
    The Negative score is 0.079
    The Neutral score is 0.921
    Tweet count is 58
    -----------------------------------
    The source is @CBSnews
    The tweet is What is Davos? https://t.co/UTuTRYTD2A https://t.co/rIacFFDoT7
    This tweet was tweeted at Sat Jan 20 14:03:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 59
    -----------------------------------
    The source is @CBSnews
    The tweet is DOJ to re-try Bob Menendez corruption case, complicating his reelection bid https://t.co/b3NDhPjnC6 https://t.co/0NK6uHEQtw
    This tweet was tweeted at Sat Jan 20 13:48:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 60
    -----------------------------------
    The source is @CBSnews
    The tweet is White House lawyer Ty Cobb says "collusion" is a term popularized by media https://t.co/4bwoVuZ151 https://t.co/62NXtgJZyr
    This tweet was tweeted at Sat Jan 20 13:33:05 +0000 2018
    The compound score is 0.6705
    The postive score is 0.314
    The Negative score is 0.0
    The Neutral score is 0.686
    Tweet count is 61
    -----------------------------------
    The source is @CBSnews
    The tweet is "Jersey Shore" star Mike Sorrentino pleads guilty to tax evasion https://t.co/FzbZCasTGT https://t.co/5ahIuhIgIT
    This tweet was tweeted at Sat Jan 20 13:18:08 +0000 2018
    The compound score is -0.4215
    The postive score is 0.0
    The Negative score is 0.203
    The Neutral score is 0.797
    Tweet count is 62
    -----------------------------------
    The source is @CBSnews
    The tweet is Prosecutors to seek death penalty in Chinese scholar's kidnap, killing https://t.co/Ia9OfDpSNg https://t.co/rxu3kxBDd0
    This tweet was tweeted at Sat Jan 20 13:03:05 +0000 2018
    The compound score is -0.9062
    The postive score is 0.0
    The Negative score is 0.557
    The Neutral score is 0.443
    Tweet count is 63
    -----------------------------------
    The source is @CBSnews
    The tweet is Republicans call for release of memo on alleged surveillance abuses https://t.co/UXapk8eJUe https://t.co/Hd7mT0YFv9
    This tweet was tweeted at Sat Jan 20 12:48:04 +0000 2018
    The compound score is -0.5574
    The postive score is 0.0
    The Negative score is 0.247
    The Neutral score is 0.753
    Tweet count is 64
    -----------------------------------
    The source is @CBSnews
    The tweet is EPA official says Trump needs plan for climate change threat to Superfund sites https://t.co/kiFKksu9Tz https://t.co/Z5g85tRaZl
    This tweet was tweeted at Sat Jan 20 12:33:05 +0000 2018
    The compound score is -0.5267
    The postive score is 0.0
    The Negative score is 0.195
    The Neutral score is 0.805
    Tweet count is 65
    -----------------------------------
    The source is @CBSnews
    The tweet is RT @CBSThisMorning: The White House emphasizes that this is a *partial* shutdown as key federal services including air traffic control, TSA…
    This tweet was tweeted at Sat Jan 20 12:18:45 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 66
    -----------------------------------
    The source is @CBSnews
    The tweet is Chris Hurst, boyfriend of slain journalist Alison Parker, says bill could have prevented girlfriend's death… https://t.co/UzrOw1rgYo
    This tweet was tweeted at Sat Jan 20 12:18:08 +0000 2018
    The compound score is 0.0258
    The postive score is 0.068
    The Negative score is 0.0
    The Neutral score is 0.932
    Tweet count is 67
    -----------------------------------
    The source is @CBSnews
    The tweet is RT @CBSThisMorning: The White House was quick to blame democrats for the shutdown, calling it once again a "Schumer shutdown." A statement…
    This tweet was tweeted at Sat Jan 20 12:09:32 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.112
    The Neutral score is 0.888
    Tweet count is 68
    -----------------------------------
    The source is @CBSnews
    The tweet is RT @CBSThisMorning: Dem. leader Chuck Schumer said he thought he and president Trump made progress on a deal when they met at the White Hou…
    This tweet was tweeted at Sat Jan 20 12:09:03 +0000 2018
    The compound score is 0.4215
    The postive score is 0.109
    The Negative score is 0.0
    The Neutral score is 0.891
    Tweet count is 69
    -----------------------------------
    The source is @CBSnews
    The tweet is RT @CBSThisMorning: The government stopped operating overnight halting all but essential services. This comes after the Senate came ten vot…
    This tweet was tweeted at Sat Jan 20 12:08:55 +0000 2018
    The compound score is -0.1154
    The postive score is 0.0
    The Negative score is 0.071
    The Neutral score is 0.929
    Tweet count is 70
    -----------------------------------
    The source is @CBSnews
    The tweet is Julia Mancuso, four-time Olympic medalist, retires from skiing https://t.co/GaABHzZIQH https://t.co/rqq6QtsqZJ
    This tweet was tweeted at Sat Jan 20 12:03:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 71
    -----------------------------------
    The source is @CBSnews
    The tweet is How to make the most of your higher take-home pay https://t.co/7egu7mi5AF https://t.co/evduaPjhvD
    This tweet was tweeted at Sat Jan 20 11:48:05 +0000 2018
    The compound score is -0.1027
    The postive score is 0.0
    The Negative score is 0.113
    The Neutral score is 0.887
    Tweet count is 72
    -----------------------------------
    The source is @CBSnews
    The tweet is Congestion pricing: Driving in Manhattan could soon cost $11.52 https://t.co/X32FGOtQUA https://t.co/Jsa9nOgWI4
    This tweet was tweeted at Sat Jan 20 11:33:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 73
    -----------------------------------
    The source is @CBSnews
    The tweet is Flu virus killing more than 100 people per week https://t.co/fKeQFg5a9e https://t.co/koCfBdqoym
    This tweet was tweeted at Sat Jan 20 11:18:09 +0000 2018
    The compound score is -0.7906
    The postive score is 0.0
    The Negative score is 0.438
    The Neutral score is 0.562
    Tweet count is 74
    -----------------------------------
    The source is @CBSnews
    The tweet is Ex-coal company CEO who went to prison launches Senate bid https://t.co/Y5vLwU44Sz https://t.co/UU9ixg4BN4
    This tweet was tweeted at Sat Jan 20 11:03:05 +0000 2018
    The compound score is -0.5106
    The postive score is 0.0
    The Negative score is 0.231
    The Neutral score is 0.769
    Tweet count is 75
    -----------------------------------
    The source is @CBSnews
    The tweet is Analysis: VP Mike Pence's Middle East trip meant to highlight evangelical roots https://t.co/0qUv22CQdh https://t.co/rXtnx95CDI
    This tweet was tweeted at Sat Jan 20 10:48:04 +0000 2018
    The compound score is 0.34
    The postive score is 0.156
    The Negative score is 0.0
    The Neutral score is 0.844
    Tweet count is 76
    -----------------------------------
    The source is @CBSnews
    The tweet is One year into Trump's presidency, hundreds of key executive branch positions remain unfilled https://t.co/jYNp8OWVdP https://t.co/8gMBTjgIJc
    This tweet was tweeted at Sat Jan 20 10:33:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 77
    -----------------------------------
    The source is @CBSnews
    The tweet is "House of horrors" parents charged for torture against their 13 children https://t.co/weyyxHfgB9 https://t.co/PaYfG7Lt8P
    This tweet was tweeted at Sat Jan 20 10:18:07 +0000 2018
    The compound score is -0.8555
    The postive score is 0.0
    The Negative score is 0.485
    The Neutral score is 0.515
    Tweet count is 78
    -----------------------------------
    The source is @CBSnews
    The tweet is How savvy teens are making a fortune on Twitter https://t.co/yu4KgHD7ct https://t.co/x8lBRR40QY
    This tweet was tweeted at Sat Jan 20 10:03:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 79
    -----------------------------------
    The source is @CBSnews
    The tweet is Pres. Trump speeds up move of U.S. Embassy to Jerusalem https://t.co/8zvR3KT0H0 https://t.co/r6w56EBsHW
    This tweet was tweeted at Sat Jan 20 09:48:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 80
    -----------------------------------
    The source is @CBSnews
    The tweet is Vladimir Putin takes dip in icy Russian lake waters to celebrate Epiphany https://t.co/cs98maURbR https://t.co/MC7kYDo2vi
    This tweet was tweeted at Sat Jan 20 09:33:04 +0000 2018
    The compound score is 0.5719
    The postive score is 0.222
    The Negative score is 0.0
    The Neutral score is 0.778
    Tweet count is 81
    -----------------------------------
    The source is @CBSnews
    The tweet is Phoenix police say suspected serial killer will likely be linked to more murders https://t.co/UbXrSSVnEZ https://t.co/Vn9eFTp3EF
    This tweet was tweeted at Sat Jan 20 09:18:06 +0000 2018
    The compound score is -0.8883
    The postive score is 0.0
    The Negative score is 0.467
    The Neutral score is 0.533
    Tweet count is 82
    -----------------------------------
    The source is @CBSnews
    The tweet is How a t-shirt, Disney World, and a viral social media post saved a father's life https://t.co/LOZgsHyw3L https://t.co/zhxhLpBHUx
    This tweet was tweeted at Sat Jan 20 09:03:06 +0000 2018
    The compound score is 0.4215
    The postive score is 0.177
    The Negative score is 0.0
    The Neutral score is 0.823
    Tweet count is 83
    -----------------------------------
    The source is @CBSnews
    The tweet is White supremacists committed most extremist killings in U.S. in 2017, watchdog group says https://t.co/BvMrVYCqfA https://t.co/oHqMJdMWo9
    This tweet was tweeted at Sat Jan 20 08:48:05 +0000 2018
    The compound score is -0.6887
    The postive score is 0.101
    The Negative score is 0.325
    The Neutral score is 0.575
    Tweet count is 84
    -----------------------------------
    The source is @CBSnews
    The tweet is Tactical teams test Trump's border wall prototypes with jackhammers, saws and torches https://t.co/zJ6rrDEJg7 https://t.co/V7pXHRJM0J
    This tweet was tweeted at Sat Jan 20 08:33:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 85
    -----------------------------------
    The source is @CBSnews
    The tweet is Report shows Las Vegas gunman's "disturbing" online searches for other crowded venues https://t.co/3KMqcwpJHW https://t.co/YFTmYdW39l
    This tweet was tweeted at Sat Jan 20 08:18:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 86
    -----------------------------------
    The source is @CBSnews
    The tweet is Rapper Kodak Black arrested on weapons, child neglect charges https://t.co/vMVcA5rwzs https://t.co/mgIzGlqMVO
    This tweet was tweeted at Sat Jan 20 08:03:04 +0000 2018
    The compound score is -0.8779
    The postive score is 0.0
    The Negative score is 0.613
    The Neutral score is 0.387
    Tweet count is 87
    -----------------------------------
    The source is @CBSnews
    The tweet is "A bunch of Washington bozos" to blame for government shutdown, Sen. Cory Gardner (R-CO) told @CBSThisMorning on Fr… https://t.co/jrKZxUj0hJ
    This tweet was tweeted at Sat Jan 20 08:00:01 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.118
    The Neutral score is 0.882
    Tweet count is 88
    -----------------------------------
    The source is @CBSnews
    The tweet is Why are we only talking about "Stormy Daniels" now? https://t.co/BVLE39fzL9 https://t.co/FcjP0TNUVg
    This tweet was tweeted at Sat Jan 20 07:48:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 89
    -----------------------------------
    The source is @CBSnews
    The tweet is Mother of patient left in cold says her daughter was denied care https://t.co/S5npJflbAr https://t.co/q7ziHPKFXK
    This tweet was tweeted at Sat Jan 20 07:33:05 +0000 2018
    The compound score is 0.0772
    The postive score is 0.177
    The Negative score is 0.16
    The Neutral score is 0.663
    Tweet count is 90
    -----------------------------------
    The source is @CBSnews
    The tweet is Excitement as early blood test for 8 types of cancer advances https://t.co/CGzjHZjV6Y https://t.co/v9tPEbulpi
    This tweet was tweeted at Sat Jan 20 07:18:08 +0000 2018
    The compound score is -0.296
    The postive score is 0.182
    The Negative score is 0.25
    The Neutral score is 0.568
    Tweet count is 91
    -----------------------------------
    The source is @CBSnews
    The tweet is Cape Town, on verge of running out of water, braces for "chaos" https://t.co/yeBXpbKAy9 https://t.co/yO8oLj8nfl
    This tweet was tweeted at Sat Jan 20 07:03:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 92
    -----------------------------------
    The source is @CBSnews
    The tweet is With the federal government shut down, how will the stoppage impact the U.S. economy? https://t.co/yACezgcpwA https://t.co/8ifciTJHNC
    This tweet was tweeted at Sat Jan 20 07:00:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 93
    -----------------------------------
    The source is @CBSnews
    The tweet is Pope Francis accuses Chile sex abuse victims of slander https://t.co/Ee5VCvBWBj https://t.co/UFPOuezPUR
    This tweet was tweeted at Sat Jan 20 06:48:06 +0000 2018
    The compound score is -0.836
    The postive score is 0.0
    The Negative score is 0.527
    The Neutral score is 0.473
    Tweet count is 94
    -----------------------------------
    The source is @CBSnews
    The tweet is Baby killed, 17 injured after car hits crowd on Rio boardwalk https://t.co/ZuGuqWaihP https://t.co/PurGUTOdN6
    This tweet was tweeted at Sat Jan 20 06:33:05 +0000 2018
    The compound score is -0.802
    The postive score is 0.0
    The Negative score is 0.396
    The Neutral score is 0.604
    Tweet count is 95
    -----------------------------------
    The source is @CBSnews
    The tweet is Delta imposes new rules for service dogs after "serious incidents" https://t.co/c67ImgaJzB https://t.co/FqwJsBytPT
    This tweet was tweeted at Sat Jan 20 06:18:07 +0000 2018
    The compound score is -0.1779
    The postive score is 0.0
    The Negative score is 0.213
    The Neutral score is 0.787
    Tweet count is 96
    -----------------------------------
    The source is @CBSnews
    The tweet is Capitol Lounge, a favorite D.C. spot for Capitol Hill staffers, began advertising drink specials starting at 12:01… https://t.co/vHTS4lUbI6
    This tweet was tweeted at Sat Jan 20 06:07:36 +0000 2018
    The compound score is 0.4588
    The postive score is 0.158
    The Negative score is 0.0
    The Neutral score is 0.842
    Tweet count is 97
    -----------------------------------
    The source is @CBSnews
    The tweet is Texas "Tourniquet Killer" put to death in first execution of 2018 https://t.co/3CtLvcrjFF https://t.co/jt0ELybWiB
    This tweet was tweeted at Sat Jan 20 06:03:06 +0000 2018
    The compound score is -0.8481
    The postive score is 0.0
    The Negative score is 0.427
    The Neutral score is 0.573
    Tweet count is 98
    -----------------------------------
    The source is @CBSnews
    The tweet is After midnight, Senate Majority Leader Mitch McConnell blamed Democrats for "the shoe-horning of illegal immigratio… https://t.co/UUf58zfkBF
    This tweet was tweeted at Sat Jan 20 05:59:07 +0000 2018
    The compound score is -0.7717
    The postive score is 0.0
    The Negative score is 0.324
    The Neutral score is 0.676
    Tweet count is 99
    -----------------------------------
    The source is @CBSnews
    The tweet is “Senate Democrats have let down our troops, our children, and all Americans," House @SpeakerRyan says in statement… https://t.co/CkA6KCk5cy
    This tweet was tweeted at Sat Jan 20 05:45:25 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 100
    -----------------------------------
    The source is @CNN
    The tweet is "Woke" grandma embodies spirit of Women's March https://t.co/Q9q0uWV5uZ https://t.co/5dV4vR0TEU
    This tweet was tweeted at Sat Jan 20 20:45:10 +0000 2018
    The compound score is 0.1779
    The postive score is 0.175
    The Negative score is 0.0
    The Neutral score is 0.825
    Tweet count is 1
    -----------------------------------
    The source is @CNN
    The tweet is Israel and Trump: United against the world https://t.co/T7a6q5pcOW | Analysis by Oren Liebermann https://t.co/HgR4qLKWo2
    This tweet was tweeted at Sat Jan 20 20:30:16 +0000 2018
    The compound score is 0.4215
    The postive score is 0.189
    The Negative score is 0.0
    The Neutral score is 0.811
    Tweet count is 2
    -----------------------------------
    The source is @CNN
    The tweet is Germany limps toward a new government https://t.co/dYF8F78Vt6 https://t.co/KwjUD7BdXN
    This tweet was tweeted at Sat Jan 20 20:15:09 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 3
    -----------------------------------
    The source is @CNN
    The tweet is Why Democrats may be making the wrong bet on the shutdown https://t.co/9VMPD0gFIM https://t.co/Pbw898BNOp
    This tweet was tweeted at Sat Jan 20 20:00:16 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.205
    The Neutral score is 0.795
    Tweet count is 4
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNPolitics: OMB Director Mick Mulvaney says this government shutdown is not like the last one: "We were asked to vote for something in…
    This tweet was tweeted at Sat Jan 20 19:49:40 +0000 2018
    The compound score is -0.2755
    The postive score is 0.0
    The Negative score is 0.084
    The Neutral score is 0.916
    Tweet count is 5
    -----------------------------------
    The source is @CNN
    The tweet is Everything you need to know about the federal government shutdown https://t.co/YixKKQOCVo https://t.co/r6DqfcTrwh
    This tweet was tweeted at Sat Jan 20 19:45:14 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 6
    -----------------------------------
    The source is @CNN
    The tweet is CNN's Jim Acosta: "How does this White House feel to have a shutdown one year after the President was sworn in?"
    
    M… https://t.co/E1InqpaKbX
    This tweet was tweeted at Sat Jan 20 19:43:27 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 7
    -----------------------------------
    The source is @CNN
    The tweet is Office of Management and Budget Director Mick Mulvaney on the shutdown: "We'll manage this day by day"… https://t.co/WBmYBG768q
    This tweet was tweeted at Sat Jan 20 19:41:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 8
    -----------------------------------
    The source is @CNN
    The tweet is “We will not negotiate the status of 690,000 unlawful immigrants while hundreds of millions of taxpaying Americans.… https://t.co/JwwbLwdV8b
    This tweet was tweeted at Sat Jan 20 19:40:15 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 9
    -----------------------------------
    The source is @CNN
    The tweet is We're at the White House press briefing during the first day of the government shutdown. Watch live: https://t.co/nYJk7UIP9H
    This tweet was tweeted at Sat Jan 20 19:38:02 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 10
    -----------------------------------
    The source is @CNN
    The tweet is North Korea is planning to send 22 athletes to the Winter Olympics in South Korea next month. Athletes from the Nor… https://t.co/ZcaVRaLG9G
    This tweet was tweeted at Sat Jan 20 19:30:12 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 11
    -----------------------------------
    The source is @CNN
    The tweet is White House Legislative Affairs Director Marc Short says their position "remains the same": "We will not negotiate"… https://t.co/zTMgdJJjEy
    This tweet was tweeted at Sat Jan 20 19:29:31 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 12
    -----------------------------------
    The source is @CNN
    The tweet is How Trump changed the world in one year https://t.co/BkZjJSytLR | Analysis by Stephen Collinson https://t.co/GlLmNhuub6
    This tweet was tweeted at Sat Jan 20 19:15:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 13
    -----------------------------------
    The source is @CNN
    The tweet is How Trump helped save the Democrats https://t.co/zklKV0i2mJ https://t.co/tyQ8V7oWNE
    This tweet was tweeted at Sat Jan 20 19:00:21 +0000 2018
    The compound score is 0.4939
    The postive score is 0.314
    The Negative score is 0.0
    The Neutral score is 0.686
    Tweet count is 14
    -----------------------------------
    The source is @CNN
    The tweet is Marches and demonstrations to advocate for women's rights and other issues are happening across the country. Follow… https://t.co/3LjJtV55TG
    This tweet was tweeted at Sat Jan 20 18:45:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 15
    -----------------------------------
    The source is @CNN
    The tweet is It's the first day of the government shutdown. Follow CNN's live blog to keep up with the latest updates:… https://t.co/HqvNtfxmUw
    This tweet was tweeted at Sat Jan 20 18:30:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 16
    -----------------------------------
    The source is @CNN
    The tweet is Why you want Amazon to be your new neighbor https://t.co/AtWRSol98F https://t.co/cWzAQ3Ko1J
    This tweet was tweeted at Sat Jan 20 18:15:05 +0000 2018
    The compound score is 0.25
    The postive score is 0.25
    The Negative score is 0.0
    The Neutral score is 0.75
    Tweet count is 17
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNnewsroom: A protester who dubs herself "Woke Grandma" tells CNN's @MarquardtA that she's "marching for true equality, justice and ki…
    This tweet was tweeted at Sat Jan 20 18:10:52 +0000 2018
    The compound score is 0.7351
    The postive score is 0.256
    The Negative score is 0.0
    The Neutral score is 0.744
    Tweet count is 18
    -----------------------------------
    The source is @CNN
    The tweet is One year later, Women's March returns https://t.co/zGFsbA1KUt https://t.co/mQ2jwGZMjs
    This tweet was tweeted at Sat Jan 20 18:00:27 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 19
    -----------------------------------
    The source is @CNN
    The tweet is President Trump privately is saying Democrats caused shutdown, but that he'll be blamed https://t.co/l3xWON9BfL https://t.co/ELsWRkVEt1
    This tweet was tweeted at Sat Jan 20 17:45:05 +0000 2018
    The compound score is -0.631
    The postive score is 0.0
    The Negative score is 0.229
    The Neutral score is 0.771
    Tweet count is 20
    -----------------------------------
    The source is @CNN
    The tweet is "Woke" grandma embodies spirit of Women's March https://t.co/Q9q0uWV5uZ https://t.co/5dV4vR0TEU
    This tweet was tweeted at Sat Jan 20 20:45:10 +0000 2018
    The compound score is 0.1779
    The postive score is 0.175
    The Negative score is 0.0
    The Neutral score is 0.825
    Tweet count is 21
    -----------------------------------
    The source is @CNN
    The tweet is Israel and Trump: United against the world https://t.co/T7a6q5pcOW | Analysis by Oren Liebermann https://t.co/HgR4qLKWo2
    This tweet was tweeted at Sat Jan 20 20:30:16 +0000 2018
    The compound score is 0.4215
    The postive score is 0.189
    The Negative score is 0.0
    The Neutral score is 0.811
    Tweet count is 22
    -----------------------------------
    The source is @CNN
    The tweet is Germany limps toward a new government https://t.co/dYF8F78Vt6 https://t.co/KwjUD7BdXN
    This tweet was tweeted at Sat Jan 20 20:15:09 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 23
    -----------------------------------
    The source is @CNN
    The tweet is Why Democrats may be making the wrong bet on the shutdown https://t.co/9VMPD0gFIM https://t.co/Pbw898BNOp
    This tweet was tweeted at Sat Jan 20 20:00:16 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.205
    The Neutral score is 0.795
    Tweet count is 24
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNPolitics: OMB Director Mick Mulvaney says this government shutdown is not like the last one: "We were asked to vote for something in…
    This tweet was tweeted at Sat Jan 20 19:49:40 +0000 2018
    The compound score is -0.2755
    The postive score is 0.0
    The Negative score is 0.084
    The Neutral score is 0.916
    Tweet count is 25
    -----------------------------------
    The source is @CNN
    The tweet is Everything you need to know about the federal government shutdown https://t.co/YixKKQOCVo https://t.co/r6DqfcTrwh
    This tweet was tweeted at Sat Jan 20 19:45:14 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 26
    -----------------------------------
    The source is @CNN
    The tweet is CNN's Jim Acosta: "How does this White House feel to have a shutdown one year after the President was sworn in?"
    
    M… https://t.co/E1InqpaKbX
    This tweet was tweeted at Sat Jan 20 19:43:27 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 27
    -----------------------------------
    The source is @CNN
    The tweet is Office of Management and Budget Director Mick Mulvaney on the shutdown: "We'll manage this day by day"… https://t.co/WBmYBG768q
    This tweet was tweeted at Sat Jan 20 19:41:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 28
    -----------------------------------
    The source is @CNN
    The tweet is “We will not negotiate the status of 690,000 unlawful immigrants while hundreds of millions of taxpaying Americans.… https://t.co/JwwbLwdV8b
    This tweet was tweeted at Sat Jan 20 19:40:15 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 29
    -----------------------------------
    The source is @CNN
    The tweet is We're at the White House press briefing during the first day of the government shutdown. Watch live: https://t.co/nYJk7UIP9H
    This tweet was tweeted at Sat Jan 20 19:38:02 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 30
    -----------------------------------
    The source is @CNN
    The tweet is North Korea is planning to send 22 athletes to the Winter Olympics in South Korea next month. Athletes from the Nor… https://t.co/ZcaVRaLG9G
    This tweet was tweeted at Sat Jan 20 19:30:12 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 31
    -----------------------------------
    The source is @CNN
    The tweet is White House Legislative Affairs Director Marc Short says their position "remains the same": "We will not negotiate"… https://t.co/zTMgdJJjEy
    This tweet was tweeted at Sat Jan 20 19:29:31 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 32
    -----------------------------------
    The source is @CNN
    The tweet is How Trump changed the world in one year https://t.co/BkZjJSytLR | Analysis by Stephen Collinson https://t.co/GlLmNhuub6
    This tweet was tweeted at Sat Jan 20 19:15:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 33
    -----------------------------------
    The source is @CNN
    The tweet is How Trump helped save the Democrats https://t.co/zklKV0i2mJ https://t.co/tyQ8V7oWNE
    This tweet was tweeted at Sat Jan 20 19:00:21 +0000 2018
    The compound score is 0.4939
    The postive score is 0.314
    The Negative score is 0.0
    The Neutral score is 0.686
    Tweet count is 34
    -----------------------------------
    The source is @CNN
    The tweet is Marches and demonstrations to advocate for women's rights and other issues are happening across the country. Follow… https://t.co/3LjJtV55TG
    This tweet was tweeted at Sat Jan 20 18:45:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 35
    -----------------------------------
    The source is @CNN
    The tweet is It's the first day of the government shutdown. Follow CNN's live blog to keep up with the latest updates:… https://t.co/HqvNtfxmUw
    This tweet was tweeted at Sat Jan 20 18:30:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 36
    -----------------------------------
    The source is @CNN
    The tweet is Why you want Amazon to be your new neighbor https://t.co/AtWRSol98F https://t.co/cWzAQ3Ko1J
    This tweet was tweeted at Sat Jan 20 18:15:05 +0000 2018
    The compound score is 0.25
    The postive score is 0.25
    The Negative score is 0.0
    The Neutral score is 0.75
    Tweet count is 37
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNnewsroom: A protester who dubs herself "Woke Grandma" tells CNN's @MarquardtA that she's "marching for true equality, justice and ki…
    This tweet was tweeted at Sat Jan 20 18:10:52 +0000 2018
    The compound score is 0.7351
    The postive score is 0.256
    The Negative score is 0.0
    The Neutral score is 0.744
    Tweet count is 38
    -----------------------------------
    The source is @CNN
    The tweet is One year later, Women's March returns https://t.co/zGFsbA1KUt https://t.co/mQ2jwGZMjs
    This tweet was tweeted at Sat Jan 20 18:00:27 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 39
    -----------------------------------
    The source is @CNN
    The tweet is President Trump privately is saying Democrats caused shutdown, but that he'll be blamed https://t.co/l3xWON9BfL https://t.co/ELsWRkVEt1
    This tweet was tweeted at Sat Jan 20 17:45:05 +0000 2018
    The compound score is -0.631
    The postive score is 0.0
    The Negative score is 0.229
    The Neutral score is 0.771
    Tweet count is 40
    -----------------------------------
    The source is @CNN
    The tweet is Kidnapped Americans and Canadians have been rescued in Nigeria, police say https://t.co/Jn4Eg4qMJH https://t.co/KY7btXHgaB
    This tweet was tweeted at Sat Jan 20 17:30:06 +0000 2018
    The compound score is 0.4215
    The postive score is 0.189
    The Negative score is 0.0
    The Neutral score is 0.811
    Tweet count is 41
    -----------------------------------
    The source is @CNN
    The tweet is Trump's high-dollar fundraiser at Mar-a-Lago will go on https://t.co/F61PKxsfKx https://t.co/PxP1CmX6Uw
    This tweet was tweeted at Sat Jan 20 17:15:09 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 42
    -----------------------------------
    The source is @CNN
    The tweet is The Women’s March brought millions to the streets for a historic day of protest the day after President Trump’s ina… https://t.co/odnQs6JJ3T
    This tweet was tweeted at Sat Jan 20 17:01:08 +0000 2018
    The compound score is -0.25
    The postive score is 0.0
    The Negative score is 0.095
    The Neutral score is 0.905
    Tweet count is 43
    -----------------------------------
    The source is @CNN
    The tweet is What to expect at the SAG Awards https://t.co/dJHx64g875 https://t.co/XoNjo0Fa6m
    This tweet was tweeted at Sat Jan 20 16:45:04 +0000 2018
    The compound score is 0.4588
    The postive score is 0.273
    The Negative score is 0.0
    The Neutral score is 0.727
    Tweet count is 44
    -----------------------------------
    The source is @CNN
    The tweet is These charts sum up Trump's presidency so far https://t.co/fNWV9TQ3Ru https://t.co/0J0cQHzdpu
    This tweet was tweeted at Sat Jan 20 16:30:24 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 45
    -----------------------------------
    The source is @CNN
    The tweet is Simona Halep wins record Australian Open classic, Maria Sharapova exits https://t.co/yCsio4lU5R https://t.co/wsfE9w4Hxn
    This tweet was tweeted at Sat Jan 20 16:15:13 +0000 2018
    The compound score is 0.5719
    The postive score is 0.252
    The Negative score is 0.0
    The Neutral score is 0.748
    Tweet count is 46
    -----------------------------------
    The source is @CNN
    The tweet is Here are the stories you might have missed amid a busy news week: https://t.co/s4oUmOeyrw https://t.co/fffeezq9IU
    This tweet was tweeted at Sat Jan 20 16:00:13 +0000 2018
    The compound score is -0.296
    The postive score is 0.0
    The Negative score is 0.145
    The Neutral score is 0.855
    Tweet count is 47
    -----------------------------------
    The source is @CNN
    The tweet is Turkish jets hit Syrian town, kicking off air operation https://t.co/N3KgTpux5q https://t.co/P0Pk0bi5sx
    This tweet was tweeted at Sat Jan 20 15:45:14 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 48
    -----------------------------------
    The source is @CNN
    The tweet is Trump's America is caving as autocrats rise https://t.co/5m9M4wvAGJ (via @CNNOpinion) https://t.co/0I48MP7Y8u
    This tweet was tweeted at Sat Jan 20 15:30:11 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 49
    -----------------------------------
    The source is @CNN
    The tweet is German skier pulls off surprise win in classic Kitzbuhel downhill https://t.co/3Xi6rRionJ https://t.co/t8dAD9VEjv
    This tweet was tweeted at Sat Jan 20 15:18:05 +0000 2018
    The compound score is 0.7096
    The postive score is 0.371
    The Negative score is 0.0
    The Neutral score is 0.629
    Tweet count is 50
    -----------------------------------
    The source is @CNN
    The tweet is Renowned French chef Paul Bocuse dies at age 91 https://t.co/q6R2vR17Qu https://t.co/ZT6rhWsarX
    This tweet was tweeted at Sat Jan 20 15:02:13 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 51
    -----------------------------------
    The source is @CNN
    The tweet is The White House slams Democrats as “obstructionist losers” after the Senate fails to avert a government shutdown… https://t.co/1znq49N2JP
    This tweet was tweeted at Sat Jan 20 14:45:14 +0000 2018
    The compound score is -0.5423
    The postive score is 0.0
    The Negative score is 0.231
    The Neutral score is 0.769
    Tweet count is 52
    -----------------------------------
    The source is @CNN
    The tweet is US President Trump is fueling a global assault on democracy, according to a report https://t.co/oqSqrSvbOM
    This tweet was tweeted at Sat Jan 20 14:31:07 +0000 2018
    The compound score is -0.5859
    The postive score is 0.0
    The Negative score is 0.241
    The Neutral score is 0.759
    Tweet count is 53
    -----------------------------------
    The source is @CNN
    The tweet is Shutdown drama shows Washington's failure to lead | Analysis by CNN's Stephen Collinson https://t.co/iZ5vYtWOOk https://t.co/6Ac2TZZUWJ
    This tweet was tweeted at Sat Jan 20 14:15:09 +0000 2018
    The compound score is -0.5106
    The postive score is 0.0
    The Negative score is 0.202
    The Neutral score is 0.798
    Tweet count is 54
    -----------------------------------
    The source is @CNN
    The tweet is A year into Donald Trump's presidency, global confidence in US leadership has fallen to a new low, slipping behind… https://t.co/jTiLL799JA
    This tweet was tweeted at Sat Jan 20 14:00:16 +0000 2018
    The compound score is -0.0772
    The postive score is 0.144
    The Negative score is 0.201
    The Neutral score is 0.655
    Tweet count is 55
    -----------------------------------
    The source is @CNN
    The tweet is From Las Vegas to New York City, here's everything you need to know about women's marches this weekend. You can als… https://t.co/D9a3vdkzp6
    This tweet was tweeted at Sat Jan 20 13:45:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 56
    -----------------------------------
    The source is @CNN
    The tweet is Legislation to prevent the government from shutting down failed in the Senate ahead of the midnight deadline on Fri… https://t.co/yb1d4mV79e
    This tweet was tweeted at Sat Jan 20 13:30:16 +0000 2018
    The compound score is -0.4939
    The postive score is 0.049
    The Negative score is 0.147
    The Neutral score is 0.804
    Tweet count is 57
    -----------------------------------
    The source is @CNN
    The tweet is In the final moments leading up to the midnight deadline, Senate Republicans and Democrats were unable to agree on… https://t.co/1325q5aHKr
    This tweet was tweeted at Sat Jan 20 13:15:07 +0000 2018
    The compound score is 0.3612
    The postive score is 0.116
    The Negative score is 0.0
    The Neutral score is 0.884
    Tweet count is 58
    -----------------------------------
    The source is @CNN
    The tweet is Women who March: The Movement
    
    CNN followed the national organizers of the Women's March over the course of a year,… https://t.co/x9ofR1UIyk
    This tweet was tweeted at Sat Jan 20 13:02:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 59
    -----------------------------------
    The source is @CNN
    The tweet is Can I go to a national park? Will I get my Social Security check? Here’s what you need to know about the government… https://t.co/iHiK1YeZ3P
    This tweet was tweeted at Sat Jan 20 12:49:00 +0000 2018
    The compound score is 0.4137
    The postive score is 0.121
    The Negative score is 0.0
    The Neutral score is 0.879
    Tweet count is 60
    -----------------------------------
    The source is @CNN
    The tweet is Iceland, a major British supermarket chain, has pledged to stop packaging its own products in plastic within five y… https://t.co/iTFWtgvEJq
    This tweet was tweeted at Sat Jan 20 12:31:05 +0000 2018
    The compound score is -0.296
    The postive score is 0.0
    The Negative score is 0.109
    The Neutral score is 0.891
    Tweet count is 61
    -----------------------------------
    The source is @CNN
    The tweet is A driver struck a median at high speed and soared into the second story of an office building in Santa Ana, Califor… https://t.co/iFRaWEth5D
    This tweet was tweeted at Sat Jan 20 12:01:48 +0000 2018
    The compound score is -0.25
    The postive score is 0.0
    The Negative score is 0.091
    The Neutral score is 0.909
    Tweet count is 62
    -----------------------------------
    The source is @CNN
    The tweet is Michael Phelps, the most decorated Olympian of all time, opened up about his battle with depression and said he con… https://t.co/WMKICrIpwm
    This tweet was tweeted at Sat Jan 20 11:31:07 +0000 2018
    The compound score is -0.743
    The postive score is 0.0
    The Negative score is 0.249
    The Neutral score is 0.751
    Tweet count is 63
    -----------------------------------
    The source is @CNN
    The tweet is Government scientists say 2017 was one of the hottest years on record https://t.co/K4ao71hgUE https://t.co/MGpaE1tVRW
    This tweet was tweeted at Sat Jan 20 11:01:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 64
    -----------------------------------
    The source is @CNN
    The tweet is Trump hotels are being swarmed with one-star reviews on Yelp, in which they are described as "shitholes" in referen… https://t.co/zPRaDy3EQY
    This tweet was tweeted at Sat Jan 20 10:31:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 65
    -----------------------------------
    The source is @CNN
    The tweet is "Fake news," "fake polls," "fake media," "fake stories"
    
    President Trump has used the word "fake" more than 400 tim… https://t.co/uu25wOcbHV
    This tweet was tweeted at Sat Jan 20 10:01:06 +0000 2018
    The compound score is -0.9081
    The postive score is 0.0
    The Negative score is 0.437
    The Neutral score is 0.563
    Tweet count is 66
    -----------------------------------
    The source is @CNN
    The tweet is Iceland made it illegal to pay women less than men https://t.co/fxcfMnM3WI https://t.co/JqHmgA2q1X
    This tweet was tweeted at Sat Jan 20 09:31:04 +0000 2018
    The compound score is -0.6124
    The postive score is 0.0
    The Negative score is 0.333
    The Neutral score is 0.667
    Tweet count is 67
    -----------------------------------
    The source is @CNN
    The tweet is Archeologists in Mexico have discovered the world's largest flooded cave. The watery labyrinth spans 216 miles in a… https://t.co/1TvS0h2iSl
    This tweet was tweeted at Sat Jan 20 09:01:24 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 68
    -----------------------------------
    The source is @CNN
    The tweet is Shutdown drama shows Washington's failure to lead | Analysis by CNN's Stephen Collinson https://t.co/EXLtFNss7A https://t.co/6HvILkAlYi
    This tweet was tweeted at Sat Jan 20 08:46:06 +0000 2018
    The compound score is -0.5106
    The postive score is 0.0
    The Negative score is 0.202
    The Neutral score is 0.798
    Tweet count is 69
    -----------------------------------
    The source is @CNN
    The tweet is The Dubai Frame, believed to be the world's largest picture frame, gives visitors a spectacular new vantage point f… https://t.co/nX0KdwUTQw
    This tweet was tweeted at Sat Jan 20 08:46:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 70
    -----------------------------------
    The source is @CNN
    The tweet is Things that might happen if you (or your child) eat laundry pods: difficulty breathing, chemical burns, seizures, f… https://t.co/NdEczDQyuh
    This tweet was tweeted at Sat Jan 20 08:31:03 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.118
    The Neutral score is 0.882
    Tweet count is 71
    -----------------------------------
    The source is @CNN
    The tweet is CVS vows to stop digitally altering the images it uses to sell beauty products https://t.co/m0YPLVgV38 https://t.co/Hlf8JzSWUN
    This tweet was tweeted at Sat Jan 20 08:16:02 +0000 2018
    The compound score is 0.3818
    The postive score is 0.19
    The Negative score is 0.11
    The Neutral score is 0.7
    Tweet count is 72
    -----------------------------------
    The source is @CNN
    The tweet is The flash of light that lit the night sky in Michigan on Tuesday is likely a meteor, the National Weather Service s… https://t.co/4mHqJi8vxd
    This tweet was tweeted at Sat Jan 20 08:02:02 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 73
    -----------------------------------
    The source is @CNN
    The tweet is Walmart is giving away free opioid disposal kits to allow people to safely throw out unused opioid prescription pil… https://t.co/SyQx26mOHw
    This tweet was tweeted at Sat Jan 20 07:46:06 +0000 2018
    The compound score is 0.8689
    The postive score is 0.403
    The Negative score is 0.0
    The Neutral score is 0.597
    Tweet count is 74
    -----------------------------------
    The source is @CNN
    The tweet is President Trump bragged on Twitter that his approval rating with black Americans has doubled. It hasn't.… https://t.co/j7aK2qB3Gx
    This tweet was tweeted at Sat Jan 20 07:31:04 +0000 2018
    The compound score is 0.4767
    The postive score is 0.162
    The Negative score is 0.0
    The Neutral score is 0.838
    Tweet count is 75
    -----------------------------------
    The source is @CNN
    The tweet is The texts loved ones sent during the Hawaii missile alert mishap https://t.co/YgvOlbGaTP https://t.co/m8xr5uJ3no
    This tweet was tweeted at Sat Jan 20 07:16:03 +0000 2018
    The compound score is 0.7269
    The postive score is 0.357
    The Negative score is 0.0
    The Neutral score is 0.643
    Tweet count is 76
    -----------------------------------
    The source is @CNN
    The tweet is A drone came to the rescue of two swimmers off the coast of Australia, hovering above their heads and dropping a po… https://t.co/dgMOO3CsMW
    This tweet was tweeted at Sat Jan 20 07:02:44 +0000 2018
    The compound score is 0.5106
    The postive score is 0.142
    The Negative score is 0.0
    The Neutral score is 0.858
    Tweet count is 77
    -----------------------------------
    The source is @CNN
    The tweet is RT @cnnbrk: "This will be called the Trump Shutdown,” says Senate Democratic leader Chuck Schumer, adding that “blame should crash entirely…
    This tweet was tweeted at Sat Jan 20 06:56:33 +0000 2018
    The compound score is -0.4019
    The postive score is 0.0
    The Negative score is 0.119
    The Neutral score is 0.881
    Tweet count is 78
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNTonight: What a government shutdown means for you https://t.co/V3Qy0uEYWj https://t.co/DS1hPruGxg
    This tweet was tweeted at Sat Jan 20 06:52:50 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 79
    -----------------------------------
    The source is @CNN
    The tweet is President Trump and Sen. Chuck Schumer came close to a deal, but then it fell apart. This is how the day unfolded.… https://t.co/VjMwSENyzU
    This tweet was tweeted at Sat Jan 20 06:51:37 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 80
    -----------------------------------
    The source is @CNN
    The tweet is This wayward wallaby was taken into custody by Australian police after it was spotted hopping along the Sydney Harb… https://t.co/emKbjbUA70
    This tweet was tweeted at Sat Jan 20 06:47:26 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 81
    -----------------------------------
    The source is @CNN
    The tweet is Conditions became so windy in the Netherlands this week that people were being knocked off their feet… https://t.co/KrRXlbCJck
    This tweet was tweeted at Sat Jan 20 06:31:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 82
    -----------------------------------
    The source is @CNN
    The tweet is In the final moments leading up to the midnight deadline, Senate Republicans and Democrats were unable to agree on… https://t.co/UKCzL2KIq6
    This tweet was tweeted at Sat Jan 20 06:19:37 +0000 2018
    The compound score is 0.3612
    The postive score is 0.116
    The Negative score is 0.0
    The Neutral score is 0.884
    Tweet count is 83
    -----------------------------------
    The source is @CNN
    The tweet is North and South Korean athletes will march together at the Winter Olympics opening ceremony under a unified flag… https://t.co/i6Ps7zkoXH
    This tweet was tweeted at Sat Jan 20 06:16:02 +0000 2018
    The compound score is 0.3818
    The postive score is 0.133
    The Negative score is 0.0
    The Neutral score is 0.867
    Tweet count is 84
    -----------------------------------
    The source is @CNN
    The tweet is Legislation to prevent the government from shutting down failed in the Senate ahead of the midnight deadline. Here'… https://t.co/ciFZh6immT
    This tweet was tweeted at Sat Jan 20 06:15:08 +0000 2018
    The compound score is -0.4939
    The postive score is 0.051
    The Negative score is 0.154
    The Neutral score is 0.794
    Tweet count is 85
    -----------------------------------
    The source is @CNN
    The tweet is Holding in a sneeze blew a small hole in a man's throat, according to a report. He spent two weeks in the hospital.… https://t.co/ZJWOwPR7qg
    This tweet was tweeted at Sat Jan 20 06:01:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 86
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNPolitics: McConnell: “I’ll be offering an amendment to change the date to February the 8th” on a continuing resolution https://t.co/…
    This tweet was tweeted at Sat Jan 20 05:51:25 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 87
    -----------------------------------
    The source is @CNN
    The tweet is The White House slams Democrats as "obstructionist losers" https://t.co/yOMV4KsUOD https://t.co/ibMBHZRXvt
    This tweet was tweeted at Sat Jan 20 05:49:38 +0000 2018
    The compound score is -0.5267
    The postive score is 0.0
    The Negative score is 0.274
    The Neutral score is 0.726
    Tweet count is 88
    -----------------------------------
    The source is @CNN
    The tweet is Senate Democratic Leader Chuck Schumer on his meeting with President Trump: “In exchange for strong DACA protection… https://t.co/HMnbMU9HRy
    This tweet was tweeted at Sat Jan 20 05:48:04 +0000 2018
    The compound score is 0.5106
    The postive score is 0.163
    The Negative score is 0.0
    The Neutral score is 0.837
    Tweet count is 89
    -----------------------------------
    The source is @CNN
    The tweet is Schumer: "The blame should crash entirely on Pres. Trump's shoulders. ... This will be called the Trump shutdown be… https://t.co/Liq8jPIrFM
    This tweet was tweeted at Sat Jan 20 05:46:39 +0000 2018
    The compound score is -0.6249
    The postive score is 0.0
    The Negative score is 0.221
    The Neutral score is 0.779
    Tweet count is 90
    -----------------------------------
    The source is @CNN
    The tweet is Apple CEO Tim Cook says the next iOS update will show the health of your phone battery and allow you to disable a s… https://t.co/77ppWW8UWZ
    This tweet was tweeted at Sat Jan 20 05:46:04 +0000 2018
    The compound score is 0.2263
    The postive score is 0.076
    The Negative score is 0.0
    The Neutral score is 0.924
    Tweet count is 91
    -----------------------------------
    The source is @CNN
    The tweet is Sen. Chuck Schumer: "It's not just Democrats who opposed this CR, several Republicans did as well"… https://t.co/Zx5r9Fl5aQ
    This tweet was tweeted at Sat Jan 20 05:32:25 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 92
    -----------------------------------
    The source is @CNN
    The tweet is L'Oreal Paris is breaking barriers and making history by featuring a hijab-wearing woman in a hair campaign… https://t.co/ajqQvUUEm9
    This tweet was tweeted at Sat Jan 20 05:31:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 93
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNPolitics: Senate Majority Leader Mitch McConnell: “What we have just witnessed on the floor was a cynical decision by Senate Democra…
    This tweet was tweeted at Sat Jan 20 05:29:09 +0000 2018
    The compound score is -0.3818
    The postive score is 0.0
    The Negative score is 0.115
    The Neutral score is 0.885
    Tweet count is 94
    -----------------------------------
    The source is @CNN
    The tweet is Sen. Mitch McConnell blames Democrats for the government shutdown: "I think our friends on the other side took some… https://t.co/Wb69iqZAwz
    This tweet was tweeted at Sat Jan 20 05:28:54 +0000 2018
    The compound score is 0.1027
    The postive score is 0.13
    The Negative score is 0.113
    The Neutral score is 0.756
    Tweet count is 95
    -----------------------------------
    The source is @CNN
    The tweet is Sen. Mitch McConnell "The government shutdown was 100% avoidable" https://t.co/zvXAezSny7 https://t.co/W3ff7jldn2
    This tweet was tweeted at Sat Jan 20 05:25:59 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 96
    -----------------------------------
    The source is @CNN
    The tweet is White House press secretary Sarah Sanders has issued an official statement reacting to the government shutdown… https://t.co/7MsN8KlzvR
    This tweet was tweeted at Sat Jan 20 05:24:25 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 97
    -----------------------------------
    The source is @CNN
    The tweet is RT @CNNPolitics: The government shuts down as lawmakers still search for a deal. 
    
    It's the first modern government shutdown with Congress…
    This tweet was tweeted at Sat Jan 20 05:17:24 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 98
    -----------------------------------
    The source is @CNN
    The tweet is YouTube and Facebook are trying to stop the spread of the Tide Pod Challenge, a bizarre and dangerous online craze… https://t.co/Yc1F9KBHoL
    This tweet was tweeted at Sat Jan 20 05:16:03 +0000 2018
    The compound score is -0.743
    The postive score is 0.052
    The Negative score is 0.305
    The Neutral score is 0.643
    Tweet count is 99
    -----------------------------------
    The source is @CNN
    The tweet is The federal government shut down at midnight as senators continued to scramble to reach a deal to fund the governme… https://t.co/LAqzmi4fEh
    This tweet was tweeted at Sat Jan 20 05:12:08 +0000 2018
    The compound score is 0.0258
    The postive score is 0.055
    The Negative score is 0.0
    The Neutral score is 0.945
    Tweet count is 100
    -----------------------------------
    The source is @Foxnews
    The tweet is Maine town manager under fire for promoting white separatism, criticizing Islam https://t.co/VtgRVc4rv8
    This tweet was tweeted at Sat Jan 20 20:55:18 +0000 2018
    The compound score is -0.34
    The postive score is 0.152
    The Negative score is 0.299
    The Neutral score is 0.549
    Tweet count is 1
    -----------------------------------
    The source is @Foxnews
    The tweet is Gunmen attack Kabul's Intercontinental Hotel https://t.co/iKftCfl067
    This tweet was tweeted at Sat Jan 20 20:55:12 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.383
    The Neutral score is 0.617
    Tweet count is 2
    -----------------------------------
    The source is @Foxnews
    The tweet is A show of solidarity around the world marks 2018 #WomensMarch https://t.co/IJ0mbi5FwJ
    This tweet was tweeted at Sat Jan 20 20:55:07 +0000 2018
    The compound score is 0.296
    The postive score is 0.196
    The Negative score is 0.0
    The Neutral score is 0.804
    Tweet count is 3
    -----------------------------------
    The source is @Foxnews
    The tweet is DC lawmakers dig their heels in, point fingers as government shutdown rolls on https://t.co/omDiWo5Uin
    This tweet was tweeted at Sat Jan 20 20:54:48 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 4
    -----------------------------------
    The source is @Foxnews
    The tweet is .@garybsmith: "The market shrugs off a #shutdown." https://t.co/NcZ6690mXK
    This tweet was tweeted at Sat Jan 20 20:44:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 5
    -----------------------------------
    The source is @Foxnews
    The tweet is U.S. markets - @POTUS's first year. https://t.co/HgX0oz1R8Z
    This tweet was tweeted at Sat Jan 20 20:40:16 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 6
    -----------------------------------
    The source is @Foxnews
    The tweet is U.S. markets - this week. https://t.co/UYaqcCI3VL
    This tweet was tweeted at Sat Jan 20 20:37:57 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 7
    -----------------------------------
    The source is @Foxnews
    The tweet is .@davidwebbshow: "Let's look at the calendar. It's January 20th. DACA expires on March 5th. That means this was a c… https://t.co/zkg4p0M3EY
    This tweet was tweeted at Sat Jan 20 20:36:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 8
    -----------------------------------
    The source is @Foxnews
    The tweet is Poll Average: Democrats lead Republicans 46% to 38.3% in 2018 generic Congressional vote. https://t.co/WF3r3od4LI
    This tweet was tweeted at Sat Jan 20 20:30:51 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 9
    -----------------------------------
    The source is @Foxnews
    The tweet is Poll Average: 55.2% disapprove of @POTUS. https://t.co/CV6M0nFTKa
    This tweet was tweeted at Sat Jan 20 20:28:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 10
    -----------------------------------
    The source is @Foxnews
    The tweet is TOMORROW on @FoxNewsSunday, Chris Wallace talks to @MickMulvaneyOMB - Tune in at 2p &amp; 10p ET on Fox News Channel! https://t.co/vHIDxiR2Sl
    This tweet was tweeted at Sat Jan 20 20:26:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 11
    -----------------------------------
    The source is @Foxnews
    The tweet is This morning, @FLOTUS Melania Trump tweeted about her first year as First Lady. https://t.co/VHwVgnD6HD
    This tweet was tweeted at Sat Jan 20 20:24:43 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 12
    -----------------------------------
    The source is @Foxnews
    The tweet is Protests mark first anniversary of @POTUS's inauguration. For full live coverage, tune in to Fox News Channel. https://t.co/qCx5uJRBcg
    This tweet was tweeted at Sat Jan 20 20:22:05 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.101
    The Neutral score is 0.899
    Tweet count is 13
    -----------------------------------
    The source is @Foxnews
    The tweet is James Comey to teach course on "ethical leadership." https://t.co/ez1rGiVGVq
    This tweet was tweeted at Sat Jan 20 20:21:08 +0000 2018
    The compound score is 0.5106
    The postive score is 0.292
    The Negative score is 0.0
    The Neutral score is 0.708
    Tweet count is 14
    -----------------------------------
    The source is @Foxnews
    The tweet is SCOTUS to rule on legality of travel ban. https://t.co/rWZ8u3dCDK https://t.co/rzPyduY77o
    This tweet was tweeted at Sat Jan 20 20:17:34 +0000 2018
    The compound score is -0.5574
    The postive score is 0.0
    The Negative score is 0.286
    The Neutral score is 0.714
    Tweet count is 15
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "[@TheDemocrats] made the choice to shut the government down. To deny our troops their pay."… https://t.co/5TlogfBY9j
    This tweet was tweeted at Sat Jan 20 20:16:02 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.13
    The Neutral score is 0.87
    Tweet count is 16
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "They made the choice to shut the government down. To deny our troops their pay." #shutdown https://t.co/jCLuz9qjFP
    This tweet was tweeted at Sat Jan 20 20:12:15 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.124
    The Neutral score is 0.876
    Tweet count is 17
    -----------------------------------
    The source is @Foxnews
    The tweet is .@RepAndyBarr: "@SenSchumer, where is your heart? @SenSchumer, where is your head?" #Shutdown #Shutdown2018 https://t.co/adngFYXn2g
    This tweet was tweeted at Sat Jan 20 20:11:35 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 18
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenatorBlumenthal: "I look forward to marching and running and fighting with you." https://t.co/Dax5ilRqSJ https://t.co/Z5bVkKxeNt
    This tweet was tweeted at Sat Jan 20 20:09:12 +0000 2018
    The compound score is -0.3612
    The postive score is 0.0
    The Negative score is 0.161
    The Neutral score is 0.839
    Tweet count is 19
    -----------------------------------
    The source is @Foxnews
    The tweet is Protesters hold rally in Dallas calling for @POTUS's impeachment; @caseystegall reports. https://t.co/0LyD4HL4cS
    This tweet was tweeted at Sat Jan 20 20:08:14 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.147
    The Neutral score is 0.853
    Tweet count is 20
    -----------------------------------
    The source is @Foxnews
    The tweet is Maine town manager under fire for promoting white separatism, criticizing Islam https://t.co/VtgRVc4rv8
    This tweet was tweeted at Sat Jan 20 20:55:18 +0000 2018
    The compound score is -0.34
    The postive score is 0.152
    The Negative score is 0.299
    The Neutral score is 0.549
    Tweet count is 21
    -----------------------------------
    The source is @Foxnews
    The tweet is Gunmen attack Kabul's Intercontinental Hotel https://t.co/iKftCfl067
    This tweet was tweeted at Sat Jan 20 20:55:12 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.383
    The Neutral score is 0.617
    Tweet count is 22
    -----------------------------------
    The source is @Foxnews
    The tweet is A show of solidarity around the world marks 2018 #WomensMarch https://t.co/IJ0mbi5FwJ
    This tweet was tweeted at Sat Jan 20 20:55:07 +0000 2018
    The compound score is 0.296
    The postive score is 0.196
    The Negative score is 0.0
    The Neutral score is 0.804
    Tweet count is 23
    -----------------------------------
    The source is @Foxnews
    The tweet is DC lawmakers dig their heels in, point fingers as government shutdown rolls on https://t.co/omDiWo5Uin
    This tweet was tweeted at Sat Jan 20 20:54:48 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 24
    -----------------------------------
    The source is @Foxnews
    The tweet is .@garybsmith: "The market shrugs off a #shutdown." https://t.co/NcZ6690mXK
    This tweet was tweeted at Sat Jan 20 20:44:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 25
    -----------------------------------
    The source is @Foxnews
    The tweet is U.S. markets - @POTUS's first year. https://t.co/HgX0oz1R8Z
    This tweet was tweeted at Sat Jan 20 20:40:16 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 26
    -----------------------------------
    The source is @Foxnews
    The tweet is U.S. markets - this week. https://t.co/UYaqcCI3VL
    This tweet was tweeted at Sat Jan 20 20:37:57 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 27
    -----------------------------------
    The source is @Foxnews
    The tweet is .@davidwebbshow: "Let's look at the calendar. It's January 20th. DACA expires on March 5th. That means this was a c… https://t.co/zkg4p0M3EY
    This tweet was tweeted at Sat Jan 20 20:36:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 28
    -----------------------------------
    The source is @Foxnews
    The tweet is Poll Average: Democrats lead Republicans 46% to 38.3% in 2018 generic Congressional vote. https://t.co/WF3r3od4LI
    This tweet was tweeted at Sat Jan 20 20:30:51 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 29
    -----------------------------------
    The source is @Foxnews
    The tweet is Poll Average: 55.2% disapprove of @POTUS. https://t.co/CV6M0nFTKa
    This tweet was tweeted at Sat Jan 20 20:28:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 30
    -----------------------------------
    The source is @Foxnews
    The tweet is TOMORROW on @FoxNewsSunday, Chris Wallace talks to @MickMulvaneyOMB - Tune in at 2p &amp; 10p ET on Fox News Channel! https://t.co/vHIDxiR2Sl
    This tweet was tweeted at Sat Jan 20 20:26:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 31
    -----------------------------------
    The source is @Foxnews
    The tweet is This morning, @FLOTUS Melania Trump tweeted about her first year as First Lady. https://t.co/VHwVgnD6HD
    This tweet was tweeted at Sat Jan 20 20:24:43 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 32
    -----------------------------------
    The source is @Foxnews
    The tweet is Protests mark first anniversary of @POTUS's inauguration. For full live coverage, tune in to Fox News Channel. https://t.co/qCx5uJRBcg
    This tweet was tweeted at Sat Jan 20 20:22:05 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.101
    The Neutral score is 0.899
    Tweet count is 33
    -----------------------------------
    The source is @Foxnews
    The tweet is James Comey to teach course on "ethical leadership." https://t.co/ez1rGiVGVq
    This tweet was tweeted at Sat Jan 20 20:21:08 +0000 2018
    The compound score is 0.5106
    The postive score is 0.292
    The Negative score is 0.0
    The Neutral score is 0.708
    Tweet count is 34
    -----------------------------------
    The source is @Foxnews
    The tweet is SCOTUS to rule on legality of travel ban. https://t.co/rWZ8u3dCDK https://t.co/rzPyduY77o
    This tweet was tweeted at Sat Jan 20 20:17:34 +0000 2018
    The compound score is -0.5574
    The postive score is 0.0
    The Negative score is 0.286
    The Neutral score is 0.714
    Tweet count is 35
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "[@TheDemocrats] made the choice to shut the government down. To deny our troops their pay."… https://t.co/5TlogfBY9j
    This tweet was tweeted at Sat Jan 20 20:16:02 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.13
    The Neutral score is 0.87
    Tweet count is 36
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "They made the choice to shut the government down. To deny our troops their pay." #shutdown https://t.co/jCLuz9qjFP
    This tweet was tweeted at Sat Jan 20 20:12:15 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.124
    The Neutral score is 0.876
    Tweet count is 37
    -----------------------------------
    The source is @Foxnews
    The tweet is .@RepAndyBarr: "@SenSchumer, where is your heart? @SenSchumer, where is your head?" #Shutdown #Shutdown2018 https://t.co/adngFYXn2g
    This tweet was tweeted at Sat Jan 20 20:11:35 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 38
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenatorBlumenthal: "I look forward to marching and running and fighting with you." https://t.co/Dax5ilRqSJ https://t.co/Z5bVkKxeNt
    This tweet was tweeted at Sat Jan 20 20:09:12 +0000 2018
    The compound score is -0.3612
    The postive score is 0.0
    The Negative score is 0.161
    The Neutral score is 0.839
    Tweet count is 39
    -----------------------------------
    The source is @Foxnews
    The tweet is Protesters hold rally in Dallas calling for @POTUS's impeachment; @caseystegall reports. https://t.co/0LyD4HL4cS
    This tweet was tweeted at Sat Jan 20 20:08:14 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.147
    The Neutral score is 0.853
    Tweet count is 40
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "They made the choice to shut the government down. To deny our troops their pay." #shutdown https://t.co/U81EYvzFHK
    This tweet was tweeted at Sat Jan 20 20:03:40 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.124
    The Neutral score is 0.876
    Tweet count is 41
    -----------------------------------
    The source is @Foxnews
    The tweet is .@cathymcmorris: "This shutdown of the government is completely unnecessary." https://t.co/VikkOlvapv
    This tweet was tweeted at Sat Jan 20 20:03:01 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 42
    -----------------------------------
    The source is @Foxnews
    The tweet is Moments ago, President @realDonaldTrump tweeted about the #WomensMarch. https://t.co/TTme6n7mbZ https://t.co/9yjHvSiInl
    This tweet was tweeted at Sat Jan 20 19:52:21 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 43
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MickMulvaneyOMB: "In 2013, we were being asked to vote for something we did not like." https://t.co/ic3RdmvM63
    This tweet was tweeted at Sat Jan 20 19:34:29 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 44
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MickMulvaneyOMB: "The Democrats in the Senate could end this #shutdown today." https://t.co/jvYoSvxY4p
    This tweet was tweeted at Sat Jan 20 19:30:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 45
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MickMulvaneyOMB: "Mr. Schumer's going to have to up his game a little bit and be a little more honest with the Pr… https://t.co/kTtj6Oltia
    This tweet was tweeted at Sat Jan 20 19:29:42 +0000 2018
    The compound score is 0.513
    The postive score is 0.142
    The Negative score is 0.0
    The Neutral score is 0.858
    Tweet count is 46
    -----------------------------------
    The source is @Foxnews
    The tweet is .@Marcshort45: "The @WhiteHouse remains the same: that we will not negotiate the status of 690,000 unlawful immigra… https://t.co/WhX4XGRdvM
    This tweet was tweeted at Sat Jan 20 19:28:25 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 47
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MickMulvaneyOMB: "My favorite is still the #SchumerShutdown." #Shutdown https://t.co/2L1SDNR30z
    This tweet was tweeted at Sat Jan 20 19:27:59 +0000 2018
    The compound score is 0.4588
    The postive score is 0.273
    The Negative score is 0.0
    The Neutral score is 0.727
    Tweet count is 48
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MickMulvaneyOMB: "The CDC has announced this morning they will continue immediate response work." #shutdown https://t.co/TeADi6xjGl
    This tweet was tweeted at Sat Jan 20 19:27:10 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 49
    -----------------------------------
    The source is @Foxnews
    The tweet is .@Marcshort45: "The @WhiteHouse remains the same: that we will not negotiate the status of 690,000 unlawful immigra… https://t.co/hNqbJ8irz3
    This tweet was tweeted at Sat Jan 20 19:22:51 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 50
    -----------------------------------
    The source is @Foxnews
    The tweet is .@Marcshort45: "We stand here ready to sign the bill that the House passed last night, anxious to... reopen the gov… https://t.co/AHT4l317vt
    This tweet was tweeted at Sat Jan 20 19:21:52 +0000 2018
    The compound score is 0.128
    The postive score is 0.106
    The Negative score is 0.085
    The Neutral score is 0.809
    Tweet count is 51
    -----------------------------------
    The source is @Foxnews
    The tweet is .@Marcshort45: "This morning, @POTUS has spoken to @SenateMajLdr, @SpeakerRyan, @GOPLeader... He also spoke with Se… https://t.co/rh7aJx5FRH
    This tweet was tweeted at Sat Jan 20 19:21:00 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 52
    -----------------------------------
    The source is @Foxnews
    The tweet is News Alert: Awaiting @WhiteHouse briefing on government shutdown. https://t.co/tdXZl57U6F
    This tweet was tweeted at Sat Jan 20 19:19:46 +0000 2018
    The compound score is 0.296
    The postive score is 0.216
    The Negative score is 0.0
    The Neutral score is 0.784
    Tweet count is 53
    -----------------------------------
    The source is @Foxnews
    The tweet is Lawmakers point fingers as government shuts down and #WomensMarch take place nationwide - for full live coverage, t… https://t.co/4VcameY5PV
    This tweet was tweeted at Sat Jan 20 19:17:59 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 54
    -----------------------------------
    The source is @Foxnews
    The tweet is Moments ago, President @realDonaldTrump tweeted about the #WomensMarch. https://t.co/TTme6n7mbZ https://t.co/lYxwQCgkiO
    This tweet was tweeted at Sat Jan 20 19:14:09 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 55
    -----------------------------------
    The source is @Foxnews
    The tweet is .@timkaine: "Women deserve to be heard. Women deserve to be respected. Women deserve to lead." #WomensMarch… https://t.co/vDou7taBE7
    This tweet was tweeted at Sat Jan 20 19:12:55 +0000 2018
    The compound score is 0.4767
    The postive score is 0.162
    The Negative score is 0.0
    The Neutral score is 0.838
    Tweet count is 56
    -----------------------------------
    The source is @Foxnews
    The tweet is .@JenKernsUSA: Women’s March -- Are we watching a movement or just group therapy for Trump haters? https://t.co/TzORLKoqOW
    This tweet was tweeted at Sat Jan 20 19:08:08 +0000 2018
    The compound score is -0.4939
    The postive score is 0.0
    The Negative score is 0.176
    The Neutral score is 0.824
    Tweet count is 57
    -----------------------------------
    The source is @Foxnews
    The tweet is Trump accuses Democrats of 'holding our Military hostage' over shutdown impasse https://t.co/bl5NIe7eDU
    This tweet was tweeted at Sat Jan 20 19:02:19 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.179
    The Neutral score is 0.821
    Tweet count is 58
    -----------------------------------
    The source is @Foxnews
    The tweet is The Capitol and Washington Monument are seen as Women's March demonstrators line the Reflecting Pool at the Lincoln… https://t.co/Ub7OesH0ag
    This tweet was tweeted at Sat Jan 20 18:47:19 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 59
    -----------------------------------
    The source is @Foxnews
    The tweet is .@VP: "The United States stands shoulder-to-shoulder with Egypt in their fight against terrorism." https://t.co/cOshhY1Y3O
    This tweet was tweeted at Sat Jan 20 18:43:58 +0000 2018
    The compound score is 0.0516
    The postive score is 0.161
    The Negative score is 0.149
    The Neutral score is 0.69
    Tweet count is 60
    -----------------------------------
    The source is @Foxnews
    The tweet is A boy with Down syndrome became a basketball star after he scored a basket as his team cheered him on. https://t.co/7YJjMQmtoC
    This tweet was tweeted at Sat Jan 20 18:39:12 +0000 2018
    The compound score is 0.5106
    The postive score is 0.163
    The Negative score is 0.0
    The Neutral score is 0.837
    Tweet count is 61
    -----------------------------------
    The source is @Foxnews
    The tweet is Maine town manager under fire for promoting white separatism, criticizing Islam https://t.co/4gh0we1ZCX
    This tweet was tweeted at Sat Jan 20 18:32:51 +0000 2018
    The compound score is -0.34
    The postive score is 0.152
    The Negative score is 0.299
    The Neutral score is 0.549
    Tweet count is 62
    -----------------------------------
    The source is @Foxnews
    The tweet is First lady Melania Trump says first year has been 'filled with many wonderful moments' https://t.co/w32bTZ4CaV
    This tweet was tweeted at Sat Jan 20 18:14:40 +0000 2018
    The compound score is 0.5719
    The postive score is 0.209
    The Negative score is 0.0
    The Neutral score is 0.791
    Tweet count is 63
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenSchumer: "This is the Trump shutdown, only the president can end it. We Democrats are at the table, we're read… https://t.co/FvbiPVTi09
    This tweet was tweeted at Sat Jan 20 18:09:54 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 64
    -----------------------------------
    The source is @Foxnews
    The tweet is TONIGHT on @GregGutfeldShow, @greggutfeld talks North Korea and fake news - Tune in at 10p ET on Fox News Channel! https://t.co/gQ5HeUFgRE
    This tweet was tweeted at Sat Jan 20 18:06:33 +0000 2018
    The compound score is -0.5255
    The postive score is 0.0
    The Negative score is 0.151
    The Neutral score is 0.849
    Tweet count is 65
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenSchumer: "Negotiating with this White House is like negotiating with jello, it's next to impossible." https://t.co/bNNJHOckUA
    This tweet was tweeted at Sat Jan 20 18:04:46 +0000 2018
    The compound score is 0.3612
    The postive score is 0.143
    The Negative score is 0.0
    The Neutral score is 0.857
    Tweet count is 66
    -----------------------------------
    The source is @Foxnews
    The tweet is JUST IN: Gunmen reportedly attack Kabul's Intercontinental Hotel https://t.co/arAMKRkHv4
    This tweet was tweeted at Sat Jan 20 17:59:36 +0000 2018
    The compound score is -0.4767
    The postive score is 0.0
    The Negative score is 0.279
    The Neutral score is 0.721
    Tweet count is 67
    -----------------------------------
    The source is @Foxnews
    The tweet is On @foxandfriends, @DiamondandSilk responded to news that former President @BarackObama was planning to campaign fo… https://t.co/gtw0XmUtVF
    This tweet was tweeted at Sat Jan 20 17:53:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 68
    -----------------------------------
    The source is @Foxnews
    The tweet is People line up for a march highlighting equal rights and equality for women. The march New York was among more than… https://t.co/3eVLMWCsat
    This tweet was tweeted at Sat Jan 20 17:48:18 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 69
    -----------------------------------
    The source is @Foxnews
    The tweet is Take a look back at some of the president's top successes from 2017. https://t.co/pN8rmca2Ni
    This tweet was tweeted at Sat Jan 20 17:43:33 +0000 2018
    The compound score is 0.6597
    The postive score is 0.329
    The Negative score is 0.0
    The Neutral score is 0.671
    Tweet count is 70
    -----------------------------------
    The source is @Foxnews
    The tweet is OPINION: @drmannyonFOX: Government shutdown hurts our veterans -- They deserve better https://t.co/I2PujIFXyW
    This tweet was tweeted at Sat Jan 20 17:41:47 +0000 2018
    The compound score is -0.0516
    The postive score is 0.181
    The Negative score is 0.194
    The Neutral score is 0.625
    Tweet count is 71
    -----------------------------------
    The source is @Foxnews
    The tweet is 'Piece of Garbage': Michael Dukakis Rips Tax Law, Blasts Wall Proposal https://t.co/L7Yv9iVPxw
    This tweet was tweeted at Sat Jan 20 17:36:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 72
    -----------------------------------
    The source is @Foxnews
    The tweet is .@chuckschumer: "The Republicans control the White House, the Senate, the House, that's why America and the world a… https://t.co/Vdc1DDyhgd
    This tweet was tweeted at Sat Jan 20 17:35:26 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 73
    -----------------------------------
    The source is @Foxnews
    The tweet is OPINION: First lady Melania Trump marks first year with grace and dignity https://t.co/L35WPkUdTw
    This tweet was tweeted at Sat Jan 20 17:23:18 +0000 2018
    The compound score is 0.6705
    The postive score is 0.333
    The Negative score is 0.0
    The Neutral score is 0.667
    Tweet count is 74
    -----------------------------------
    The source is @Foxnews
    The tweet is .@RajShah45: "We're not going to negotiate the status of hundreds of thousands of people here unlawfully while the… https://t.co/jgbGEVi3Nz
    This tweet was tweeted at Sat Jan 20 17:14:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 75
    -----------------------------------
    The source is @Foxnews
    The tweet is OPINION: Trump's first year had round-the-clock journalistic insanity -- Here are 2017's most outrageous media mome… https://t.co/tKhXMYPdK8
    This tweet was tweeted at Sat Jan 20 17:03:17 +0000 2018
    The compound score is -0.7902
    The postive score is 0.0
    The Negative score is 0.318
    The Neutral score is 0.682
    Tweet count is 76
    -----------------------------------
    The source is @Foxnews
    The tweet is .@Theismann7 on anthem protests: "That flag represents something very special in this country... I think it's disre… https://t.co/eQxNhJtOGa
    This tweet was tweeted at Sat Jan 20 16:54:21 +0000 2018
    The compound score is 0.2716
    The postive score is 0.15
    The Negative score is 0.096
    The Neutral score is 0.754
    Tweet count is 77
    -----------------------------------
    The source is @Foxnews
    The tweet is Ben Stein: "It shocks me that Democrats would close the government down when government spending on defense is so u… https://t.co/RtybU8MCq8
    This tweet was tweeted at Sat Jan 20 16:52:02 +0000 2018
    The compound score is -0.2732
    The postive score is 0.065
    The Negative score is 0.113
    The Neutral score is 0.823
    Tweet count is 78
    -----------------------------------
    The source is @Foxnews
    The tweet is Moments ago, @FLOTUS tweeted about her first year as First Lady of the United States https://t.co/s1QAQbpTD0
    This tweet was tweeted at Sat Jan 20 16:29:01 +0000 2018
    The compound score is 0.4215
    The postive score is 0.157
    The Negative score is 0.0
    The Neutral score is 0.843
    Tweet count is 79
    -----------------------------------
    The source is @Foxnews
    The tweet is Michael Dukakis: "I think we have a great opportunity to take over the House and make gains in the Senate." https://t.co/HP0TITqg0L
    This tweet was tweeted at Sat Jan 20 16:23:43 +0000 2018
    The compound score is 0.8519
    The postive score is 0.354
    The Negative score is 0.0
    The Neutral score is 0.646
    Tweet count is 80
    -----------------------------------
    The source is @Foxnews
    The tweet is Protests Mark One Year Anniversary of Trump Administration https://t.co/9Hl9O8Teh1
    This tweet was tweeted at Sat Jan 20 16:14:34 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.192
    The Neutral score is 0.808
    Tweet count is 81
    -----------------------------------
    The source is @Foxnews
    The tweet is OPINION: Want your kids to talk to you? Try this... https://t.co/PXVFT3wciB
    This tweet was tweeted at Sat Jan 20 16:10:57 +0000 2018
    The compound score is 0.0772
    The postive score is 0.115
    The Negative score is 0.0
    The Neutral score is 0.885
    Tweet count is 82
    -----------------------------------
    The source is @Foxnews
    The tweet is Charles Manson supporter Leslie Van Houten denied parole again by California governor https://t.co/BQirQVHqbK
    This tweet was tweeted at Sat Jan 20 16:08:08 +0000 2018
    The compound score is -0.2023
    The postive score is 0.131
    The Negative score is 0.181
    The Neutral score is 0.688
    Tweet count is 83
    -----------------------------------
    The source is @Foxnews
    The tweet is Pat Buchanan: "This market has not been good, it's been unbelievable." https://t.co/j02c0s0DXG
    This tweet was tweeted at Sat Jan 20 15:42:53 +0000 2018
    The compound score is -0.3412
    The postive score is 0.0
    The Negative score is 0.179
    The Neutral score is 0.821
    Tweet count is 84
    -----------------------------------
    The source is @Foxnews
    The tweet is DOW Milestones Since Election https://t.co/AYreE0EsZX
    This tweet was tweeted at Sat Jan 20 15:38:41 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 85
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenatorTimScott: "The Schumer shutdown reflects that the Democrats are more engaged in campaigning and politics t… https://t.co/pcjVNQA0fM
    This tweet was tweeted at Sat Jan 20 15:27:56 +0000 2018
    The compound score is 0.4576
    The postive score is 0.158
    The Negative score is 0.0
    The Neutral score is 0.842
    Tweet count is 86
    -----------------------------------
    The source is @Foxnews
    The tweet is .@SenatorTimScott: "This is a Schumer shutdown." https://t.co/zakvzja31S
    This tweet was tweeted at Sat Jan 20 15:22:57 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 87
    -----------------------------------
    The source is @Foxnews
    The tweet is 'He Does Not Respect Women': Andrew Cuomo Blasts Trump at Women's March Breakfast https://t.co/IFwWPXO3Ls
    This tweet was tweeted at Sat Jan 20 15:19:25 +0000 2018
    The compound score is 0.4767
    The postive score is 0.193
    The Negative score is 0.0
    The Neutral score is 0.807
    Tweet count is 88
    -----------------------------------
    The source is @Foxnews
    The tweet is RIGHT NOW: @TeamCavuto is LIVE in Washington for 2 hours - Don't miss #Cavuto Live every Saturday from 10a to 12p E… https://t.co/fK6u974nTI
    This tweet was tweeted at Sat Jan 20 15:00:06 +0000 2018
    The compound score is 0.1139
    The postive score is 0.067
    The Negative score is 0.0
    The Neutral score is 0.933
    Tweet count is 89
    -----------------------------------
    The source is @Foxnews
    The tweet is Moments ago @realDonaldTrump tweeted about the government shutdown, blaming Democrats for "holding our military hos… https://t.co/YRKAJhWXmf
    This tweet was tweeted at Sat Jan 20 14:51:55 +0000 2018
    The compound score is -0.4939
    The postive score is 0.0
    The Negative score is 0.176
    The Neutral score is 0.824
    Tweet count is 90
    -----------------------------------
    The source is @Foxnews
    The tweet is A boy with Down syndrome became a basketball star after he scored a basket as his team cheered him on. https://t.co/tIYRwyBdfY
    This tweet was tweeted at Sat Jan 20 14:23:11 +0000 2018
    The compound score is 0.5106
    The postive score is 0.163
    The Negative score is 0.0
    The Neutral score is 0.837
    Tweet count is 91
    -----------------------------------
    The source is @Foxnews
    The tweet is .@hogangidley45: "The Democrats played politics with peoples' lives. They're holding the military hostage, they're… https://t.co/t8B7D3qHof
    This tweet was tweeted at Sat Jan 20 14:11:47 +0000 2018
    The compound score is 0.34
    The postive score is 0.146
    The Negative score is 0.0
    The Neutral score is 0.854
    Tweet count is 92
    -----------------------------------
    The source is @Foxnews
    The tweet is OPINION: First lady Melania Trump marks first year with grace and dignity https://t.co/L35WPkUdTw
    This tweet was tweeted at Sat Jan 20 14:04:26 +0000 2018
    The compound score is 0.6705
    The postive score is 0.333
    The Negative score is 0.0
    The Neutral score is 0.667
    Tweet count is 93
    -----------------------------------
    The source is @Foxnews
    The tweet is .@MichaelGWaltz: "[Soldiers are] out there on the wall for our freedom and we can't do our job back in Washington t… https://t.co/wy519W6ceT
    This tweet was tweeted at Sat Jan 20 13:52:19 +0000 2018
    The compound score is 0.6369
    The postive score is 0.167
    The Negative score is 0.0
    The Neutral score is 0.833
    Tweet count is 94
    -----------------------------------
    The source is @Foxnews
    The tweet is .@David_Bossie: "This president only cares about America first." https://t.co/IIUowmcYdd
    This tweet was tweeted at Sat Jan 20 13:47:07 +0000 2018
    The compound score is 0.4588
    The postive score is 0.273
    The Negative score is 0.0
    The Neutral score is 0.727
    Tweet count is 95
    -----------------------------------
    The source is @Foxnews
    The tweet is .@David_Bossie: "There is no reason our government is shutdown except the Democrat Party, the Democrat leadership w… https://t.co/qiPWrLAuMk
    This tweet was tweeted at Sat Jan 20 13:43:49 +0000 2018
    The compound score is 0.128
    The postive score is 0.129
    The Negative score is 0.105
    The Neutral score is 0.766
    Tweet count is 96
    -----------------------------------
    The source is @Foxnews
    The tweet is .@David_Bossie: "The Democratic Party is putting illegals, people here illegally, ahead of the American people." https://t.co/XDd65ibeIP
    This tweet was tweeted at Sat Jan 20 13:42:00 +0000 2018
    The compound score is 0.4019
    The postive score is 0.153
    The Negative score is 0.0
    The Neutral score is 0.847
    Tweet count is 97
    -----------------------------------
    The source is @Foxnews
    The tweet is Trump blames Dems for shutdown, calls it 'nice present' marking his one year in office https://t.co/iHfbN5Ul8M
    This tweet was tweeted at Sat Jan 20 13:33:53 +0000 2018
    The compound score is 0.0258
    The postive score is 0.144
    The Negative score is 0.138
    The Neutral score is 0.718
    Tweet count is 98
    -----------------------------------
    The source is @Foxnews
    The tweet is North Korea sending 22 athletes to Winter Olympics, both countries to march together https://t.co/sgGYG2g4LK https://t.co/BxO4107jIG
    This tweet was tweeted at Sat Jan 20 13:22:17 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 99
    -----------------------------------
    The source is @Foxnews
    The tweet is .@jasoninthehouse on the shutdown: "Republicans are going to blame Democrats, Democrats are going to blame Republic… https://t.co/gqm1cW5ome
    This tweet was tweeted at Sat Jan 20 13:14:03 +0000 2018
    The compound score is -0.5859
    The postive score is 0.0
    The Negative score is 0.242
    The Neutral score is 0.758
    Tweet count is 100
    -----------------------------------
    The source is @nytimes
    The tweet is This week's Race/Related tackles the accusations against Aziz Ansari through a racial lens https://t.co/bgA7NpWFHW https://t.co/hfvLsCHP1z
    This tweet was tweeted at Sat Jan 20 20:50:07 +0000 2018
    The compound score is -0.3182
    The postive score is 0.0
    The Negative score is 0.15
    The Neutral score is 0.85
    Tweet count is 1
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: The view outside the White House right now. https://t.co/YJFEf0gw2m
    This tweet was tweeted at Sat Jan 20 20:40:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 2
    -----------------------------------
    The source is @nytimes
    The tweet is Tens of thousands of federal workers woke up to notices that they will be furloughed this coming week. But the shut… https://t.co/NGVt5VKzQU
    This tweet was tweeted at Sat Jan 20 20:33:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 3
    -----------------------------------
    The source is @nytimes
    The tweet is RT @charlie_savage: Here's what's going on with the Trump-Russia investigation &amp; the sudden/intense #ReleaseTheMemo social-media campaign r…
    This tweet was tweeted at Sat Jan 20 20:20:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 4
    -----------------------------------
    The source is @nytimes
    The tweet is New York marchers are empowered: "I feel like the revolution is now" https://t.co/xJhfzx9JZj
    This tweet was tweeted at Sat Jan 20 20:10:06 +0000 2018
    The compound score is 0.3612
    The postive score is 0.172
    The Negative score is 0.0
    The Neutral score is 0.828
    Tweet count is 5
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: Pelosi on the shutdown:
    "We just came from the capitol where our Republican colleagues have shut down the government....
    Th…
    This tweet was tweeted at Sat Jan 20 20:00:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 6
    -----------------------------------
    The source is @nytimes
    The tweet is Wearing a backward cap has never been a logical choice in tennis, but the style has persisted https://t.co/3bgbOnA03D
    This tweet was tweeted at Sat Jan 20 19:49:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 7
    -----------------------------------
    The source is @nytimes
    The tweet is Read the full text of Aly Raisman's statement during the sentencing hearing of Larry Nassar https://t.co/cqWmAkFSIT… https://t.co/mQUR7t5LAs
    This tweet was tweeted at Sat Jan 20 19:39:12 +0000 2018
    The compound score is -0.1531
    The postive score is 0.0
    The Negative score is 0.091
    The Neutral score is 0.909
    Tweet count is 8
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: "We're not tired, we're just getting started." "Happy anniversary, Mr. President." Organizers speaking to kick off Washingt…
    This tweet was tweeted at Sat Jan 20 19:35:06 +0000 2018
    The compound score is 0.7274
    The postive score is 0.264
    The Negative score is 0.0
    The Neutral score is 0.736
    Tweet count is 9
    -----------------------------------
    The source is @nytimes
    The tweet is Patrick Meehan used thousands of dollars in taxpayer money to settle the complaint after a former aide accused him… https://t.co/oqAz31rlpx
    This tweet was tweeted at Sat Jan 20 19:23:18 +0000 2018
    The compound score is -0.5267
    The postive score is 0.0
    The Negative score is 0.206
    The Neutral score is 0.794
    Tweet count is 10
    -----------------------------------
    The source is @nytimes
    The tweet is Breaking News: Patrick Meehan, a congressman on a panel that examines harassment charges in the House, used public… https://t.co/wxyjuB9AbP
    This tweet was tweeted at Sat Jan 20 19:19:22 +0000 2018
    The compound score is -0.6808
    The postive score is 0.0
    The Negative score is 0.272
    The Neutral score is 0.728
    Tweet count is 11
    -----------------------------------
    The source is @nytimes
    The tweet is In the dizzying news cycle of the Trump era, a shutdown crisis now may be long forgotten by November https://t.co/WVpM89Uwd9
    This tweet was tweeted at Sat Jan 20 19:07:05 +0000 2018
    The compound score is -0.7184
    The postive score is 0.0
    The Negative score is 0.261
    The Neutral score is 0.739
    Tweet count is 12
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: Nancy Pelosi, speaking to women's marchers in front of the Lincoln Memorial: "Wouldn't you love to see this group serve in…
    This tweet was tweeted at Sat Jan 20 19:00:56 +0000 2018
    The compound score is -0.5216
    The postive score is 0.0
    The Negative score is 0.133
    The Neutral score is 0.867
    Tweet count is 13
    -----------------------------------
    The source is @nytimes
    The tweet is Trump's remarks were broadcast to the Mall, the first time a president had addressed the annual March for Life on l… https://t.co/tfLv6kNMp9
    This tweet was tweeted at Sat Jan 20 18:52:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 14
    -----------------------------------
    The source is @nytimes
    The tweet is RT @johannabarr: “Everyone kept saying people are going to burn out; don’t highlight all the terrible things that are happening,” said Fati…
    This tweet was tweeted at Sat Jan 20 18:42:04 +0000 2018
    The compound score is -0.1779
    The postive score is 0.094
    The Negative score is 0.122
    The Neutral score is 0.784
    Tweet count is 15
    -----------------------------------
    The source is @nytimes
    The tweet is The Women’s March became a movement. What’s next? https://t.co/me9QvugZOi https://t.co/5NCOqqCd66
    This tweet was tweeted at Sat Jan 20 18:32:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 16
    -----------------------------------
    The source is @nytimes
    The tweet is RT @joumana_khatib: Watch scenes of the #WomensMarch2018 across the country: "The only thing we have to lose is our chains" https://t.co/tK…
    This tweet was tweeted at Sat Jan 20 18:22:28 +0000 2018
    The compound score is -0.4019
    The postive score is 0.0
    The Negative score is 0.119
    The Neutral score is 0.881
    Tweet count is 17
    -----------------------------------
    The source is @nytimes
    The tweet is New York lawmakers are trying to find options to sidestep the effects of President Trump’s new federal tax plan https://t.co/fnRnwUgco8
    This tweet was tweeted at Sat Jan 20 18:17:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 18
    -----------------------------------
    The source is @nytimes
    The tweet is Read the full text of Aly Raisman's statement during the sentencing hearing of Larry Nassar https://t.co/xVYX23CyXf https://t.co/toiwsZ7cqd
    This tweet was tweeted at Sat Jan 20 18:02:05 +0000 2018
    The compound score is -0.1531
    The postive score is 0.0
    The Negative score is 0.091
    The Neutral score is 0.909
    Tweet count is 19
    -----------------------------------
    The source is @nytimes
    The tweet is RT @jmartNYT: Why were most Dems willing to engage in brinksmanship? 
    
    Because they know the midterms will revolve around Trump &gt;
    
    https://…
    This tweet was tweeted at Sat Jan 20 17:52:03 +0000 2018
    The compound score is 0.34
    The postive score is 0.103
    The Negative score is 0.0
    The Neutral score is 0.897
    Tweet count is 20
    -----------------------------------
    The source is @nytimes
    The tweet is This week's Race/Related tackles the accusations against Aziz Ansari through a racial lens https://t.co/bgA7NpWFHW https://t.co/hfvLsCHP1z
    This tweet was tweeted at Sat Jan 20 20:50:07 +0000 2018
    The compound score is -0.3182
    The postive score is 0.0
    The Negative score is 0.15
    The Neutral score is 0.85
    Tweet count is 21
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: The view outside the White House right now. https://t.co/YJFEf0gw2m
    This tweet was tweeted at Sat Jan 20 20:40:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 22
    -----------------------------------
    The source is @nytimes
    The tweet is Tens of thousands of federal workers woke up to notices that they will be furloughed this coming week. But the shut… https://t.co/NGVt5VKzQU
    This tweet was tweeted at Sat Jan 20 20:33:55 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 23
    -----------------------------------
    The source is @nytimes
    The tweet is RT @charlie_savage: Here's what's going on with the Trump-Russia investigation &amp; the sudden/intense #ReleaseTheMemo social-media campaign r…
    This tweet was tweeted at Sat Jan 20 20:20:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 24
    -----------------------------------
    The source is @nytimes
    The tweet is New York marchers are empowered: "I feel like the revolution is now" https://t.co/xJhfzx9JZj
    This tweet was tweeted at Sat Jan 20 20:10:06 +0000 2018
    The compound score is 0.3612
    The postive score is 0.172
    The Negative score is 0.0
    The Neutral score is 0.828
    Tweet count is 25
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: Pelosi on the shutdown:
    "We just came from the capitol where our Republican colleagues have shut down the government....
    Th…
    This tweet was tweeted at Sat Jan 20 20:00:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 26
    -----------------------------------
    The source is @nytimes
    The tweet is Wearing a backward cap has never been a logical choice in tennis, but the style has persisted https://t.co/3bgbOnA03D
    This tweet was tweeted at Sat Jan 20 19:49:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 27
    -----------------------------------
    The source is @nytimes
    The tweet is Read the full text of Aly Raisman's statement during the sentencing hearing of Larry Nassar https://t.co/cqWmAkFSIT… https://t.co/mQUR7t5LAs
    This tweet was tweeted at Sat Jan 20 19:39:12 +0000 2018
    The compound score is -0.1531
    The postive score is 0.0
    The Negative score is 0.091
    The Neutral score is 0.909
    Tweet count is 28
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: "We're not tired, we're just getting started." "Happy anniversary, Mr. President." Organizers speaking to kick off Washingt…
    This tweet was tweeted at Sat Jan 20 19:35:06 +0000 2018
    The compound score is 0.7274
    The postive score is 0.264
    The Negative score is 0.0
    The Neutral score is 0.736
    Tweet count is 29
    -----------------------------------
    The source is @nytimes
    The tweet is Patrick Meehan used thousands of dollars in taxpayer money to settle the complaint after a former aide accused him… https://t.co/oqAz31rlpx
    This tweet was tweeted at Sat Jan 20 19:23:18 +0000 2018
    The compound score is -0.5267
    The postive score is 0.0
    The Negative score is 0.206
    The Neutral score is 0.794
    Tweet count is 30
    -----------------------------------
    The source is @nytimes
    The tweet is Breaking News: Patrick Meehan, a congressman on a panel that examines harassment charges in the House, used public… https://t.co/wxyjuB9AbP
    This tweet was tweeted at Sat Jan 20 19:19:22 +0000 2018
    The compound score is -0.6808
    The postive score is 0.0
    The Negative score is 0.272
    The Neutral score is 0.728
    Tweet count is 31
    -----------------------------------
    The source is @nytimes
    The tweet is In the dizzying news cycle of the Trump era, a shutdown crisis now may be long forgotten by November https://t.co/WVpM89Uwd9
    This tweet was tweeted at Sat Jan 20 19:07:05 +0000 2018
    The compound score is -0.7184
    The postive score is 0.0
    The Negative score is 0.261
    The Neutral score is 0.739
    Tweet count is 32
    -----------------------------------
    The source is @nytimes
    The tweet is RT @ESCochrane: Nancy Pelosi, speaking to women's marchers in front of the Lincoln Memorial: "Wouldn't you love to see this group serve in…
    This tweet was tweeted at Sat Jan 20 19:00:56 +0000 2018
    The compound score is -0.5216
    The postive score is 0.0
    The Negative score is 0.133
    The Neutral score is 0.867
    Tweet count is 33
    -----------------------------------
    The source is @nytimes
    The tweet is Trump's remarks were broadcast to the Mall, the first time a president had addressed the annual March for Life on l… https://t.co/tfLv6kNMp9
    This tweet was tweeted at Sat Jan 20 18:52:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 34
    -----------------------------------
    The source is @nytimes
    The tweet is RT @johannabarr: “Everyone kept saying people are going to burn out; don’t highlight all the terrible things that are happening,” said Fati…
    This tweet was tweeted at Sat Jan 20 18:42:04 +0000 2018
    The compound score is -0.1779
    The postive score is 0.094
    The Negative score is 0.122
    The Neutral score is 0.784
    Tweet count is 35
    -----------------------------------
    The source is @nytimes
    The tweet is The Women’s March became a movement. What’s next? https://t.co/me9QvugZOi https://t.co/5NCOqqCd66
    This tweet was tweeted at Sat Jan 20 18:32:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 36
    -----------------------------------
    The source is @nytimes
    The tweet is RT @joumana_khatib: Watch scenes of the #WomensMarch2018 across the country: "The only thing we have to lose is our chains" https://t.co/tK…
    This tweet was tweeted at Sat Jan 20 18:22:28 +0000 2018
    The compound score is -0.4019
    The postive score is 0.0
    The Negative score is 0.119
    The Neutral score is 0.881
    Tweet count is 37
    -----------------------------------
    The source is @nytimes
    The tweet is New York lawmakers are trying to find options to sidestep the effects of President Trump’s new federal tax plan https://t.co/fnRnwUgco8
    This tweet was tweeted at Sat Jan 20 18:17:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 38
    -----------------------------------
    The source is @nytimes
    The tweet is Read the full text of Aly Raisman's statement during the sentencing hearing of Larry Nassar https://t.co/xVYX23CyXf https://t.co/toiwsZ7cqd
    This tweet was tweeted at Sat Jan 20 18:02:05 +0000 2018
    The compound score is -0.1531
    The postive score is 0.0
    The Negative score is 0.091
    The Neutral score is 0.909
    Tweet count is 39
    -----------------------------------
    The source is @nytimes
    The tweet is RT @jmartNYT: Why were most Dems willing to engage in brinksmanship? 
    
    Because they know the midterms will revolve around Trump &gt;
    
    https://…
    This tweet was tweeted at Sat Jan 20 17:52:03 +0000 2018
    The compound score is 0.34
    The postive score is 0.103
    The Negative score is 0.0
    The Neutral score is 0.897
    Tweet count is 40
    -----------------------------------
    The source is @nytimes
    The tweet is The government shutdown risks political peril for both parties, and lawmakers insist that they were eager for a res… https://t.co/kw2C5uZAj5
    This tweet was tweeted at Sat Jan 20 17:42:02 +0000 2018
    The compound score is 0.1027
    The postive score is 0.208
    The Negative score is 0.192
    The Neutral score is 0.6
    Tweet count is 41
    -----------------------------------
    The source is @nytimes
    The tweet is Trump accused Democrats of orchestrating a government shutdown to detract from the anniversary of his inauguration https://t.co/MssBkoxY1K
    This tweet was tweeted at Sat Jan 20 17:32:09 +0000 2018
    The compound score is -0.296
    The postive score is 0.0
    The Negative score is 0.128
    The Neutral score is 0.872
    Tweet count is 42
    -----------------------------------
    The source is @nytimes
    The tweet is Opinion: Here's what women around the country have done with their pussy hats https://t.co/FighucP4br
    This tweet was tweeted at Sat Jan 20 17:17:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 43
    -----------------------------------
    The source is @nytimes
    The tweet is Women’s March rallies are taking place in hundreds of cities across the world, galvanized by the #MeToo moment. Her… https://t.co/IFDL5uQNnp
    This tweet was tweeted at Sat Jan 20 17:02:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 44
    -----------------------------------
    The source is @nytimes
    The tweet is Paul Bocuse, the chef who revolutionized French cuisine at his 3-Michelin star restaurant, has died at 91 https://t.co/pxtlvlSonv
    This tweet was tweeted at Sat Jan 20 16:32:06 +0000 2018
    The compound score is -0.5574
    The postive score is 0.0
    The Negative score is 0.175
    The Neutral score is 0.825
    Tweet count is 45
    -----------------------------------
    The source is @nytimes
    The tweet is The latest front in the partisan struggle over the investigation into the Russia inquiry? A 2016 application for a… https://t.co/F8Zyum8Kqd
    This tweet was tweeted at Sat Jan 20 16:17:04 +0000 2018
    The compound score is -0.3182
    The postive score is 0.0
    The Negative score is 0.113
    The Neutral score is 0.887
    Tweet count is 46
    -----------------------------------
    The source is @nytimes
    The tweet is Yes, people really are eating Tide pods. No, It’s not safe. https://t.co/dq1jV7GRcE
    This tweet was tweeted at Sat Jan 20 16:02:03 +0000 2018
    The compound score is -0.2278
    The postive score is 0.166
    The Negative score is 0.282
    The Neutral score is 0.552
    Tweet count is 47
    -----------------------------------
    The source is @nytimes
    The tweet is We will be tracking Women's Marches around the world and talking with women about what’s brought them out and their… https://t.co/rTUwLOf2kJ
    This tweet was tweeted at Sat Jan 20 15:47:06 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 48
    -----------------------------------
    The source is @nytimes
    The tweet is Over cheeseburgers, Trump and Chuck Schumer struck an outline of an agreement to keep the government open. Then eve… https://t.co/lsqvIJZWoS
    This tweet was tweeted at Sat Jan 20 15:32:07 +0000 2018
    The compound score is 0.296
    The postive score is 0.138
    The Negative score is 0.086
    The Neutral score is 0.776
    Tweet count is 49
    -----------------------------------
    The source is @nytimes
    The tweet is 10 breakout films of Sundances past, and where to stream them https://t.co/MoY5XjPsSd
    This tweet was tweeted at Sat Jan 20 15:17:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 50
    -----------------------------------
    The source is @nytimes
    The tweet is Heartier than chicken soup, this classic comfort dish is decidedly more stewlike https://t.co/hUdkydcK0F https://t.co/sa2DDhOuGH
    This tweet was tweeted at Sat Jan 20 15:03:03 +0000 2018
    The compound score is 0.3612
    The postive score is 0.161
    The Negative score is 0.0
    The Neutral score is 0.839
    Tweet count is 51
    -----------------------------------
    The source is @nytimes
    The tweet is Trump Passed a Cognitive Exam. What Does That Really Mean? https://t.co/cj4rP8dILy
    This tweet was tweeted at Sat Jan 20 14:57:56 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 52
    -----------------------------------
    The source is @nytimes
    The tweet is In Savannah, there is no shortage of history, beauty and architectural delights. And a visit needn’t cost you much. https://t.co/Oxr655YBgH
    This tweet was tweeted at Sat Jan 20 14:42:04 +0000 2018
    The compound score is 0.5574
    The postive score is 0.262
    The Negative score is 0.162
    The Neutral score is 0.577
    Tweet count is 53
    -----------------------------------
    The source is @nytimes
    The tweet is Review: The Ghosts of Michael Brown, in ‘Until the Flood’ https://t.co/7R0zL5vMej
    This tweet was tweeted at Sat Jan 20 14:28:08 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 54
    -----------------------------------
    The source is @nytimes
    The tweet is The hidden gems of 2017 movies are on ... Netflix?
    https://t.co/SsxdMkYLgP
    This tweet was tweeted at Sat Jan 20 14:22:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 55
    -----------------------------------
    The source is @nytimes
    The tweet is Yes, People Really Are Eating Tide Pods. No, It’s Not Safe. https://t.co/HeEYEGbJy2
    This tweet was tweeted at Sat Jan 20 14:13:32 +0000 2018
    The compound score is 0.5267
    The postive score is 0.333
    The Negative score is 0.131
    The Neutral score is 0.536
    Tweet count is 56
    -----------------------------------
    The source is @nytimes
    The tweet is Opinion: Anyone who doubts climate change should come to this island in Bangladesh https://t.co/lSDpuYBL0p
    This tweet was tweeted at Sat Jan 20 14:03:03 +0000 2018
    The compound score is -0.296
    The postive score is 0.0
    The Negative score is 0.145
    The Neutral score is 0.855
    Tweet count is 57
    -----------------------------------
    The source is @nytimes
    The tweet is The final Boeing 747 flight by any commercial U.S. airline took to the sky recently, with some tears and farewells.… https://t.co/byasX5k8Wj
    This tweet was tweeted at Sat Jan 20 13:42:04 +0000 2018
    The compound score is -0.2263
    The postive score is 0.0
    The Negative score is 0.087
    The Neutral score is 0.913
    Tweet count is 58
    -----------------------------------
    The source is @nytimes
    The tweet is Women’s March Returns a Year Later, as Movement Evolves https://t.co/CaTjWF8xTi
    This tweet was tweeted at Sat Jan 20 13:31:45 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 59
    -----------------------------------
    The source is @nytimes
    The tweet is Paul Bocuse, Celebrated French Chef, Dies at 91 https://t.co/UaHdGhqQCy
    This tweet was tweeted at Sat Jan 20 13:28:25 +0000 2018
    The compound score is 0.5719
    The postive score is 0.316
    The Negative score is 0.0
    The Neutral score is 0.684
    Tweet count is 60
    -----------------------------------
    The source is @nytimes
    The tweet is How bad is this year's flu season? Is this particular strain dangerous? Answers to your questions about the flu. https://t.co/xmMuHkNTUO
    This tweet was tweeted at Sat Jan 20 13:22:04 +0000 2018
    The compound score is -0.9074
    The postive score is 0.0
    The Negative score is 0.471
    The Neutral score is 0.529
    Tweet count is 61
    -----------------------------------
    The source is @nytimes
    The tweet is Calls grow for Michigan State University president to resign over Larry Nassar case https://t.co/eMrkbtOa83
    This tweet was tweeted at Sat Jan 20 13:03:05 +0000 2018
    The compound score is -0.34
    The postive score is 0.0
    The Negative score is 0.156
    The Neutral score is 0.844
    Tweet count is 62
    -----------------------------------
    The source is @nytimes
    The tweet is 10 new books recommended by critics and editors at The New York Times https://t.co/ErX0lAk3Sw
    This tweet was tweeted at Sat Jan 20 12:42:04 +0000 2018
    The compound score is -0.1027
    The postive score is 0.113
    The Negative score is 0.138
    The Neutral score is 0.75
    Tweet count is 63
    -----------------------------------
    The source is @nytimes
    The tweet is RT @paula_span: Should you have a separate advance directive that tells your doctors what to do if you develop dementia?  https://t.co/V4TZ…
    This tweet was tweeted at Sat Jan 20 12:22:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 64
    -----------------------------------
    The source is @nytimes
    The tweet is Here's how every senator voted on the government shutdown https://t.co/Xv97B6C5nr
    This tweet was tweeted at Sat Jan 20 12:03:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 65
    -----------------------------------
    The source is @nytimes
    The tweet is "Little Ripper" helped save 2 swimmers at a beach in Australia. (Little Ripper is a drone.) https://t.co/VQ2cJWh8ET
    This tweet was tweeted at Sat Jan 20 11:45:42 +0000 2018
    The compound score is 0.4472
    The postive score is 0.184
    The Negative score is 0.0
    The Neutral score is 0.816
    Tweet count is 66
    -----------------------------------
    The source is @nytimes
    The tweet is "They said, 'You look shaken,' and I said I was," Richard Durbin said. "After you have been in politics as long I h… https://t.co/Cx2XimdDHH
    This tweet was tweeted at Sat Jan 20 11:28:34 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 67
    -----------------------------------
    The source is @nytimes
    The tweet is Satellite imagery of the California mudslides that are being used to identify what caused them https://t.co/10o3qlCHx7
    This tweet was tweeted at Sat Jan 20 11:11:31 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 68
    -----------------------------------
    The source is @nytimes
    The tweet is Fiction: Madeleine Thien’s New Novel of Communist Occupation Turns Inward https://t.co/7Q28FkgVuY
    This tweet was tweeted at Sat Jan 20 10:53:24 +0000 2018
    The compound score is 0.3182
    The postive score is 0.187
    The Negative score is 0.0
    The Neutral score is 0.813
    Tweet count is 69
    -----------------------------------
    The source is @nytimes
    The tweet is 11 of Our Best Weekend Reads https://t.co/hRcyPAId3u
    This tweet was tweeted at Sat Jan 20 10:49:48 +0000 2018
    The compound score is 0.6369
    The postive score is 0.412
    The Negative score is 0.0
    The Neutral score is 0.588
    Tweet count is 70
    -----------------------------------
    The source is @nytimes
    The tweet is Olympic gymnasts Aly Raisman and Jordyn Wieber echoed dozens who say they too are victims of Larry Nassar https://t.co/VHdZcd27Yo
    This tweet was tweeted at Sat Jan 20 10:37:03 +0000 2018
    The compound score is -0.3182
    The postive score is 0.0
    The Negative score is 0.113
    The Neutral score is 0.887
    Tweet count is 71
    -----------------------------------
    The source is @nytimes
    The tweet is Meet Your Art Twin: A 400-Year-Old With an Oily Complexion https://t.co/rvE3qpQYa8
    This tweet was tweeted at Sat Jan 20 10:18:44 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 72
    -----------------------------------
    The source is @nytimes
    The tweet is For more than 600 years, Prague’s Astronomical Clock has measured the passing hours, noting when day turns to night… https://t.co/Zrc9brh9hM
    This tweet was tweeted at Sat Jan 20 10:03:07 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 73
    -----------------------------------
    The source is @nytimes
    The tweet is While the lives of squid are mysterious in many ways, one gruesome truth is that after mating comes death https://t.co/SufNiLX4kV
    This tweet was tweeted at Sat Jan 20 09:43:13 +0000 2018
    The compound score is -0.3818
    The postive score is 0.095
    The Negative score is 0.161
    The Neutral score is 0.744
    Tweet count is 74
    -----------------------------------
    The source is @nytimes
    The tweet is Being antisocial leads to a longer life. For marmots.
    https://t.co/DaLzio5lXK
    This tweet was tweeted at Sat Jan 20 09:27:02 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 75
    -----------------------------------
    The source is @nytimes
    The tweet is RT @nytvideo: She created a spreadsheet that enabled women in the media industry to name men accused of sexual misconduct. Now, she's speak…
    This tweet was tweeted at Sat Jan 20 09:10:01 +0000 2018
    The compound score is -0.0516
    The postive score is 0.083
    The Negative score is 0.091
    The Neutral score is 0.826
    Tweet count is 76
    -----------------------------------
    The source is @nytimes
    The tweet is "The Bitcoin bubble may ultimately turn out to be a distraction from the true significance of the blockchain." https://t.co/6ytFQB1bwE
    This tweet was tweeted at Sat Jan 20 08:52:52 +0000 2018
    The compound score is 0.3182
    The postive score is 0.218
    The Negative score is 0.116
    The Neutral score is 0.667
    Tweet count is 77
    -----------------------------------
    The source is @nytimes
    The tweet is Playlist: The Playlist: Previously Unreleased Hendrix, and 10 More New Songs https://t.co/JXz0qZU4kE
    This tweet was tweeted at Sat Jan 20 08:33:45 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 78
    -----------------------------------
    The source is @nytimes
    The tweet is A new book examines why child prodigies often do not sustain their genius into adulthood https://t.co/pGOmbRRCet
    This tweet was tweeted at Sat Jan 20 08:23:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 79
    -----------------------------------
    The source is @nytimes
    The tweet is A baby who had experimental surgery while still in the womb for a severe spinal defect, is born: full-term and kick… https://t.co/mE6EplU9IO
    This tweet was tweeted at Sat Jan 20 08:05:51 +0000 2018
    The compound score is -0.6124
    The postive score is 0.0
    The Negative score is 0.217
    The Neutral score is 0.783
    Tweet count is 80
    -----------------------------------
    The source is @nytimes
    The tweet is “Dr. Nassar was not a doctor. He in fact is, was, and forever shall be a child molester, and a monster of a human b… https://t.co/qMj2PIGVRE
    This tweet was tweeted at Sat Jan 20 07:48:30 +0000 2018
    The compound score is -0.5106
    The postive score is 0.0
    The Negative score is 0.136
    The Neutral score is 0.864
    Tweet count is 81
    -----------------------------------
    The source is @nytimes
    The tweet is RT @NYTStyles: He remembered thinking, “this guy has a lot of guts, and he’s kind of cute, too.” (And both, now active-duty Apache helicopt…
    This tweet was tweeted at Sat Jan 20 07:32:04 +0000 2018
    The compound score is 0.4033
    The postive score is 0.11
    The Negative score is 0.0
    The Neutral score is 0.89
    Tweet count is 82
    -----------------------------------
    The source is @nytimes
    The tweet is Senate Leaders Speak After Government Shuts Down https://t.co/YLdt83KR3b
    This tweet was tweeted at Sat Jan 20 07:20:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 83
    -----------------------------------
    The source is @nytimes
    The tweet is "How do you exorcise someone like this, get them out of your deepest being, out from under your skin?" https://t.co/syUgYiQxsI
    This tweet was tweeted at Sat Jan 20 07:06:18 +0000 2018
    The compound score is 0.3612
    The postive score is 0.116
    The Negative score is 0.0
    The Neutral score is 0.884
    Tweet count is 84
    -----------------------------------
    The source is @nytimes
    The tweet is RT @NYTHealth: More young and middle-aged women are using A.D.H.D. drugs -- a lot more. https://t.co/HIcRS0X6Zi
    This tweet was tweeted at Sat Jan 20 06:47:02 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 85
    -----------------------------------
    The source is @nytimes
    The tweet is Delta Air Lines said it was tightening its rules for service and support animals https://t.co/AKlQ1D1arM
    This tweet was tweeted at Sat Jan 20 06:32:03 +0000 2018
    The compound score is 0.4019
    The postive score is 0.162
    The Negative score is 0.0
    The Neutral score is 0.838
    Tweet count is 86
    -----------------------------------
    The source is @nytimes
    The tweet is RT @thomaskaplan: McConnell says the Senate will convene at noon on Saturday.
    This tweet was tweeted at Sat Jan 20 06:23:00 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 87
    -----------------------------------
    The source is @nytimes
    The tweet is Leaving a bad review on Airbnb is one thing, receiving one is another https://t.co/mpoMe1yJyi
    This tweet was tweeted at Sat Jan 20 06:18:06 +0000 2018
    The compound score is -0.5423
    The postive score is 0.0
    The Negative score is 0.226
    The Neutral score is 0.774
    Tweet count is 88
    -----------------------------------
    The source is @nytimes
    The tweet is RT @shearm: My story on the day of negotiations between @SenSchumer and @realDonaldTrump, with @maggieNYT https://t.co/XmaW2DCeZq
    This tweet was tweeted at Sat Jan 20 06:03:03 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 89
    -----------------------------------
    The source is @nytimes
    The tweet is A neighbor of Rand Paul is expected to plead guilty to a federal charge in connection with his attack of the senator https://t.co/57HM7jFD9H
    This tweet was tweeted at Sat Jan 20 05:48:04 +0000 2018
    The compound score is -0.7096
    The postive score is 0.0
    The Negative score is 0.237
    The Neutral score is 0.763
    Tweet count is 90
    -----------------------------------
    The source is @nytimes
    The tweet is RT @nytpolitics: Over cheeseburgers, President Trump and Senator Schumer struck an outline of an agreement to keep the government open. The…
    This tweet was tweeted at Sat Jan 20 05:32:03 +0000 2018
    The compound score is 0.296
    The postive score is 0.132
    The Negative score is 0.083
    The Neutral score is 0.785
    Tweet count is 91
    -----------------------------------
    The source is @nytimes
    The tweet is Here is the impact of the government shutdown on federal agencies https://t.co/rsI0Hzxg4M
    This tweet was tweeted at Sat Jan 20 05:18:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 92
    -----------------------------------
    The source is @nytimes
    The tweet is Breaking News: The U.S. government has officially shut down. Lawmakers are now scrambling for a quick deal to reope… https://t.co/BazuiRbaEc
    This tweet was tweeted at Sat Jan 20 05:03:09 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 93
    -----------------------------------
    The source is @nytimes
    The tweet is RT @NeilMacFarquhar: H'o'w would you feel if your new alpha'b'et was suddenly full of apo'stro'phes in odd pla'c'es? #Kazakhstan https://t.…
    This tweet was tweeted at Sat Jan 20 04:48:05 +0000 2018
    The compound score is -0.3182
    The postive score is 0.0
    The Negative score is 0.108
    The Neutral score is 0.892
    Tweet count is 94
    -----------------------------------
    The source is @nytimes
    The tweet is "Music is an inherently creative process. So we are directly opposing this feeling of loss with a feeling of creati… https://t.co/SlarusOduK
    This tweet was tweeted at Sat Jan 20 04:33:01 +0000 2018
    The compound score is 0.431
    The postive score is 0.252
    The Negative score is 0.094
    The Neutral score is 0.654
    Tweet count is 95
    -----------------------------------
    The source is @nytimes
    The tweet is When states make it harder to enroll, even eligible people drop Medicaid https://t.co/sK8XW1Qh4t
    This tweet was tweeted at Sat Jan 20 04:18:06 +0000 2018
    The compound score is -0.2732
    The postive score is 0.0
    The Negative score is 0.149
    The Neutral score is 0.851
    Tweet count is 96
    -----------------------------------
    The source is @nytimes
    The tweet is Here's how every senator voted on the government shutdown https://t.co/yr83pkdqKh
    This tweet was tweeted at Sat Jan 20 04:08:04 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 97
    -----------------------------------
    The source is @nytimes
    The tweet is RT @nytpolitics: If the government shuts down, hundreds of thousands of federal workers would be furloughed, affecting a wide range of gove…
    This tweet was tweeted at Sat Jan 20 03:48:05 +0000 2018
    The compound score is 0.0
    The postive score is 0.0
    The Negative score is 0.0
    The Neutral score is 1.0
    Tweet count is 98
    -----------------------------------
    The source is @nytimes
    The tweet is A stopgap spending bill to keep the government open was blocked in the Senate. Latest updates here: https://t.co/H02W3crJsX
    This tweet was tweeted at Sat Jan 20 03:34:02 +0000 2018
    The compound score is -0.2732
    The postive score is 0.0
    The Negative score is 0.116
    The Neutral score is 0.884
    Tweet count is 99
    -----------------------------------
    The source is @nytimes
    The tweet is RT @nytgraphics: LIVE VOTE COUNT: The Senate is voting now to avert a government shutdown https://t.co/GV9koV4bU9
    This tweet was tweeted at Sat Jan 20 03:24:04 +0000 2018
    The compound score is -0.1779
    The postive score is 0.0
    The Negative score is 0.108
    The Neutral score is 0.892
    Tweet count is 100
    -----------------------------------



```python
#creating Dataframe of tweet data pull
df_tweet = pd.DataFrame.from_dict(tweet_collect)
df_tweet = df_tweet[['timestamp','source','tweets ago','tweet text','compound score','positive score','negative score','neutral score']]
df_tweet.head(100)
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
      <th>timestamp</th>
      <th>source</th>
      <th>tweets ago</th>
      <th>tweet text</th>
      <th>compound score</th>
      <th>positive score</th>
      <th>negative score</th>
      <th>neutral score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Sat Jan 20 18:59:56 +0000 2018</td>
      <td>@BBCworld</td>
      <td>0</td>
      <td>Why is Turkey attacking Syria? https://t.co/UW...</td>
      <td>-0.4588</td>
      <td>0.000</td>
      <td>0.375</td>
      <td>0.625</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Sat Jan 20 18:46:41 +0000 2018</td>
      <td>@BBCworld</td>
      <td>1</td>
      <td>At the beginning of Donald Trump's presidency,...</td>
      <td>0.1027</td>
      <td>0.133</td>
      <td>0.115</td>
      <td>0.752</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Sat Jan 20 18:15:46 +0000 2018</td>
      <td>@BBCworld</td>
      <td>2</td>
      <td>The Brazilian man who lives in a sandcastle ht...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Sat Jan 20 17:42:16 +0000 2018</td>
      <td>@BBCworld</td>
      <td>3</td>
      <td>Football president George Weah puts Liberian a...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Sat Jan 20 17:24:17 +0000 2018</td>
      <td>@BBCworld</td>
      <td>4</td>
      <td>Gunmen 'attacking major Kabul hotel' https://t...</td>
      <td>-0.4588</td>
      <td>0.000</td>
      <td>0.375</td>
      <td>0.625</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Sat Jan 20 16:08:05 +0000 2018</td>
      <td>@BBCworld</td>
      <td>5</td>
      <td>India police 'failed to help injured teenagers...</td>
      <td>-0.5106</td>
      <td>0.197</td>
      <td>0.438</td>
      <td>0.365</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Sat Jan 20 16:04:22 +0000 2018</td>
      <td>@BBCworld</td>
      <td>6</td>
      <td>The Brazilian man who lives in a sandcastle ht...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Sat Jan 20 14:13:12 +0000 2018</td>
      <td>@BBCworld</td>
      <td>7</td>
      <td>RT @BBCSteveR: A pro-Kremlin paper today repor...</td>
      <td>-0.3612</td>
      <td>0.000</td>
      <td>0.106</td>
      <td>0.894</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Sat Jan 20 13:51:40 +0000 2018</td>
      <td>@BBCworld</td>
      <td>8</td>
      <td>Nigeria: Kidnapped US and Canadian citizens fr...</td>
      <td>0.4019</td>
      <td>0.278</td>
      <td>0.000</td>
      <td>0.722</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Sat Jan 20 13:45:00 +0000 2018</td>
      <td>@BBCworld</td>
      <td>9</td>
      <td>Syria: Turkey ground operation in Afrin begins...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Sat Jan 20 13:34:21 +0000 2018</td>
      <td>@BBCworld</td>
      <td>10</td>
      <td>Australian Open: Roger Federer and Novak Djoko...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Sat Jan 20 13:30:49 +0000 2018</td>
      <td>@BBCworld</td>
      <td>11</td>
      <td>Top French chef Paul Bocuse dies at 91 https:/...</td>
      <td>0.2023</td>
      <td>0.184</td>
      <td>0.000</td>
      <td>0.816</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Sat Jan 20 13:20:19 +0000 2018</td>
      <td>@BBCworld</td>
      <td>12</td>
      <td>US shutdown: Trump and Democrats blame each ot...</td>
      <td>-0.3400</td>
      <td>0.000</td>
      <td>0.231</td>
      <td>0.769</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Sat Jan 20 13:02:23 +0000 2018</td>
      <td>@BBCworld</td>
      <td>13</td>
      <td>Why Italians are saying 'No' to takeaway coffe...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Sat Jan 20 12:38:41 +0000 2018</td>
      <td>@BBCworld</td>
      <td>14</td>
      <td>Pope sends gift to police woman thrown from ho...</td>
      <td>0.4404</td>
      <td>0.244</td>
      <td>0.000</td>
      <td>0.756</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Sat Jan 20 12:34:10 +0000 2018</td>
      <td>@BBCworld</td>
      <td>15</td>
      <td>Winter Olympics 2018: North Korea will send 22...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Sat Jan 20 12:08:33 +0000 2018</td>
      <td>@BBCworld</td>
      <td>16</td>
      <td>RT @BBCOS: You might have seen Cindy Garcia an...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Sat Jan 20 12:03:24 +0000 2018</td>
      <td>@BBCworld</td>
      <td>17</td>
      <td>Syria conflict: 15 refugees found frozen to de...</td>
      <td>-0.7351</td>
      <td>0.000</td>
      <td>0.470</td>
      <td>0.530</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Sat Jan 20 11:22:42 +0000 2018</td>
      <td>@BBCworld</td>
      <td>18</td>
      <td>Pad Man: A man's 'period poverty' rescue becom...</td>
      <td>0.0000</td>
      <td>0.243</td>
      <td>0.243</td>
      <td>0.515</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Sat Jan 20 11:18:01 +0000 2018</td>
      <td>@BBCworld</td>
      <td>19</td>
      <td>What is Trumpism?\n\nhttps://t.co/Ks53fkoyoW</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Sat Jan 20 18:59:56 +0000 2018</td>
      <td>@BBCworld</td>
      <td>20</td>
      <td>Why is Turkey attacking Syria? https://t.co/UW...</td>
      <td>-0.4588</td>
      <td>0.000</td>
      <td>0.375</td>
      <td>0.625</td>
    </tr>
    <tr>
      <th>21</th>
      <td>Sat Jan 20 18:46:41 +0000 2018</td>
      <td>@BBCworld</td>
      <td>21</td>
      <td>At the beginning of Donald Trump's presidency,...</td>
      <td>0.1027</td>
      <td>0.133</td>
      <td>0.115</td>
      <td>0.752</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Sat Jan 20 18:15:46 +0000 2018</td>
      <td>@BBCworld</td>
      <td>22</td>
      <td>The Brazilian man who lives in a sandcastle ht...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Sat Jan 20 17:42:16 +0000 2018</td>
      <td>@BBCworld</td>
      <td>23</td>
      <td>Football president George Weah puts Liberian a...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>24</th>
      <td>Sat Jan 20 17:24:17 +0000 2018</td>
      <td>@BBCworld</td>
      <td>24</td>
      <td>Gunmen 'attacking major Kabul hotel' https://t...</td>
      <td>-0.4588</td>
      <td>0.000</td>
      <td>0.375</td>
      <td>0.625</td>
    </tr>
    <tr>
      <th>25</th>
      <td>Sat Jan 20 16:08:05 +0000 2018</td>
      <td>@BBCworld</td>
      <td>25</td>
      <td>India police 'failed to help injured teenagers...</td>
      <td>-0.5106</td>
      <td>0.197</td>
      <td>0.438</td>
      <td>0.365</td>
    </tr>
    <tr>
      <th>26</th>
      <td>Sat Jan 20 16:04:22 +0000 2018</td>
      <td>@BBCworld</td>
      <td>26</td>
      <td>The Brazilian man who lives in a sandcastle ht...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>27</th>
      <td>Sat Jan 20 14:13:12 +0000 2018</td>
      <td>@BBCworld</td>
      <td>27</td>
      <td>RT @BBCSteveR: A pro-Kremlin paper today repor...</td>
      <td>-0.3612</td>
      <td>0.000</td>
      <td>0.106</td>
      <td>0.894</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Sat Jan 20 13:51:40 +0000 2018</td>
      <td>@BBCworld</td>
      <td>28</td>
      <td>Nigeria: Kidnapped US and Canadian citizens fr...</td>
      <td>0.4019</td>
      <td>0.278</td>
      <td>0.000</td>
      <td>0.722</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Sat Jan 20 13:45:00 +0000 2018</td>
      <td>@BBCworld</td>
      <td>29</td>
      <td>Syria: Turkey ground operation in Afrin begins...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>70</th>
      <td>Fri Jan 19 19:02:22 +0000 2018</td>
      <td>@BBCworld</td>
      <td>70</td>
      <td>Larry Nassar case: Olympic champ Jordyn Wieber...</td>
      <td>-0.2732</td>
      <td>0.203</td>
      <td>0.275</td>
      <td>0.523</td>
    </tr>
    <tr>
      <th>71</th>
      <td>Fri Jan 19 18:58:26 +0000 2018</td>
      <td>@BBCworld</td>
      <td>71</td>
      <td>Gold medallists Aly Raisman and Jordyn Wieber ...</td>
      <td>-0.5574</td>
      <td>0.000</td>
      <td>0.286</td>
      <td>0.714</td>
    </tr>
    <tr>
      <th>72</th>
      <td>Fri Jan 19 17:37:23 +0000 2018</td>
      <td>@BBCworld</td>
      <td>72</td>
      <td>Philippines stops sending workers to Kuwait ov...</td>
      <td>-0.8225</td>
      <td>0.000</td>
      <td>0.551</td>
      <td>0.449</td>
    </tr>
    <tr>
      <th>73</th>
      <td>Fri Jan 19 17:14:57 +0000 2018</td>
      <td>@BBCworld</td>
      <td>73</td>
      <td>RT @BBCBusiness: Coca-Cola pledges to recycle ...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>74</th>
      <td>Fri Jan 19 16:45:58 +0000 2018</td>
      <td>@BBCworld</td>
      <td>74</td>
      <td>"I think there are some ironies to point out.....</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>75</th>
      <td>Fri Jan 19 16:43:53 +0000 2018</td>
      <td>@BBCworld</td>
      <td>75</td>
      <td>Kenya investigates 'sex attacks' on new mother...</td>
      <td>-0.4404</td>
      <td>0.000</td>
      <td>0.244</td>
      <td>0.756</td>
    </tr>
    <tr>
      <th>76</th>
      <td>Fri Jan 19 16:34:41 +0000 2018</td>
      <td>@BBCworld</td>
      <td>76</td>
      <td>"It is frustrating to all of us that we are in...</td>
      <td>-0.4404</td>
      <td>0.000</td>
      <td>0.121</td>
      <td>0.879</td>
    </tr>
    <tr>
      <th>77</th>
      <td>Fri Jan 19 16:27:42 +0000 2018</td>
      <td>@BBCworld</td>
      <td>77</td>
      <td>Czech PM Andrej Babis stripped of immunity ami...</td>
      <td>-0.5859</td>
      <td>0.000</td>
      <td>0.275</td>
      <td>0.725</td>
    </tr>
    <tr>
      <th>78</th>
      <td>Fri Jan 19 16:15:37 +0000 2018</td>
      <td>@BBCworld</td>
      <td>78</td>
      <td>Nasa removes US astronaut from ISS mission htt...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>79</th>
      <td>Fri Jan 19 15:59:50 +0000 2018</td>
      <td>@BBCworld</td>
      <td>79</td>
      <td>Mattis: US national security focus no longer t...</td>
      <td>-0.6597</td>
      <td>0.158</td>
      <td>0.447</td>
      <td>0.395</td>
    </tr>
    <tr>
      <th>80</th>
      <td>Fri Jan 19 15:32:04 +0000 2018</td>
      <td>@BBCworld</td>
      <td>80</td>
      <td>Russian President Vladimir Putin plunges into ...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>81</th>
      <td>Fri Jan 19 15:14:13 +0000 2018</td>
      <td>@BBCworld</td>
      <td>81</td>
      <td>Russian social media defends air cadets dancin...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>82</th>
      <td>Fri Jan 19 15:14:13 +0000 2018</td>
      <td>@BBCworld</td>
      <td>82</td>
      <td>Crocodile found in weapons raid https://t.co/w...</td>
      <td>-0.4404</td>
      <td>0.000</td>
      <td>0.367</td>
      <td>0.633</td>
    </tr>
    <tr>
      <th>83</th>
      <td>Fri Jan 19 14:55:24 +0000 2018</td>
      <td>@BBCworld</td>
      <td>83</td>
      <td>Smiling Macron and May pose for selfie https:/...</td>
      <td>0.4588</td>
      <td>0.300</td>
      <td>0.000</td>
      <td>0.700</td>
    </tr>
    <tr>
      <th>84</th>
      <td>Fri Jan 19 14:55:24 +0000 2018</td>
      <td>@BBCworld</td>
      <td>84</td>
      <td>US shutdown: Senate bill on verge of collapse ...</td>
      <td>-0.4939</td>
      <td>0.000</td>
      <td>0.242</td>
      <td>0.758</td>
    </tr>
    <tr>
      <th>85</th>
      <td>Fri Jan 19 14:36:51 +0000 2018</td>
      <td>@BBCworld</td>
      <td>85</td>
      <td>RT @BBCNews: 'Extreme kayaker' sets 128ft wate...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>86</th>
      <td>Fri Jan 19 14:11:12 +0000 2018</td>
      <td>@BBCworld</td>
      <td>86</td>
      <td>Data-stealing spyware 'traced to Lebanon' http...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>87</th>
      <td>Fri Jan 19 13:26:17 +0000 2018</td>
      <td>@BBCworld</td>
      <td>87</td>
      <td>President Putin takes a dip into icy water htt...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>88</th>
      <td>Fri Jan 19 12:59:55 +0000 2018</td>
      <td>@BBCworld</td>
      <td>88</td>
      <td>Turkey steps up Syria shelling as invasion of ...</td>
      <td>-0.1531</td>
      <td>0.000</td>
      <td>0.138</td>
      <td>0.862</td>
    </tr>
    <tr>
      <th>89</th>
      <td>Fri Jan 19 12:34:06 +0000 2018</td>
      <td>@BBCworld</td>
      <td>89</td>
      <td>British 'extreme kayaker' sets 128ft waterfall...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>90</th>
      <td>Fri Jan 19 11:55:48 +0000 2018</td>
      <td>@BBCworld</td>
      <td>90</td>
      <td>Pope Francis 'slander' comment angers Chile ab...</td>
      <td>-0.8689</td>
      <td>0.000</td>
      <td>0.620</td>
      <td>0.380</td>
    </tr>
    <tr>
      <th>91</th>
      <td>Fri Jan 19 11:41:59 +0000 2018</td>
      <td>@BBCworld</td>
      <td>91</td>
      <td>Michael Douglas: Former employee accuses actor...</td>
      <td>-0.7096</td>
      <td>0.000</td>
      <td>0.424</td>
      <td>0.576</td>
    </tr>
    <tr>
      <th>92</th>
      <td>Fri Jan 19 11:39:58 +0000 2018</td>
      <td>@BBCworld</td>
      <td>92</td>
      <td>RT @bbctennis: Game set and match 💪\n\nKyrgios...</td>
      <td>-0.4588</td>
      <td>0.000</td>
      <td>0.111</td>
      <td>0.889</td>
    </tr>
    <tr>
      <th>93</th>
      <td>Fri Jan 19 11:09:43 +0000 2018</td>
      <td>@BBCworld</td>
      <td>93</td>
      <td>Pakistan Zainab murder: DNA suggests suspect i...</td>
      <td>-0.7845</td>
      <td>0.000</td>
      <td>0.408</td>
      <td>0.592</td>
    </tr>
    <tr>
      <th>94</th>
      <td>Fri Jan 19 11:09:43 +0000 2018</td>
      <td>@BBCworld</td>
      <td>94</td>
      <td>Fake-bomb TV crew held at New Jersey airport h...</td>
      <td>0.0000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>1.000</td>
    </tr>
    <tr>
      <th>95</th>
      <td>Fri Jan 19 10:33:43 +0000 2018</td>
      <td>@BBCworld</td>
      <td>95</td>
      <td>Europe storm: Germany in huge clean-up as trai...</td>
      <td>0.3182</td>
      <td>0.187</td>
      <td>0.000</td>
      <td>0.813</td>
    </tr>
    <tr>
      <th>96</th>
      <td>Fri Jan 19 10:30:15 +0000 2018</td>
      <td>@BBCworld</td>
      <td>96</td>
      <td>Yu Wensheng: China human rights lawyer arreste...</td>
      <td>-0.4767</td>
      <td>0.000</td>
      <td>0.237</td>
      <td>0.763</td>
    </tr>
    <tr>
      <th>97</th>
      <td>Fri Jan 19 10:12:30 +0000 2018</td>
      <td>@BBCworld</td>
      <td>97</td>
      <td>South Korea to reward 'dogparazzi' informers h...</td>
      <td>0.5719</td>
      <td>0.381</td>
      <td>0.000</td>
      <td>0.619</td>
    </tr>
    <tr>
      <th>98</th>
      <td>Fri Jan 19 10:08:38 +0000 2018</td>
      <td>@BBCworld</td>
      <td>98</td>
      <td>Patricia Dagorn: France's 'Black Widow' jailed...</td>
      <td>-0.7650</td>
      <td>0.000</td>
      <td>0.485</td>
      <td>0.515</td>
    </tr>
    <tr>
      <th>99</th>
      <td>Fri Jan 19 09:45:31 +0000 2018</td>
      <td>@BBCworld</td>
      <td>99</td>
      <td>RT @BBCSteveR: One Russian paper today predict...</td>
      <td>-0.0258</td>
      <td>0.158</td>
      <td>0.118</td>
      <td>0.724</td>
    </tr>
  </tbody>
</table>
<p>100 rows × 8 columns</p>
</div>




```python
#saving dataframe to csv
df_tweet.to_csv('output/news_organization_sentiment.csv')
```


```python
#plotting each tweet by each news handle into scatterplot
fig = plt.figure(figsize=(15, 10))
sns.set(style="whitegrid", color_codes=True)
sns.swarmplot(x="tweets ago", y="compound score", hue='source',data=df_tweet,size=8)
plt.title("Tweet Sentiment by News Organization - Jan.16, 2018")
#plt.xlim([0,110])
plt.xlabel("Tweets Ago")
plt.ylabel("Tweet Compound Sentiment")
plt.savefig("charts/News_organization_tweet_sentiment.png")
plt.show()
```


![png](output_6_0.png)



```python
#creating groupby of news account in order to create average sentiment scores

df_account_gby = df_tweet.groupby(['source'],as_index=False)
df_account_gby_avg = df_account_gby.mean().head()
df_account_gby_avg.head()
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
      <th>source</th>
      <th>tweets ago</th>
      <th>compound score</th>
      <th>positive score</th>
      <th>negative score</th>
      <th>neutral score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>@BBCworld</td>
      <td>49.5</td>
      <td>-0.137857</td>
      <td>0.06451</td>
      <td>0.14510</td>
      <td>0.79040</td>
    </tr>
    <tr>
      <th>1</th>
      <td>@CBSnews</td>
      <td>49.5</td>
      <td>-0.052982</td>
      <td>0.05216</td>
      <td>0.08611</td>
      <td>0.86174</td>
    </tr>
    <tr>
      <th>2</th>
      <td>@CNN</td>
      <td>49.5</td>
      <td>-0.006878</td>
      <td>0.05913</td>
      <td>0.05248</td>
      <td>0.88837</td>
    </tr>
    <tr>
      <th>3</th>
      <td>@Foxnews</td>
      <td>49.5</td>
      <td>0.009376</td>
      <td>0.06748</td>
      <td>0.06638</td>
      <td>0.86615</td>
    </tr>
    <tr>
      <th>4</th>
      <td>@nytimes</td>
      <td>49.5</td>
      <td>-0.058572</td>
      <td>0.04914</td>
      <td>0.07111</td>
      <td>0.87978</td>
    </tr>
  </tbody>
</table>
</div>




```python
#plotting each tweet by each news handle into scatterplot
x_axis = [0,1,2,3,4]
fig = plt.figure(figsize=(15, 10))
sns.set(style="whitegrid", color_codes=True)
sns.barplot(x=x_axis,y='compound score',hue='source',data=df_account_gby_avg)
plt.title("Average Tweet Sentiment by News Organization - January 16, 2018")
plt.xticks(x_axis,df_account_gby_avg['source'])
plt.xlabel("News Organization")
plt.ylabel("Acerage Compound Sentiment")
plt.savefig("charts/News_organization_tweet_average_sentiment.png")
plt.show()
```


![png](output_8_0.png)

