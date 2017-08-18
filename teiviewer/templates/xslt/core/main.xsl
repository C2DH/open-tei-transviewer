<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 16, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> frederic.reis</xd:p>
            <xd:p>Core: main transformation stylesheet</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="html" encoding="utf-8" indent="no"/> 

    <xsl:variable name="textID"/>
    <xsl:variable name="textType"/>
    <xsl:variable name="textSubType"/>

    <xsl:include href="global_config.xsl"/>
    <xsl:include href="boot_saxonce.xsl"/>
    <xsl:include href="head_basic.xsl"/>
    <xsl:include href="frame_basic.xsl"/>
    <xsl:include href="layout_transcr-facsimile.xsl"/>
    <xsl:include href="transcript-basic.xsl"/>
    
</xsl:stylesheet>