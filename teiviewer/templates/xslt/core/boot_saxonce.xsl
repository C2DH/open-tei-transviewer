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
        <xsl:param name="pathXSLSaxonEntry" />
        
              <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSaxonceJS}"></script>
        
                <!-- In HTML documents this line loads everything twice (so images are doubled. Use the other main to transform html). NOT the cause of overlaped text, but doubles the head also in xml documents on the fly. -->
              
                <!--<xsl:text disable-output-escaping="yes">&lt;script type="text/javascript"&gt;var onSaxonLoad = function() { Saxon.run( {stylesheet: "</xsl:text><xsl:value-of select="$pathXSLMain"/><xsl:text disable-output-escaping="yes">", source: "</xsl:text><xsl:value-of select="$xmlSource"/><xsl:text disable-output-escaping="yes">" }); }&lt;/script&gt;</xsl:text>-->
                
                <xsl:text disable-output-escaping="yes">
                    &lt;script&gt;
                            var onSaxonLoad = function() 
                                { Saxon.run( {
                                     stylesheet: "</xsl:text><xsl:value-of select="$pathXSLSaxonEntry"/>
                                     <xsl:text disable-output-escaping="yes">", source: "</xsl:text><xsl:value-of select="$xmlSource"/>
                                     <xsl:text disable-output-escaping="yes">" }); 
                                }
                    &lt;/script&gt;
                </xsl:text>
        
                <!--  <xsl:text disable-output-escaping="yes">&lt;script&gt; var onSaxonLoad = function() { var xsl = Saxon.requestXML("</xsl:text><xsl:value-of select="$pathXSLSaxonEntry"/><xsl:text disable-output-escaping="yes">"); var xml = Saxon.requestXML("</xsl:text><xsl:value-of select="$xmlSource"/><xsl:text disable-output-escaping="yes">"); var proc = Saxon.newXSLT20Processor(xsl); proc.updateHTMLDocument(xml); }; &lt;/script&gt;</xsl:text>-->
                <!-- <script type="application/xslt+xml" language="xslt2.0" src="{$pathXSLSaxonEntry}" data-source="{$xmlSource}"></script>-->
                <!--  <script type="application/xslt+xml" language="xslt2.0" src="{$pathXSLSaxonEntry}" data-initial-template="{$initTemplate}"></script>-->
      
              <!--  <xsl:text disable-output-escaping="yes">&lt;script type="text/javascript"&gt; var onSaxonLoad = function() { Saxon.run( { source: location.href, logLevel: "SEVERE", stylesheet: "</xsl:text><xsl:value-of select="$pathXSLSaxonEntry"/><xsl:text disable-output-escaping="yes">" }); }&lt;/script&gt;</xsl:text>-->
               
                <!-- Saxon loading error in Firefox: InvalidStateError: An attempt was made to use an object that is not, or is no longer, usable Saxonce.nocache.js:17:0. See reported error on: https://saxonica.plan.io/boards/1/topics/5808 -->
                <!-- See also: https://github.com/dwcramer/saxoncedemo -->
                <!-- See also: http://stackoverflow.com/questions/20078726/cant-get-saxon-ce-to-work -->
       
    </xsl:template>

</xsl:stylesheet>
