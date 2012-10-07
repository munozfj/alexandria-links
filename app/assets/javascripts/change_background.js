function cambio(valor)
{
  /*alert("me llego el valor " + valor);*/

  if(valor == "violet")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-violet.jpg')";
  }
  else if(valor == "black")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-black.jpg')";
  } 
  else if(valor == "blue")
  {
    document.body.style.color="orange";
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
	  document.body.style.backgroundImage="url('/assets/background-wood.png')";
  } 
  else if(valor == "verticalwood")
  {
    document.body.style.color="black";
	  document.body.style.backgroundImage="url('/assets/background-wood-vertical.png')";
  } 
  else 
  {
    document.body.style.color="black";
    document.body.style.backgroundImage="url('/assets/background-wood-vertical.png')";
  }
  

}
