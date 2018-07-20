/*
 * TEI Transviewer 1.0. Interface for online text and image visualisation.
 * Copyright (C) 2018, C2DH, University of Luxembourg,  Florentina Armaselu, Frédéric Reis
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

// 
// This file shows the minimum you need to provide to BookReader to display a book
//
// Copyright(c)2008-2009 Internet Archive. Software license AGPL version 3.

// Create the BookReader object
$(document).ready(function() {

	//	2017/03/03 - fre - Jira WEBSIX-376 ([TEI Transviewer][Facsimile only]Internal and external publication doesn't seem to work properly.): Get width and height for each pictures from the TEI xml file
	var img_array = $(".doc-part-fac img").remove().map(function(index, img) {
		return {
			src: 		$(img).data('src')
			,width:		Number($(img).attr('width'))
			,height:	Number($(img).attr('height'))
		};
	}).get();
	
    br = new BookReader();
    br.zoomIndex = 0;
    br.bookTitle = '';
    br.contentUrl = '';

    // Return the width of a given page.  
    // The width comes from the TEI xml file.
    // The default value is 800
    br.getPageWidth = function(index) {
        return img_array[Math.max(index, 0) || 0].width || 800;
    }

    // Return the height of a given page.
    // The height comes from the TEI xml file.
    // The default value is 1200
    br.getPageHeight = function(index) {
        return img_array[Math.max(index, 0) || 0].height || 1200;
    }

    // We load the images from archive.org -- you can modify this function to retrieve images
    // using a different URL structure
   

    // Return which side, left or right, that a given page should be displayed on
    br.getPageSide = function(index) {
        if (0 == (index & 0x1)) {
            return 'R';
        } else {
            return 'L';
        }
    }

    br.numLeafs = img_array.length;

    // This function returns the left and right indices for the user-visible
    // spread that contains the given index.  The return values may be
    // null if there is no facing page or the index is invalid.
    br.getSpreadIndices = function(pindex) {   
        var spreadIndices = [null, null]; 
        if ('rl' == this.pageProgression) {
            // Right to Left
            if (this.getPageSide(pindex) == 'R') {
                spreadIndices[1] = pindex;
                spreadIndices[0] = pindex + 1;
            } else {
                // Given index was LHS
                spreadIndices[0] = pindex;
                spreadIndices[1] = pindex - 1;
            }
        } else {
            // Left to right
            if (this.getPageSide(pindex) == 'L') {
                spreadIndices[0] = pindex;
                spreadIndices[1] = pindex + 1;
            } else {
                // Given index was RHS
                spreadIndices[1] = pindex;
                spreadIndices[0] = pindex - 1;
            }
        }
        
        return spreadIndices;
    }

    // For a given "accessible page index" return the page number in the book.
    //
    // For example, index 5 might correspond to "Page 1" if there is front matter such
    // as a title page and table of contents.
    br.getPageNum = function(index) {
        return index+1;
    }

    br.getPageURI = function(index, reduce, rotate) {
        return br.contentUrl + img_array[index].src;
    };

    
    /**
     * This method is deflected to dispatch events when the current mode or page chang
     * 
	 * @author 	fre
	 * @since	August 24, 2016
     */
    BookReader.prototype.updateLocationHash = function() 
    {

        //	Issue: if there are more than one page visible, the currentIndex will be never equal to the last page
    	if(this.mode == br.constMode1up) {
	        var maxScroll 	= $('#BRcontainer').prop('scrollHeight') - $('#BRcontainer').height();
	        if(this.firstIndex != this.numLeafs - 1 && $('#BRcontainer').scrollTop() >= maxScroll)
	        	this.firstIndex++;
    	}

        var pageNum 	= this.getPageNum(this.currentIndex());

        //	Page
        if(pageNum != this.oldPageNum)
    		$(this).trigger('changepage', pageNum);
        
        this.oldPageNum = pageNum;

    	//	Mode
    	if(this.mode != this.oldMode)
    		$(this).trigger('switchmode', this.mode);
    	
    	this.oldMode = this.mode;
    	
    };


    /**
     * Zoom in on the bookreader
     * Used to dispatch custom event with a zoom index
     * 
	 * @author 	fre
	 * @since	August 29, 2016
     */
    BookReader.prototype.zoomIn = function() 
    {
    	var reduce = this.reduce;
    	
		this.zoom(1);
		
		if(reduce != this.reduce)
    		$(this).trigger('changezoom', [this.zoomIndex + 1, this.zoomIndex++]);
    }
    
    
    /**
     * Zoom in on the bookreader
     * Used to dispatch custom event with a zoom index
     * 
	 * @author 	fre
	 * @since	August 29, 2016
     */
    BookReader.prototype.zoomOut = function() 
    {
    	//	Maximum zoom out
    	if(this.zoomIndex == -4)
    		return;
    	
    	var reduce = this.reduce;
    	
		this.zoom(-1);
		
		if(reduce != this.reduce)
    		$(this).trigger('changezoom', [this.zoomIndex - 1, this.zoomIndex--]);
    }
    

    /**
     * Reset the zoom to the default value
     * 
	 * @author 	fre
	 * @since	August 24, 2016
     */
    BookReader.prototype.resetZoom = function() 
    {
    	switch(this.mode) {
    	case 1:
	    	this.onePage.autofit = 'auto';
	    	this.displayedIndices = [];
	    	this.resizePageView();
	    	$('#BRpageview').empty();
	    	break;
	    	
    	case 2:
    		this.twoPage.autofit = 'auto';
    		this.prepareTwoPageView();
    	    break;
    	    
    	case 3:
    		this.thumbColumns = 6;
            this.prepareThumbnailView();
    	    
    	}
    	
		$(this).trigger('changezoom', [0, this.zoomIndex]);
    	this.zoomIndex = 0;
    	
    } 
    
    
    //	Disable navbar and toolbar features
    BookReader.prototype.initNavbar = function() {};
    BookReader.prototype.initToolbar = function() {};
    
    // Book title and the URL used for the book title link
    // br.bookTitle= 'Open Library BookReader Presentation';
    // br.bookUrl  = 'http://openlibrary.org';

    // Override the path used to find UI images
    br.imagesBaseURL = './';

    br.getEmbedCode = function(frameWidth, frameHeight, viewParams) {
        return "Embed code not supported in bookreader demo.";
    }


    var isIE = (navigator.userAgent.indexOf("MSIE") != -1);
    setTimeout(function() {
        $(".loader-processing").hide();
        br.init();
    }, 4500);
    
     //setInterval(function() { console.log(finish);}, 100);

    // function checkReady() {
        
    //     console.log(finish);
    //     if (!finish) {
    //         console.log("finish is false");
    //         setTimeout(checkReady, 500);
    //     } else {
    //         //$(".loader-processing").hide();
    //         console.log("trouvé!");
    //     }
    // }
//    checkReady();
 // br.init();
});