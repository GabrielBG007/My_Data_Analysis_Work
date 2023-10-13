const hamburger = document.querySelector(".header .nav-bar .nav-list .hamburger");/* Guiamos a java script para que encuentre la clase hamburguesa */
const mobile_menu = document.querySelector(".header .nav-bar .nav-list ul");
const menu_item = document.querySelectorAll(".header .nav-bar .nav-list ul li a");/* SelecterAll significa que vamos a seleccionar a más de un elemento dentro de a */
const header = document.querySelector(".header.container");

hamburger.addEventListener("click",()=>{
    hamburger.classList.toggle("active");/* Aplicamos una animación al clickear, ver inspeccionar con click derecho sobre la web */
    mobile_menu.classList.toggle("active");/* Igual que el anterior */
});/* Con active creamos interacciones tras clickear los botones */


 document.addEventListener("scroll",()=>{
    var scroll_position = window.scrollY;
    if(scroll_position > 250){
        header.style.backgroundColor = "#29323c";
    }else {
        header.style.backgroundColor = "transparent";
    }
 });/* Esta línea de comando nos permite que si scrolleamos hacia abajo una cierta distancia el 
 fondo del header cambiará de color y si nos vamos arriba del todo se vuelve transparente.
 Darnos cuenta que hacemos referencia al header que hemos definido como variable al principio de este archivo 
 y que hemos guiado a java a que lo busque y encuentre. */

 menu_item.forEach(item=> {/* Queremos que tras clickear a cada uno de los elementos del menú, la hamburguesa siga haciendo su efecto (como si clickaramos sobre la hamburguesa,
    que sería el hamburger.classList.....) y también el menú aparezca y desaparezca (con el mobile_menu....) */
    item.addEventListener("click", () => {
        hamburger.classList.toggle("active");
        mobile_menu.classList.toggle("active");   
    });
 });/* (Caso Móvil y Tablet) Aplicamos lo mismo que en el menú de la hamburguesa, que al presionar sobre ella nos aparece y 
  desaparece el menú. En este caso, cuando estemos dentro del menú cada vez que le demos a alguna de las palabras 
  nos sacará del menú y nos llevará al sitio donde hayamos clickeado. */