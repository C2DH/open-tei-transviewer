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
            <xd:p><xd:b>Created on:</xd:b> Jul 16, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Project specific configuration stylesheet.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Include -->
    <xsl:include href="../../core/global_config.xsl"/>
    <xsl:include href="local_constants.xsl"/>
    <xsl:include href="links_specific.xsl"/>
    <xsl:include href="transcript_specific.xsl"/>
    
    <!-- Paths -->
    <xsl:param name="pathSpecificXSL" select="'../../../transviewer/templates/xslt/plugins/sample_transcr-facs'"/>
    <xsl:param name="pathSpecificCSS" select="'../../../transviewer/templates/css/plugins/sample_transcr-facs'"/>
    <xsl:param name="pathSpecificSaxonEntryXSL" select="concat(concat($pathSpecificXSL, $sepFile), $fileSaxonEntryXSL)"/>
    
</xsl:stylesheet>