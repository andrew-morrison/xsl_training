<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="base.xsl"/>
    
    <xsl:template match="physDesc">
        <h3>Physical Description</h3>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="textLang">
        <p>
            <b>Languages: </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="supplied">
        <xsl:text>⟨</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>⟩</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>