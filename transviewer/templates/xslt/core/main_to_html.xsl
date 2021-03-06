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
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:import href="global_config.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 27, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Transform XML to HTML outside the browser.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="text"/>
    
    <xsl:variable name="toHTML" select="true()"/> 
   
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
            <xsl:call-template name="head" />
            <body xmlns="http://www.w3.org/1999/xhtml" class="{$textType}" id="{$textID}">
                <xsl:call-template name="bodyCoreLayout"/>
                <xsl:call-template name="bodyCoreScript" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="head">
        <head xmlns="http://www.w3.org/1999/xhtml">
            <title><xsl:value-of select="//tei:titleStmt/tei:title"/></title>
            <xsl:call-template name="headCoreCSS" />
            <xsl:call-template name="headCoreStyle" />
        </head>
    </xsl:template>
    
</xsl:stylesheet>
