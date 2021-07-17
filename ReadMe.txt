ReadMe - Open source TEI Transviewer 1.0
Authors: Florentina Armaselu, Frédéric Reis
Last updated: 17.07.2021
Institution: Luxembourg Centre for Contemporary and Digital History (C2DH), University of Luxembourg, https://www.c2dh.uni.lu/ 
-------------------------------------

CONTENTS

1. Introduction
2. Installation and testing (Windows)
3. Folders and files
	3.1. data
	3.2. transviewer
4. Licenses
5. Current online (server-based) version
6. Specific instructions
	6.1. Specify the height and width attributes of images
	6.2. Change the interface language
7. Cross-browser compatibility
	7.1. Tested OS and browsers
	7.2. Issues
8. How to cite the Transviewer software

-------------------------------------
1. Introduction
-------------------------------------

TEI Transviewer is an interface intended to the exploration of primary and secondary sources, at the document level, in historical or other types of digital editions involving the representation of original material. Its name comes from the combination of the terms transformation and viewing, supposing the transformation of documents in XML-TEI format (directly in the browser or by means of a server/dedicated editor) so that they can be viewed in the browser.

Features:
- side-by-side and single view of transcription and digital facsimile,
- synchronised scrolling and zooming, 
- page and structural navigation, 
- linear and diplomatic transcription view, 
- free text search and search by categories of named entities (persons, organisations, places, dates, etc.).

The Transviewer architecture is based on core/project-specific JS, CSS and XSLT modules allowing to accommodate both common elements, applying to many projects, as well as particularities applying to just one project. 

Two versions of the Transviewer software are available: (1) online, server-based (section 5); (2) open source adaptation (sections 2-4, 6 and 7).


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

3.1. data

TEI Transviewer samples, for three configurations: 
- facsimile only (sample_facs-only)
- transcription and facsimile (sample_transcr-facs)
- transcription only (sample_transcr-only).

For each corresponding configuration, there is a common hierarchy of subfolders:

html - Results of the xslt transformation without using Saxon-CE.
html_saxonce - Results of the xslt transformation using Saxon-CE.
media - Images of the digitised facsimiles.
xml - Files in XML-TEI format to be transformed and visualised via the Transviwer.


3.2. transviewer

transviewer.js - main Transviewer module

images - Transviewer icons

lib - Third party libraries called by the Transviewer

resources - Transviewer JS modules for multilingual support (DE, EN, FR)

styles - Transviewer CSS stylesheets

templates - Transviewer core and project-specific (plugins) CSS and XSLT stylesheets. The modular structure should allow reuse, customisation and integration of new (project-specific) formatting/transformation features.

core - CSS or XSLT applying to a larger number of projects (e.g. transformation of the most common XML structural elements or basic CSS formatting).

plugins - It may contain subfolders for each project requiring specific configurations. The name of the subfolder is the same with that of the project mentioned in the data folder (e.g. sample_transcr-facs). 

main_to_html - XSLT stylesheet transforming the XML-TEI to HTML, outside the browser (e.g. via an XML Editor equipped with a XSLT processor).

main - XSLT stylesheet transforming the XML-TEI directly in the browser (e.g. using Saxon-CE processor) or outside the browser to generate the corresponding HTML file. 

main_plugin - XSLT stylesheet transforming the XML-TEI to HTML without including the standalone viewer. It can be used to integrate the viewer as a plug-in in a website.


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

Open TEI Transviewer 1.0: AGPL v3 License, https://www.gnu.org/licenses/agpl.html.


-------------------------------------
5. Current online (server-based) version
------------------------------------- 

The current online (server-based) version of the Transviewer and our CVCE.EU by UNI.LU XML-TEI collection can be accessed via the following link: https://www.cvce.eu/en/search?q=*&format=tei%2Bxml. The collection contains facsimile-only and transcription and facsimile documents. Check the box "Franco-British diplomatic games and issues within WEU (1954-1982)" to display only the list of documents provided with both transcription and facsimile.


-------------------------------------
6. Specific instructions
-------------------------------------

6.1.  Specify the height and width attributes of images

The width and height attributes of images should be manually specified in the xml file in order to keep the ratio of images. If omitted, the default width is 800px and default height is 1200px with a ratio of 2/3. Any units can be used for the values.

Ex: <graphic width="686px" height="889px" url="../media/images/transviewer-sample_3_001.jpg"/>


6.2. Change the interface language

The language of a document is described by the @xml:lang attribute of the 'text' tag in the xml file.

Ex: <text xml:id="transviewer_sample_3" decls="#transcr-facs" type="sample" xml:lang="en">

The default language of the interface is English. It can be changed by changing the value of the 'interface_lang' variable in the templates/xslt/core/global_constants.xsl file.

Ex: <xsl:variable name="interface_lang" select="'fr'"/>

For the change to be effective, the html files should be regenerated.

Available languages are: French (fr), English (en) and German (de). If you wish to add a new language, you need to create a new file in the resources folder with the iso code as name.

Ex: resources/es.js
 

-------------------------------------
7. Cross-browser compatibility
-------------------------------------

7.1. Tested OS and browsers

Transviewer was tested on Windows 7 Professional (64-bit), with the following browsers:
- Firefox, 59.0
- Google Chrome, 66.0
- Internet Explorer, 11.0
- Opera, 52.0.


7.2. Issues

Transviewer direct XML transformation using Saxon-CE does not work on Firefox. The Saxon-CE library generates a JavaScript error when it's added by an xslt 1.0 stylesheet. (Error: InvalidStateError: An attempt was made to use an object that is not, or is no longer, usable Saxonce.nocache.js).

This could be an explanation: https://stackoverflow.com/questions/20778312/why-do-xslt-inserted-scripts-behave-like-asynchronous-in-firefox.

A topic about the problem: https://saxonica.plan.io/boards/1/topics/5808.


-------------------------------------
8. How to cite the Transviewer software
-------------------------------------

Armaselu, F. Reis, F. Jones, C. Wieneke, L. Berettoni, A. Alzetta, C. Hingray, E. Piticco, M. C. Cooper, S. Guido, D. (2018). TEI Transviewer. Luxembourg Centre for Contemporary and Digital History (C2DH), University of Luxembourg. https://orbilu.uni.lu/handle/10993/36992.

Armaselu, F. Reis, F. (2018). Open TEI Transviewer. Luxembourg Centre for Contemporary and Digital History (C2DH), University of Luxembourg. https://github.com/C2DH/open-tei-transviewer.

