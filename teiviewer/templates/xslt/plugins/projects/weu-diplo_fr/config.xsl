<?xml version="1.0" encoding="UTF-8"?>
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
    
    <!--<xsl:output indent="yes"/>-->
    
    <!-- Include -->

    <xsl:include href="../../../core/global_config.xsl"/>
    <xsl:include href="local_constants.xsl"/>
    <xsl:include href="../../../core/boot_saxonce.xsl"/>
    <xsl:include href="../../../core/head_basic.xsl"/>
    <xsl:include href="head_specific.xsl"/>
    <xsl:include href="../../../core/frame_basic.xsl"/>
    <!--<xsl:include href="../../../core/basic_frame_vertical_alignment.xsl"/>-->
    <xsl:include href="../../../core/layout_transcr-facsimile.xsl"/>
    <xsl:include href="../../../core/transcript-basic.xsl"/>
    <xsl:include href="transcript-specific.xsl"/>

    <!-- Variables -->
    
    <!-- Language -->
    <xsl:param name="lang" select="$langFR"/> 
    
    <!-- Paths -->
    <xsl:param name="pathXSLCore" select="'../../../tools/transviewer/xslt/core'"/>
    <xsl:param name="pathXSLSpecific" select="'../../../tools/transviewer/xslt/plugins/projects/weu-diplo_fr'"/>
    <xsl:param name="pathCSSSpecific" select="'../../../tools/transviewer/css/plugins/projects/weu-diplo_fr'"/>
    <xsl:param name="pathSpecificJS" select="'../../../tools/transviewer/js/plugins/projects/weu-diplo_fr'"/>
    
    <!-- File names -->
    <!--<xsl:param name="fileXslBootSaxonce" select="'boot_saxonce.xsl'"/> -->
   <!-- <xsl:param name="fileXSLSaxonEntry" select="'saxon_entry.xsl'"/>-->
    <xsl:param name="fileXSLSaxonEntry" select="'saxon_entry.xsl'"/>
   <!-- <xsl:param name="fileXSLSaxonEntry" select="'main.xsl'"/>-->
    
    <!--Complete paths -->
    <xsl:param name="pathXSLSaxonEntry" select="concat(concat($pathXSLSpecific, $sepFile), $fileXSLSaxonEntry)"/>
    
  <!--  <xsl:param name="pathXSLMain" select="'../../../tools/transviewer/xslt/plugins/projects/test-xslt_2.0/main.xsl'"/>-->
    
</xsl:stylesheet>