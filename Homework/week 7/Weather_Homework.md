

```python
# Dependencies

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import json
import requests as req
import openweathermapy.core as ow
from citipy import citipy
from datetime import datetime
```


```python
#generating random latitude and longitude
lat = [np.random.randint(-90,90) for x in range(1700)]
lng = [np.random.randint(-180,180) for x in range(1700)]

#zipping lat and lng together
lat_lng = zip(lat,lng)

#info var
cities = []
lat = []
lng = []

#creating for loop to find the nearest city to lat and lng
for lat_lng in lat_lng:
    
    #retrieve city from lat and lng
    city = citipy.nearest_city(lat_lng[0],lat_lng[1]).city_name
    
    #check if city is in the cities list
    if city not in cities:
        
        cities.append(city)
        print(city)

len(cities)
```

    saint george
    dikson
    middle island
    bhadra
    cape town
    ballina
    hobart
    hamilton
    qaanaaq
    mar del plata
    busselton
    umzimvubu
    vardo
    albany
    iqaluit
    bambous virieux
    boffa
    rikitea
    merced
    nikolskoye
    north platte
    hilo
    nome
    belushya guba
    malanje
    tuktoyaktuk
    naze
    caravelas
    san quintin
    kiruna
    hermanus
    chuy
    hasaki
    new norfolk
    sakakah
    cabo san lucas
    tasiilaq
    richards bay
    barentsburg
    wukari
    grand river south east
    san patricio
    fortuna
    lebu
    ushuaia
    kaitangata
    butaritari
    kapaa
    avarua
    georgetown
    punta arenas
    cidreira
    jacareacanga
    east london
    attawapiskat
    zhangjiakou
    semey
    evanston
    lolua
    atuona
    tuatapere
    hovd
    mataura
    arraial do cabo
    pimentel
    faanui
    port moresby
    longyearbyen
    tsihombe
    bluff
    taolanaro
    shingu
    yangjiang
    vila franca do campo
    bridlington
    constitucion
    amurzet
    meulaboh
    martin
    yellowknife
    suchitoto
    buchanan
    korla
    bilma
    saskylakh
    acapulco
    saint-medard-en-jalles
    pontes e lacerda
    havre-saint-pierre
    elk city
    ilulissat
    saint-augustin
    samusu
    vaini
    bredasdorp
    bocaiuva
    port alfred
    neumunster
    puerto ayora
    kamyshla
    nizhneyansk
    college
    shubarshi
    brae
    ribeira grande
    ponta do sol
    lagoa
    provideniya
    karratha
    vaitape
    haines junction
    tumannyy
    yumen
    paris
    sentyabrskiy
    bandarbeyla
    airai
    guerrero negro
    khani
    cabedelo
    barbar
    araouane
    honiara
    bonavista
    chokurdakh
    pangnirtung
    wewak
    rindal
    ust-nera
    katsuura
    san agustin acasaguastlan
    pitimbu
    talnakh
    mana
    russell
    clyde river
    norman wells
    bengkulu
    jamsa
    tsienyane
    portland
    asau
    nuuk
    adrar
    carnarvon
    port elizabeth
    thompson
    jamestown
    severo-kurilsk
    beira
    anloga
    khatanga
    rosetta
    mago
    keningau
    skibbereen
    kushima
    barrow
    merritt
    kirya
    mys shmidta
    gorontalo
    yantal
    naron
    valdosta
    ensenada
    upernavik
    hofn
    kavaratti
    illoqqortoormiut
    narsaq
    isiro
    pisco
    codrington
    kollumerland
    kodiak
    gizo
    rungata
    imbituba
    odesskoye
    ixtapa
    kangasala
    bethel
    san cristobal
    arman
    nantucket
    ingham
    kirakira
    alofi
    novyy urengoy
    gorele
    kamenka
    bathsheba
    nelson bay
    sumbawa
    torbay
    castro
    hithadhoo
    sao filipe
    eureka
    mahebourg
    taywarah
    sitka
    yar-sale
    makarov
    valleyview
    daru
    awbari
    vanimo
    sao gabriel da cachoeira
    bubaque
    nuzvid
    sarh
    portree
    axim
    louisbourg
    olafsvik
    pevek
    saleaula
    atikokan
    santa maria
    ambilobe
    buin
    sakaiminato
    itarema
    huarmey
    flinders
    halalo
    vila velha
    kavieng
    goba
    krasnoselkup
    umba
    tessalit
    saint-georges
    port lincoln
    cherskiy
    trincomalee
    aasiaat
    amderma
    yatou
    tongling
    saraland
    auki
    temaraia
    ballater
    sumbe
    lata
    lena
    itaituba
    victoria
    anadyr
    roseburg
    kargasok
    sabang
    bar harbor
    chipinge
    vaitupu
    saint-philippe
    nabire
    kieta
    we
    gorno-altaysk
    tommot
    margate
    tiruchchendur
    raudeberg
    arrecife
    faya
    souillac
    ahipara
    nederland
    luanda
    batsfjord
    kaeo
    torva
    wum
    tulun
    forbes
    dekar
    santo antonio do taua
    mto wa mbu
    ancud
    pacific grove
    george
    yabrud
    tura
    launceston
    inuvik
    pathein
    boguchany
    vao
    skagastrond
    port blair
    altay
    teguise
    cayenne
    rio cuarto
    roald
    braganca
    strezhevoy
    shimoda
    uyo
    guarare
    aksu
    makakilo city
    hirara
    dharchula
    troy
    batemans bay
    safaga
    karaul
    port-gentil
    mehamn
    egersund
    wichita falls
    penalva
    liepaja
    rio gallegos
    saint-jean-de-braye
    mandalgovi
    jinchang
    hami
    fizesu gherlii
    tiksi
    vostok
    harper
    pangody
    iquique
    seoul
    marang
    emerald
    grimari
    sinnamary
    abu kamal
    sioux lookout
    saldanha
    mnogovershinnyy
    yima
    jaleswar
    port hawkesbury
    hualmay
    jinxiang
    porto novo
    valparaiso
    salalah
    ostrovnoy
    mallama
    nakhon thai
    klaksvik
    mount gambier
    vagay
    malwan
    arkhangelsk
    skjaerhollen
    moctezuma
    camopi
    zhigansk
    isangel
    bahir dar
    san joaquin
    anchorage
    bargal
    hervey bay
    zhanakorgan
    yenagoa
    upington
    bur gabo
    letterkenny
    griffith
    maningrida
    fairbanks
    lavrentiya
    sayyan
    port hedland
    velsk
    keetmanshoop
    bajil
    dandong
    kostino
    xam nua
    yulara
    chapais
    songjianghe
    banda aceh
    inverness
    husavik
    jumla
    west wendover
    ust-omchug
    huancayo
    chiriqui grande
    broome
    trelew
    oktyabrskoye
    leningradskiy
    stryn
    ranong
    lasa
    rabo de peixe
    jiuquan
    mezen
    moose factory
    skovorodino
    marystown
    taman
    geraldton
    nhulunbuy
    ormara
    beloha
    ginda
    okhotsk
    polunochnoye
    nanortalik
    coquimbo
    soligalich
    catuday
    matagami
    agirish
    shache
    uruacu
    dauriya
    nouakchott
    tshikapa
    coihaique
    stornoway
    gurupi
    galiwinku
    westport
    satun
    berlevag
    loa janan
    prince rupert
    opuwo
    lompoc
    sur
    khash
    waw
    san jose
    muros
    sorland
    esperance
    grindavik
    mweka
    lunenburg
    dapaong
    meyungs
    calatayud
    san lawrenz
    muli
    nioro
    sasaram
    yacuiba
    magugu
    herat
    chara
    wagar
    mendi
    cocobeach
    yelizovo
    aljezur
    japura
    benghazi
    iquitos
    nizhniy odes
    manokwari
    nouadhibou
    tocopilla
    tsaratanana
    lucea
    san gabriel
    marcona
    bealanana
    tilichiki
    touros
    fort nelson
    grand-bourg
    barra
    shitkino
    saint-paul
    kampot
    laguna
    foumban
    kruisfontein
    sibolga
    oga
    bereda
    diego de almagro
    prainha
    lorengau
    gushi
    kakonko
    kayes
    biak
    papillion
    bara
    shchors
    maceio
    miandrivazo
    kutum
    paradwip
    merritt island
    avera
    santo antonio do ica
    sakti
    kulhudhuffushi
    dawlatabad
    meadow lake
    sabaudia
    palmer
    svay rieng
    moron
    nenjiang
    newport
    vuktyl
    progreso
    madimba
    suslovo
    tateyama
    twentynine palms
    bambui
    linhares
    acarau
    nichinan
    tiznit
    seymchan
    port augusta
    petropavlovsk-kamchatskiy
    namibe
    viedma
    barhi
    colquechaca
    suoyarvi
    bilibino
    nevsehir
    dargaville
    tucuma
    umm lajj
    lingao
    rocha
    whitehorse
    ngunguru
    sola
    ust-tsilma
    boksitogorsk
    veraval
    llaillay
    enid
    dingle
    matay
    zyryanka
    tautira
    kamenskoye
    verkhoyansk
    coari
    shimanovsk
    sambava
    belyy yar
    dunedin
    oktyabrskiy
    rio grande
    mercedes
    belaya gora
    mackay
    maxixe
    namatanai
    siuna
    netrakona
    saint-louis
    ishinomaki
    san carlos
    yanan
    paamiut
    aksarka
    jaruco
    quelimane
    port hardy
    saint anthony
    hanmer springs
    te anau
    alekseyevsk
    nalgonda
    sobolevo
    dubbo
    kendari
    tandil
    stolac
    greymouth
    krasnyy bogatyr
    gobabis
    uch
    teya
    sorvag
    panzhihua
    brownsville
    singaraja
    mombetsu
    saint john
    puerto escondido
    florence
    suntar
    reconquista
    lugoba
    taoudenni
    emba
    chatra
    greenville
    elizabeth city
    balykshi
    ewo
    waingapu
    tuyen quang
    otane
    sao joao da barra
    kingaroy
    xiongzhou
    homer
    sofiysk
    rawannawi
    maykain
    kidal
    hobyo
    shaoguan
    colchester
    atar
    turtas
    imeni morozova
    high level
    methoni
    dongsheng
    hambantota
    akkermanovka
    llanes
    guaymas
    bogalusa
    tabas
    vanavara
    cap malheureux
    vila
    byron bay
    arlit
    hailey
    takoradi
    brainerd
    swellendam
    santa eulalia del rio
    oriximina
    easton
    dakar
    poum
    santa cruz de la palma
    hihifo
    toulepleu
    sao jose da coroa grande
    balvi
    grand gaube
    cuamba
    honolulu
    burica
    aklavik
    cam ranh
    suzu
    teotitlan
    ontario
    makinsk
    mount isa
    kambove
    acari
    lahat
    vagur
    sherlovaya gora
    linxia
    ambulu
    bolungarvik
    zonguldak
    fevralsk
    kahului
    nevers
    diu
    cagayan de tawi-tawi
    kristiinankaupunki
    vitim
    fort saint james
    eston





    684




```python
#setup config for weather API

api_key = "c34efaa32f6509d36ae7428be00f54c7"
url = "http://api.openweathermap.org/data/2.5/weather?"
query_url = url + "appid=" + api_key + "&units=imperial" + "&q="

#info
temp = []
hum = []
cloud_cov = []
wind_spd = []
weather_data = []
counter = 0


while(True):

    #iterating through list of cities
    for city in cities:

        #removing spacing for city name to ensure the correct city is retrieved from the API call
        city = city.replace(" ","+")

        #constructing API Url
        weather_resp = req.get(query_url + city)
        weather_json = weather_resp.json()

        #Checking if city is found by the API call
        if (weather_json['cod'] == '404'):

            print(" Missing city... skipping.")
            continue


        #appending weather data to var
        weather_data.append(weather_json)

        #Printing city and query url
        print("City name: %s City ID: %s " % (str(city), str(weather_json['id'])))
        print(query_url + city)

        #adding integer to counter when city is found
        counter = counter + 1

        #breaking loop when 500 cities are reached
        if (counter == 500):
            break
    break


    

```

    City name: saint+george City ID: 5546220 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint+george
    City name: dikson City ID: 1507390 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=dikson
    City name: middle+island City ID: 5126787 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=middle+island
    City name: bhadra City ID: 1276330 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bhadra
    City name: cape+town City ID: 3369157 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cape+town
    City name: ballina City ID: 2177069 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ballina
    City name: hobart City ID: 2163355 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hobart
    City name: hamilton City ID: 5969785 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hamilton
    City name: qaanaaq City ID: 3831208 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=qaanaaq
    City name: mar+del+plata City ID: 3430863 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mar+del+plata
    City name: busselton City ID: 2075265 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=busselton
     Missing city... skipping.
    City name: vardo City ID: 777019 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vardo
    City name: albany City ID: 5106834 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=albany
    City name: iqaluit City ID: 5983720 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=iqaluit
    City name: bambous+virieux City ID: 1106677 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bambous+virieux
    City name: boffa City ID: 2422968 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=boffa
    City name: rikitea City ID: 4030556 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=rikitea
    City name: merced City ID: 5372253 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=merced
     Missing city... skipping.
    City name: north+platte City ID: 5697939 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=north+platte
    City name: hilo City ID: 5855927 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hilo
    City name: nome City ID: 5870133 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nome
     Missing city... skipping.
    City name: malanje City ID: 2239862 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=malanje
    City name: tuktoyaktuk City ID: 6170031 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tuktoyaktuk
    City name: naze City ID: 1855540 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=naze
    City name: caravelas City ID: 3466980 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=caravelas
    City name: san+quintin City ID: 3984997 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=san+quintin
    City name: kiruna City ID: 605155 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kiruna
    City name: hermanus City ID: 3366880 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hermanus
    City name: chuy City ID: 3443061 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=chuy
    City name: hasaki City ID: 2112802 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hasaki
    City name: new+norfolk City ID: 2155415 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=new+norfolk
     Missing city... skipping.
    City name: cabo+san+lucas City ID: 3985710 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cabo+san+lucas
    City name: tasiilaq City ID: 3424607 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tasiilaq
    City name: richards+bay City ID: 962367 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=richards+bay
     Missing city... skipping.
    City name: wukari City ID: 2318921 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=wukari
     Missing city... skipping.
    City name: san+patricio City ID: 3985168 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=san+patricio
    City name: fortuna City ID: 5563839 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=fortuna
    City name: lebu City ID: 3883457 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=lebu
    City name: ushuaia City ID: 3833367 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ushuaia
     Missing city... skipping.
    City name: butaritari City ID: 2110227 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=butaritari
    City name: kapaa City ID: 5848280 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kapaa
    City name: avarua City ID: 4035715 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=avarua
    City name: georgetown City ID: 3378644 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=georgetown
    City name: punta+arenas City ID: 3874787 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=punta+arenas
    City name: cidreira City ID: 3466165 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cidreira
    City name: jacareacanga City ID: 3397763 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jacareacanga
    City name: east+london City ID: 1006984 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=east+london
     Missing city... skipping.
    City name: zhangjiakou City ID: 2033196 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=zhangjiakou
    City name: semey City ID: 1519422 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=semey
    City name: evanston City ID: 4891382 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=evanston
     Missing city... skipping.
    City name: atuona City ID: 4020109 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=atuona
    City name: tuatapere City ID: 2180815 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tuatapere
    City name: hovd City ID: 1516048 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hovd
     Missing city... skipping.
    City name: arraial+do+cabo City ID: 3471451 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=arraial+do+cabo
    City name: pimentel City ID: 3693584 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pimentel
    City name: faanui City ID: 4034551 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=faanui
    City name: port+moresby City ID: 2088122 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+moresby
    City name: longyearbyen City ID: 2729907 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=longyearbyen
     Missing city... skipping.
    City name: bluff City ID: 2206939 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bluff
     Missing city... skipping.
    City name: shingu City ID: 1847947 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=shingu
    City name: yangjiang City ID: 1806408 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yangjiang
    City name: vila+franca+do+campo City ID: 3372472 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vila+franca+do+campo
    City name: bridlington City ID: 2654728 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bridlington
    City name: constitucion City ID: 3893726 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=constitucion
    City name: amurzet City ID: 2027740 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=amurzet
    City name: meulaboh City ID: 1214488 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=meulaboh
    City name: martin City ID: 3058780 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=martin
    City name: yellowknife City ID: 6185377 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yellowknife
    City name: suchitoto City ID: 3583090 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=suchitoto
    City name: buchanan City ID: 2278158 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=buchanan
    City name: korla City ID: 1529376 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=korla
    City name: bilma City ID: 2446796 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bilma
    City name: saskylakh City ID: 2017155 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saskylakh
     Missing city... skipping.
    City name: saint-medard-en-jalles City ID: 2978072 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint-medard-en-jalles
    City name: pontes+e+lacerda City ID: 3453060 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pontes+e+lacerda
    City name: havre-saint-pierre City ID: 5972291 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=havre-saint-pierre
    City name: elk+city City ID: 4535823 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=elk+city
    City name: ilulissat City ID: 3423146 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ilulissat
    City name: saint-augustin City ID: 6137462 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint-augustin
     Missing city... skipping.
    City name: vaini City ID: 4032243 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vaini
    City name: bredasdorp City ID: 1015776 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bredasdorp
    City name: bocaiuva City ID: 3469601 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bocaiuva
    City name: port+alfred City ID: 964432 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+alfred
    City name: neumunster City ID: 2864475 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=neumunster
    City name: puerto+ayora City ID: 3652764 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=puerto+ayora
    City name: kamyshla City ID: 553271 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kamyshla
     Missing city... skipping.
    City name: college City ID: 5859699 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=college
    City name: shubarshi City ID: 608270 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=shubarshi
    City name: brae City ID: 2654970 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=brae
    City name: ribeira+grande City ID: 3372707 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ribeira+grande
    City name: ponta+do+sol City ID: 2264557 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ponta+do+sol
    City name: lagoa City ID: 3372964 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=lagoa
    City name: provideniya City ID: 4031574 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=provideniya
    City name: karratha City ID: 6620339 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=karratha
    City name: vaitape City ID: 4033077 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vaitape
    City name: haines+junction City ID: 5969025 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=haines+junction
     Missing city... skipping.
    City name: yumen City ID: 1528998 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yumen
    City name: paris City ID: 2988507 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=paris
     Missing city... skipping.
    City name: bandarbeyla City ID: 64814 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bandarbeyla
     Missing city... skipping.
    City name: guerrero+negro City ID: 4021858 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=guerrero+negro
     Missing city... skipping.
    City name: cabedelo City ID: 3404558 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cabedelo
     Missing city... skipping.
    City name: araouane City ID: 2460954 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=araouane
    City name: honiara City ID: 2108502 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=honiara
    City name: bonavista City ID: 5905393 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bonavista
    City name: chokurdakh City ID: 2126123 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=chokurdakh
    City name: pangnirtung City ID: 6096551 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pangnirtung
    City name: wewak City ID: 2083537 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=wewak
    City name: rindal City ID: 3141866 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=rindal
    City name: ust-nera City ID: 2120048 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ust-nera
    City name: katsuura City ID: 2112309 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=katsuura
    City name: san+agustin+acasaguastlan City ID: 3590547 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=san+agustin+acasaguastlan
    City name: pitimbu City ID: 3391889 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pitimbu
    City name: talnakh City ID: 1490256 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=talnakh
    City name: mana City ID: 3381041 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mana
    City name: russell City ID: 4278471 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=russell
    City name: clyde+river City ID: 5924351 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=clyde+river
    City name: norman+wells City ID: 6089245 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=norman+wells
    City name: bengkulu City ID: 1649150 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bengkulu
    City name: jamsa City ID: 656083 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jamsa
     Missing city... skipping.
    City name: portland City ID: 5746545 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=portland
    City name: asau City ID: 686090 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=asau
    City name: nuuk City ID: 3421319 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nuuk
    City name: adrar City ID: 2508813 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=adrar
    City name: carnarvon City ID: 2074865 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=carnarvon
    City name: port+elizabeth City ID: 964420 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+elizabeth
    City name: thompson City ID: 6165406 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=thompson
    City name: jamestown City ID: 5122534 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jamestown
    City name: severo-kurilsk City ID: 2121385 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=severo-kurilsk
    City name: beira City ID: 1052373 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=beira
    City name: anloga City ID: 2304548 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=anloga
    City name: khatanga City ID: 2022572 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=khatanga
    City name: rosetta City ID: 350203 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=rosetta
    City name: mago City ID: 2123621 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mago
    City name: keningau City ID: 1734098 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=keningau
    City name: skibbereen City ID: 2961459 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=skibbereen
    City name: kushima City ID: 1895695 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kushima
    City name: barrow City ID: 5880054 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=barrow
    City name: merritt City ID: 6072350 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=merritt
    City name: kirya City ID: 157045 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kirya
     Missing city... skipping.
    City name: gorontalo City ID: 1643837 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=gorontalo
    City name: yantal City ID: 2055868 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yantal
    City name: naron City ID: 3115739 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=naron
    City name: valdosta City ID: 4228147 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=valdosta
    City name: ensenada City ID: 4006702 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ensenada
    City name: upernavik City ID: 3418910 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=upernavik
    City name: hofn City ID: 2630299 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hofn
    City name: kavaratti City ID: 1267390 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kavaratti
     Missing city... skipping.
    City name: narsaq City ID: 3421719 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=narsaq
    City name: isiro City ID: 215771 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=isiro
    City name: pisco City ID: 3932145 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pisco
    City name: codrington City ID: 2171099 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=codrington
     Missing city... skipping.
    City name: kodiak City ID: 5866583 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kodiak
    City name: gizo City ID: 2108857 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=gizo
     Missing city... skipping.
    City name: imbituba City ID: 3461370 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=imbituba
    City name: odesskoye City ID: 1496380 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=odesskoye
    City name: ixtapa City ID: 4004293 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ixtapa
    City name: kangasala City ID: 654441 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kangasala
    City name: bethel City ID: 5282297 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bethel
    City name: san+cristobal City ID: 3628473 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=san+cristobal
    City name: arman City ID: 2127060 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=arman
    City name: nantucket City ID: 4944903 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nantucket
    City name: ingham City ID: 2162737 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ingham
    City name: kirakira City ID: 2178753 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kirakira
    City name: alofi City ID: 4036284 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=alofi
    City name: novyy+urengoy City ID: 1496511 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=novyy+urengoy
    City name: gorele City ID: 746565 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=gorele
    City name: kamenka City ID: 553766 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kamenka
    City name: bathsheba City ID: 3374083 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bathsheba
    City name: nelson+bay City ID: 2155562 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nelson+bay
     Missing city... skipping.
    City name: torbay City ID: 6167817 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=torbay
    City name: castro City ID: 3466704 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=castro
    City name: hithadhoo City ID: 1282256 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hithadhoo
    City name: sao+filipe City ID: 3374210 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sao+filipe
    City name: eureka City ID: 5563397 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=eureka
    City name: mahebourg City ID: 934322 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mahebourg
    City name: taywarah City ID: 1122464 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=taywarah
    City name: sitka City ID: 5557293 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sitka
    City name: yar-sale City ID: 1486321 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yar-sale
    City name: makarov City ID: 2123614 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=makarov
    City name: valleyview City ID: 6173220 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=valleyview
    City name: daru City ID: 2098329 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=daru
    City name: awbari City ID: 2219235 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=awbari
    City name: vanimo City ID: 2084442 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vanimo
    City name: sao+gabriel+da+cachoeira City ID: 3662342 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sao+gabriel+da+cachoeira
    City name: bubaque City ID: 2374583 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bubaque
    City name: nuzvid City ID: 1261110 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nuzvid
     Missing city... skipping.
    City name: portree City ID: 2640006 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=portree
    City name: axim City ID: 2303611 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=axim
     Missing city... skipping.
     Missing city... skipping.
    City name: pevek City ID: 2122090 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pevek
     Missing city... skipping.
    City name: atikokan City ID: 5888001 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=atikokan
    City name: santa+maria City ID: 3450083 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=santa+maria
    City name: ambilobe City ID: 1082243 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ambilobe
    City name: buin City ID: 3897774 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=buin
    City name: sakaiminato City ID: 1853174 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sakaiminato
     Missing city... skipping.
    City name: huarmey City ID: 3939168 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=huarmey
    City name: flinders City ID: 6255012 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=flinders
     Missing city... skipping.
    City name: vila+velha City ID: 3445026 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vila+velha
    City name: kavieng City ID: 2094342 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kavieng
    City name: goba City ID: 336350 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=goba
     Missing city... skipping.
    City name: umba City ID: 479071 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=umba
    City name: tessalit City ID: 2449893 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tessalit
    City name: saint-georges City ID: 6138282 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint-georges
    City name: port+lincoln City ID: 2063036 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+lincoln
    City name: cherskiy City ID: 2126199 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cherskiy
    City name: trincomalee City ID: 1226260 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=trincomalee
    City name: aasiaat City ID: 3424901 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=aasiaat
     Missing city... skipping.
    City name: yatou City ID: 1786855 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yatou
    City name: tongling City ID: 1792622 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tongling
    City name: saraland City ID: 4088628 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saraland
    City name: auki City ID: 2109701 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=auki
     Missing city... skipping.
    City name: ballater City ID: 2656565 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ballater
    City name: sumbe City ID: 3346015 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sumbe
    City name: lata City ID: 2738381 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=lata
    City name: lena City ID: 3118547 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=lena
    City name: itaituba City ID: 3397967 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=itaituba
    City name: victoria City ID: 6174041 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=victoria
    City name: anadyr City ID: 2127202 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=anadyr
    City name: roseburg City ID: 5749352 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=roseburg
    City name: kargasok City ID: 1504382 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kargasok
    City name: sabang City ID: 1214026 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sabang
    City name: bar+harbor City ID: 4957320 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=bar+harbor
    City name: chipinge City ID: 893549 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=chipinge
     Missing city... skipping.
    City name: saint-philippe City ID: 935215 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint-philippe
    City name: nabire City ID: 1634614 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nabire
    City name: kieta City ID: 2094027 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kieta
     Missing city... skipping.
    City name: gorno-altaysk City ID: 1506271 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=gorno-altaysk
    City name: tommot City ID: 2015179 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tommot
    City name: margate City ID: 2643044 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=margate
    City name: tiruchchendur City ID: 1254390 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tiruchchendur
     Missing city... skipping.
    City name: arrecife City ID: 2521570 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=arrecife
     Missing city... skipping.
    City name: souillac City ID: 933995 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=souillac
    City name: ahipara City ID: 2194098 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ahipara
    City name: nederland City ID: 4713932 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nederland
    City name: luanda City ID: 2240449 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=luanda
    City name: batsfjord City ID: 780717 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=batsfjord
    City name: kaeo City ID: 2189343 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=kaeo
    City name: torva City ID: 588204 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=torva
    City name: wum City ID: 2221053 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=wum
    City name: tulun City ID: 2014927 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tulun
    City name: forbes City ID: 2166368 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=forbes
    City name: dekar City ID: 933815 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=dekar
    City name: santo+antonio+do+taua City ID: 3389062 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=santo+antonio+do+taua
    City name: mto+wa+mbu City ID: 152743 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mto+wa+mbu
    City name: ancud City ID: 3899695 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ancud
    City name: pacific+grove City ID: 5380437 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pacific+grove
    City name: george City ID: 1002145 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=george
    City name: yabrud City ID: 162627 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yabrud
    City name: tura City ID: 1254046 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tura
    City name: launceston City ID: 2160517 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=launceston
    City name: inuvik City ID: 5983607 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=inuvik
    City name: pathein City ID: 1328421 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pathein
    City name: boguchany City ID: 1509844 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=boguchany
    City name: vao City ID: 2137773 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vao
     Missing city... skipping.
    City name: port+blair City ID: 1259385 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+blair
    City name: altay City ID: 1529651 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=altay
    City name: teguise City ID: 2510573 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=teguise
    City name: cayenne City ID: 3382160 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=cayenne
    City name: rio+cuarto City ID: 3838874 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=rio+cuarto
    City name: roald City ID: 3141667 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=roald
    City name: braganca City ID: 3405006 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=braganca
    City name: strezhevoy City ID: 1490796 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=strezhevoy
    City name: shimoda City ID: 1852357 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=shimoda
    City name: uyo City ID: 2319480 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=uyo
    City name: guarare City ID: 3708911 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=guarare
    City name: aksu City ID: 1529660 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=aksu
    City name: makakilo+city City ID: 5850554 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=makakilo+city
    City name: hirara City ID: 1862505 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hirara
    City name: dharchula City ID: 1272864 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=dharchula
    City name: troy City ID: 5012639 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=troy
    City name: batemans+bay City ID: 2176639 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=batemans+bay
     Missing city... skipping.
     Missing city... skipping.
    City name: port-gentil City ID: 2396518 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port-gentil
    City name: mehamn City ID: 778707 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mehamn
    City name: egersund City ID: 3158792 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=egersund
    City name: wichita+falls City ID: 4741752 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=wichita+falls
    City name: penalva City ID: 3392368 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=penalva
    City name: liepaja City ID: 457954 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=liepaja
    City name: rio+gallegos City ID: 3838859 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=rio+gallegos
    City name: saint-jean-de-braye City ID: 2979341 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saint-jean-de-braye
    City name: mandalgovi City ID: 2030065 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mandalgovi
    City name: jinchang City ID: 1805733 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jinchang
    City name: hami City ID: 1529484 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hami
    City name: fizesu+gherlii City ID: 678089 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=fizesu+gherlii
    City name: tiksi City ID: 2015306 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=tiksi
    City name: vostok City ID: 2013279 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vostok
    City name: harper City ID: 2276492 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=harper
    City name: pangody City ID: 1495626 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=pangody
    City name: iquique City ID: 3887127 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=iquique
    City name: seoul City ID: 1835848 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=seoul
    City name: marang City ID: 1734715 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=marang
    City name: emerald City ID: 2167426 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=emerald
     Missing city... skipping.
    City name: sinnamary City ID: 3380290 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sinnamary
     Missing city... skipping.
    City name: sioux+lookout City ID: 6148373 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=sioux+lookout
    City name: saldanha City ID: 3361934 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=saldanha
    City name: mnogovershinnyy City ID: 2019935 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mnogovershinnyy
    City name: yima City ID: 1786676 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=yima
    City name: jaleswar City ID: 1283323 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jaleswar
    City name: port+hawkesbury City ID: 6111867 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=port+hawkesbury
    City name: hualmay City ID: 3939761 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=hualmay
    City name: jinxiang City ID: 1916249 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=jinxiang
    City name: porto+novo City ID: 3374336 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=porto+novo
    City name: valparaiso City ID: 3868626 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=valparaiso
    City name: salalah City ID: 286621 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=salalah
    City name: ostrovnoy City ID: 556268 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=ostrovnoy
     Missing city... skipping.
    City name: nakhon+thai City ID: 1608524 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=nakhon+thai
    City name: klaksvik City ID: 2618795 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=klaksvik
    City name: mount+gambier City ID: 2156643 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=mount+gambier
    City name: vagay City ID: 1487860 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=vagay
     Missing city... skipping.
    City name: arkhangelsk City ID: 581049 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=arkhangelsk
     Missing city... skipping.
    City name: moctezuma City ID: 3995647 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=moctezuma
    City name: camopi City ID: 3382226 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=camopi
    City name: zhigansk City ID: 2012530 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=zhigansk
    City name: isangel City ID: 2136825 
    http://api.openweathermap.org/data/2.5/weather?appid=c34efaa32f6509d36ae7428be00f54c7&units=imperial&q=isangel



    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-5-53f8fb0804c1> in <module>()
         37 
         38         #Printing city and query url
    ---> 39         print("City name: %s City ID: %s " % (str(city), str(weather_json['id'])))
         40         print(query_url + city)
         41 


    KeyError: 'id'



```python
len(weather_data)
```




    313




```python

date = [datetime.utcfromtimestamp(data['dt']).strftime('%m/%d/%Y') for data in weather_data]
cities = [data['name'] for data in weather_data]
lat = [data["coord"]['lat'] for data in weather_data]
lng = [data["coord"]['lon'] for data in weather_data]
temp = [data['main']['temp'] for data in weather_data]
hum = [data['main']['humidity'] for data in weather_data]
cloud_cov = [data['clouds']['all'] for data in weather_data]
wind_spd = [data['wind']['speed'] for data in weather_data]

df_weather = pd.DataFrame({'Datetime':date,
                           'City': cities,
                          'Latitude': lat,
                          "Longitude": lng,
                          'Temperature': temp,
                          'Humidity %': hum,
                          'Cloud Coverage %': cloud_cov,
                          'Wind Speed': wind_spd})

df_weather = df_weather[['Datetime','City','Latitude','Longitude','Temperature','Humidity %','Cloud Coverage %','Wind Speed']]

df_weather.head()
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-7-ecb8b6818a26> in <module>()
          1 
    ----> 2 date = [datetime.utcfromtimestamp(data['dt']).strftime('%m/%d/%Y') for data in weather_data]
          3 cities = [data['name'] for data in weather_data]
          4 lat = [data["coord"]['lat'] for data in weather_data]
          5 lng = [data["coord"]['lon'] for data in weather_data]


    <ipython-input-7-ecb8b6818a26> in <listcomp>(.0)
          1 
    ----> 2 date = [datetime.utcfromtimestamp(data['dt']).strftime('%m/%d/%Y') for data in weather_data]
          3 cities = [data['name'] for data in weather_data]
          4 lat = [data["coord"]['lat'] for data in weather_data]
          5 lng = [data["coord"]['lon'] for data in weather_data]


    KeyError: 'dt'



```python
#Save to csv
df_weather.to_csv("weather_city_data.csv",index=False, header=True)
```


```python
#Building Temp and lat scatterplot

plt.scatter(df_weather['Latitude'],
                df_weather['Temperature'],
               edgecolor = 'black',
               linewidths = 1,
               marker = "o",
               alpha = 0.8)
plt.title("Temperature by Latitude - Updated: " + df_weather['Datetime'][0])
plt.xlabel("Latitude")
plt.ylabel("Temperature")
plt.grid(True)
plt.savefig("TempvsLatitude.png")
plt.show()
```


![png](output_6_0.png)



```python
#Building Humidity and lat scatterplot

plt.scatter(df_weather['Latitude'],
                df_weather['Humidity %'],
               edgecolor = 'orange',
               linewidths = 1,
               marker = "o",
               alpha = 0.8)
plt.title("Humidity by Latitude - Updated: " + df_weather['Datetime'][0])
plt.xlabel("Latitude")
plt.ylabel("Humidity %")
plt.grid(True)
plt.savefig("HumidityvsLatitude.png")
plt.show()
```


![png](output_7_0.png)



```python
#Building Cloud Coverage and lat scatterplot

plt.scatter(df_weather['Latitude'],
                df_weather['Cloud Coverage %'],
               edgecolor = 'blue',
               linewidths = 1,
               marker = "o",
               alpha = 0.8)
plt.title("Cloud Coverage by Latitude - Updated: " + df_weather['Datetime'][0])
plt.xlabel("Latitude")
plt.ylabel("Cloud Coverage %")
plt.grid(True)
plt.savefig("CloudCovvsLatitude.png")
plt.show()
```


![png](output_8_0.png)



```python
#Building Wind Speed and lat scatterplot

plt.scatter(df_weather['Latitude'],
                df_weather['Wind Speed'],
               edgecolor = 'purple',
               linewidths = 1,
               marker = "o",
               alpha = 0.8)
plt.title("Wind Speed by Latitude - Updated: " + df_weather['Datetime'][0])
plt.xlabel("Latitude")
plt.ylabel("Wind Speed MPH")
plt.grid(True)
plt.savefig("WindSpdvsLatitude.png")
plt.show()
```


![png](output_9_0.png)

