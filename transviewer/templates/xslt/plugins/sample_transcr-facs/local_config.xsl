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