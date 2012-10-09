function cambio(valor)
{
  /*alert("me llego el valor " + valor);*/

  sessionStorage.setItem('tipo_background',valor);

  if(valor == "violet")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-violet.jpg')";
  }
  else if(valor == "green")
  {
    document.body.style.color="yellow";
	  document.body.style.backgroundImage="url('/assets/background-green.jpg')";
  } 
  else if(valor == "blue")
  {
    document.body.style.color="yellow";
	  document.body.style.backgroundImage="url('/assets/background-blue.jpg')";
  } 
  else if(valor == "brown")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-brown.jpg')";
  } 
  else if(valor == "pink")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-pink.jpg')";
  } 
  else if(valor == "wood")
  {
    document.body.style.color="black";
	  document.body.style.backgroundImage="url('/assets/background-wood-vertical.png')";
  } 
  else if(valor == "red")
  {
    document.body.style.color="gray";
	  document.body.style.backgroundImage="url('/assets/background-red.jpg')";
  } 
  else 
  {
    document.body.style.color="yellow";
    document.body.style.backgroundImage="url('/assets/background-green.jpg')";
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
