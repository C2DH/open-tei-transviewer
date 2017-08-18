<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 21, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Chiara Alzetta</xd:p>
            <xd:p>Creating the elements to visualise the transcription and the image associated to it. </xd:p>
        </xd:desc>
    </xd:doc>
    
   <!-- <xsl:output indent="yes"/> 
    <xsl:strip-space elements="div"/>-->
    
    <xsl:template match="tei:pb">
        <br xmlns="http://www.w3.org/1999/xhtml" class="change_page">
            <xsl:attribute name="id">page_<xsl:number level="any"/></xsl:attribute>
        </br> 
    </xsl:template>
    
    <xsl:template match="tei:facsimile//tei:graphic" name="create_options">
        <option xmlns="http://www.w3.org/1999/xhtml" class="page">
            <xsl:attribute name="value"><xsl:value-of select="./@url"/></xsl:attribute>
            <xsl:value-of select="substring-after(./parent::tei:surface/@xml:id, $sepUnder)"/>
        </option> 
    </xsl:template>
    
    <!-- Previews attempts -->
    <!--<xsl:for-each select="//tei:surface[@corresp=concat('#',current()/@xml:id)]">
                    <xsl:value-of select=".//tei:graphic/@url"/>                      
                </xsl:for-each>-->

    <!--  <xsl:for-each select="//tei:surface[substring-after(@corresp, '#')=current()/@xml:id]">
                    <xsl:value-of select="./substring-after(@corresp, '#')"/>                    
                </xsl:for-each>-->
    
    <!-- <xsl:value-of select="$pathToImages"/><xsl:value-of
                    select="./@xml:id"/>.jpg</xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="./@xml:id"/>.jpg</xsl:attribute> --> 
    
    <!-- <xsl:template match="tei:facsimile" mode="create_img">
        <xsl:apply-templates select="./tei:surface"/>
    </xsl:template>-->
    
    <!--<xsl:template match="tei:surface">
        <img xmlns="http://www.w3.org/1999/xhtml" 
            id="{./@xml:id}" 
            class="lazyload" 
            data-src="{./tei:graphic/@url}" 
            src="../media/loading.jpg" 
            alt="{concat(./@xml:id,$extJPG)}"
            height="800px" width="auto"/>-->
    <!--<img xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:value-of select="./@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="./tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="./@xml:id"/>.jpg</xsl:attribute>
            <xsl:attribute name="height">820px</xsl:attribute>
            <xsl:attribute name="width">550px</xsl:attribute>-->
    <!--  <xsl:if test="./@n='001'">-->
    <!--<xsl:attribute name="align">left</xsl:attribute>-->
    <!--  </xsl:if>-->
    
    <!-- <xsl:attribute name="max-height">90%</xsl:attribute> -->
    <!-- <xsl:attribute name="max-width">auto</xsl:attribute> -->
    <!--   </img>-->
    <!-- </xsl:template>-->
    
    <!-- <a xmlns="http://www.w3.org/1999/xhtml" href="{./@corresp}"/>-->
    <!--<a xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="href">
                <xsl:value-of select="./@corresp"/>-->
    <!--<xsl:attribute name="name">
                <xsl:value-of select="substring-after(./@corresp, '#')"/>-->
    <!--</xsl:attribute><xsl:comment> </xsl:comment></a>-->    
    
    <!-- <xsl:for-each select="//tei:graphic">
            <option xmlns="http://www.w3.org/1999/xhtml" class="page">
                <xsl:attribute name="value"><xsl:value-of select="./@url"/></xsl:attribute>
                <xsl:number format="001" />
            </option>                      
        </xsl:for-each>-->
    
</xsl:stylesheet>