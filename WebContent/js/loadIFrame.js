function loadIFrame(loc, src, css)
	{
      // create a new <iframe> element
      // append the new element to the <div id="bucket"></div>
      var iframe = document.getElementById(loc).appendChild(document.createElement('iframe'));      
   	  // style the iframe with some CSS
      iframe.style.cssText = css;
      // get a handle on the <iframe>d document (in a cross-browser way)
      var doc = iframe.contentWindow || iframe.contentDocument;
      if (doc.document) {
        doc = doc.document;
      }      
      // create a string to use as a new document object
      var val = '<scr' + 'ipt type="text/javascript"> function redirect() { window.location="'+src+'";} </scr' + 'ipt> <body onload="redirect()">';      

      // open, write content to, and close the document
      doc.open().write(val);
      doc.close();
	}
