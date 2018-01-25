<?xml version="1.0" encoding="UTF-8"?>
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
                <xsl:text disable-output-escaping="yes">
                    &lt;script&gt;
                            var onSaxonLoad = function() 
                                { Saxon.run( {
                                     stylesheet: "</xsl:text><xsl:value-of select="$pathSaxonEntryXSL"/>
                                     <xsl:text disable-output-escaping="yes">", source: "</xsl:text><xsl:value-of select="$xmlSource"/>
                                     <xsl:text disable-output-escaping="yes">" }); 
                                }
                    &lt;/script&gt;
                </xsl:text> 
    </xsl:template>

</xsl:stylesheet>
