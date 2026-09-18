var token;
var addr;

function on_ws_msg(data)
{
  
}

function onload_config()
{
  translateUI();
 if ( localStorage.hasOwnProperty('serverurl'))
  {
    window.serverurl =   localStorage.getItem("serverurl");
   document.getElementById('address').value =  localStorage.getItem("serverurl");
   }
   var browse_page = sessionStorage.getItem("browse_page");
 try{
 document.getElementById('browse_btn').setAttribute('href', browse_page);
 }catch{}
 
 if (localStorage.getItem('username')!= null && localStorage.getItem('password')!= null) {
    document.getElementById('username').value = localStorage.getItem('username');
    document.getElementById('password').value = localStorage.getItem('password');
    
    onload_server();
}

document.getElementById('address').innerHTML = "a"
}
  

function setAdress()
{

  var address = document.getElementById('address').value;
  localStorage.setItem('serverurl', address);
 
}





function setToken()
{
  current_address = window.location.href;

  var loginUrl = window.serverurl + "/v1/Login"
  var user = document.getElementById('username').value;
  var password = document.getElementById('password').value;
  var hash = btoa(user + ":" + password); 
  var authorizationBasic  = "Basic " + hash;
  var request = new XMLHttpRequest();
  request.open('GET', loginUrl , true)
  request.setRequestHeader('Authorization', authorizationBasic);
  request.addEventListener('load',after_setToken );
  request.send()
}


function after_setToken()
{
  var response = JSON.parse(this.response);
  if (response["response"] =="Error in login : {user:token} required ")
  { 
  document.getElementById('conn_mesg').innerHTML = "No credentials for this user / password !";
  }
  else
  {
  localStorage.setItem('username', document.getElementById('username').value);
  localStorage.setItem('password', document.getElementById('password').value);
  localStorage.setItem('token', response.token);
  document.getElementById('conn_mesg').innerHTML ="Authentication Token Set";
  } 
}

