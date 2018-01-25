<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 17, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Link tags for project specific CSS; to be added to the head of the generated HTML file.</xd:p>
        </xd:desc>
    </xd:doc>
     
    <xsl:template name="headSpecificCSS">
        <link xmlns="http://www.w3.org/1999/xhtml" id="specificCSS_dipl" href="{$pathSpecificCSS}/transcript_specific_dipl.css" rel="stylesheet" type="text/css" title="diplomatic"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" id="specificCSS_lin" href="{$pathSpecificCSS}/transcript_specific_lin.css" rel="stylesheet alternate" type="text/css" title="linear"> </link>
    </xsl:template>
      
</xsl:stylesheet>