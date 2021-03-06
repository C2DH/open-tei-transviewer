/*!
 * TEI Transviewer 1.0. Interface for online text and image visualisation.
 * Copyright (C) 2018, C2DH, University of Luxembourg,  Frédéric Reis
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
(function($) {

	TransViewerLanguage = {
		'multiple-pages':						'Multiple pages'
		,'one-page':							'One-page view'
		,'two-page':							'Two-page view'
		,'original':							'Original'
		,'original-transcription':				'Original & Transcription'
		,'transcription':						'Transcription'
		,'switch-to-scan-only':					'Switch to scan only'
		,'switch-to-scan-and-transcription':	'Switch to scan and transcription'
		,'switch-to-transcription-only':		'Switch to transcription only'
		,'zoom-in':								'Zoom in'
		,'zoom-out':							'Zoom out'
		,'back-to-original-size':				'Back to original size'
		,'linear-style':						'Linear style'
		,'diplomatic-style':					'Diplomatic style'
		,'diplomatic-responsive-style':			'Diplomatic responsive style'
		,'navigation':							'Structural navigation'
		,'search-in-text':						'Search in text'
		,'help':								'Help'
		,'search':								'Search'
		,'previous':							'Previous'
		,'next':								'Next'
		,'org':									'Organisations'
		,'product':								'Products'
		,'event':								'Events'
		,'function':							'Roles'
		,'person':								'People'
		,'place':								'Places'
		,'date':								'Dates'
		,'help.intro':							'Transviewer is a tool for the transformation of documents in XML-TEI format so that they can be viewed in the browser. It is designed to facilitate the exploration of primary/secondary sources, at document level, in historical or other types of digital scholarly editions involving the digital representation of original material.'
		,'help.placeholder':					'Hover over a feature to display an explanation here.'
		,'help.navigation':						'<span class="name">Structural navigation:</span> A view of the structural hierarchy of parts, chapters, sections, subsections, etc. of the document is provided. Users can access the content by clicking on an item in the hierarchy. The term is inspired by a similar concept in Web design (Kalbach, 2007: section 4.1.1 Structural navigation).'					
		,'help.multi-page':						'<span class="name">Multiple pages:</span> View the scanned pages of the original as thumbnails. Clicking on a thumbnail will display the corresponding page of the document.'
		,'help.single-page':					'<span class="name">One-page view:</span> One page of the scan is displayed at a time.'
		,'help.dubble-page':					'<span class="name">Two-page view:</span> Two pages of the scan are displayed at the same time, allowing users to browse the document as if they were reading a book. Clicking on the left or right side will take users to the previous or next pages.'
		,'help.display-mode':					'<div><span class="name">Original:</span> Visualisation of the scan/digitised original only.</div><div><span class="name">Original & Transcription:</span> Side-by-side visualisation of the scan/digitised original and the transcription.</div><div><span class="name">Transcription:</span> Visualisation of the transcription only.</div>'
		,'help.tei-pager':						'<div><span class="name">Page navigation:</span> Allows users to switch to the next, previous, first and last page of the document. A "Go to page" option is also available so that users can select a specific page.</div>'
		,'help.zoom-in':						'<div><span class="name">Zoom in:</span> Allows users to zoom in on both the scan and the transcription, increasing the size of the image (scan) and the font (transcription).</div>'
		,'help.zoom-reset':						'<div><span class="name">Back to original size:</span> Resets the display to the initial size of the scan and transcription, for instance after zooming in or zooming out.</div>'
		,'help.zoom-out':						'<div><span class="name">Zoom out:</span> Allows users to zoom out on both the scan and the transcription, decreasing the size of the image (scan) and the font (transcription).</div>'
		,'help.linear':							'<div><span class="name">Linear style:</span> Inspired by the term "linear transcription" in genetic editions (Grésillon 1994: 246), the linear rendering of the transcription focuses on the text content rather than on the typographical characteristics and layout of the original. Minimal formatting (left alignment) of headers and titles has been applied.</div>'
		,'help.diplomatic':						'<div><span class="name">Diplomatic style:</span> The transcription is rendered in a style close to that of the original document (although it may not be entirely identical). The term "diplomatic" is inspired by Pierazzo\'s (2011: 2) definition of a diplomatic edition which "comprises a transcription that reproduces as many characteristics of the transcribed document (the diploma) as allowed by the characters used in modern print. It includes features like line breaks, page breaks, abbreviations and differentiated letter shapes."</div>'
		,'help.diplomatic-responsive':			'<div><span class="name">Diplomatic responsive style:</span> The diplomatic responsive rendering of the transcription respects the general layout of the original (see Diplomatic style above) except for the line breaks which are discarded. The term "responsive" is related to the "optimal viewing experience" used in Web design (Marcotte, 2010: section Becoming responsive), where the visualisation of the Web page is adapted to the size of the displaying device. Therefore, in the diplomatic responsive view, the transcription will fill the whole width of the available text area, irrespective of the line breaks in the original document.</div>'
		,'help.search':							'<div><span class="name">Search in text:</span> Allows users to explore the text of the transcription. Several options may be available: free-text search and, in some cases, depending on the project, search by categories of named entities (names of people, organisations, places, etc.) and dates (see the categories explained below).</div>'
		,'help.search-form':					'<div><span class="name">Search:</span> Users can type the text to be searched in the Search field.</div>'
		,'help.previous-next':					'<div><span class="name">Previous, Next:</span> The up and down arrows to the right of the Search field allow users to navigate through the different occurrences of an item entered in the Search field or selected from the lists of named entities.</div>'
		,'help.entity-product':					'<div><span class="name">Products:</span> Composite category containing names of material and intellectual artefacts, such as specialist devices, pieces of equipment or official, historical documents and relevant units (e.g. a paragraph, subparagraph of a treaty, etc.) referred to in the text.</div>'
		,'help.entity-event':					'<div><span class="name">Events:</span> Category of events named in the text, e.g. meetings, sessions, conferences or particular historical events.</div>'
		,'help.entity-date':					'<div><span class="name">Dates:</span> Category comprising dates, usually related to particular events, mentioned in the text.</div>'
		,'help.entity-org':						'<div><span class="name">Organisations:</span> Category including names of administrative and political structures, associations, institutions, groups, etc.</div>'
		,'help.entity-person':					'<div><span class="name">People:</span> Category containing people\'s names.</div>'
		,'help.entity-function':				'<div><span class="name">Roles:</span> Category including names of official positions and roles such as president, delegate, representative, member of a specific group or organisation, etc.</div>'
		,'help.entity-place':					'<div><span class="name">Places:</span> Composite category of place names (e.g. continent, region, country, town/city).</div>'
		,'help.references-title':				'References'	
		,'help.references':						'\
			<li><span class="name">Grésillon, Almuth</span> (1994) <i>Eléments de critique génétique. Lire les manuscrits modernes</i>. Presses universitaires de France. See also: <a href="http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/" target="_blank">http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/</a>.</li>\
			<li><span class="name">Kalbach, James</span> (2007) <i>Designing Web Navigation</i>. O\'Reilly Media, Inc., ISBN: 9780596528102. <a href="https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/" target="_blank">https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/</a>.</li>\
			<li><span class="name">Marcotte, Ethan</span> (2010) <i>Responsive Web Design</i>. Publié le 25 mai 2010 dans CSS, Layout & Grids, Mobile/Multidevice, Responsive Design, Interaction Design. <a href="http://alistapart.com/article/responsive-web-design" target="_blank">http://alistapart.com/article/responsive-web-design</a>.</li>\
			<li><span class="name">Pierazzo, Elena</span> (2011) <i>A rationale of digital documentary editions</i>. <hal-01182169>. <a href="https://hal.inria.fr/hal-01182169/document" target="_blank">https://hal.inria.fr/hal-01182169/document</a>.</li>\
			<li><span class="name">TEI</span> (Text Encoding Initiative). <a href="http://www.tei-c.org/index.xml" target="_blank">http://www.tei-c.org/index.xml</a>.</li>\
		'
	};
	
})(jQuery)