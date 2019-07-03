<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="base.xsl"/>
    
    <xsl:template match="tei:dimensions">
        <xsl:for-each select="tei:*">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() ne last()">
                <xsl:text>x</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="@unit"/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <mark>
            <xsl:apply-templates/>
        </mark>
    </xsl:template>
    
</xsl:stylesheet>