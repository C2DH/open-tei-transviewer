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
		'multiple-pages':						'Plusieurs pages'
		,'one-page':							'Une page'
		,'two-page':							'Deux pages'
		,'original':							'Original'
		,'original-transcription':				'Original et transcription'
		,'transcription':						'Transcription'
		,'switch-to-scan-only':					'Passer au document numérisé'
		,'switch-to-scan-and-transcription':	'Passer au document numérisé et à la transcription'
		,'switch-to-transcription-only':		'Passer à la transcription'
		,'zoom-in':								'Agrandir'
		,'zoom-out':							'Réduire'
		,'back-to-original-size':				'Retour à la taille originale'
		,'linear-style':						'Style linéaire'
		,'diplomatic-style':					'Style diplomatique'
		,'diplomatic-responsive-style':			'Style diplomatique adaptatif'
		,'navigation':							'Navigation structurelle'
		,'search-in-text':						'Rechercher dans le texte'
		,'help':								'Aide'
		,'search':								'Rechercher'
		,'previous':							'Précédent'
		,'next':								'Suivant'
		,'org':									'Organisations'
		,'product':								'Produits'
		,'event':								'Événements'
		,'function':							'Fonctions'
		,'person':								'Personnes'
		,'place':								'Lieux'
		,'date':								'Dates'
		,'help.intro':							'Transviewer est un outil permettant la transformation de documents en format XML-TEI afin de pouvoir les afficher dans le navigateur. Il vise à faciliter l’exploration de sources primaires/secondaires, au niveau du document, dans des éditions historiques ou dans d’autres types d’éditions scientifiques numériques utilisant la représentation numérique de documents originaux.'
		,'help.placeholder':					'Afficher ici les explications en passant la souris sur chaque fonctionnalité.'
		,'help.navigation':						'<span class="name">Navigation structurelle:</span> Il existe aussi un affichage de l’arborescence structurelle des parties, chapitres, sections, sous-sections, etc. du document. Les utilisateurs peuvent accéder au contenu en cliquant sur un élément de l’arborescence. Le terme s’inspire d’un concept similaire utilisé en Web design (James Kalbach, Design Web Navigation: section 4.1.1 Structural navigation, 2007).'					
		,'help.multi-page':						'<span class="name">Plusieurs pages:</span> Affichage des pages originales numérisées sous forme de vignettes. Il suffit de cliquer sur la vignette pour afficher la page correspondante du document.'
		,'help.single-page':					'<span class="name">Une page:</span> Affichage d’une page du document numérisé à la fois.'
		,'help.dubble-page':					'<span class="name">Deux pages:</span> L’affichage simultané de deux pages originales numérisées, permet aux utilisateurs de consulter le document comme s’ils étaient en train de lire un livre. En cliquant à gauche ou à droite, les utilisateurs atteindront la page précédente ou suivante.'
		,'help.display-mode':					'<div><span class="name">Original:</span> Affichage du document original scanné/numérisé seul.</div><div><span class="name">Original & Transcription:</span> Affichage côte à côte du document original scanné/numérisé et de la transcription.</div><div><span class="name">Transcription:</span> Affichage de la transcription seule.</div>'
		,'help.tei-pager':						'<div><span class="name">Navigation par page:</span> Elle permet aux utilisateurs d’aller à la page suivante ou précédente ainsi qu’à la première ou à la dernière page du document. L’option «aller à la page», permettant de choisir une page spécifique, est également disponible.</div>'
		,'help.zoom-in':						'<div><span class="name">Agrandir:</span> Permet aux utilisateurs d’agrandir le document numérisé et la transcription, en augmentant la taille de l’image (numérisation) et de la police de caractères (transcription).</div>'
		,'help.zoom-reset':						'<div><span class="name">Retour à la taille originale:</span> Redimensionne l’affichage à la taille initiale du document numérisé ou de la transcription, par exemple après l’avoir agrandi ou réduit.</div>'
		,'help.zoom-out':						'<div><span class="name">Réduire:</span> Permet aux utilisateurs de réduire le document numérisé et la transcription, en diminuant la taille de l’image (numérisation) et de la police de caractères (transcription).</div>'
		,'help.linear':							'<div><span class="name">Style linéaire:</span> Inspiré du terme «transcription linéaire» dans les éditions génétiques (Grésillon 1994: 246), le rendu linéaire de la transcription se concentre sur le contenu du texte, plutôt que sur les caractéristiques typographiques et la mise en page de l’original. Un formatage minimal (l’alignement à gauche) des en-têtes et des titres a été appliqué.</div>'
		,'help.diplomatic':						'<div><span class="name">Style diplomatique:</span> La transcription est rendue dans un style proche de celui du document original (même si elle n’est pas exactement identique). Le terme «diplomatique» s’inspire de la définition d’édition diplomatique de Pierazzo (2011: 2) qui «comprend une transcription reproduisant le plus de caractéristiques possibles du document transcrit (diploma) en utilisant des caractères de l’imprimerie moderne. Celle-ci comprend des fonctions telles que les sauts de ligne, les sauts de page, les abréviations, les formes de lettres différenciées.»</div>'
		,'help.diplomatic-responsive':			'<div><span class="name">Style diplomatique adaptatif:</span> Le rendu de la transcription en style diplomatique adaptatif respecte la présentation générale de l’original (cf. style diplomatique au-dessus), sauf pour les sauts de lignes qui sont éliminés. Le terme «adaptatif» est lié à l’«expérience de visualisation optimale» (optimal viewing experience) utilisée dans la conception de sites Web (Ethan Marcotte, Responsive Web Design: section Becoming responsive, 2010), où la visualisation de la page Web est adaptée à la taille du dispositif d’affichage. Par conséquent, dans l’affichage diplomatique adaptatif, la transcription va occuper toute la largeur de la zone texte disponible, sans tenir compte des sauts de ligne du document original.</div>'
		,'help.search':							'<div><span class="name">Rechercher dans le texte:</span> Permet aux utilisateurs de parcourir le texte de la transcription. Plusieurs options sont disponibles: la recherche en texte libre et, dans certains cas, en fonction du projet, la recherche par catégories d’entités nommées (noms de personnes, organisations, lieux, etc.) et par dates (voir les catégories expliquées ci-dessous).</div>'
		,'help.search-form':					'<div><span class="name">Rechercher:</span> Les utilisateurs peuvent taper le texte à rechercher dans le champ de recherche.</div>'
		,'help.previous-next':					'<div><span class="name">Précédent, Suivant:</span> Les flèches haut et bas, à droite du champ de recherche, permettent aux utilisateurs de parcourir les différents résultats obtenus grâce au champ recherche ou la sélection à partir de la liste d’entités nommées.</div>'
		,'help.entity-product':					'<div><span class="name">Produits:</span> Catégorie composite contenant les noms d’artefacts matériels et intellectuels, tels que des appareils spécialisés, des pièces d’équipement, ou des documents historiques officiels et des passages pertinents (p.ex. des paragraphes ou sous-paragraphes d’un traité, etc.) mentionnés dans le texte.</div>'
		,'help.entity-event':					'<div><span class="name">Événements:</span> Catégorie d’événements mentionnés dans le texte, p.ex. des réunions, des séances, des conférences ou des événements historiques particuliers.</div>'
		,'help.entity-date':					'<div><span class="name">Dates:</span> Catégorie comprenant des dates, généralement liées à des événements, mentionnés dans le texte.</div>'
		,'help.entity-org':						'<div><span class="name">Organisations:</span> Catégorie comprenant les noms de structures, d’associations, d’institutions, de groupes, etc. administratifs et politiques.</div>'
		,'help.entity-person':					'<div><span class="name">Personnes:</span> Catégorie contenant les noms de personnes.</div>'
		,'help.entity-function':				'<div><span class="name">Fonctions:</span> Catégorie comprenant les noms de positions et de fonctions officielles tels que président, délégué, représentant, membre d’un groupe ou d’une organisation spécifiques, etc.</div>'
		,'help.entity-place':					'<div><span class="name">Lieux:</span> Catégorie composite de noms de lieux (p.ex. continent, région, pays, ville).</div>'
		,'help.references-title':				'Références'	
		,'help.references':						'\
			<li><span class="name">Grésillon, Almuth</span> (1994) <i>Eléments de critique génétique. Lire les manuscrits modernes</i>. Presses universitaires de France. Voir aussi: <a href="http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/" target="_blank">http://uahost.uantwerpen.be/lse/index.php/lexicon/linear-transcription/</a>.</li>\
			<li><span class="name">Kalbach, James</span> (2007) <i>Designing Web Navigation</i>. O\'Reilly Media, Inc., ISBN: 9780596528102. Disponible sur le Web: <a href="https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/" target="_blank">https://www.safaribooksonline.com/library/view/designing-web-navigation/9780596528102/</a>.</li>\
			<li><span class="name">Marcotte, Ethan</span> (2010) <i>Responsive Web Design</i>. Publié le 25 mai 2010 dans CSS, Layout & Grids, Mobile/Multidevice, Responsive Design, Interaction Design. Disponible sur le Web: <a href="http://alistapart.com/article/responsive-web-design" target="_blank">http://alistapart.com/article/responsive-web-design</a>.</li>\
			<li><span class="name">Pierazzo, Elena</span> (2011) <i>A rationale of digital documentary editions</i>. <hal-01182169>. Disponible sur le Web: <a href="https://hal.inria.fr/hal-01182169/document" target="_blank">https://hal.inria.fr/hal-01182169/document</a>.</li>\
			<li><span class="name">TEI</span> (Text Encoding Initiative). Disponible sur le Web: <a href="http://www.tei-c.org/index.xml" target="_blank">http://www.tei-c.org/index.xml</a>.</li>\
		'
	};
	
})(jQuery)