/***************** PURE JS *****************/

//Returns a NodeList of Elements matching the CSS selector.
document.getElementById(selector)

//Returns a single Element matching the id.
document.getElementsByClassName(selector)

//Returns an Array-like object of type NodeList that contains all Elements matching the class name.
document.querySelectorAll(selector)

//Creates new DOM element, without appending anywhere
const li = document.createElement("li")

//Sets text value
li.textContent = "Bla"

//Append to Element
Element.appendChild(li);

//Adds event listener. Blocks default from taking place
Element.addEventListener("submit", event => {
  event.preventDefault();
})

/***************** jQuery *****************/

// Iterate through each Element obj from a jQuery list
$("li").each(() => ...)

// Add/Remove/Toggle class (done iteratively)
$("li").addClass("bla") / $("li").removeClass("bla") / $("li").toggleClass("bla")

// Traversal methods
$("ul").children() / $("ul").parent() / $("ul").siblings()
