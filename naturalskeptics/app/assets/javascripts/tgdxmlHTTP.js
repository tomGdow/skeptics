var forwardButtonObject = document.getElementById('userButtonForward');
var backButtonObject = document.getElementById('userButtonBack');
var beginningButtonObject = document.getElementById('userButtonBeginning');
var endButtonObject = document.getElementById('userButtonEnd');
var xmlFileName;

xmlFileName = "/xmlNewUsers.xml";

//xml-HTTP-Request
if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
}
else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
}
xmlhttp.open("GET", xmlFileName, false);
xmlhttp.send();
xmlDoc = xmlhttp.responseXML;

x = xmlDoc.getElementsByTagName("myUsers");
var i = 0;

//DisplayFunction
function displayUser() {

    var display_email = (
        x[i].getElementsByTagName("email")[0].childNodes[0].nodeValue);
    var display_user_id = (
        x[i].getElementsByTagName("userID")[0].childNodes[0].nodeValue);
    var display_created_at = (
        x[i].getElementsByTagName("createdAT")[0].childNodes[0].nodeValue);
    var display_updated_at = (
        x[i].getElementsByTagName("updatedAT")[0].childNodes[0].nodeValue);
    var display_signInCount_at = (
        x[i].getElementsByTagName("signInCount")[0].childNodes[0].nodeValue);
    var display_currSignIn_at = (
        x[i].getElementsByTagName("currSignInAt")[0].childNodes[0].nodeValue);
     var display_lastSignIn_at = (
         x[i].getElementsByTagName("lastSignInAt")[0].childNodes[0].nodeValue);
    var display_currSignInIP = (
        x[i].getElementsByTagName("currSignInIP")[0].childNodes[0].nodeValue);
    var display_lastSignInIP = (
        x[i].getElementsByTagName("lastSignInIP")[0].childNodes[0].nodeValue);


    document.getElementById("td_email").innerHTML = display_email;
    document.getElementById("td_user_id").innerHTML = display_user_id;
    document.getElementById("td_created_at").innerHTML = display_created_at;
    document.getElementById("td_updated_at").innerHTML = display_updated_at;
    document.getElementById("td_signInCount").innerHTML = display_signInCount_at;
    document.getElementById("td_curr_sign_in_at").innerHTML = display_currSignIn_at ;
    document.getElementById("td_last_sign_in_at").innerHTML = display_lastSignIn_at;
    document.getElementById("td_curr_sign_in_ip").innerHTML = display_currSignInIP;
    document.getElementById("td_last_sign_in_ip").innerHTML = display_lastSignInIP;

}



document.write(forwardButtonObject)

function next() {
    if (i < x.length - 1) {
        i++;
        displayUser();
    }
}
function previous() {
    if (i > 0) {
        i--;
        displayUser();
    }
}
function beginning() {
    if (i > 0) {
        i = 0;
        displayUser();
    }
}
function gotoend() {
    if (i >= 0) {
        i = (x.length - 1);
        displayUser();
    }
}


//Allow multiple window.onload events
function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func
    }
    else {
        window.onload = function () {
            if (oldonload) {
                oldonload()
            }
            func()
        }
    }
}

addLoadEvent(displayUser);

//add Event Handlers
forwardButtonObject.onclick = function () {
    previous();
};
backButtonObject.onclick = function () {
    next();
};
beginningButtonObject.onclick = function () {
    beginning();
};
endButtonObject.onclick = function () {
    gotoend();
};

