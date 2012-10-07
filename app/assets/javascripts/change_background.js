function cambio(valor)
{
  /*alert("me llego el valor " + valor);*/

  if(valor == "green")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-green.jpg')";
  }
  else if(valor == "blue")
  {
    document.body.style.color="yellow";
	  document.body.style.backgroundImage="url('/assets/background-blue.jpg')";
  } 
  else if(valor == "lightblue")
  {
    document.body.style.color="white";
	  document.body.style.backgroundImage="url('/assets/background-lightblue.png')";
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
