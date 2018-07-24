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

	var EMPTY					= '';
	var SPACE					= ' ';
	var HYPHEN					= '-';

	/** Events */
	var CLICK_EVENT 			= 'click';
	var SWITCH_MODE_EVENT		= 'switchmode';
	var CHANGE_PAGE_EVENT		= 'changepage';
	var CHANGE_ZOOM_EVENT		= 'changezoom';
	var RESIZE_EVENT			= 'resize';
	var CHANGE_EVENT			= 'change';
	var KEY_UP_EVENT			= 'keyup';
	var SCROLL_EVENT			= 'scroll';
	var SUBMIT_EVENT			= 'submit';
	var MOUSE_ENTER_EVENT		= 'mouseenter';
	var MOUSE_LEAVE_EVENT		= 'mouseleave';

	/** CSS classes */
	var TRANSVIEWER				= 'transviewer';
	var CONTENT_WRAPPER			= 'content-wrapper';
	var MENU_BAR				= 'menu-bar';
	var TEXT_ONLY				= 'text-only';
	var FACSIMILE_ONLY			= 'facsimile-only';
	var FACSIMILE_TEXT			= 'facsimile-text';
	var NAVIGATION_TOOLS		= 'navigation-tools';
	var NAVIGATION				= 'navigation';
	var FAC_MODE				= 'fac-mode';
	var DISPLAY_MODE			= 'display-mode';
	var FAC_DISPLAY				= 'fac-display';
	var MULTI_PAGE				= 'multi-page';
	var SINGLE_PAGE				= 'single-page';
	var DUBBLE_PAGE				= 'dubble-page';
	var SELECTED				= 'selected';
	var ORIGINAL				= 'original';
	var ORIGINAL_TRANSCRIPTION	= 'original-transcription';
	var TRANSCRIPTION			= 'transcription';
	var TEXT_MODE				= 'text-mode';
	var TEXT_DISPLAY			= 'text-display';
	var LINEAR					= 'linear';
	var DIPLOMATIC				= 'diplomatic';
	var DIPLOMATIC_RESPONSIVE	= 'diplomatic-responsive';
	var TEXT_TOOLS				= 'text-tools';
	var HELP_TOOLS				= 'help-tools';
	var TOOLTIP					= 'tei-tooltip';
	var TOOLTIP_TEXT			= 'tooltip-text';
	var PAGER					= 'tei-pager';
	var PAGE_COUNTER			= 'page-counter';
	var PREVIOUS				= 'previous';
	var NEXT					= 'next';
	var FIRST					= 'first';
	var LAST					= 'last';
	var COUNT					= 'count';
	var PAGE					= 'page';
	var ZOOM					= 'zoom';
	var ZOOMER					= 'zoomer';
	var ZOOM_IN					= 'zoom-in';
	var ZOOM_OUT				= 'zoom-out';
	var ZOOM_RESET				= 'zoom-reset';
	var SEARCH					= 'search';
	var SEARCH_ON				= 'search-on';
	var SEARCH_BOX				= 'search-box';
	var NO_MATCH				= 'no-match';
	var TABS					= 'tabs';
	var TAB						= 'tab';
	var OPEN					= 'open';
	var SWITCH					= 'switch';
	var SWITCH_ON				= 'switch-on';
	var NAME					= 'name';
	var SEARCH_FORM				= 'search-form';
	var SEARCH_INPUT			= 'search-input';
	var SEARCH_BUTTON			= 'search-button';
	var ENTITIES				= 'entities';
	var ENTITY					= 'entity';
	var HIGHLIGHT				= 'highlight';
	var HIGHLIGHT_PFX			= 'highlight-';
	var DISABLED				= 'disabled';
	var NAVIGATION_ENABLED		= 'navigation-enabled';
	var NAVIGATION_ON			= 'navigation-on';
	var NAVIGATION_BOX			= 'navigation-box';
	var NAV_ITEMS				= 'nav-items';
	var NAV_ITEM				= 'nav-item';
	var SUB_HEAD				= 'sub_head';
	var HELP					= 'help';
	var HELP_ON					= 'help-on';
	var HELP_BOX				= 'help-box';
	var HELP_TEXT_WRAPPER		= 'help-text-wrapper';
	var HELP_TEXT				= 'help-text';
	var PLACEHOLDER				= 'placeholder';
	var REFERENCE				= 'reference';
	var REFERENCE_LIST			= 'reference-list';
	var ACTIVE_HELP				= 'active-help';
	var ACTIVE_HELP_ON			= 'active-help-on';
	
	/** Attribute */
	var MAX						= 'max';
	var TITLE					= 'title';
	var MATCH					= 'match';
	var MATCHES					= 'matches';
	var CLASS					= 'class';
	var TYPE					= 'type';
	var SCROLL_HEIGHT			= 'scrollHeight';
	var HELP_KEY				= 'help-key';
	var HREF					= 'href';

	/** Properties */
	var TAG_NAME				= 'tagName';

	/** HTML Tags */
	var UL_TAG					= ' ul';
	var LI_TAG					= ' li';
	var A_TAG					= ' a';
	var SPAN_TAG				= ' span';
	
	/** CSS selector */
	var CLASS_SELECTOR				= ' .';
	var DOC_PART_TEXT_SELECTOR 		= ' .doc-part-text';
	var DOC_PART_FAC_SELECTOR 		= ' .doc-part-fac';
	var MENU_BAR_SELECTOR			= CLASS_SELECTOR + MENU_BAR;
	var CONTENT_WRAPPER_SELECTOR	= CLASS_SELECTOR + CONTENT_WRAPPER;
	var NAVIGATION_SELECTOR			= MENU_BAR_SELECTOR + CLASS_SELECTOR + NAVIGATION;
	var FAC_MODE_SELECTOR			= MENU_BAR_SELECTOR + CLASS_SELECTOR + FAC_MODE;
	var FAC_DISPLAY_SELECTOR		= MENU_BAR_SELECTOR + CLASS_SELECTOR + FAC_DISPLAY;
	var MULTI_PAGE_SELECTOR			= CLASS_SELECTOR + MULTI_PAGE;
	var SINGLE_PAGE_SELECTOR		= CLASS_SELECTOR + SINGLE_PAGE;
	var DUBBLE_PAGE_SELECTOR		= CLASS_SELECTOR + DUBBLE_PAGE;
	var TEXT_MODE_SELECTOR			= MENU_BAR_SELECTOR + CLASS_SELECTOR + TEXT_MODE;
	var TEXT_DISPLAY_SELECTOR		= MENU_BAR_SELECTOR + CLASS_SELECTOR + TEXT_DISPLAY;
	var TOOLTIP_SELECTOR			= CLASS_SELECTOR + TOOLTIP;
	var TOOLTIP_TEXT_SELECTOR		= CLASS_SELECTOR + TOOLTIP_TEXT;
	var PAGER_SELECTOR				= MENU_BAR_SELECTOR + CLASS_SELECTOR + PAGER;
	var PAGE_COUNTER_SELECTOR		= CLASS_SELECTOR + PAGE_COUNTER;
	var PAGE_SELECTOR				= MENU_BAR_SELECTOR + PAGE_COUNTER_SELECTOR + ' .' + PAGE;
	var PAGE_COUNT_SELECTOR			= MENU_BAR_SELECTOR + PAGE_COUNTER_SELECTOR + ' .' + COUNT;
	var CHANGE_PAGE_SELECTOR		= ' .change_page';
	var ZOOMER_SELECTOR				= MENU_BAR_SELECTOR + CLASS_SELECTOR + ZOOMER;
	var SEARCH_SELECTOR				= MENU_BAR_SELECTOR + CLASS_SELECTOR + SEARCH;
	var HELP_SELECTOR				= MENU_BAR_SELECTOR + CLASS_SELECTOR + HELP;
	var SEARCH_BOX_SELECTOR			= CLASS_SELECTOR + SEARCH_BOX;
	var SEARCH_FORM_SELECTOR		= SEARCH_BOX_SELECTOR + CLASS_SELECTOR + SEARCH_FORM;
	var SEARCH_INPUT_SELECTOR		= SEARCH_FORM_SELECTOR + CLASS_SELECTOR + SEARCH_INPUT;
	var SEARCH_BUTTON_SELECTOR		= SEARCH_FORM_SELECTOR + CLASS_SELECTOR + SEARCH_BUTTON;
	var SEARCH_PREVIOUS_SELECTOR	= SEARCH_BOX_SELECTOR + CLASS_SELECTOR + PREVIOUS;
	var SEARCH_NEXT_SELECTOR		= SEARCH_BOX_SELECTOR + CLASS_SELECTOR + NEXT;
	var SEARCH_TABS_SELECTOR		= SEARCH_BOX_SELECTOR + CLASS_SELECTOR + TABS;
	var SEARCH_TAB_SELECTOR			= SEARCH_TABS_SELECTOR + CLASS_SELECTOR + TAB;
	var SWITCHED_ON_TAB_SELECTOR	= SEARCH_TAB_SELECTOR + CLASS_SELECTOR + SWITCH_ON;
	var TAB_SWITCH_SELECTOR			= CLASS_SELECTOR + TAB + CLASS_SELECTOR + SWITCH;
	var SEARCH_ENTITIES_SELECTOR	= SEARCH_TABS_SELECTOR + CLASS_SELECTOR + ENTITIES;
	var SEARCH_ENTITY_SELECTOR		= SEARCH_ENTITIES_SELECTOR + CLASS_SELECTOR + ENTITY;
	var ENTITIES_SELECTOR			= CLASS_SELECTOR + ENTITIES;
	var ENTITY_SELECTOR				= CLASS_SELECTOR + ENTITY;
	var ENTITY_VISIBLE_SELECTOR		= CLASS_SELECTOR + ENTITY + ':visible';
	var HYPHEN_SELECTOR				= ' .hyphen';
	var HIGHLIGHT_SELECTOR			= CLASS_SELECTOR + HIGHLIGHT;
	var NAME_SELECTOR				= CLASS_SELECTOR + NAME;
	var COUNT_SELECTOR				= CLASS_SELECTOR + COUNT;
	var NAVIGATION_BOX_SELECTOR		= CLASS_SELECTOR + NAVIGATION_BOX;
	var NAVIGATION_ITEMS_SELECTOR	= NAVIGATION_BOX_SELECTOR + CLASS_SELECTOR + NAV_ITEMS;
	var NAV_ITEM_SELECTOR			= CLASS_SELECTOR + NAV_ITEM;
	var HELP_BOX_SELECTOR			= CLASS_SELECTOR + HELP_BOX;
	var HELP_TEXT_SELECTOR			= HELP_BOX_SELECTOR + CLASS_SELECTOR + HELP_TEXT;
	var HELP_PLACEHOLDER_SELECTOR	= HELP_BOX_SELECTOR + CLASS_SELECTOR + PLACEHOLDER;
	var TAB_SELECTOR				= CLASS_SELECTOR + TAB + CLASS_SELECTOR + NAME;
	var ACTIVE_HELP_SELECTOR		= CLASS_SELECTOR + ACTIVE_HELP;
	var LINK_TAG_WITH_TITLE			= 'link[title]';

	/** HTML */
	var TOOLBAR_HTML 			= '\
		<nav class="' + MENU_BAR + '">\
			<ul class="' + NAVIGATION_TOOLS + '">\
				<li class="' + NAVIGATION + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + NAVIGATION + '"><a href="#">@navigation@</a></li>\
			</ul>\
			<ul class="' + FAC_MODE + '">\
				<li class="' + MULTI_PAGE + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + MULTI_PAGE + '" ><a href="#">@multiple-pages@</a></li>\
				<li class="' + SINGLE_PAGE + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + SINGLE_PAGE + '" ><a href="#">@one-page@</a></li>\
				<li class="' + DUBBLE_PAGE + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + DUBBLE_PAGE + '"><a href="#">@two-page@</a></li>\
			</ul>\
			<ul class="' + FAC_DISPLAY + SPACE + ACTIVE_HELP + '" data-help-key="' + DISPLAY_MODE + '">\
        		<li id="' + ORIGINAL + '"  class="' + ORIGINAL + SPACE + TOOLTIP + '" title="@switch-to-scan-only@"><a href="#">@original@</a></li>\
            	<li id="' + ORIGINAL_TRANSCRIPTION + '" class="' + ORIGINAL_TRANSCRIPTION + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" title="@switch-to-scan-and-transcription@"><a href="#">@original-transcription@</a></li>\
            </ul>\
            <ul class="' + ZOOMER + '">\
            	<li class="' + ZOOM_IN + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + ZOOM_IN + '"><a href="#">@zoom-in@</a></li>\
            	<li class="' + ZOOM_RESET + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + ZOOM_RESET + '"><a href="#">@back-to-original-size@</a></li>\
            	<li class="' + ZOOM_OUT + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + ZOOM_OUT + '"><a href="#">@zoom-out@</a></li>\
            </ul>\
            <ul class="' + PAGER + SPACE + ACTIVE_HELP + '" data-help-key="' + PAGER + '">\
            	<li class="' + FIRST + '"><a href="#">First</a></li>\
            	<li class="' + PREVIOUS + '"><a href="#">Previous</a></li>\
            	<li class="' + PAGE_COUNTER + '"><input class="' + PAGE + '" type="number" min="1" max="1" value="1" /> / <span class="' + COUNT + '">1</span></li>\
            	<li class="' + NEXT + '"><a href="#">Next</a></li>\
            	<li class="' + LAST + '"><a href="#">Last</a></li>\
            </ul>\
			<ul class="' + HELP_TOOLS + '">\
				<li class="' + HELP + SPACE + TOOLTIP + '"><a href="#">@help@</a></li>\
			</ul>\
			<ul class="' + TEXT_TOOLS + '">\
    			<li class="' + SEARCH + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + SEARCH + '"><a href="#">@search-in-text@</a></li>\
        	</ul>\
			<ul class="' + TEXT_MODE + '">\
				<li class="' + LINEAR + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + LINEAR + '"><a href="#">@linear-style@</a></li>\
				<li class="' + DIPLOMATIC + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + DIPLOMATIC + '"><a href="#">@diplomatic-style@</a></li>\
				<li class="' + DIPLOMATIC_RESPONSIVE + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + DIPLOMATIC_RESPONSIVE + '"><a href="#">@diplomatic-responsive-style@</a></li>\
			</ul>\
			<ul class="' + TEXT_DISPLAY + SPACE + ACTIVE_HELP + '" data-help-key="' + DISPLAY_MODE + '">\
	    		<li class="' + TRANSCRIPTION + SPACE + TOOLTIP + '" title="@switch-to-transcription-only@"><a href="#">@transcription@</a></li>\
	        	<li class="' + ORIGINAL_TRANSCRIPTION + SPACE + TOOLTIP + '" title="@switch-to-scan-and-transcription@"><a href="#">@original-transcription@</a></li>\
	        </ul>\
		</nav>\
	';
	var SEARCH_BOX_HTML		= '\
		<section class="' + SEARCH_BOX + '">\
			<form class="' + SEARCH_FORM + SPACE + ACTIVE_HELP + '" data-help-key="' + SEARCH_FORM + '">\
				<input class="' + SEARCH_INPUT + '" type="text" placeholder="@search@" />\
				<input type="submit" class="' + SEARCH_BUTTON + SPACE + DISABLED + '" />\
			</form>\
			<a href="#" class="' + PREVIOUS + SPACE + DISABLED + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + PREVIOUS + HYPHEN + NEXT + '">@previous@</a>\
			<a href="#" class="' + NEXT + SPACE + DISABLED + SPACE + TOOLTIP + SPACE + ACTIVE_HELP + '" data-help-key="' + PREVIOUS + HYPHEN + NEXT + '">@next@</a>\
			<nav>\
				<ul class="' + TABS + '">\
				</ul>\
			</na>\
		</section>\
	';
	var TAB_HTML				= 	'\
		<li class="' + TAB + SPACE + ACTIVE_HELP + '">\
			<a class="' + SWITCH + '" href="#">Highlight</a>\
			<a class="' + NAME + '" href="#"> (<span class="' + COUNT + '">0</span>)</a>\
			<ul class="' + ENTITIES + '"></ul>\
		</li>\
	';
	var ENTITY_HTML				= '<li class="' + ENTITY + '"><a href="#"></a></li>';
	var NAVIGATION_BOX_HTML		= '\
		<nav class="' + NAVIGATION_BOX + '">\
			<ul class="' + NAV_ITEMS + '">\
			</ul>\
		</nav>\
	';
	var NAVIGATION_ITEM_HTML	= '<li class="' + NAV_ITEM + '"><a href="#"></a></li>';
	var HELP_BOX_HTML			= '\
		<aside class="' + HELP_BOX + '">\
			<div class="' + HELP_TEXT_WRAPPER + '">\
				<div class="' + PLACEHOLDER + '">@help.placeholder@</div>\
				<div class="' + HELP_TEXT + '">\
				</div>\
			</div>\
			<div>@help.intro@</div>\
			<section class="' + REFERENCE + SPACE + TAB + '">\
				<a class="' + NAME + '" href="#">@help.references-title@</a>\
				<ul class="' + REFERENCE_LIST + '">@help.references@</ul>\
			</section>\
		</aside>\
	';
	var LOADER_HTML 			= '<div class="loader-processing"></div>';
	var TOOLTIP_HTML			= '<div class="' + TOOLTIP_TEXT + '"></div>';

	//	Resources
	var LANGUAGE_FILE			= 'resources/{0}.js';
	var DEFAULT_LANGUAGE		= 'en';
	
	//	Format token
	var TOKEN_0					= '{0}';
	
	//	Minimum number of items in the navigation to enable the feature
	var MINIUMUM_NAV_ITEMS		= 2;
	
	var searchInitialized		= false;
	var isScrolling				= false;
	
	
	/**
	 * Constructor of the TEI Viewer
	 *
	 * @author 	fre
	 * @since	August 18, 2016
	 */
	var App = function(rootEl, config)	{
		
		this.rootEl 	= $(rootEl);
		this.text 		= this.rootEl.find(DOC_PART_TEXT_SELECTOR);
		this.br			= window.br;
		this.config 	= {language: DEFAULT_LANGUAGE};
		
		$.extend(this.config, config);

		//	Load language file
		var path 		= TransViewer.plugInRoot || $("script[src*='transviewer.']").attr('src').match(/(.*\/)[^\/]*/)[1];
		if(this.br) 
			this.br.path 	= path;
		$.getScript(path + LANGUAGE_FILE.replace(TOKEN_0, this.config.language))
			.done(this.bind(this._init))
			.fail(this.bind(function() {
				$.getScript(path + LANGUAGE_FILE.replace(TOKEN_0, DEFAULT_LANGUAGE), this.bind(this._init));
			}));
		
	};

	
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------
	//	Public functions 
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------
	
	/**
	 * Set the display mode
	 * 
	 * @param	display mode to set
	 * 
	 * @author	fre
	 * @since	August 30, 2016
	 */
	App.prototype.setDisplayMode = function(displayMode) {

		//	For the transcription, change the text mode to diplomatic responsive if it's diplomatic
		if(displayMode == TRANSCRIPTION && this.textMode == DIPLOMATIC)
			this.setTextMode(DIPLOMATIC_RESPONSIVE);

		//	For the original & transcription, change the text mode to diplomatic if it's diplomatic responsive
		if(displayMode == ORIGINAL_TRANSCRIPTION && this.textMode == DIPLOMATIC_RESPONSIVE)
			this.setTextMode(DIPLOMATIC);
		
		if(this.displayMode)
			this.rootEl.removeClass(this.displayMode);
		
        this.displayMode = displayMode;
		this.rootEl.addClass(this.displayMode);
		
		//	Position tooltip
		this._refreshTooltip();
		
		//	Refresh bookreader
		$(window).trigger(RESIZE_EVENT);

		//	Refresh bookreader and text position
		this.setPage(this.pageNum, false, true);
		
		//	Reset zoom
		this.resetZoom();
		
	};

	
	/**
	 * Set the text mode
	 * 
	 * @param	text mode to set
	 * 
	 * @author	fre
	 * @since	September 2, 2016
	 */
	App.prototype.setTextMode = function(textMode) {
		
		if(this.textMode)
			this.rootEl.removeClass(this.textMode);
		
		this.textMode = textMode;
		this.rootEl.addClass(this.textMode);
		
		//	Enabled the right stylesheet
		$(LINK_TAG_WITH_TITLE).each(function() {
			this.disabled = $(this).attr(TITLE) != textMode.split(HYPHEN)[0];
		});
		
		this._refreshPageOffsets();		

	};
	
	
	/**
	 * Set the current page of the viewer
	 * 
	 * @param	pageNum				page number to set
	 * @param	ignoreScrollText	boolean value which indicates whether the scroll of the text must be ignored
	 * @param	refreshOffsets		force to refresh page offsets
	 * 
	 * @author	fre
	 * @since	September 5, 2016
	 */
	App.prototype.setPage = function(pageNum, ignoreScrollText, refreshOffsets) {
		
		if(pageNum < 1)
			pageNum = 1;
		
		if(pageNum > this.pageCount)
			pageNum = this.pageCount;
			
		if(!refreshOffsets && this.pageNum == pageNum)
			return;
		
		if(refreshOffsets)
			this._refreshPageOffsets();
		
		//	Fix an issue when you change page in 2 pages mode with different image sizes
		//	Apply a fit to page if the zoomIndex is 0
		if(this.br) {
			setTimeout(function() {
				if(br.mode == br.constMode2up && br.zoomIndex == 0)
					br.resetZoom();
			}, 500);
		}
		
		this.pageNum = pageNum;

		//	The delay is to fix an issue when coming from transcription to original and transcription
		//	The bookreader jumps to the right page but the br.updateLocationHash method is not called
		if(this.br) {
			if(refreshOffsets)
				setTimeout(function() {
					this.br.jumpToIndex(pageNum - 1);
				}, 500);
			else
				this.br.jumpToIndex(pageNum - 1);
		}
		
		isScrolling = true;
		
		try {
			if(!ignoreScrollText)
				this.text.animate({scrollTop: this.pageOffset[pageNum - 1]}, 200);
			
		} catch (e) {}
		
		//	Block the binding of scroll event during 500ms
		//	Don't use the complete callback method because the scroll event is still dispatched once after the complete method is called
		setTimeout(function() {
			isScrolling = false;
		}, 500);

		this.rootEl.find(PAGE_SELECTOR).val(pageNum);
		
	}
	
	
	/**
	 * Zoom in bookreader and text
	 * 
	 * @author	fre
	 * @since	September 8, 2016
	 */
	App.prototype.zoomIn = function() {
		
		if(this.displayMode == TRANSCRIPTION)
			this._zoomText(this.zoomIndex + 1);
		else
			this.br.zoomIn();
	}

	
	/**
	 * Zoom out bookreader and text
	 * 
	 * @author	fre
	 * @since	September 8, 2016
	 */
	App.prototype.zoomOut = function() {
		
		if(this.displayMode == TRANSCRIPTION)
			this._zoomText(this.zoomIndex - 1);
		else
			this.br.zoomOut();
	}

	
	/**
	 * Reset zoom on bookreader and text
	 * 
	 * @author	fre
	 * @since	September 8, 2016
	 */
	App.prototype.resetZoom = function() {
		
		if(this.displayMode == TRANSCRIPTION)
			this._zoomText(0);
		else
			this.br.resetZoom();
	}
	
	
	/**
	 * Custom event implementation 
	 * Allow to keep the context of the class instance
	 * 
	 * @param	type		event type
	 * @param	handler		handler method of the event
	 * @param	el			Object, element, jquery object or selector that matches the element which get the event. 
	 * @param	data		Optional. Data to be passed to the handler
	 * 
	 * @author	fre
	 * @since	August 18, 2016
	 */
	App.prototype.on = function(type, handler, el, data) {
		
		$(el).on(type, {context: this, data: data}, function(e) {
			
			var context = e.data.context;
			
			e.target 			= $(e.target); 
			e.data				= e.data.data;
			
			handler.apply(context, arguments);  
		});
	};

	
	/**
	 * Custom event implementation  for delegation
	 * Allow to keep the context of the class instance
	 * 
	 * @param	type		event type
	 * @param	handler		handler method of the event
	 * @param	el			Object, element, jquery object or selector that matches the element which get the event. 
	 * @param	filter		Selector used to filter descendants elements
	 * @param	data		Optional. Data to be passed to the handler
	 * 
	 * @author	fre
	 * @since	September 7, 2016
	 */
	App.prototype.delegate = function(type, handler, el, filter, data) {
		
		$(el).on(type, filter, {context: this, data: data}, function(e) {
			
			var context 		= e.data.context;
			
			e.target 			= $(e.target); 
			e.delegateTarget 	= $(e.delegateTarget);
			e.currentTarget 	= $(e.currentTarget);
			e.data				= e.data.data;
			
			handler.apply(context, arguments);  
		});
	};
	
	
	/**
     * Returns a function that will execute the supplied function in the current context
     *
     * @param {Function} 	fn 			the function to bind
     * 
     * @return {function} 	the wrapped function
	 * 
	 * @author	fre
	 * @since	October 14, 2016
     */
	App.prototype.bind = function(fn) {
		var context = this;
		return function() {
			return fn.apply(context, arguments);
		}
	}
	
	
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------
	//	Private functions 
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------

	/**
	 * Initialize the TEI Viewer
	 *
	 * @author 	fre
	 * @since	August 18, 2016
	 */
	App.prototype._init = function() {

		//	Add default class name
		this.rootEl.addClass(TRANSVIEWER);

		//	Add toolbar
		this.rootEl.prepend(this._formatLanguage(TOOLBAR_HTML));

		//	Define default display mode (depends on whether the mode is text only, facsimile only or both)
		//	Facsimile only
		var mode;
		if($.trim(this.text.text()).length == 0) {
			mode = FACSIMILE_ONLY;
			this.setDisplayMode(ORIGINAL);
			
		//	Text only
		} else if(!this.br) {
			mode = TEXT_ONLY;
			this.setDisplayMode(TRANSCRIPTION);
			
		//	Facsimile and text
		} else {
			mode = FACSIMILE_TEXT;
			this.setDisplayMode(ORIGINAL_TRANSCRIPTION);
		}
		this.rootEl.addClass(mode);

		//	Initialize click event on the help icon
		this.on(CLICK_EVENT, this._help_clickHandler, this.rootEl.find(HELP_SELECTOR));

		//	Initialize help
		this._initHelp();

		//	Text only
		if(mode != TEXT_ONLY) {

			//	Initialize click event on the facsimile mode icons
			this.delegate(CLICK_EVENT, this._facMode_clickHandler, this.rootEl.find(FAC_MODE_SELECTOR), LI_TAG + A_TAG);

			//	Iniatialize click event on the zoomer icons
			this.delegate(CLICK_EVENT, this._zoomer_clickHandler, this.rootEl.find(ZOOMER_SELECTOR), LI_TAG + A_TAG);

			//	Iniatialize click event on the pager icons
			this.delegate(CLICK_EVENT, this._pager_clickHandler, this.rootEl.find(PAGER_SELECTOR), LI_TAG + A_TAG);
			this.on(CHANGE_EVENT, this._pager_clickHandler, this.rootEl.find(PAGE_SELECTOR));
			
			//	Add loader
			this.rootEl.find(DOC_PART_FAC_SELECTOR).prepend(LOADER_HTML);
			
			//	Initialize switch mode event on the bookreader
			this.on(SWITCH_MODE_EVENT, this._bookreader_switchModeHandler, this.br);
			
			//	Initialize change page event on the bookreader
			this.on(CHANGE_PAGE_EVENT, this._bookreader_changePageHandler, this.br);
	
			//	Initialize change zoom event on the bookreader
			this.on(CHANGE_ZOOM_EVENT, this._bookreader_changeZoomHandler, this.br);
			
			this.pageCount = this.br.numLeafs;
			
			//	Define page count
			this.rootEl.find(PAGE_COUNT_SELECTOR).text(this.pageCount);
			this.rootEl.find(PAGE_SELECTOR).attr(MAX, this.pageCount);
			
		}

		//	Not facsimile only
		if(mode != FACSIMILE_ONLY) {
			
			//	Initialize click event on the search icon
			this.on(CLICK_EVENT, this._search_clickHandler, this.rootEl.find(SEARCH_SELECTOR));

			//	Initialize click event on the navigation icon
			this.on(CLICK_EVENT, this._navigation_clickHandler, this.rootEl.find(NAVIGATION_SELECTOR));
			
			//	Initialize click event on anchors in the text
			this.delegate(CLICK_EVENT, this._anchor_clickHandler, this.text, 'a[href^="#"]');
			
			//	Define diplomatic text mode
			this.setTextMode(DIPLOMATIC);
			
			//	Set the default zoom level to the the text
			this._zoomText(0);
			
			//	Initialize navigation
			this._initNavigation();
			
		}
		
		//	Facsimile and text
		if(mode == FACSIMILE_TEXT) {

			//	Initialize click event on the text mode icons
			this.delegate(CLICK_EVENT, this._textMode_clickHandler, this.rootEl.find(TEXT_MODE_SELECTOR), LI_TAG + A_TAG);
			
			//	Initialize click event on the facsimile and text display mode icons
			this.delegate(CLICK_EVENT, this._displayMode_clickHandler, this.rootEl.find(FAC_DISPLAY_SELECTOR), LI_TAG + A_TAG);
			
			//	Initialize click event on the facsimile and text display mode icons
			this.delegate(CLICK_EVENT, this._displayMode_clickHandler, this.rootEl.find(TEXT_DISPLAY_SELECTOR), LI_TAG + A_TAG);

			//	Initialize scroll event on the text
			this.on(SCROLL_EVENT, this._text_scrollHandler, this.text);
		}

		//	Tooltip feature
		this._initTooltip();
		
	};
	
	
	/**
	 * Initialize search tools
	 * 
	 * @author	fre
	 * @since	August 30, 2016
	 */
	App.prototype._initSearch = function() {
		
		searchInitialized 		= true;
		this.query				= EMPTY;
	    this.currentMatchIndex	= -1
		
		//	Add search
		this.rootEl.append(this._formatLanguage(SEARCH_BOX_HTML));

		//	Parse to find entities
	    this._initEntities();

		//	Initialize submit, change and key up events on the search form
		this.on(SUBMIT_EVENT, this._searchForm_submitHandler, this.rootEl.find(SEARCH_FORM_SELECTOR));		
		this.on(KEY_UP_EVENT, this._searchInput_keyUpHandler, this.rootEl.find(SEARCH_INPUT_SELECTOR));
		
		//	Initialize click event on the previous and next buttons
		this.on(CLICK_EVENT, this._previous_clickHandler, this.rootEl.find(SEARCH_PREVIOUS_SELECTOR));
		this.on(CLICK_EVENT, this._next_clickHandler, this.rootEl.find(SEARCH_NEXT_SELECTOR));
		
		//	Initialize click event on the search tab
		this.delegate(CLICK_EVENT, this._searchTab_clickHandler, this.rootEl.find(SEARCH_TABS_SELECTOR), NAME_SELECTOR);

		//	Initialize click event on the search tab switches
		this.delegate(CLICK_EVENT, this._searchTabSwitch_clickHandler, this.rootEl.find(SEARCH_TABS_SELECTOR), TAB_SWITCH_SELECTOR);
		
		//	Initialize click event on the entities
		this.delegate(CLICK_EVENT, this._entity_clickHandler, this.rootEl.find(SEARCH_TABS_SELECTOR), ENTITY_SELECTOR + A_TAG);
	
		//	Init tooltip
		this._initTooltip(this.rootEl.find(SEARCH_BOX_SELECTOR));
	}
	
	
	/**
	 * Initialize navigation tools
	 * 2016/12/06 - fre - Jira WEBSIX-382 ([TEI Transviewer][Structural navigation] "Sub-head" cases)
	 * 
	 * @author	fre
	 * @since	November 09, 2016
	 */
	App.prototype._initNavigation = function() {

		var itemBox 	= $(NAVIGATION_BOX_HTML);
		var itemList	= itemBox.children(UL_TAG);
		var items		= this.text.find('h1:not(.sub_head), h2:not(.sub_head), h3:not(.sub_head), h4:not(.sub_head)');
		
		if(items.length >= MINIUMUM_NAV_ITEMS)
			this.rootEl.addClass(NAVIGATION_ENABLED);
		
		items.each(this.bind(function(index, el) {
			
			var item 	= $(NAVIGATION_ITEM_HTML);
			el			= $(el);

			item.addClass(el.prop(TAG_NAME).toLowerCase());
			item.data(MATCH, el);
			item.data(PAGE, this._getPageFromTextOffset(el.position().top));
			
			//	2016/12/06 - fre - Jira WEBSIX-382 ([TEI Transviewer][Structural navigation] "Sub-head" cases)
			//	If the element is followed by an element with a sub_head class, both texts are concatenated
			var text 	= el.text();
			var next	= el.next();

			while(next && next.hasClass(SUB_HEAD)) {
				text += SPACE + next.text();
				next = next.next();
			}
			
			item.children(A_TAG).text(text);
			itemList.append(item);
		}));
		
		//	Add navigation box
		this.rootEl.find(MENU_BAR_SELECTOR).after(itemBox);
		
		//	Initialize click event on the entities
		this.delegate(CLICK_EVENT, this._navItem_clickHandler, this.rootEl.find(NAVIGATION_ITEMS_SELECTOR), NAV_ITEM_SELECTOR + A_TAG);
		
	}
	
	
	/**
	 * Initialize help tools
	 * 
	 * @author	fre
	 * @since	December 16, 2016
	 */
	App.prototype._initHelp = function() {
		
		//	Add help box
		this.rootEl.append(this._formatLanguage(HELP_BOX_HTML));

		//	Initialize click event on the help tab
		this.delegate(CLICK_EVENT, this._searchTab_clickHandler, this.rootEl.find(HELP_BOX_SELECTOR), TAB_SELECTOR);

	}
	
	
	/**
	 * Look for entities in the text
	 * 2016/11/07 - fre - Jira WEBSIX-377 ([TEI]Scrum feedback): remove footnote
	 * 2016/12/21 - fre - Jira WEBSIX-388 ([TEI Transviewer][Search] The search does not ignore the linebreaks and hyphens inside words)
	 * 
	 * @author	fre
	 * @since	September 14, 2016
	 */
	App.prototype._initEntities = function() {
		
		var rootEl		= this.rootEl.find(SEARCH_TABS_SELECTOR);
		var tabs		= this.tabs			= {};
		var entities	= this.entities		= {};
		//	2016/11/07 - fre - Jira WEBSIX-377 ([TEI]Scrum feedback): remove footnote
		var instances	= this.text.find("span:not(.type§footnote)[class*='type§'], .date");

		//	Parse text
		instances.each(this.bind(function(index, el) {
			
			el 				= $(el);

			var types 	= el.attr(CLASS).match(/\b(date)\b/);
			var type 	= types != null ? types[1] : el.attr(CLASS).match(/type§(.*)\b/)[1];
			var tab		= tabs[type];
			
			var clone	= el.clone();
			//	2016/12/21 - fre - Jira WEBSIX-388 ([TEI Transviewer][Search] The search does not ignore the linebreaks and hyphens inside words)
			clone.find(HYPHEN_SELECTOR).remove();
			var name	= $.trim(clone.text());
			
			if(tab == null) {
				tab = tabs[type] = $(TAB_HTML).data(HELP_KEY, ENTITY + HYPHEN + type);
				tab.addClass(type);
				tab.data(TYPE, type);
				tab.children(NAME_SELECTOR).prepend(this._getLanguage(type));
				rootEl.append(tab);
			}
			
			var entity		= entities[name];
	          
			if (entity == null) {
				entity = entities[name] = $(ENTITY_HTML);
				entity.children(A_TAG).text(name);
				entity.data(MATCHES, $());
				tab.children(ENTITIES_SELECTOR).append(entity);
			}
          
			el.data(ENTITY, entity);
			entity.data(MATCHES, entity.data(MATCHES).add(el));
          
		}));
		
		//	Set number of references by entity
		$.each(entities, function(index, entity) {
			var count =  entity.data(MATCHES).length;
			if(count > 1)
				entity.children(A_TAG).append(' (' + count + ')');
		});
		
		//	Set number of entities. Delay the execution to fix an issue with the visible selector
		setTimeout(this.bind(function() {
			this._refreshEntitiesCount();
		}));
		
	}
	
	
	/**
	 * Show or hide entities depending on the search result
	 * 
	 * @author	fre
	 * @since	September 14, 2016
	 */
	App.prototype._refreshEntities = function() {
		
		if(this.query) {
			
			this.rootEl.find(SEARCH_ENTITY_SELECTOR).hide();
			this.matches.each(function(index, el) {
				
				var entity 	= $(el).parent().data(ENTITY);
				
				if(entity != null)
					entity.show();
					
			});
			
		} else
			this.rootEl.find(SEARCH_ENTITY_SELECTOR).show();
		
		this._highlightEntitiesMatches();
		
		//	Update entities total number
		this._refreshEntitiesCount();
		
	}
	
	
	/**
	 * Set the number of matches for each tab
	 * 
	 * @author	fre
	 * @since	September 19, 2016
	 */
	App.prototype._refreshEntitiesCount = function() {
		
		this.rootEl.find(SEARCH_TAB_SELECTOR).each(function(index, tab) {
			
			tab 		= $(tab);
			var count 	= 0;
			
			tab.find(ENTITY_VISIBLE_SELECTOR).each(function(index, entity) {
				count += $(entity).data(MATCHES).length;
			});
			tab.find(COUNT_SELECTOR).text(count);
			
		});
		
	}
	
	
	/**
	 * Highlight matches of entities of the specified tab
	 * 
	 * @param		tabs 	tabs for which entities must be highlighted
	 * 						if not defined, entities of all switched on tabs wil be highlighted
	 * 
	 * @author	fre
	 * @since	September 20, 2016
	 */
	App.prototype._highlightEntitiesMatches = function(tabs) {

		if(!tabs)
			tabs = this.rootEl.find(SWITCHED_ON_TAB_SELECTOR);
		
		tabs.each(function(index, tab) {
			$(tab).find(ENTITY_VISIBLE_SELECTOR).each(function(index, entity) {
				$(entity).data(MATCHES).each(function(e, match) {
					$(match).toggleClass(HIGHLIGHT);
				});
			});
		});
		
	}
	
	
	/**
	 * Initialize tooltip feature
	 * 
	 * @author	fre
	 * @since September 2, 2016
	 */
	App.prototype._initTooltip = function(rootEl)
	{
		
		rootEl = rootEl || this.rootEl;
		rootEl.find(TOOLTIP_SELECTOR).each(function(index, el) {
			
			var tooltip 	= $(el);
			var tooltipText = $(TOOLTIP_HTML).append(tooltip.attr(TITLE) || tooltip.text());
			
			tooltip.removeAttr(TITLE);
			tooltip.append(tooltipText);
		});

		this._refreshTooltip(rootEl);
		
	}
	

	/**
	 * Position tooltip
	 * 
	 * @author	fre
	 * @since September 2, 2016
	 */
	App.prototype._refreshTooltip = function(rootEl)
	{
		
		rootEl = rootEl || this.rootEl;
		rootEl.find(TOOLTIP_SELECTOR).each(function(index, el) {
			
			var tooltip 	= $(el);
			var tooltipText = tooltip.find(TOOLTIP_TEXT_SELECTOR);
			
			tooltipText.css('left', tooltip.outerWidth() / 2 - tooltipText.outerWidth() / 2);
			
		});
		
	}
	
	
	/**
	 * Create an array of page offsets used to browse between pages
	 * 
	 * @author	fre
	 * @since September 7, 2016
	 */
	App.prototype._refreshPageOffsets = function()
	{
		var pageOffset 		= this.pageOffset = [];
		this.text.find(CHANGE_PAGE_SELECTOR).each(function(index, pageEl) {
			pageOffset.push(index == 0 ? 0 : $(pageEl).position().top);
		});
		
	}
	

	/**
	 * Get the page number from the text offset by using a binary search
     * 2017/10/17 - fre - Jira WEBSIX-406 ([TEI Transviewer] Issue when scrolling back in dubble page mode: the viewer scrolls automatically to the top of the document)
	 * 
	 * @param	offset		offset in the text to which get the page number
	 * 
	 * @return	the page number from the text offset
	 * 
	 * @author	fre
	 * @since	September 5, 2016
	 */
	App.prototype._getPageFromTextOffset = function(offset) {

        var mid;
        var lo 	= 0;
        var hi 	= this.pageOffset.length;
        
        while (hi - lo > 1) {
            mid = Math.floor((lo + hi) / 2);
            if (this.pageOffset[mid] < offset)
                lo = mid;
            else
                hi = mid;
        }
        
        //	2017/10/17 - fre - Jira WEBSIX-406 ([TEI Transviewer] Issue when scrolling back in dubble page mode: the viewer scrolls automatically to the top of the document)
        //	In dubble page view, ensures that the page number is even or 1
        if(hi > 1 && br.mode == br.constMode2up && hi % 2 != 0)
        	hi--;
        	
        return hi;
		
	}
	
	
	/**
	 * Apply zoom index on the text
	 * 
	 * @param index			new zoom index
	 * 
	 * @author	fre
	 * @since	September 7, 2016
	 */
	App.prototype._zoomText = function(index) {
		
		//	index between -4 and 4
		index = Math.max(Math.min(index, 4), -4);
		
		if(index == this.zoomIndex)
			return;
		
		this.text.removeClass(ZOOM + this.zoomIndex);
		this.text.addClass(ZOOM + index);
		
		this.zoomIndex = index;
		
		this._refreshPageOffsets();		
		
	}
	
	
	/**
	 * Scroll the text to ensure that the specified element is visible
	 * 
	 * @param 	el	Element which must be visible
	 * 
	 * @author	fre
	 * @since	September 13, 2016
	 */
	App.prototype._ensureVisible = function(el)	 {
		
		var y = el.position().top - this.text.scrollTop();
		var h = this.text.height();
		
		if(y > h - 50 || y < 0)
			this.text.scrollTop(y + this.text.scrollTop() - h / 2);

	}
	
	
	/**
	 * Get the translated text for a specified key
	 * 
	 * @param 	key		Key that matches the text to get
	 * 
	 * @return	The translated text for the specified key
	 * 			or the key is the key doesn't match any text
	 * 
	 * @author	fre
	 * @since	September 19, 2016
	 */
	App.prototype._getLanguage = function(key)	{
		return TransViewerLanguage[key] || key;
	}
	
	
	/**
	 * Get the supplied text with tokens replaced by labels translated in the current language
	 * 
	 * @param	(String)	text	text to translate
	 * 
	 * @return	(String)	the supplied text with tokens replaced by labels translated in the current language
	 * 
	 * @author	fre
	 * @since	October 14, 2016
	 */
	App.prototype._formatLanguage = function(text)	{
		return text.replace(/@.*?@/g, this.bind(function(token) {
			return this._getLanguage(token.slice(1, -1));
		}));
	}
	
	
	/**
	 * Define the current match collection
	 * 
	 * @param 	matches		The current match collection
	 * 
	 * @author	fre
	 * @since	September 22, 2016
	 */
	App.prototype._setMatches = function(matches) {

		matches = matches || this.text.find(HIGHLIGHT_SELECTOR);

		//	Enable previous and next buttons
		this.rootEl.find(SEARCH_PREVIOUS_SELECTOR).toggleClass(DISABLED, matches.length <= 1);
		this.rootEl.find(SEARCH_NEXT_SELECTOR).toggleClass(DISABLED, matches.length <= 1);

		//	Unselect current selected match
		if(this.currentMatchIndex != -1)
			this.matches.eq(this.currentMatchIndex).removeClass(SELECTED);
		
		this.matches 			= matches;
		
		//	Trigger a click on the next button
		this.currentMatchIndex 	= -1;
		this.rootEl.find(SEARCH_NEXT_SELECTOR).trigger(CLICK_EVENT);
	}
	
	
	
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------
	//	Events 
	//	--------------------------------------------------------------------------------
	//	--------------------------------------------------------------------------------
	
	/**
	 * Event dispatched when a button of the facsimile mode toolbar is clicked
	 * 
	 * @param	e	object which contains event data
	 * 
	 * @author 	fre
	 * @since	August 18, 2016
	 */
	App.prototype._facMode_clickHandler = function(e) {
		
		var selected		= e.target.parent();

		br.resetZoom();
		
		if(selected.hasClass(MULTI_PAGE))
            br.switchMode(br.constModeThumb);
		else if(selected.hasClass(SINGLE_PAGE))
            br.switchMode(br.constMode1up);
		else if(selected.hasClass(DUBBLE_PAGE))
            br.switchMode(br.constMode2up);
		
		e.preventDefault();

	};
	
	
	/**
	 * Event dispatched when a button of the facsimile display toolbar is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	August 19, 2016
	 */
	App.prototype._displayMode_clickHandler = function(e) {
		
		var parent			= e.target.parent();
		var displayMode;
		
		if(parent.hasClass(ORIGINAL))
            displayMode = ORIGINAL;
		else if(parent.hasClass(ORIGINAL_TRANSCRIPTION))
            displayMode = ORIGINAL_TRANSCRIPTION;
		else if(parent.hasClass(TRANSCRIPTION))
            displayMode = TRANSCRIPTION;

		this.setDisplayMode(displayMode);
		
		e.preventDefault();
		
	}

	
	/**
	 * Event dispatched when a button of the text mode toolbar is clicked
	 * 
	 * @param	e	object which contains event data
	 * 
	 * @author 	fre
	 * @since	August 23, 2016
	 */
	App.prototype._textMode_clickHandler = function(e)	{
		
		var parent		= e.target.parent();

		if(parent.hasClass(LINEAR))
            this.setTextMode(LINEAR);
		else if(parent.hasClass(DIPLOMATIC))
            this.setTextMode(DIPLOMATIC);
		else if(parent.hasClass(DIPLOMATIC_RESPONSIVE))
            this.setTextMode(DIPLOMATIC_RESPONSIVE);

		e.preventDefault();

	};
	
	
	/**
	 * Event dispatched when an icon of the zoomer is clicked
	 * 
	 * @param	e	object which contains event data
	 * 
	 * @author 	fre
	 * @since	August 26, 2016
	 */
	App.prototype._zoomer_clickHandler = function(e) {

		var selected		= e.target.parent();

		if(selected.hasClass(ZOOM_IN))
			this.zoomIn();
		else if(selected.hasClass(ZOOM_OUT))
			this.zoomOut();
		else if(selected.hasClass(ZOOM_RESET))
			this.resetZoom();
		
		e.preventDefault();
	}
	
	
	/**
	 * Event dispatched when an icon of the pager is clicked
	 * 
	 * @param	e	object which contains event data
	 * 
	 * @author 	fre
	 * @since	August 25, 2016
	 */
	App.prototype._pager_clickHandler = function(e) {
		
		var selected		= e.target.parent();

		if(selected.hasClass(FIRST)) {
			if(this.displayMode == TRANSCRIPTION)
				this.setPage(1);
			else
				this.br.leftmost();
			
		} else if(selected.hasClass(LAST)) {
			if(this.displayMode == TRANSCRIPTION)
				this.setPage(this.pageCount);
			else
				this.br.rightmost();
            
		} else if(selected.hasClass(PREVIOUS)) {
			if(this.displayMode == TRANSCRIPTION)
				this.setPage(this.pageNum - 1);
			else
				this.br.left();
			
		} else if(selected.hasClass(NEXT)) {
			if(this.displayMode == TRANSCRIPTION)
				this.setPage(this.pageNum + 1);
			else
				this.br.right();
			
		} else if(selected.hasClass(PAGE_COUNTER)) {
			if(this.displayMode == TRANSCRIPTION)
				this.setPage(e.target.val());
			else
				this.br.jumpToIndex(e.target.val() - 1);
		}
		
		e.preventDefault();
		
	}
	

	/**
	 * Event dispatched when the navigation button is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	November 9, 2016
	 */
	App.prototype._navigation_clickHandler = function(e) {
		
		this.rootEl.toggleClass(NAVIGATION_ON);
		
		//	Refresh bookreader
		$(window).trigger(RESIZE_EVENT);

		//	Recalcultate page offsets in responsive mode
		if(this.textMode == DIPLOMATIC_RESPONSIVE)
			this._refreshPageOffsets();		
		
		e.preventDefault();
		
	}
	
	
	/**
	 * Event dispatched when an navigation item is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	November 11, 2016
	 */
	App.prototype._navItem_clickHandler = function(e) {
		
		var item = e.target.parent();

		isScrolling = true;
		this.setPage(item.data(PAGE), true);
		this.text.scrollTop(item.data(MATCH).position().top);
		
		//	Block the binding of scroll event during 500ms
		setTimeout(function() {
			isScrolling = false;
		}, 500);

		e.preventDefault();
	}

	
	/**
	 * Event dispatched when the search button is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	August 30, 2016
	 */
	App.prototype._search_clickHandler = function(e) {
		
		if(!searchInitialized)
			this._initSearch();
		
		this.rootEl.toggleClass(SEARCH_ON);

		//	Set the display mode to transcription
		if(this.rootEl.hasClass(SEARCH_ON))
			this.setDisplayMode(TRANSCRIPTION);
		else {
			if(this.displayMode == ORIGINAL_TRANSCRIPTION)
				//	Refresh bookreader
				$(window).trigger(RESIZE_EVENT);
		}

		//	Recalcultate page offsets in responsive mode
		if(this.textMode == DIPLOMATIC_RESPONSIVE)
			this._refreshPageOffsets();		
		
		e.preventDefault();
		
	}
	

	/**
	 * Event dispatched when the search form is submitted
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 12, 2016
	 */
	App.prototype._searchForm_submitHandler = function(e) {

		var query = $.trim(this.rootEl.find(SEARCH_INPUT_SELECTOR).val());
		
		if(query != this.query) {
			
			this.query = query;
			
			if(this.text.unmark)
				this.text.unmark();
			else
				this.text.unhighlight();
			
			this.text.find(HIGHLIGHT_SELECTOR).removeClass(HIGHLIGHT);
	
			//	Highlight matches
			if(this.text.mark)
				this.text.mark(query, {
					element:				$.trim(SPAN_TAG)
					,className:				HIGHLIGHT
					//	2016/10/10 - fre - Jira WEBSIX-372 ([TEI Transviewer][Search] Updated design. Add <date> category. Use the space as an "AND" operator to search for expressions (e.g. "M. Cary").)
					,separateWordSearch:	false
					,accuracy:				'complementary'		//	Highlight the whole word
				});
			else
				this.text.highlight(query);

			//	Unselect old entity
			if(this.currentEntity)
				this.currentEntity.removeClass(SELECTED);
			
			this._setMatches(this.text.find(HIGHLIGHT_SELECTOR));
			this._refreshEntities();
			
			e.target.toggleClass(NO_MATCH, this.matches.length == 0 && query.length > 0);
			this.rootEl.find(SEARCH_BUTTON_SELECTOR).toggleClass(DISABLED, this.matches.length == 0);
			
		} else
			//	Trigger a click on the next button
			this.rootEl.find(SEARCH_NEXT_SELECTOR).trigger(CLICK_EVENT);
		
		e.preventDefault();
	}
	

	/**
	 * Event dispatched when the previous button is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 12, 2016
	 */
	App.prototype._previous_clickHandler = function(e) {
		
		this.matches.eq(this.currentMatchIndex).removeClass(SELECTED);

		if(this.matches.length == 0)
			return;
		
		if(this.currentMatchIndex == 0)
			this.currentMatchIndex = this.matches.length;
		
		this._ensureVisible(this.matches.eq(--this.currentMatchIndex).addClass(SELECTED));
		
		e.preventDefault();
	}

	
	/**
	 * Event dispatched when the next button is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 12, 2016
	 */
	App.prototype._next_clickHandler = function(e) {
		
		this.matches.eq(this.currentMatchIndex).removeClass(SELECTED);
		
		if(this.matches.length == 0)
			return;
		
		if(++this.currentMatchIndex == this.matches.length)
			this.currentMatchIndex = 0;
		
		this._ensureVisible(this.matches.eq(this.currentMatchIndex).addClass(SELECTED));
		
		e.preventDefault();
	}
	
	
	/**
	 * Event dispatched when a key is released on the search field
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 12, 2016
	 */
	App.prototype._searchInput_keyUpHandler = function(e) {
		if(e.keyCode != 13)
			this.rootEl.find(SEARCH_BUTTON_SELECTOR).removeClass(DISABLED);
	}
	
	
	/**
	 * Event dispatched when a switch button of the tab is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 7, 2016
	 */
	App.prototype._searchTabSwitch_clickHandler = function(e) {
		
		var tab		= e.target.parent();
		var type	= tab.data(TYPE);
		
		this.text.toggleClass(HIGHLIGHT_PFX + type);
		tab.toggleClass(SWITCH_ON);

		//	Highlight entities in the text
		this._highlightEntitiesMatches(tab);

		e.preventDefault();
	}
	
	
	/**
	 * Event dispatched when a search tab is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	August 31, 2016
	 */
	App.prototype._searchTab_clickHandler = function(e) {
		var tab 	= e.target.parent().toggleClass(OPEN);
		tab.parent().find(LI_TAG).not(tab).removeClass(OPEN);
		e.preventDefault();
	}
	
	
	/**
	 * Event dispatched when an entity is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	September 15, 2016
	 */
	App.prototype._entity_clickHandler = function(e) {
		
		var entity				= e.target.parent();
		var isSameEntity		= entity.hasClass(SELECTED);
		
		//	Unselect old entity
		if(this.currentEntity)
			this.currentEntity.removeClass(SELECTED);

		this._setMatches(isSameEntity ? null : entity.data(MATCHES));
		entity.toggleClass(SELECTED, !isSameEntity);
		this.currentEntity = entity;
		
		e.preventDefault();
		
	}
	
	
	/**
	 * Event dispatched when the help button is clicked
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	December 15, 2016
	 */
	App.prototype._help_clickHandler = function(e) {
		
		this.rootEl.toggleClass(HELP_ON);
		
		//	Refresh bookreader
		$(window).trigger(RESIZE_EVENT);

		if(this.rootEl.hasClass(HELP_ON)) {
			
			//	Initialize mouse enter event on the active help icons
			this.delegate(MOUSE_ENTER_EVENT, this._activeHelp_mouseEnterHandler, this.rootEl, ACTIVE_HELP_SELECTOR);
			//	Initialize mouse leave event on the active help icons
			this.delegate(MOUSE_LEAVE_EVENT, this._activeHelp_mouseLeaveHandler, this.rootEl, ACTIVE_HELP_SELECTOR);
			
		} else {
			
			//	Remove mouse enter event on the active help icons
			this.rootEl.off(MOUSE_ENTER_EVENT);
			//	Remove mouse leave event on the active help icons
			this.rootEl.off(MOUSE_LEAVE_EVENT);
		}

		//	Recalcultate page offsets in responsive mode
		if(this.textMode == DIPLOMATIC_RESPONSIVE)
			this._refreshPageOffsets();		
		
		e.preventDefault();
		
	}
	
	
	/**
	 * Event dispatched when the mouse enter above an active help button
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	December 16, 2016
	 */
	App.prototype._activeHelp_mouseEnterHandler = function(e) {

		this.rootEl.addClass(ACTIVE_HELP_ON);
		
		clearTimeout(this._helpTimer);
		this.rootEl.find(HELP_PLACEHOLDER_SELECTOR).hide();
		
		var id = e.currentTarget.data(HELP_KEY);
		
		this.rootEl.find(HELP_TEXT_SELECTOR).html(this._getLanguage('help.' + id));
		
	}
	

	/**
	 * Event dispatched when the mouse leave an active help button
	 * 
	 * @param 	e	object which contains event data
	 * 
	 * @author	fre
	 * @since	December 16, 2016
	 */
	App.prototype._activeHelp_mouseLeaveHandler = function(e) {
		
		this.rootEl.removeClass(ACTIVE_HELP_ON);
		
		this._helpTimer = setTimeout(this.bind(function() {
			this.rootEl.find(HELP_TEXT_SELECTOR).empty();
			this.rootEl.find(HELP_PLACEHOLDER_SELECTOR).show();
		}), 500);
	}

	
	/**
	 * Event dispatched when the mode of the bookreader has switched
	 * 
	 * @param	e		object which contains event data
	 * @param	mode	new mode
	 * 
	 * @author 	fre
	 * @since	August 18, 2016
	 */
	App.prototype._bookreader_switchModeHandler = function(e, mode) {
		
		var toolbar 		= this.rootEl.find(FAC_MODE_SELECTOR);
		var selected;
		
		if(mode == br.constModeThumb)
			selected = toolbar.children(MULTI_PAGE_SELECTOR);
		else if(mode == br.constMode1up)
			selected = toolbar.children(SINGLE_PAGE_SELECTOR);
		else if(mode == br.constMode2up)
			selected = toolbar.children(DUBBLE_PAGE_SELECTOR);

		toolbar.children(LI_TAG).removeClass(SELECTED);
		selected.addClass(SELECTED);
		
	};
	
	
	/**
	 * Event dispatched when the current page changes
	 * 
	 * @param	e		object which contains event data
	 * @param	mode	new page number
	 * 
	 * @author	fre
	 * @since	August 24, 2016
	 */
	App.prototype._bookreader_changePageHandler = function(e, pageNum) {
		this.setPage(pageNum);
	};
	
	
	/**
	 * Event dispatched when the zoom index changes
	 * 
	 * @param	e			object which contains event data
	 * @param	index		new zoom index
	 * @param	oldIndex	old zoom index
	 * 
	 * @author	frehttp://10.1.30.136/obj/fr-35e17c8d-286c-40a4-a387-6618503adf34.html
	 * @since	August 29, 2016
	 */
	App.prototype._bookreader_changeZoomHandler = function(e, index, oldIndex) {
		this._zoomText(index);
	};
	
	
	/**
	 * Event dispatched when the text is scrolled
	 * 
	 * @param	e			object which contains event data
	 * 
	 * @author	fre
	 * @since	September 5, 2016
	 */
	App.prototype._text_scrollHandler = function(e) {
		
		//	Disable event when the book reader is scrolled
		if(isScrolling) return;
		
		if(this._scrollTimer)
			clearTimeout(this._scrollTimer);
		
		this._scrollTimer = setTimeout(this.bind(function() {
			
			//	Fix an issue: when scrolling to the bottom, the page doesn't switch to the last one
	        var maxScroll 	= e.target.prop(SCROLL_HEIGHT) - e.target.height();
	        var page 		= this.pageCount;
	        
	        if(e.target.scrollTop() < maxScroll)
	        	page = this._getPageFromTextOffset(e.target.scrollTop()); 
	        
			this.setPage(page, true);
			
		}), 500);
		
	};
	
	
	/**
	 * Event dispatched when an anchor is clicked
	 * 
	 * @param	e		object which contains event data
	 * 
	 * @author	fre
	 * @since	October 17, 2017
	 */
	App.prototype._anchor_clickHandler = function(e) {

		e.preventDefault();
		
		var href = e.target.attr(HREF);
		
		if(href) {
			var anchor = $(href.replace('.', '\\.'));
			if(anchor.length > 0) {
				this.text.animate({
			        scrollTop: anchor.position().top
			    }, 500);	
			}
		}
	    
	};

	
	window.TransViewer = App;
	
})(jQuery);