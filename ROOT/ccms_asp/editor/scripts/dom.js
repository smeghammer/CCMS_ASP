//TODO: Do this as a .ASP page, I can then dynamically set the options.


window.onload = function(){
	var handlers = new Handlers();

	//retrieve all the UL tags inside the nav container:
	var lists   = document.getElementById("tree").getElementsByTagName("ul");

	//handle sibling insertion:
	var arr = new Array();

	/*
	HANDLE THE UL PARENT ELEMENT:
	I need to insert a click handler as a SIBLING ABOVE the UL tag:
	*/
	var elem;
	var index;

	//append an onclick handler
	var b;
	var c;
	for(var a = 1; a < lists.length; a++){
		//close by default:
		lists[a].style.display = "none";

		elem              = document.createElement('span');
		elem.onclick      = handlers.click_opener;
		elem.onmouseover  = handlers.mouseover_pointer;
		elem.innerHTML    = "&nbsp;+&nbsp;";
		addElementAsFirstItem(lists[a].parentNode,elem);
	}

	//and unhide the root:
	lists[0].style.display = "block";

	/*
	HANDLE THE LI ITEM ELEMENTS:
	get all the LI tags to generate the click event for dropdown insertion:
	Note: I need to do it this way because if I try to add onclick to the LI, it conflicts with the opener.
	*/

	var items   = document.getElementById("tree").getElementsByTagName("li");

	var text;

	for(a = 0; a < items.length; a++){

		//create a SPAN to insert in the current LI tag:
		elem = document.createElement("span");

		//we need the ID:
		elem.setAttribute("id",items[a].getAttribute("id"));

		//create a text node to insert into the new SPAN. Use the LI attribute 'title' as dynamically obtained:
		text = document.createTextNode(items[a].getAttribute("title") + "(" + items[a].getAttribute("id") + ")");
		elem.appendChild(text);

		//attach a click handler:
		elem.onclick = handlers.click_dropdown;

		//attach an onhover handler:
		elem.onmouseover = handlers.mouseover_pointer;

		addElementAsFirstItem(items[a],elem);
	}
}

/*
Class holding event handlers. 'this' refers to the element to which
the handler has been assigned.
*/
function Handlers(){

	/*
	generic onmouseover pointer handler
	*/
	Handlers.prototype.mouseover_pointer = function(){
		this.style.cursor = "pointer";
	}
	
	/*
	handle opening/closing of child item list:
	*/
	Handlers.prototype.click_opener = function(){
		if(this.innerHTML == "&nbsp;+&nbsp;") this.innerHTML = "&nbsp;-&nbsp;";
		else this.innerHTML = "&nbsp;+&nbsp;"

		var obj     = this.parentNode;     //I need to get the parent LI tag and then get the nested UL - there should be only one....
		var childContainer = obj.getElementsByTagName("ul")[0]; //there's only one...
		if(childContainer.style.display == "block") childContainer.style.display = "none";
		else childContainer.style.display = "block";
	}
	
	/*
	handle attaching the dropdown for the selected item:
	*/
	Handlers.prototype.click_dropdown = function(){
		
		//iterate over all LI elements and remove the SELECT element
		
		var lists = document.getElementById("tree").getElementsByTagName("li");
		var directLIChildArray;
		var currParent;
		//get the SPAN elements, check for id="actionsdropdown" and remove this if found:
		var currSpans = document.getElementsByTagName("span");
		//iterate over these and remove any that are id="dropdown":
		for(var a=0;a<currSpans.length;a++){
      if(currSpans[a].getAttribute("id") == "actionsdropdown"){
        currParent = currSpans[a].parentNode;   //?
        currParent.removeChild(currSpans[a]);  
      }
    }
		
		
		/*
    for(a = 0; a < lists.length; a++){
			//get the direct children of the current LI element:
			directLIChildArray = lists[a].childNodes;

			//iterate over child list, remove elem if it is SELECT:
			for(var c = 0; c<directLIChildArray.length; c++){
			  //orig
				//if(directLIChildArray[c].tagName == "SELECT") lists[a].removeChild(directLIChildArray[c]);
			}
		}
		*/
		var nodeId = this.getAttribute("id").split("_")[1];

    //create wrapper to contain the <select> and the button:
    var selSpan = document.createElement("span");
    selSpan.setAttribute("id","actionsdropdown");

		//add SELECT element and handler to THIS element:
		var sel = document.createElement("select");
		sel.setAttribute("name","getaction")
		//build the initial message
    var opt0 = document.createElement("option");
		opt0.appendChild(document.createTextNode("[select action]"));

    //build option 1
    var opt1 = document.createElement("option");
		opt1.setAttribute("value","reorder");
		opt1.appendChild(document.createTextNode("Re-order child items"));
		
		//build option 2
    var opt2 = document.createElement("option");
		opt2.setAttribute("value","layout");
		opt2.appendChild(document.createTextNode("Assign layout"));
		
		//build option 3
    var opt3 = document.createElement("option");
		opt3.setAttribute("value","nodeprops");
		opt3.appendChild(document.createTextNode("Node properties"));

    //build option 4
    var opt4 = document.createElement("option");
		opt4.setAttribute("value","pageprops");
		opt4.appendChild(document.createTextNode("Page properties"));
		
		//build option 5
    var opt5 = document.createElement("option");
		opt5.setAttribute("value","movenode");
		opt5.appendChild(document.createTextNode("Move node"));

		sel.appendChild(opt0);
    sel.appendChild(opt1);
    sel.appendChild(opt2);
    sel.appendChild(opt3);
    sel.appendChild(opt4);
    sel.appendChild(opt5);
    
    var btn = document.createElement("input");
    btn.setAttribute("type","button");
    btn.setAttribute("name","doaction");
    btn.setAttribute("value","OK");
    btn.setAttribute("onclick","doAction(" + nodeId + ");return false;");
    //btn.setAttribute("onclick","javascript:alert(" + nodeId + ");");
    
    //add stuff to the containing SPAN:
    selSpan.appendChild(sel);
    selSpan.appendChild(btn);
    
    
		//I need to append to the PARENT element:
		arr = new Array();
		var childs;
		
		//this.parentNode.appendChild(sel);
		//addDropdown(this.parentNode,sel);
		addDropdown(this.parentNode,selSpan);
	}
}

/*
add a new DOM element as the first child of PARENT:
*/
function addElementAsFirstItem(parent,itemToAdd){
	try{
		arr = new Array();  //reset temp array.
		var nodeList      = parent.childNodes;

		//add the click span to the top of the
		var arr = new Array();
		for(b=0;b<nodeList.length;b++){
			arr.push(nodeList[b]);
		}

		arr.reverse();

		//add new element to array, and reverse so it is at the top:
		arr.push(itemToAdd);
		arr.reverse();

		//add each element on the array to the current item:
		for(c=0;c<arr.length;c++){
			parent.appendChild(arr[c]);
		}
	}
	catch(e){
		alert(e.message);
	}
}
/*
add DOM element at specified position
*/
function addDropdown(parent,itemToAdd){
	try{
		var initialList 	= parent.childNodes;
		var modifiedList    = new Array();

		var insertAt = 1;

		//if there's only one, there are no childs:
		if(initialList.length == 1) insertAt = 0;

		for(var a=0;a<initialList.length;a++){
			modifiedList.push(initialList[a]);
			if(a == insertAt) modifiedList.push(itemToAdd);
		}
		
		//append the modified list:
		for(a=0;a<modifiedList.length;a++){
            parent.appendChild(modifiedList[a]);
		}
	}
	catch(e){
		alert(e.message)
	}
}
