<?xml version="1.0" encoding="UTF-8"?>
<!-- 
 TEI Transviewer 1.0. Interface for online text and image visualisation.
 Copyright (C) 2018, C2DH, University of Luxembourg, Frédéric Reis
 
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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" version="2.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Oct 19, 2016</xd:p>
			<xd:p><xd:b>Author:</xd:b>Frédéric Reis</xd:p>
			<xd:p>Creating a basic layout.</xd:p>
		</xd:desc>
	</xd:doc>

	<!--<xsl:template match="/" priority="1">-->
	<xsl:template name="bodyCoreLayout">
		<div xmlns="http://www.w3.org/1999/xhtml" class="content-wrapper">
			<xsl:apply-templates select="//tei:facsimile" />
			<xsl:apply-templates select="//tei:text" />
		</div>
	</xsl:template>

	<xsl:template match="//tei:facsimile">
		<section xmlns="http://www.w3.org/1999/xhtml" id="BookReader" class="doc-part-fac">
			<xsl:apply-templates select="./child::node()" />
		</section>
	</xsl:template>
	
    <xsl:template match="//tei:facsimile//tei:graphic">
    	<img xmlns="http://www.w3.org/1999/xhtml" width="{translate(./@width, translate(./@width, '0123456789', ''), '')}" height="{translate(./@height, translate(./@height, '0123456789', ''), '')}" data-src="{./@url}" src="#" />
	</xsl:template>	

	<xsl:template match="//tei:text">
		<section xmlns="http://www.w3.org/1999/xhtml" class="doc-part-text {$textType}">
			<div xmlns="http://www.w3.org/1999/xhtml" id="text" class="text_img">
				<xsl:apply-templates select="./child::node()" />
			</div>
		</section>
	</xsl:template>
	
	<!--  2016/10/19 - fre - Override the default //tei:body template of the frame_basic.xsl file -->
	 <xsl:template match="//tei:body" priority="1">
		<xsl:apply-templates select="./child::node()" />
	</xsl:template>

</xsl:stylesheet>