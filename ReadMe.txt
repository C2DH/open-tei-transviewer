ReadMe - Open source TEI Transviewer 1.0
Author(s): Florentina Armaselu
Last updated: 17.11.2017
------------------------------------

CONTENTS

1. Introduction
2. Installation and testing (Windows) - Fred, should we add something for Linux?
3. Folders and files
	3.1. data
	3.2. transviewer
4. Licenses
5. Current online version
6. Specific instructions
	6.1. Specify the height and width attributes of images
	6.2. Change the interface language


-------------------------------------
1. Introduction
-------------------------------------


TEI Transviewer is an interface intended to the exploration of primary and secondary sources, at the document level, in historical or other types of digital editions involving the representation of original material. Its name comes from the combination of the terms transformation and viewing, supposing the transformation of documents in XML-TEI format (directly in the browser or by means of a server/dedicated editor) so that they can be viewed in the browser.

The Transviewer architecture is based on core / project-specific JS, CSS and XSLT modules allowing to accomodate both common elements, applying to many projects, as well as particularities to just one project. 


-------------------------------------
2. Installation and testing (Windows)
-------------------------------------


For testing, install a cross-platform web server package, e.g. XAMPP the free Apache distribution (https://www.apachefriends.org/).

Copy the open-tei-transviewer folder on your local machine under htdocs in the xampp distribution installation folder (e.g. C:\xampp\htdocs). 

Launch the XAMPP Control panel and launch the Apache Service.

In the browser, type http://localhost/open-tei-transviewer/data/ to browse the TEI Transviewer samples provided with this release.


-------------------------------------
3. Folders and files
-------------------------------------


transviewer.js - main Transviewer module

3.1. data

TEI Transviewer samples, for three configurations: 
- facsimile only (sample_facs-only)
- transcription and facsimile (sample_transcr-facs)
- transcription only (sample_transcr-only)

For each corresponding configuration, there is a common hierarchy of subfolders:

html_saxonce - results of the xslt transformation using Saxon-CE
media - images of the digitised facsimiles
html - results of the xslt transformation without using Saxon-CE
xml - files in XML-TEI format to be transfromed and visualised via the Transviwer


3.2. transviewer

images - Transviewer icons

lib - Third party libraries called by the Transviewer

resources - Transviewer JS modules for multilingual support (DE, EN, FR)

styles - Transviewer CSS stylesheets

templates - Transviewer core and project-specific (plugins) CSS and XSLT stylesheets 

core - CSS or XSLT applying to a larger number of project (e.g. most common XML structural elements or basic CSS formatting)

plugins - It may contain subfolders for each project requiring specific configurations. The name of the subfolder is the same with that of the project mentioned in the data folder (e.g. sample_transcr-facs). 

main_to_html - XSLT stylesheet transforming the XML-TEI to HTML, outside the browser (e.g. via an XML Editor equipped with a XSLT processor).

main - XSLT stylesheet transforming the XML-TEI directly in the browser (e.g. using Saxon-CE processor) or outside the browser to generate the corresponding HTML file. 


-------------------------------------
4. Licenses
-------------------------------------


jQuery 1.11.1: MIT License,  https://jquery.org/license/

jQuery UI 1.11.4: MIT License, https://jquery.org/license/ 

jQuery Highlight Plugin: MIT License, http://bartaz.github.io/sandbox.js/jquery.highlight.html

Mark.js 8.1.1: MIT License, https://github.com/julmot/mark.js/blob/master/LICENSE 

jQuery dragscrollable Plugin 1.0: MIT & GPL License, https://github.com/mvlandys/jquery.dragscrollable/blob/master/dragscrollable.js 

Bookreader: AGPL v3 License, https://github.com/internetarchive/bookreader/blob/master/LICENSE 

Saxon-CE 1.1: http://www.saxonica.com/license/license.xml: Mozilla Public License; Version 2.0, https://www.mozilla.org/en-US/MPL/2.0/

TEI Transviewer 1.0: TBD.


-------------------------------------
5. Current online version
------------------------------------- 

The current online version of the Transviewer and our XML-TEI based collection can be accessed via the following link: https://www.cvce.eu/search?q=*&format=tei%2Bxml.


-------------------------------------
6. Specific instructions
-------------------------------------

6.1.  Specify the height and width attributes of images

The width and height attributes of images should be manually specified in the xml file in order to keep the ratio of images.
If omitted, the default width is 800px and default height is 1200px with a ratio of 2/3.
Any units can be used for the values.

Ex: <graphic width="686px" height="889px" url="../media/images/transviewer-sample_3_001.jpg"/>


6.2. Change the interface language
