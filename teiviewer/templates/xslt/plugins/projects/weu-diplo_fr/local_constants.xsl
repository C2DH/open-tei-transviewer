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
    <xsl:variable name="textSubType" select="//tei:text/@subtype"/>
    
    <xsl:variable name="annexClass" select="'annex'"/>
    <xsl:variable name="annexText" select="'Annexe'"/>
    <xsl:variable name="annexTextCap" select="'ANNEXE'"/>
    <xsl:variable name="archNumType" select="concat($refTag,'arch_num')"/>
    <xsl:param name="breakNoClass" select="'break_no'"/>
    <xsl:param name="breakNoType" select="'no'"/>
    <xsl:variable name="footnoteType" select="'footnote'"/>
    <xsl:variable name="footnoteSepClass" select="'footnote_sep'"/>
    <xsl:variable name="headerType" select="'header'"/>
    <xsl:param name="hyphenBeforeType" select="concat($refTag, 'hyphen_before')"/>
    <xsl:param name="hyphenClass" select="'hyphen'"/>
    <xsl:variable name="noDecoClass" select="'no_deco'"/>
    <xsl:variable name="subHeadClass" select="'sub_head'"/>
    <xsl:variable name="noDecoType" select="concat($refTag, $noDecoClass)"/>
    <xsl:variable name="docAuthType" select="concat($refTag,'doc_auth')"/>
    <xsl:variable name="classifStampType" select="concat($refTag,'classif_stamp')"/>
    <xsl:variable name="classifDateType" select="concat($refTag,'classif_date')"/>
    
    <!-- Separators, punctuation marks and tags -->
    
    <!-- Used to separate place specifications like 'top-left', 'top-right' -->
    <xsl:param name="sepPlace" select="'-'"/>
    
</xsl:stylesheet>