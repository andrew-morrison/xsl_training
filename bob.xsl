<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="base.xsl"/>
    
    <xsl:template match="dimensions">
        <xsl:for-each select="*">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() ne last()">
                <xsl:text>x</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="@unit"/>
    </xsl:template>
    
    <xsl:template match="hi">
        <mark>
            <xsl:apply-templates/>
        </mark>
    </xsl:template>
    
</xsl:stylesheet>