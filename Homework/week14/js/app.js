var $tbody =document.querySelector("tbody");

var $stateInput = document.querySelector("#state");
var $cityInput = document.querySelector("#city");
var $dateInput = document.querySelector("#date");
var $countryInput = document.querySelector("#country");
var $shapeInput = document.querySelector("#shape");

var $search = document.querySelector("#search");

$search.addEventListener("click", dataRetrieve);

var filterUfoData = dataSet;

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
    for(var i=0;i < filterUfoData.length;i++){
        var $d  = filterUfoData[i];
        var $values = Object.keys(d);

        var $row = $tbody.insertRow(i);
        for(var j=0;j< $values.length;j++){
            var $value = $values[j];
            var $cell = $row.insertCell(j);
            $cell.innertext = $d[$value];
        }
    }
}