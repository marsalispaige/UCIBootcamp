var $tbody =document.querySelector("tbody");

var $stateInput = document.querySelector("#state");
var $cityInput = document.querySelector("#city");
var $dateInput = document.querySelector("#date");
var $countryInput = document.querySelector("#country");
var $shapeInput = document.querySelector("#shape");

var $search = document.querySelector("#search");

$search.addEventListener("click", filter);

var filterData = data;

function filter(){
    var stateSelect = $stateInput.value.trim().toLowerCase();
    var citySelect = $cityInput.value.trim().toLowerCase();
    var dateSelect = $dateInput.value.trim().toLowerCase();
    var countrySelect = $countryInput.value.trim().toLowerCase();
    var shapeSelect = $shapeInput.value.trim().toLowerCase();
};


function tableGen(){
    for(var i=0;i < filterData.length;i++){
        var $d  = filterData[i];
        var $values = Object.keys(d);

        var $row = $tbody.insertRow(i);
        for(var j=0;j< $values.length;j++){
            var $value = $values[j];
            var $cell = $row.insertCell(j);
            $cell.innertext = $d[$value];
        }
    }
}