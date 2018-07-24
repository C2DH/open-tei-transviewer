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
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xd tei" version="1.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Jul 15, 2015</xd:p>
			<xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
			<xd:p>Launch Saxon-CE in order to support XSLT 2.0 in the browser.</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:param name="xmlSource" select="concat(concat(concat($pathDataXML, $sepFile),//tei:text/@xml:id),$extXML)"/>
   
	<xsl:template name="bootSaxonCE">
		<xsl:param name="pathSaxonEntryXSL" />
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSaxonceJS}"></script>
		<script>
			<xsl:text disable-output-escaping="yes">
				var onSaxonLoad = function() {
					Saxon.run({
						stylesheet: "</xsl:text><xsl:value-of select="$pathSaxonEntryXSL"/>
						<xsl:text disable-output-escaping="yes">", source: "</xsl:text><xsl:value-of select="$xmlSource"/>
						<xsl:text disable-output-escaping="yes">" 
					}); 
				}
			</xsl:text> 
		</script>
	</xsl:template>

</xsl:stylesheet>
