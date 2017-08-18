<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Sep 1, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Utilities to be used by all projects.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Return the substring after the last occurrence of the delimiter (delim) in the given string (str). -->
    <xsl:template name="lastSubstr">
        <xsl:param name="str"/>
        <xsl:param name="delim"/>	
        <xsl:choose>
            <xsl:when test="contains($str, $delim)">
                <xsl:call-template name="lastSubstr">
                    <xsl:with-param name="str" select="substring-after($str, $delim)"/>
                    <xsl:with-param name="delim" select="$delim"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$str"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Return the substring before the first occurrence of the delimiter (delim) in the given string (str). -->
    <xsl:template name="firstSubstr">
        <xsl:param name="str"/>
        <xsl:param name="delim"/>	
        <xsl:choose>
            <xsl:when test="contains($str, $delim)">
                <xsl:value-of select="substring-before($str, $delim)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$str"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>