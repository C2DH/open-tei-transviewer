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
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 24, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> frederic.reis</xd:p>
            <xd:p>Core: Only transform the body part of the XML to HTML outside the browser. Can be integrated as a plug-in in other website. </xd:p>
        </xd:desc>
    </xd:doc>

	<xsl:output method="html" encoding="utf-8" indent="no"/> 

	<xsl:include href="global_config.xsl"/>

	<xsl:template match="/">
		<div xmlns="http://www.w3.org/1999/xhtml" class="content-wrapper" id="{$textID}">
			<xsl:apply-templates select="//tei:facsimile" />
			<xsl:apply-templates select="//tei:text" />
		</div>
	</xsl:template>

</xsl:stylesheet>