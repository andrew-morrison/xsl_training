<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="/"
    exclude-result-prefixes="xs local"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    div {
                        display:block;
                        border-left:1px #C0C0C0 solid;
                        padding-left:1em;
                        padding-bottom:1rem;
                    }
                    span {
                        display:inline-block;
                        border:1px #C0C0C0 solid;
                        padding:1px;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="*/*"/>
            </body>
        </html>
    </xsl:template>   
     
    <xsl:function name="local:isPara" as="xs:boolean">
        <xsl:param name="this" as="element()"/>
        <xsl:value-of select="not($this/text()) or $this/text()[string-length(normalize-space()) gt 0]"/>
    </xsl:function>
    
    <xsl:function name="local:listAttributes" as="xs:string*">
        <xsl:param name="this" as="element()"/>
        <xsl:for-each select="$this/@*[not(starts-with(name(.), 'xml:'))]">
            <xsl:value-of select="name()"/>
            <xsl:text>=</xsl:text>
            <xsl:value-of select="data()"/>
            <xsl:if test="position() ne last()">
                <xsl:text>; </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>
    
    <xsl:template match="*[child::* and not(local:isPara(.))]" priority="-50">
        <xsl:element name="h{  if(count(ancestor::*) lt 4) then count(ancestor::*) else 4 }">
            <xsl:attribute name="title" select="local:listAttributes(.)"/>
            <xsl:value-of select="name()"/>
        </xsl:element>
        <div style="margin-left:1rem;" class="{ local-name() }">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="*" priority="-100">
        <div class="{ local-name() }" style="border-left-width:0px;">
            <b>
                <xsl:attribute name="title" select="local:listAttributes(.)"/>
                <xsl:value-of select="name()"/>
                <xsl:text>: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="*[some $a in ancestor::* satisfies local:isPara($a)]" priority="-1">
        <span>
            <xsl:attribute name="title">
                <xsl:value-of select="name()"/>
                <xsl:if test="@*">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="local:listAttributes(.)"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>