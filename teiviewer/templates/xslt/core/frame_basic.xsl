<?xml version="1.0" encoding="UTF-8"?>

    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" version="2.0">
        <xd:doc scope="stylesheet">
            <xd:desc>
                <xd:p>
                    <xd:b>Created on:</xd:b> Jul 23, 2015</xd:p>
                <xd:p>
                    <xd:b>Author:</xd:b> Chiara Alzetta</xd:p>
                <xd:p>Creating a basic structure for the frame. </xd:p>
            </xd:desc>
        </xd:doc>

        <!--  <xsl:output method="xhtml" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>-->

        <!--<xsl:strip-space elements="*"/>-->
        <!--<xsl:output indent="yes"/>-->

        <xsl:param name="empty" select="''" />

        <xsl:template name="htmlBody">
            <xsl:apply-templates select="//tei:body" />
        </xsl:template>

        <xsl:template match="//tei:body">
            <!--<body xmlns="http://www.w3.org/1999/xhtml">-->
            <div xmlns="http://www.w3.org/1999/xhtml" id="global_wrapper">
                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">TEI TransViewer</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav">
                            <li class="root">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Versions d'affichage <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" id="pdf_src">PDF<i class="fa fa-file-pdf-o f-right"></i></a></li>
                                    <li><a href="#" id="img_only">Scans<i class="fa fa-file-image-o f-right"></i></a></li>
                                    <li><a href="#" id="text_img">Text-Scans<span class="f-right" style="margin-right:-7px;"><i class="fa fa-file-text-o"></i>|<i class="fa fa-file-image-o"></i></span></a></li>
                                    <li><a href="#" id="text_only">Text<i class="fa fa-file-text-o f-right"></i></a></li>
                                    <li><a href="#" id="xml_code">XML<i class="fa fa-file-excel-o f-right"></i></a></li>
                                </ul>
                            </li>

                            <li class="root">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Type de transcription <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="lin_transcr"><i class="fa fa-align-justify"></i> Linear</a></li>
                                    <li><a href="#" class="dipl_transcr"><i class="fa fa-align-left"></i> Diplomatic</a></li>
                                    <li class="dropdown-submenu"><a href="#"><i class="fa fa-search"></i> Interpretative</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-submenu"> <a href="#">Names</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#" class="name_pers">People</a></li>
                                                    <li><a href="#" class="name_place">Places</a></li>
                                                    <li><a href="#" class="name_org">Organisations</a></li>
                                                    <li><a href="#" class="name_func">Functions</a></li>
                                                    <li><a href="#" class="name_event">Events</a></li>
                                                    <li><a href="#" class="name_prod">Products</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Dates</a>
                                            </li>
                                            <li><a href="#">Discours</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
                <div xmlns="http://www.w3.org/1999/xhtml" id="central_wrapper" class="text_img">

                    <!-- <div xmlns="http://www.w3.org/1999/xhtml" id="content_block"> -->

                    <!-- Not build in the Book Reader version -->
                    <!--<div xmlns="http://www.w3.org/1999/xhtml" id="arrowPrev">
                            <button xmlns="http://www.w3.org/1999/xhtml" type="button" class="arr">pr</button>
                        </div>-->
                    <!--<div xmlns="http://www.w3.org/1999/xhtml" id="imgzoom">
                            <div xmlns="http://www.w3.org/1999/xhtml" id="img">
                                <xsl:apply-templates select="//tei:facsimile"></xsl:apply-templates> 
                            </div>
                            <xsl:call-template name="zoom"></xsl:call-template>
                        </div>-->
                    <!--<div xmlns="http://www.w3.org/1999/xhtml" id="arrowNext">
                            <button xmlns="http://www.w3.org/1999/xhtml" type="button" class="arr">nx</button>
                        </div>-->

                    <div xmlns="http://www.w3.org/1999/xhtml" id="BookReader">
                        <xsl:value-of select="$empty" />
                    </div>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="text">
                        <div xmlns="http://www.w3.org/1999/xhtml" id="text_padding">
                            <xsl:apply-templates select="./child::node()" />
                        </div>
                    </div>

                    <div xmlns="http://www.w3.org/1999/xhtml" id="footer" class="hidden">
                        <span xmlns="http://www.w3.org/1999/xhtml" id="img_features">
                            <span xmlns="http://www.w3.org/1999/xhtml" id="select_page">
                                <select xmlns="http://www.w3.org/1999/xhtml" id="pages">
                                    <xsl:apply-templates select="//tei:facsimile//tei:graphic"/>
                                </select>
                            </span>
                        <!--<span xmlns="http://www.w3.org/1999/xhtml" id="img_magnifier">Magnifier</span>
                        <span xmlns="http://www.w3.org/1999/xhtml" id="feature">Hot spot/Text Link -for future development-</span>-->
                        </span>

                        <!-- Changed by FAR -->
                        <!--  <div xmlns="http://www.w3.org/1999/xhtml" id="text_features">
                            <div xmlns="http://www.w3.org/1999/xhtml" id="transcr_view">
                                <span id="transcr_type">Transcription type ^</span>
                                <ul id="transcr_button" class="hidden">
                                    <li><p class="lin_transcr">Linear</p></li>
                                    <li><p class="dipl_transcr">Diplomatic</p></li>
                                    <li><p class="interp_transcr">Interpretative</p>
                                        <ul id="interp_button" class="hidden">
                                            <li><p class="namesButton">Select names</p></li>
                                            <li><p class="datesButton">Select dates</p></li>
                                            <li><p class="saidButton">Select discourse</p></li>
                                            <li><ul id="sub_name" class="hidden">
                                                <li><p class="name_pers">People</p></li>
                                                <li><p class="name_place">Places</p></li>
                                                <li><p class="name_org">Organisations</p></li>
                                                <li><p class="name_func">Functions</p></li>
                                                <li><p class="name_event">Events</p></li>
                                                <li><p class="name_prod">Products</p></li>
                                            </ul></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div> -->



                        <!--    <ul id="text_features" class="footer-menu">
                            <li>
                                <a href="#">Transcription type</a>
                                <ul>
                                    <li><a href="#">Linear</a></li>
                                    <li><a href="#">Diplomatic</a></li>
                                    <li><a href="#">Interpretative</a>
                                        <li>
                                            <a href="#">Transcription type</a>
                                            <ul>
                                                <li>
                                                    <a href="#">Select names</a>
                                                    <li><a href="#">People</a></li>
                                                    <li><a href="#">Places</a></li>
                                                    <li><a href="#">Organisations</a></li>
                                                    <li><a href="#">Functions</a>
                                                    <li><a href="#">Events</a>
                                                    <li><a href="#">Products</a>
                                                </li>
                                                <li><a href="#">Select dates</a></li>
                                                <li><a href="#">Select discourse</a></li>
                                            </ul>
                                        </li>
                                    </li>
                                </ul>
                            </li>

                        </ul> -->
                    </div>

                </div>
            </div>
        </xsl:template>

    </xsl:stylesheet>