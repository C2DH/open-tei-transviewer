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
		'multiple-pages':						'Mehrere Seiten'
		,'one-page':							'Eine Seite'
		,'two-page':							'Zwei Seiten'
		,'original':							'Original'
		,'original-transcription':				'Original und Transkription'
		,'transcription':						'Transkription'
		,'switch-to-scan-only':					'Zur Transkription wechseln'
		,'switch-to-scan-and-transcription':	'Zum Scan und zur Transkription wechseln'
		,'switch-to-transcription-only':		'Zum Scan wechseln'
		,'zoom-in':								'Vergrößern'
		,'zoom-out':							'Verkleinern'
		,'back-to-original-size':				'Zurück zur Originalgröße'
		,'linear-style':						'Lineare Ansicht'
		,'diplomatic-style':					'Diplomatischer Ansicht'
		,'diplomatic-responsive-style':			'Diplomatisch-responsive Ansicht'
		,'navigation':							'Strukturelle Navigation'
		,'search-in-text':						'Text durchsuchen'
		,'help':								'Hilfe'
		,'search':								'Suchen'
		,'previous':							'Vorherige'
		,'next':								'Nächste'
		,'org':									'Organisationen'
		,'product':								'Produkte'
		,'event':								'Ereignisse'
		,'function':							'Funktionen'
		,'person':								'Personen'
		,'place':								'Orte'
		,'date':								'Daten'
		,'help.intro':							'Transviewer ist ein Werkzeug für die Konvertierung von Dokumenten in das XML-TEI Format und deren Darstellung im Browser. Transviewer erleichtert das Studium von Primär- und Sekundärquellen für einzelne Dokumente und in digitalen wissenschaftlichen Editionen, die die Darstellung von Originalmaterialien einbeziehen.'
		,'help.placeholder':					'Fahren Sie mit der Maus über die Funktionen, um die Erklärungen hier anzuzeigen.'
		,'help.navigation':						'<span class="name">Strukturelle Navigation:</span> Daneben können auch Hierarchie-Strukturen wie z.B. Kapitel, Abschnitte, und Unterabschnitte angezeigt werden. Ein Klick auf eines dieser Elemente führt Benutzer zu den jeweiligen Inhalten. Der Begriff „Strukturelle Navigation“ wurde mit Blick auf ein ähnliches Konzept aus dem Webdesign (Kalbach, 2007: section 4.1.1 Structural navigation) gewählt.'					
		,'help.multi-page':						'<span class="name">Mehrere Seiten:</span> Die gescannten Originalseiten werden als Miniaturen angezeigt. Durch das Anklicken einer Miniatur wird die entsprechende Seite des Dokuments angezeigt.'
		,'help.single-page':					'<span class="name">Eine Seite:</span> Ansicht einer gescannten Seite.'
		,'help.dubble-page':					'<span class="name">Zwei Seiten:</span> Zwei gescannte Seiten werden nebeneinander angezeigt, um Benutzern das Durchblättern wie in einem Buch zu ermöglichen. Ein Klick auf den linken oder rechten Rand führt auf die vorherige oder nächste Seite.'
		,'help.display-mode':					'<div><span class="name">Original:</span> Darstellung des eingescannten/digitalisierten Originals.</div><div><span class="name">Original & Transkription:</span> Darstellung des eingescannten/digitalisierten Originals und der Transkription nebeneinander.</div><div><span class="name">Transkription:</span> Darstellung der Transkription.</div>'
		,'help.tei-pager':						'<div><span class="name">Seitennavigation:</span> Ermöglicht es dem Benutzer zur nächsten, vorherigen, ersten und letzten Seite des Dokuments zu wechseln. Mit der Option „Zur Seite” können Benutzer auf eine bestimmte Seite wechseln.</div>'
		,'help.zoom-in':						'<div><span class="name">Vergrößern:</span> Ermöglicht es dem Benutzer das gescannte Dokument und die Transkription gleichzeitig zu vergrößern. Vergrößert wird hierbei das Bild des gescannten Dokuments und die Schrift der Transkription.</div>'
		,'help.zoom-reset':						'<div><span class="name">Zurück zur Originalgröße:</span> Stellt nach einer vorangegangenen Vergrößerung oder Verkleinerung die Anfangsgröße des gescannten Dokuments und der Transkription wieder her.</div>'
		,'help.zoom-out':						'<div><span class="name">Verkleinern:</span> Ermöglicht es dem Benutzer das gescannte Dokument und die Transkription gleichzeitig zu verkleinern. Verkleinert wird hierbei das Bild des gescannten Dokuments und die Schrift der Transkription.</div>'
		,'help.linear':							'<div><span class="name">Linearer Stil:</span> Die lineare Wiedergabe der Transkription, die sich an dem Begriff “lineare Transkription” in den Genetic Editions (Grésillon 1994: 246) anlehnt, konzentriert sich mehr auf den Textinhalt als auf die typografischen Merkmale und das Layout des Originals. Hier wird lediglich eine minimale Formatierung (Ausrichtung nach links) der Kopfzeilen und Titel verwendet.</div>'
		,'help.diplomatic':						'<div><span class="name">Diplomatischer Stil:</span> Die Transkription wird in einem Stil wiedergegeben, der dem Originaldokument sehr nahe kommt (auch wenn er nicht ganz identisch ist). Der Begriff „diplomatisch“ lehnt sich an die Definition einer diplomatischen Edition von Pierazzo (2011: 2) an die besagt, dass sie „eine Transkription aufweist, die so viele Merkmale des transkribierten Dokuments (Diploma) wiedergibt wie es die Zeichen der modernen Druckerei erlauben. Sie umfasst Funktionen wie Zeilenumbrüche, Seitenumbrüche, Abkürzungen und differenzierte Buchstabenformen.“</div>'
		,'help.diplomatic-responsive':			'<div><span class="name">Diplomatisch-responsiver Stil:</span> Die diplomatisch-responsive Wiedergabe der Transkription respektiert das allgemeine Layout des Originals (siehe oben Diplomatischer Stil) mit Ausnahme von Zeilenumbrüchen. Der Begriff „responsiv“ hängt mit der im Webdesign (Ethan Marcotte, Responsive Web Design: section Becoming responsive, 2010) verwendeten „optimalen Darstellung“ (optimal viewing experience) zusammen, bei der sich die Visualisierung der Webseite an die Größe des Wiedergabegeräts anpasst. Deshalb füllt die Transkription in der diplomatisch-responsiven Ansicht die gesamte Breite des verfügbaren Textbereichs aus, ohne die Zeilenumbrüche des Originaldokuments zu berücksichtigen.</div>'
		,'help.search':							'<div><span class="name">Text durchsuchen:</span> Ermöglicht es dem Benutzer den Text der Transkription zu durchsuchen. Je nach Projekt stehen zwei Optionen zur Verfügung: die Freitextsuche und, soweit verfügbar, die Suche nach Kategorien benannter Einheiten (Personennamen, Organisationen, Orte, etc.) und Daten (siehe unten die erläuterten Kategorien).</div>'
		,'help.search-form':					'<div><span class="name">Suchen:</span> Benutzer können den zu suchenden Text in das Suchfeld eingeben.</div>'
		,'help.previous-next':					'<div><span class="name">Vorherige, Nächste:</span> Die Auf- und Abwärtspfeile, die sich rechts von dem Suchfeld befinden, ermöglichen es dem Benutzer durch die Suchtreffer oder die Listen benannter Entitäten zu navigieren.</div>'
		,'help.entity-product':					'<div><span class="name">Produkte:</span> Sammelkategorie für im Text genannte materielle und intellektuelle Artefakte wie z.B. Spezialgeräte, Ausrüstungsgegenstände oder offizielle historische Dokumente und relevante Texteinheiten (z.B. ein Absatz oder Unterabsatz eines Vertrags, etc.).</div>'
		,'help.entity-event':					'<div><span class="name">Ereignisse:</span> Kategorie für im Text genannte Ereignissen, z.B. Besprechungen, Sitzungen, Konferenzen oder historische Ereignisse.</div>'
		,'help.entity-date':					'<div><span class="name">Daten:</span> Kategorie die Datumsangaben umfasst, die sich zumeist auf im Text genannte Ereignissen beziehen.</div>'
		,'help.entity-org':						'<div><span class="name">Organisationen:</span> Kategorie für im Text genannte Namen administrativer und politischer Strukturen, Verbände, Institutionen, Gruppen, etc.</div>'
		,'help.entity-person':					'<div><span class="name">Personen:</span> Kategorie für im Text genannte Personennamen.</div>'
		,'help.entity-function':				'<div><span class="name">Funktionen:</span> Kategorie für im Text genannte offizielle Rollen und Funktionen, wie z.B. Präsident, Delegierter, Vertreter, Mitglied einer bestimmten Gruppe oder Organisation.</div>'
		,'help.entity-place':					'<div><span class="name">Orte:</span> Sammelkategorie für im Text genannte Ortsangaben (z.B. Kontinent, Region, Land, Stadt).</div>'
		,'help.references-title':				'Referenzen'	
		,'help.references':						'\
			<li><span class="name">Grésillon, Almuth</span> (1994) <i>Eléments de critique génétique. Lire les manuscrits modernes</i>. Presses universitaires de France. Siehe auch: <a href="http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/" target="_blank">http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/</a>.</li>\
			<li><span class="name">Kalbach, James</span> (2007) <i>Designing Web Navigation</i>. O\'Reilly Media, Inc., ISBN: 9780596528102. Verfügbar unter: <a href="https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/" target="_blank">https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/</a>.</li>\
			<li><span class="name">Marcotte, Ethan</span> (2010) <i>Responsive Web Design</i>. Veröffentlicht am 25. Mai 2010 in CSS, Layout & Grids, Mobile/Multidevice, Responsive Design, Interaction Design. Verfügbar unter: <a href="http://alistapart.com/article/responsive-web-design" target="_blank">http://alistapart.com/article/responsive-web-design</a>.</li>\
			<li><span class="name">Pierazzo, Elena</span> (2011) <i>A rationale of digital documentary editions</i>. <hal-01182169>. Verfügbar unter: <a href="https://hal.inria.fr/hal-01182169/document" target="_blank">https://hal.inria.fr/hal-01182169/document</a>.</li>\
			<li><span class="name">TEI</span> (Text Encoding Initiative). Verfügbar unter: <a href="http://www.tei-c.org/index.xml" target="_blank">http://www.tei-c.org/index.xml</a>.</li>\
		'
	};
	
})(jQuery)