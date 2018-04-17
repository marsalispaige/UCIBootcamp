var $tbody =document.querySelector("tbody");

var $stateInput = document.querySelector("#state");
var $cityInput = document.querySelector("#city");
var $dateInput = document.querySelector("#date");
var $countryInput = document.querySelector("#country");
var $shapeInput = document.querySelector("#shape");

var $search = document.querySelector("#search");
var $load = document.querySelector("#load");

$search.addEventListener("click", dataRetrieve);
$load.addEventListener("click",index);


var filterUfoData = dataSet;

var startingIndex = 0;
var resultsPerPage = 99;

//for(var i =0; i < filterUfoData.length; i++)
    //console.log(Object.keys(filterUfoData[0]));

function index(){
    startingIndex += resultsPerPage;
    tableGen();
}


function dataRetrieve(){
    var stateSelect = $stateInput.value.trim().toLowerCase();
    var citySelect = $cityInput.value.trim().toLowerCase();
    var dateSelect = $dateInput.value.trim().toLowerCase();
    var countrySelect = $countryInput.value.trim().toLowerCase();
    var shapeSelect = $shapeInput.value.trim().toLowerCase();

    filterUfoData = dataSet.filter(function(ufo){
        var ufoState = ufo.state.substring(0,stateSelect.length).toLowerCase();
        var ufoCity = ufo.city.substring(0,citySelect.length).toLowerCase();
        var ufoDate = ufo.datetime.substring(0,dateSelect.length).toLowerCase();
        var ufoCountry = ufo.country.substring(0,countrySelect.length).toLowerCase();
        var ufoShape = ufo.shape.substring(0,shapeSelect.length).toLowerCase();

        if(ufoState === stateSelect && ufoCity === citySelect && ufoDate === dateSelect && ufoCountry === countrySelect && ufoShape === shapeSelect){
            return true;
        }
        return false;
    });

    tableGen();
};


function tableGen(){
    var endingIndex = startingIndex + resultsPerPage;
    var ufoSet = filterUfoData.slice(startingIndex,endingIndex);
    for(var i=0;i < ufoSet.length;i++){
        var $record  = ufoSet[i];
        var $keys = Object.keys($record);
        //console.log($record);
        var $row = $tbody.insertRow(i + startingIndex);
        for(var j=0;j < $keys.length; j++){
            var $key = $keys[j];
            var $cell = $row.insertCell(j);
            $cell.innerText = $record[$key];
        }
    }
}