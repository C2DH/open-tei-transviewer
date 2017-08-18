<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 17, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Global constants declaration.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Language constants -->
    <xsl:variable name="langFR" select="'fr'"/>
    <xsl:variable name="langEN" select="'en'"/>
    <xsl:variable name="langDE" select="'de'"/>
    
    <!-- Extensions -->
    <xsl:param name="extJPG" select="'.jpg'"/>
    <xsl:param name="extXML" select="'.xml'"/>
      
    <!-- Transformation types -->
    <!-- On the fly -->
    <xsl:param name="onTheFly" select="'onf'"/>
    <!-- XHTML only -->
    <xsl:param name="outXHTML" select="'oxhtml'"/>
    
    <!-- Separators, delimiters and tags -->
    <xsl:param name="sepFile" select="'/'"/>
    <!-- Used to separe the attribute name of its value in its transaltion to a html class, e.g. 'corresp|doc_ref' -->
    <xsl:param name="sepAtt" select="'§'"/>
    <xsl:param name="refTag" select="'#'"/>
    <xsl:param name="sepUnder" select="'_'"/>
    <xsl:param name="leftRoundBracket" select="'('"/>
    <xsl:param name="rightRoundBracket" select="')'"/>
    
    <!-- Classes -->
    <xsl:variable name="sepClass" select="'separator'"/>
    <!-- Deletable line break in linear transcription -->
    <xsl:variable name="lbDelClass" select="'line_break_del'"/>
    
</xsl:stylesheet>