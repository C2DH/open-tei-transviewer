<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 23, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Processes project-specific structure and content elements.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Divisions with @type, @n and @xml:id attributes -->
    <xsl:template match="//tei:body//tei:div[count(./@*)=3 and count(./@type)=1 and count(./@n)=1 and count(./@xml:id)=1]">
        <div xmlns="http://www.w3.org/1999/xhtml" class="{$divTranscrClass} {name(./@type)}{$sepAtt}{./@type} {name(./@n)}{$sepAtt}{./@n}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </div>
    </xsl:template>
       
    <!-- Heading with a div parent of type 'treaty', level 1 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeTreaty]">
       <h1 xmlns="http://www.w3.org/1999/xhtml">
           <xsl:apply-templates select="./child::node()"/>
       </h1>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'part', level 2 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypePart]">
        <h2 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h2>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'title', level 3 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeTitle]">
        <h3 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h3>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'chapter', level 4 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeChapter]">
        <h4 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h4>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'section', level 5 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeSection]">
        <h5 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h5>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'subsection', level 6 -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeSubsection]">
        <h6 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h6>  
    </xsl:template>
    
    <!-- Heading with a div parent of type 'article', level 7 but 'h6' will be used instead -->
    <xsl:template match="//tei:head[count(./parent::tei:div/@type)=1 and ./parent::tei:div/@type=$divTypeArticle]">
        <h6 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h6>  
    </xsl:template>
    
</xsl:stylesheet>