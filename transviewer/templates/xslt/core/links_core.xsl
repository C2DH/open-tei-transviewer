<?xml version="1.0" encoding="UTF-8"?>
<!-- 
 TEI Transviewer 1.0. Interface for online text and image visualisation.
 Copyright (C) 2018, C2DH, University of Luxembourg,  Florentina Armaselu
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.
  * This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.
 
 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 17, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Links to application and project core CSS and JS, and style description; to be added to the head or end of the body part in the generated HTML file</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="headCoreCSS">
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathAppCSS}/transviewer.css" rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathCoreCSS}/transcript_core.css" rel="stylesheet" type="text/css"> </link>
    </xsl:template>
    
    <xsl:template name="headCoreStyle">
        <style xmlns="http://www.w3.org/1999/xhtml" type="text/css">
            <xsl:text disable-output-escaping="yes">html, body {height:100%; margin:0; overflow: hidden;</xsl:text>
        </style>
    </xsl:template>
    
    <xsl:template name="bodyCoreScript">
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript">
				function loadJQueryPlugins() {
						$.when(
							<xsl:if test="//tei:facsimile">
								$.getScript('<xsl:value-of select="$pathJQuery-uiJS" />'),
								$.getScript('<xsl:value-of select="$pathDragscrollableJS" />'),
								$.getScript('<xsl:value-of select="$pathBookreaderJS" />'),
							</xsl:if>
							<xsl:if test="//tei:text">
								$.getScript('<xsl:value-of select="$pathJQuery-highlightJS" />'),
								$.getScript('<xsl:value-of select="$pathJQuery-markJS" />'),
							</xsl:if>
							$.getScript('<xsl:value-of select="$pathTransviewerJS" />')

						).done(function() {
							$.when(
								<xsl:if test="//tei:facsimile">
									$.getScript('<xsl:value-of select="$pathBookreader-simpleJS" />')
								</xsl:if>
								
							).done(function() {
								TransViewer.plugInRoot = '<xsl:value-of select="concat($pathRoot, $sepFile)" />';
								new TransViewer($('body'), {
									language: '<xsl:value-of select="$interface_lang" />'
								});
							});
						});
				}
		</script>
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSaxonceJS}"/>
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJS}" onload="loadJQueryPlugins()"/>
		
    </xsl:template>
    
</xsl:stylesheet>
