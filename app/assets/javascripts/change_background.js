function cambio(valor)
{
  /*alert("me llego el valor " + valor);*/

  sessionStorage.setItem('tipo_background',valor);

  if(valor == "pink")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-pink.png')";
  } 
  
  else if(valor == "red")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-red.png')";
  } 
  else if(valor == "blue")
  {
    document.body.style.color="white";
    document.body.style.backgroundImage="url('/assets/background-blue.png')";
  }
  else
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-default.png')";
  } 
  
  /*alert("Me voy con:"+sessionStorage.getItem('tipo_background'));*/
}

function determinar_cambio()
{
  valor=sessionStorage.getItem('tipo_background');

  if (valor == null )
    valor = document.getElementById("change_background").value;

  document.getElementById("change_background").value = valor;

  /*alert("Value en onload:"+valor);*/
  cambio(valor);
}
