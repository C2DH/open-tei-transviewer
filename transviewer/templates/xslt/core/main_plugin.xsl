<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 24, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> frederic.reis</xd:p>
            <xd:p>Core: Only transform the body part of the XML to HTML outside the browser. Can be integrated as a plug-in in other website. </xd:p>
        </xd:desc>
    </xd:doc>

	<xsl:output method="html" encoding="utf-8" indent="no"/> 

	<xsl:include href="global_config.xsl"/>

	<xsl:template match="/">
		<xsl:call-template name="bodyCoreLayout"/>
	</xsl:template>

</xsl:stylesheet>