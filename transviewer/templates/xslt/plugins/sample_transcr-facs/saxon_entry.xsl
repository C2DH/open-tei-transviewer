<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 25, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Inject body content into the html page</xd:p>
        </xd:desc>
    </xd:doc>
   
   <xsl:include href="local_config.xsl"/>
    
    <xsl:template match="/">
            <xsl:result-document href="{concat($refTag, $textID)}" method="ixsl:replace-content">
                <xsl:call-template name="bodyCoreLayout"/>
                <xsl:call-template name="bodyCoreScript" />
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>