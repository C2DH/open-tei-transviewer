<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 17, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Transform most common structure and content: divisions, paragraphs, line breaks, tables, etc. Specific cases (particular elements, attributes) should be treated in project specific stylesheets.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Divisions with no attributes -->
    <xsl:template match="//tei:body//tei:div[count(./@*)=0]">
        <div xmlns="http://www.w3.org/1999/xhtml" class="transcript">
            <xsl:apply-templates select="./child::node()"/>
        </div>
    </xsl:template>
    
    <!-- Headings with no attributes, level 1 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)=1]">
        <h1 xmlns="http://www.w3.org/1999/xhtml">
          <xsl:apply-templates select="./child::node()"/>
        </h1>  
    </xsl:template>
    
    <!-- Headings with no attributes, level 2 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)=2]">
        <h2 xmlns="http://www.w3.org/1999/xhtml">
           <xsl:apply-templates select="./child::node()"/>
        </h2>  
    </xsl:template>
    
    <!-- Headings with no attributes, level 3 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)=3]">
        <h3 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h3>  
    </xsl:template>
    
    <!-- Headings with no attributes, level = 4 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)=4]">
        <h4 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h4>  
    </xsl:template>
    
    <!-- Headings with no attributes, level = 5 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)=5]">
        <h5 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h5>  
    </xsl:template>
    
    <!-- Headings with no attributes, level >= 6 -->
    <xsl:template match="//tei:head[count(./@*)=0 and count(./ancestor::tei:div)>=6]">
        <h6 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </h6>  
    </xsl:template>
    
    <!-- Paragraphs with no attributes -->
    <xsl:template match="//tei:p[count(./@*)=0]">
         <p xmlns="http://www.w3.org/1999/xhtml">
              <xsl:apply-templates select="./child::node()"/>
         </p>
    </xsl:template>
    
    <!-- Entity names with no attributes -->
    <xsl:template match="//tei:name[count(./@*)=0]">
       <!-- <xsl:template match="//tei:name[count(./@*)=0 and not(contains(./descendant-or-self::text(),'('))]">-->
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Entity names with @type only -->
    <xsl:template match="//tei:name[count(./@*)=1 and count(./@type)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@type)}{$sepAtt}{./@type}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Date with no attributes. In HTML5 this can correspond to the element 'time'. But it is not available in HTML 4.-->
    <xsl:template match="//tei:date[count(./@*)=0]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Date with @when only. In HTML5 this can correspond to the element 'time' + attribute 'datetime'. But they are not available in HTML 4. -->
    <xsl:template match="//tei:date[count(./@*)=1 and count(./@when)=1]">
       <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@when)}{$sepAtt}{./@when}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Word ('w') with no attributes -->
    <xsl:template match="//tei:w[count(./@*)=0]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Line break with no attributes -->
    <xsl:template match="//tei:lb[count(./@*)=0]">
        <xsl:choose>
            <xsl:when test="count(./following-sibling::*[1][name(.)='fw'])=1">
               <!-- <br xmlns="http://www.w3.org/1999/xhtml" /> -->
                <xsl:call-template name="br"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- <br xmlns="http://www.w3.org/1999/xhtml" class="{$lbDelClass}" /> -->
                <xsl:call-template name="brWithClass">
                    <xsl:with-param name="class" select="$lbDelClass"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- 'br' with no parameters -->
    <xsl:template name="br">
        <xsl:choose>
            <xsl:when test="$toHTML=true()">
                <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <br xmlns="http://www.w3.org/1999/xhtml" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
   <!-- 'br' with parameter 'class' -->
    <xsl:template name="brWithClass">
        <xsl:param name="class"/>
        <xsl:choose>
            <xsl:when test="$toHTML=true()">
                <xsl:text disable-output-escaping="yes">&lt;br class="</xsl:text><xsl:value-of select="$class"/><xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <br xmlns="http://www.w3.org/1999/xhtml" class="{$class}" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- 'br' with parameters 'class' and 'id' -->
    <xsl:template name="brWithClassAndId">
        <xsl:param name="class"/>
        <xsl:param name="id"/>
        <xsl:variable name="idNumber"><xsl:number level="any"/></xsl:variable>
        <xsl:variable name="idPage">
            <xsl:value-of select="concat($id,$idNumber)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$toHTML=true()">
                <xsl:text disable-output-escaping="yes">&lt;br class="</xsl:text><xsl:value-of select="$class"/><xsl:text disable-output-escaping="yes">" id="</xsl:text><xsl:value-of select="$idPage"/><xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <br xmlns="http://www.w3.org/1999/xhtml" class="$class" id="$idPage" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Table with no attributes -->
    <xsl:template match="//tei:table[count(./@*)=0]">
        <table xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </table>
    </xsl:template>
    
    <!-- Table with @rules (attribute with value 'rules' added by OxGarage during conversion) -->
    <xsl:template match="//tei:table[count(./@*)=1 and ./@rend='rules']">
        <table xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </table>
    </xsl:template>
    
    <!-- Row with no attributes -->
    <xsl:template match="//tei:row[count(./@*)=0]">
        <tr xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </tr>
    </xsl:template>
    
    <!-- Cell with no attributes -->
    <xsl:template match="//tei:cell[count(./@*)=0]">
        <td xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </td>
    </xsl:template>
    
    <!-- Cell with attributes @colspan or @rowspan or both -->
    <xsl:template match="//tei:cell[count(./@*)=1 and count(./@cols)=1]">
        <td xmlns="http://www.w3.org/1999/xhtml" colspan="{./@cols}">
            <xsl:apply-templates select="./child::node()"/>
        </td>
    </xsl:template>
    
    <!-- Cell with attributes @colspan or @rowspan or both -->
    <xsl:template match="//tei:cell[count(./@*)=1 and count(./@rows)=1]">
        <td xmlns="http://www.w3.org/1999/xhtml" rowspan="{./@rows}">
            <xsl:apply-templates select="./child::node()"/>
        </td>
    </xsl:template>
    
    <!-- Cell with attributes @colspan or @rowspan or both -->
    <xsl:template match="//tei:cell[count(./@*)=1 and count(./@cols)=1 and count(./@rows)=1]">
        <td xmlns="http://www.w3.org/1999/xhtml" rowspan="{./@rows}">
            <xsl:apply-templates select="./child::node()"/>
        </td>
    </xsl:template>
    
    <!-- Note with no attributes -->
    <xsl:template match="//tei:note[count(./@*)=0]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Highlight with @rend: bold -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='bold']">
        <span xmlns="http://www.w3.org/1999/xhtml" style="font-weight:bold">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Highlight with @rend: italic -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='italic']">
        <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Highlight with @rend: strikethrough -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='strikethrough']">
        <span xmlns="http://www.w3.org/1999/xhtml" style="text-decoration: line-through">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Highlight with @rend: subscript -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='subscript']">
        <sub xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </sub>
    </xsl:template>
    
    <!-- Highlight with @rend: superscript -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='superscript']">
        <sup xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </sup>
    </xsl:template>

    <!-- Highlight with @rend: underline -->
    <xsl:template match="//tei:hi[count(./@*)=1 and ./@rend='underline']">
        <span xmlns="http://www.w3.org/1999/xhtml" style="text-decoration:underline">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Reference with @target -->
    <xsl:template match="//tei:ref[count(./@*)=1 and count(./@target)=1]">
        <a xmlns="http://www.w3.org/1999/xhtml" href="{./@target}">
            <xsl:apply-templates select="./child::node()"/>
        </a>
    </xsl:template>
    
    <!-- Reference with @target and @type -->
    <xsl:template match="//tei:ref[count(./@*)=2 and count(./@type)=1 and count(./@target)=1]">
        <a xmlns="http://www.w3.org/1999/xhtml" class="{./@type}" href="{./@target}">
            <xsl:apply-templates select="./child::node()"/>
        </a>
    </xsl:template>
    
    <!-- Reference with @type, @target and @xml:id -->
    <xsl:template match="//tei:ref[count(./@*)=3 and count(./@type)=1 and count(./@target)=1 and count(./@xml:id)=1]">
        <a xmlns="http://www.w3.org/1999/xhtml" class="{./@type}" href="{./@target}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </a>
    </xsl:template>
    
    <!-- Unordered list -->
    <xsl:template match="//tei:list[count(./@*)=0 or (count(./@*)=1 and ./@type='unordered')]">
        <ul xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </ul>
    </xsl:template>
    
    <!-- Ordered list -->
    <xsl:template match="//tei:list[count(./@*)=1 and ./@type='ordered']">
        <ol xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </ol>
    </xsl:template>
    
    <!-- List items -->
    <xsl:template match="//tei:item">
        <li xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="./child::node()"/>
        </li>
    </xsl:template>
    
    <!-- Page break -->
    <xsl:template match="tei:pb">
        <xsl:call-template name="brWithClassAndId">
            <xsl:with-param name="class" select="$changePageClass"/>
            <xsl:with-param name="id" select="$pageIdPrefix"/>
        </xsl:call-template>
        <!--<br xmlns="http://www.w3.org/1999/xhtml" class="change_page">
            <xsl:attribute name="id">page_<xsl:number level="any"/></xsl:attribute>
        </br> -->
    </xsl:template>
    
    <!-- Text content-->
    <xsl:template match="text()">
        <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>