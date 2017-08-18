<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 6, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Local constants defined for a given project</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Specific attribute values -->
    <xsl:variable name="textID" select="//tei:text/@xml:id"/>
    <xsl:variable name="textType" select="//tei:text/@type"/>
    <xsl:variable name="textSubType"/>
    <xsl:variable name="divTranscrClass" select="'transcript'"/>
    <xsl:variable name="divTypeTreaty" select="'treaty'"/>
    <xsl:variable name="divTypePart" select="'part'"/>
    <xsl:variable name="divTypeTitle" select="'title'"/>
    <xsl:variable name="divTypeChapter" select="'chapter'"/>
    <xsl:variable name="divTypeSection" select="'section'"/>
    <xsl:variable name="divTypeSubsection" select="'subsection'"/>
    <xsl:variable name="divTypeArticle" select="'article'"/>
    
</xsl:stylesheet>