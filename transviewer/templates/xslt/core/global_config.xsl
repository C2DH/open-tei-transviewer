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
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 15, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Set the global configuration.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Include -->
    <xsl:include href="global_constants.xsl"/>
    <xsl:include href="links_core.xsl"/>
    <xsl:include href="layout_core.xsl"/>
    <xsl:include href="transcript_core.xsl"/>
    <xsl:include href="boot_saxonce.xsl"/>
    
    <!-- Paths -->
    <xsl:param name="pathSaxonce" select="'../../../transviewer/lib/Saxon-CE_1.1/Saxonce'"/>
    <xsl:param name="pathLib" select="'../../../transviewer/lib'"/>
    <xsl:param name="pathCoreXSL" select="'../../../transviewer/templates/xslt/core'"/>
    <xsl:param name="pathCoreCSS" select="'../../../transviewer/templates/css/core'"/>
    <xsl:param name="pathAppCSS" select="'../../../transviewer/styles'"/>
    <xsl:param name="pathRoot" select="'../../../transviewer'"/>
    <xsl:param name="pathDataXML" select="'../xml'"/>    
    
    <!-- JS Libraries file names -->
    <xsl:param name="libSaxonceJS" select="'Saxonce.nocache.js'"/>    
    <xsl:param name="libJQueryJS" select="'jquery-1.11.1.min.js'"/>
    <xsl:param name="libJQuery-uiJS" select="'jquery-ui-1.11.4.min.js'"/>
    <xsl:param name="libJQuery-highlightJS" select="'jquery.highlight.js'"/>
    <xsl:param name="libJQuery-markJS" select="'jquery.mark.min.js'"/>
    <xsl:param name="libDragscrollableJS" select="'dragscrollable.js'"/>
    <xsl:param name="libBookreaderJS" select="'Bookreader.js'"/>
    <xsl:param name="libBookreader-simpleJS" select="'bookreader-simple.js'"/>
    <xsl:param name="libTransviewerJS" select="'transviewer.js'"/>
    <xsl:param name="fileSaxonEntryXSL" select="'saxon_entry.xsl'"/>
    
    <!-- Complete paths, including file names -->
    <xsl:param name="pathSaxonceJS" select="concat(concat($pathSaxonce, $sepFile), $libSaxonceJS)"/>
    <xsl:param name="pathJQueryJS" select="concat(concat($pathLib, $sepFile), $libJQueryJS)"/>
    <xsl:param name="pathJQuery-uiJS" select="concat(concat($pathLib, $sepFile), $libJQuery-uiJS)"/>
    <xsl:param name="pathJQuery-highlightJS" select="concat(concat($pathLib, $sepFile), $libJQuery-highlightJS)"/>
    <xsl:param name="pathJQuery-markJS" select="concat(concat($pathLib, $sepFile), $libJQuery-markJS)"/>
    <xsl:param name="pathDragscrollableJS" select="concat(concat($pathLib, $sepFile), $libDragscrollableJS)"/>
    <xsl:param name="pathBookreaderJS" select="concat(concat($pathLib, $sepFile), $libBookreaderJS)"/>
    <xsl:param name="pathBookreader-simpleJS" select="concat(concat($pathLib, $sepFile), $libBookreader-simpleJS)"/>
    <xsl:param name="pathTransviewerJS" select="concat(concat($pathRoot, $sepFile), $libTransviewerJS)"/>
    <xsl:param name="pathSaxonEntryXSL" select="concat(concat($pathCoreXSL, $sepFile), $fileSaxonEntryXSL)"/>
    
</xsl:stylesheet>