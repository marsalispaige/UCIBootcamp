
# coding: utf-8

# In[82]:


# Dependencies
from bs4 import BeautifulSoup as bs
import requests
import pandas as pd
from splinter import Browser


# In[85]:


# URL of Python nasa
url = 'https://mars.nasa.gov/news/'

# Retrieve page with the requests module
html = requests.get(url)

# Creating BeautifulSoup object
soup = bs(html.text, 'html.parser')


# In[48]:


print(soup.prettify())


# In[50]:


results_t = soup.find('div', class_='content_title')
news_title = results_t.get_text()
print(news_title)

results_p = soup.find('div', class_='rollover_description_inner')
news_p = results_p.get_text()
print(news_p)


# In[51]:


#executable_path = {'executable_path': 'chromedriver.exe'}
browser = Browser('chrome', headless=False)

#URL for JPL Featured Page
url = 'https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars'

browser.visit(url)

html = browser.html

soup = bs(html, 'html.parser')


# In[52]:


print(soup.prettify())


# In[54]:


full_img_ele = browser.find_by_id("full_image")
full_img_ele.click()


# In[55]:


more_info_ele = browser.find_link_by_partial_text('more info')
more_info_ele.click()


# In[56]:


html = browser.html
soup = bs(html, 'html.parser')


# In[57]:


print(soup.prettify())


# In[66]:


img_ele = soup.find('div', class_='img').find('img')
img_url = img_ele['src']
print(img_url)


# In[67]:


featured_image_url = f'https://www.jpl.nasa.gov{img_url}'
featured_image_url


# In[68]:


#Mars Weather
url = 'https://twitter.com/marswxreport?lang=en'

browser.visit(url)

html = browser.html

soup = bs(html, 'html.parser')


# In[69]:


print(soup.prettify())


# In[70]:


weather_ele = soup.find('div', class_='js-tweet-text-container')
mars_weather = weather_ele.p.text
print(mars_weather)


# In[75]:


#Mars Facts
url = 'http://space-facts.com/mars/'

df = pd.read_html(url)[0]
df.columns=['facts', 'measures']
df.set_index('facts', inplace=True)
df


# In[76]:


df.to_html()


# In[117]:


#mars Hemispheres

#executable_path = {'executable_path': 'chromedriver.exe'}
browser = Browser('chrome', headless=False)

url = 'https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars'

browser.visit(url)

html = browser.html


# In[140]:


hemispheres_img = []

links = browser.find_by_css('a.product-item')

i = 1

for x in range(4):
    hemispheres = {}
    
    browser.find_by_css('a.product-item')[x+i].click()
    
    ele = browser.find_by_css('h2.title').text
    hemispheres['title'] = ele
    print(ele)
    
    ele = browser.find_link_by_text('Sample')
    hemispheres['url'] = ele['href']
    print(ele['href'])
    
    
    hemispheres_img.append(hemispheres)
    
    i = i + 1
    browser.back()


# In[141]:


print(hemispheres_img)

