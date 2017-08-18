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
     
    <!-- Headers, footers, catch, page numbers with @type and @place -->
    <xsl:template match="//tei:fw[count(./@*)=2 and count(./@type)=1 and count(./@place)=1]">
        <xsl:choose>
            <xsl:when test="./@type=$headerType and (contains(.,$annexText) or contains(.,$annexTextCap))">
                <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {$annexClass}" style="text-align:{substring-after(./@place, $sepPlace)}">
                    <xsl:apply-templates select="./child::node()"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="./child::tei:note[./@type=$footnoteType]">
                    <hr class="{$footnoteSepClass}" xmlns="http://www.w3.org/1999/xhtml"/>
                </xsl:if>
                <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type}" style="text-align:{substring-after(./@place, $sepPlace)}">
                    <xsl:apply-templates select="./child::node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @place and @corresp -->
    <xsl:template match="//tei:fw[count(./@*)=3 and count(./@type)=1 and count(./@place)=1 and count(./@corresp)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" style="text-align:{substring-after(./@place, $sepPlace)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <!-- <xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2"> -->
        <xsl:if test="./@corresp=$docAuthType">
            <xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2 or (count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=1 and count(./following-sibling::tei:fw[./@corresp=$docAuthType])=0)">
                <xsl:if test="count(./following-sibling::tei:fw[./@corresp=$archNumType])=0">
                    <hr xmlns="http://www.w3.org/1999/xhtml"/>
                </xsl:if>
            </xsl:if>
        </xsl:if>
        <xsl:if test="./@corresp=$archNumType and count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2">
            <hr xmlns="http://www.w3.org/1999/xhtml"/>
        </xsl:if>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @place, @corresp and @xml:id-->
    <xsl:template match="//tei:fw[count(./@*)=4 and count(./@type)=1 and count(./@place)=1 and count(./@corresp)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" id="{./@xml:id}" style="text-align:{substring-after(./@place, $sepPlace)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <!--<xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2">-->
        <xsl:if test="./@corresp=$docAuthType">
            <xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2 or (count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=1 and count(./following-sibling::tei:fw[./@corresp=$docAuthType])=0)">
                <hr xmlns="http://www.w3.org/1999/xhtml"/>
            </xsl:if>
        </xsl:if>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @place, @corresp and @xml:id-->
    <xsl:template match="//tei:fw[count(./@*)=4 and count(./@type)=1 and count(./@place)=1 and count(./@corresp)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" id="{./@xml:id}" style="text-align:{substring-after(./@place, $sepPlace)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <!--<xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2">-->
        <xsl:if test="./@corresp=$docAuthType">
            <xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2 or (count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=1 and count(./following-sibling::tei:fw[./@corresp=$docAuthType])=0)">
                <hr xmlns="http://www.w3.org/1999/xhtml"/>
            </xsl:if>
        </xsl:if>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type and @xml:id-->
    <xsl:template match="//tei:fw[count(./@*)=3 and count(./@type)=1 and count(./@place)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type}" id="{./@xml:id}" style="text-align:{substring-after(./@place, $sepPlace)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @place, @corresp and @rendition for colour-->
    <xsl:template match="//tei:fw[count(./@*)=4 and count(./@type)=1 and count(./@place)=1 and count(./@corresp)=1 and count(./@rendition)=1]">
        <xsl:choose>
            <xsl:when test="./@corresp=$classifStampType and count(./following-sibling::tei:fw[@corresp=$classifDateType])=1">
                <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" style="text-align:{substring-after(./@place, $sepPlace)}; color:{./@rendition}">
                    <xsl:apply-templates select="./child::node()"/>
                    <br xmlns="http://www.w3.org/1999/xhtml" />
                    <xsl:apply-templates select="./following-sibling::tei:fw[@corresp=$classifDateType]/child::node()"/>
                </span>
            </xsl:when>
            <xsl:when test="./@corresp=$classifDateType">
                <!-- Do nothing, already processed -->
            </xsl:when>
            <xsl:otherwise>
                <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" style="text-align:{substring-after(./@place, $sepPlace)}; color:{./@rendition}">
                    <xsl:apply-templates select="./child::node()"/>
                </span>
                <xsl:if test="count(./preceding-sibling::tei:fw[./@corresp=$docAuthType])=2">
                    <hr xmlns="http://www.w3.org/1999/xhtml"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
     
    <!-- Headings with @rendition for no decoration, level 1 -->
    <xsl:template match="//tei:head[(count(./@*)=1 and count(./@rendition)=1 and count(./ancestor::tei:div)=1)]">
        <xsl:if test="./@rendition=$noDecoType">
           <!-- <h1 xmlns="http://www.w3.org/1999/xhtml" style="text-decoration:none">-->
            <h1 xmlns="http://www.w3.org/1999/xhtml" class="{$subHeadClass}">
              <xsl:apply-templates select="./child::node()"/>
            </h1>  
        </xsl:if>
    </xsl:template>
    
    <!-- Headings with @rendition for no decoration, level 2 -->
    <xsl:template match="//tei:head[count(./@*)=1 and count(./@rendition)=1 and count(./ancestor::tei:div)=2]">
        <xsl:if test="./@rendition=$noDecoType">
            <!--<h2 xmlns="http://www.w3.org/1999/xhtml" style="text-decoration:none">-->
            <h2 xmlns="http://www.w3.org/1999/xhtml" class="{$subHeadClass}">
                <xsl:apply-templates select="./child::node()"/>
            </h2>  
        </xsl:if>
    </xsl:template>
    
    <!-- Headings with @rendition for no decoration, level 3 -->
    <xsl:template match="//tei:head[count(./@*)=1 and count(./@rendition)=1 and count(./ancestor::tei:div)=3]">
        <xsl:if test="./@rendition=$noDecoType">
             <!--<h3 xmlns="http://www.w3.org/1999/xhtml" style="text-decoration:none">-->
             <h3 xmlns="http://www.w3.org/1999/xhtml" class="{$subHeadClass}">
                 <xsl:apply-templates select="./child::node()"/>
             </h3>  
        </xsl:if>
    </xsl:template>
    
    <!-- Headings with @rendition for no decoration, level 4 -->
    <xsl:template match="//tei:head[count(./@*)=1 and count(./@rendition)=1 and count(./ancestor::tei:div)>=4]">
        <xsl:if test="./@rendition=$noDecoType">
           <!-- <h4 xmlns="http://www.w3.org/1999/xhtml" style="text-decoration:none">-->
            <h4 xmlns="http://www.w3.org/1999/xhtml" class="{$subHeadClass}">
                <xsl:apply-templates select="./child::node()"/>
            </h4>
        </xsl:if>
    </xsl:template>
    
    <!-- 'Said' element with @ana, @corresp and no 'p' descendants -->
   <xsl:template match="//tei:said[count(./descendant::tei:p)=0 and count(./@*)=2 and count(./@ana)=1 and count(./@corresp)=1]">
          <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@ana)}{$sepAtt}{substring-after(./@ana,$refTag)} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}">
              <xsl:apply-templates select="./child::node()"/>
          </span>
    </xsl:template>
      
    <!-- 'Said' element with @direct, @ana, @corresp and no 'p' descendants -->
    <xsl:template match="//tei:said[count(./descendant::tei:p)=0 and count(./@*)=3 and count(./@direct)=1 and count(./@ana)=1 and count(./@corresp)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@direct)}{$sepAtt}{./@direct} {name(./@ana)}{$sepAtt}{substring-after(./@ana,$refTag)} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>  
    
    <!-- Paragraphs not enclosed in a 'said' element and containing a @rend attribute -->
    <xsl:template match="//tei:p[count(./ancestor::tei:said)=0 and count(./@*)=1 and count(./@rend)=1]">
        <p xmlns="http://www.w3.org/1999/xhtml" class="{./@rend}">
            <xsl:apply-templates select="./child::node()"/>
        </p>
    </xsl:template>
    
    <!-- Paragraphs not enclosed in a 'said' element and containing a @corresp attribute -->
    <xsl:template match="//tei:p[count(./ancestor::tei:said)=0 and count(./@*)=1 and count(./@corresp)=1]">
        <p xmlns="http://www.w3.org/1999/xhtml" class="{name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}">
            <xsl:apply-templates select="./child::node()"/>
        </p>
    </xsl:template>
    
    <!-- Paragraphs not enclosed in a 'said' element and containing a @corresp and @rendition attribute -->
    <xsl:template match="//tei:p[count(./ancestor::tei:said)=0 and count(./@*)=2 and count(./@corresp)=1 and count(./@rendition)=1]">
        <xsl:choose>
            <xsl:when test="./@corresp=$classifStampType and count(./preceding-sibling::tei:p[./@corresp=$classifStampType])=0 and count(./following-sibling::tei:p[./@corresp=$classifStampType])=1">
                <p xmlns="http://www.w3.org/1999/xhtml" class="{name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" style="color:{./@rendition}">
                    <xsl:apply-templates select="./child::node()"/>
                    <br xmlns="http://www.w3.org/1999/xhtml" />
                    <xsl:apply-templates select="./following-sibling::tei:p[./@corresp=$classifStampType]/child::node()"/>
                </p>
            </xsl:when>
            <xsl:when test="./@corresp=$classifStampType and count(./preceding-sibling::tei:p[./@corresp=$classifStampType])>0">
                <!-- Do nothing, already processed -->
            </xsl:when>
            <xsl:otherwise>
                <p xmlns="http://www.w3.org/1999/xhtml" class="{name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" style="color:{./@rendition}">
                    <xsl:apply-templates select="./child::node()"/>
                </p>
            </xsl:otherwise>    
        </xsl:choose>
    </xsl:template>
    
    <!-- 'Said' element with @direct, @ana, @corresp, @who and no 'p' descendants -->
    <xsl:template match="//tei:said[count(./descendant::tei:p)=0 and count(./@*)=4 and count(./@direct)=1 and count(./@ana)=1 and count(./@corresp)=1 and count(./@who)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@direct)}{$sepAtt}{./@direct} {name(./@ana)}{$sepAtt}{substring-after(./@ana,$refTag)} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)} {name(./@who)}{$sepAtt}{substring-after(./@who,$refTag)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Paragraph 'p' with @ana, @corresp and 'said' ancestor -->
    <xsl:template match="//tei:p[count(./@*) = 0 and count(./ancestor::tei:said)>0 and count(./ancestor::tei:said[1]/@*)=2 and count(./ancestor::tei:said[1]/@ana)=1 and count(./ancestor::tei:said[1]/@corresp)=1]">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <span xmlns="http://www.w3.org/1999/xhtml" class="{name(./ancestor::tei:said[1])} {name(./ancestor::tei:said[1]/@ana)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@ana,$refTag)} {name(./ancestor::tei:said[1]/@corresp)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@corresp,$refTag)}">
                <xsl:apply-templates select="./child::node()"/>
            </span>
        </p>
    </xsl:template> 
    
    <!-- Paragraph 'p' with @direct, @ana, @corresp and 'said' ancestor -->
    <xsl:template match="//tei:p[count(./@*) = 0 and count(./ancestor::tei:said)>0 and count(./ancestor::tei:said[1]/@*)=3 and count(./ancestor::tei:said[1]/@direct)=1 and count(./ancestor::tei:said[1]/@ana)=1 and count(./ancestor::tei:said[1]/@corresp)=1]">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <span xmlns="http://www.w3.org/1999/xhtml" class="{name(./ancestor::tei:said[1])} {name(./ancestor::tei:said[1]/@direct)}{$sepAtt}{./ancestor::tei:said[1]/@direct} {name(./ancestor::tei:said[1]/@ana)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@ana,$refTag)} {name(./ancestor::tei:said[1]/@corresp)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@corresp,$refTag)}">
                <xsl:apply-templates select="./child::node()"/>
            </span>
        </p>
    </xsl:template>
    
    <!-- Paragraph 'p' with @direct, @ana, @corresp, @who and 'said' ancestor -->
    <xsl:template match="//tei:p[count(./@*) = 0 and count(./ancestor::tei:said)>0 and count(./ancestor::tei:said[1]/@*)=4 and count(./ancestor::tei:said[1]/@direct)=1 and count(./ancestor::tei:said[1]/@ana)=1 and count(./ancestor::tei:said[1]/@corresp)=1 and count(./ancestor::tei:said[1]/@who)=1]">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <span xmlns="http://www.w3.org/1999/xhtml" class="{name(./ancestor::tei:said[1])} {name(./ancestor::tei:said[1]/@direct)}{$sepAtt}{./ancestor::tei:said[1]/@direct} {name(./ancestor::tei:said[1]/@ana)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@ana,$refTag)} {name(./ancestor::tei:said[1]/@corresp)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@corresp,$refTag)} {name(./ancestor::tei:said[1]/@who)}{$sepAtt}{substring-after(./ancestor::tei:said[1]/@who,$refTag)}">
                <xsl:apply-templates select="./child::node()"/>
            </span>
        </p>
    </xsl:template>
    
    <!-- Note with @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=1 and count(./@xml:id)=1]">
       <!-- <xsl:if test="count(./preceding-sibling::tei:note)=0 and count(./parent::tei:fw/preceding-sibling::tei:fw[./@type=$footerType])=0">-->
        
    <!--    <xsl:if test="count(./parent::tei:fw/preceding-sibling::tei:fw[./@type=$footerType])=0">-->
           <!-- <hr xmlns="http://www.w3.org/1999/xhtml"/>-->
       <!-- </xsl:if>-->
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @type and @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=2 and count(./@type)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@type)}{$sepAtt}{./@type}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @corresp -->
    <xsl:template match="//tei:note[count(./@*)=1 and count(./@corresp)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@corresp)}{$sepAtt}{./@corresp}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @cert and @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=2 and count(./@cert)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@cert)}{$sepAtt}{./@cert}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Line break with @rendition and @break. See https://css-tricks.com/almanac/properties/h/hyphenate/. 
        A CSS should be applied (soft hyphen &#173; hard hyphen &#8208;)-->
    <xsl:template match="//tei:lb[count(./@*)=2 and count(./@rendition)=1 and count(./@break)=1]">
        <xsl:if test="./@rendition=$hyphenBeforeType and ./@break=$breakNoType">
            <!--<xsl:text disable-output-escaping="yes">&#45;</xsl:text>-->
            <span xmlns="http://www.w3.org/1999/xhtml" class="{$hyphenClass}">-</span>
            <br xmlns="http://www.w3.org/1999/xhtml" class="{$breakNoClass}" />
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>