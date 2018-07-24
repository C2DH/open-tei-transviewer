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
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 17, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Global constants declaration.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Extensions -->
    <xsl:param name="extJPG" select="'.jpg'"/>
    <xsl:param name="extXML" select="'.xml'"/>
    
    <!-- Global variables -->
    <!-- Change the lang of the interface -->
    <xsl:variable name="interface_lang" select="'en'"/>
      
    <!-- Global attribute values -->
    <xsl:variable name="textID" select="//tei:text/@xml:id"/>
    <xsl:variable name="textType" select="//tei:text/@type"/>
    <xsl:variable name="lang" select="//tei:text/@xml:lang"/>
    <xsl:variable name="pageIdPrefix" select="'page_'"/>
    
    <!-- Separators, delimiters and tags -->
    <xsl:param name="sepFile" select="'/'"/>
    <!-- Used to separe the attribute name of its value in its transaltion to a html class, e.g. 'corresp§doc_ref' -->
    <xsl:param name="sepAtt" select="'§'"/>
    <xsl:param name="refTag" select="'#'"/>
    <xsl:param name="sepUnder" select="'_'"/>
    <xsl:param name="leftRoundBracket" select="'('"/>
    <xsl:param name="rightRoundBracket" select="')'"/>
    
    <!-- Classes -->
    <xsl:variable name="sepClass" select="'separator'"/>
    <!-- Deletable line break in linear transcription -->
    <xsl:variable name="lbDelClass" select="'line_break_del'"/>
    <xsl:variable name="changePageClass" select="'change_page'"/>
    <xsl:variable name="toHTML" select="false()"/> 
    
</xsl:stylesheet>