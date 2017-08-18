<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 15, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Set the global configuration.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Include -->
    <xsl:include href="global_constants.xsl"/>
   <!-- <xsl:include href="util.xsl"/>-->
    
    <!-- Paths -->
    <!-- Saxon-CE path prefixes -->
    <xsl:param name="pathSaxonce" select="'../../../tools/third-party/Saxon-CE_1.1/Saxonce'"/>
    <!-- JQuery path prefixes -->
    <xsl:param name="pathJQuery" select="'../../../tools/third-party/lib'"/> 
    <!-- CSS core path prefixes -->
    <xsl:param name="pathCoreCSS" select="'../../../tools/transviewer/css/core'"/>
    <!-- JS core path prefixes -->
    <xsl:param name="pathCoreJS" select="'../../../tools/transviewer/js/core'"/>
    <!-- Data XML path prefix -->
    <xsl:param name="pathDataXML" select="'../xml'"/>    
    <!-- jQuery BookReader path prefixes -->
    <xsl:param name="pathBookReader" select="'../../../tools/third-party/BookReader-master/BookReader'"/>
    
    
    <!-- Libraries -->
    <!-- Saxon-CE JS-->
    <xsl:param name="libSaxonceJS" select="'Saxonce.nocache.js'"/>    
    <!-- JQuery-->
    <!-- <xsl:param name="libJQueryJS11" select="'jquery-1.11.3.min.js'"/>  -->
    <xsl:param name="libJQueryJS4" select="'jquery-1.4.2.min.js'"/>
    <xsl:param name="libJQueryJScustom" select="'jquery-ui-1.8.5.custom.min.js'"/>
    <xsl:param name="libJQueryJScolorbox" select="'jquery.colorbox-min.js'"/>
    <xsl:param name="libJQueryJSipad" select="'jquery.ui.ipad.js'"/>
    <xsl:param name="libJQueryJSbt" select="'jquery.bt.min.js'"/>
    <!-- Book Reader -->
    <xsl:param name="libJSdragscroll" select="'dragscrollable.js'"/>
    
    <!-- Complete paths -->
    <xsl:param name="pathSaxonceJS" select="concat(concat($pathSaxonce, $sepFile), $libSaxonceJS)"/>
    <!-- <xsl:param name="pathJQueryJS11" select="concat(concat($pathJQuery, $sepFile), $libJQueryJS11)"/> -->
    <xsl:param name="pathJQueryJScustom" select="concat(concat($pathJQuery, $sepFile), $libJQueryJScustom)"/>
    <xsl:param name="pathJQueryJS4" select="concat(concat($pathJQuery, $sepFile), $libJQueryJS4)"/>
    <xsl:param name="pathJSdragscroll" select="concat(concat($pathBookReader, $sepFile), $libJSdragscroll)"/>
    <xsl:param name="pathJQueryJScolorbox" select="concat(concat($pathBookReader, $sepFile), $libJQueryJScolorbox)"/>
    <xsl:param name="pathJQueryJSipad" select="concat(concat($pathBookReader, $sepFile), $libJQueryJSipad)"/>
    <xsl:param name="pathJQueryJSbt" select="concat(concat($pathBookReader, $sepFile), $libJQueryJSbt)"/>
    
    <xsl:include href="liferay-basic.xsl"/>
    
    <!-- These two libraries are not used at the moment -->
    <!-- jQuery lazysizes path prefixes -->
    <!--<xsl:param name="pathLazysizes" select="'../../../tools/third-party/jQuery-lazy'"/>-->
    <!-- jQuery lazysizes path prefixes -->
    <!--<xsl:param name="pathSmartZoom" select="'../../../tools/third-party/smartZoom/src'"/>-->
    <!-- lazysizes -->
    <!--<xsl:param name="libLazysizes" select="'lazysizes.min.js'"/>-->
    <!-- smartZoom -->
    <!--<xsl:param name="libSmartZoom" select="'e-smart-zoom-jquery.min.js'"/>-->   
    <!--<xsl:param name="pathLazysizesJS" select="concat(concat($pathLazysizes, $sepFile), $libLazysizes)"/>-->
    <!--<xsl:param name="pathSmartZoomJS" select="concat(concat($pathSmartZoom, $sepFile), $libSmartZoom)"/>-->
</xsl:stylesheet>