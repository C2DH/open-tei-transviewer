<?xml version="1.0" encoding="UTF-8"?>

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
    	<img xmlns="http://www.w3.org/1999/xhtml" width="{translate(./@width, translate(./@width, '0123456789', ''), '')}" height="{translate(./@height, translate(./@height, '0123456789', ''), '')}" data-src="{./@url}" />
	</xsl:template>	

	<xsl:template match="//tei:text">
		<section xmlns="http://www.w3.org/1999/xhtml" class="doc-part-text {$textType}" id="{$textID}">
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