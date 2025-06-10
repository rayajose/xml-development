<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="delim">
        <xsl:text>&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="break">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>

    <!-- header row -->

    <xsl:template match="product">

        <xsl:variable name="purl" select="concat('http://www.babystuff.com/products/', handle)"/>

        <xsl:value-of select="concat('product-id', $delim)"/>
        <xsl:value-of select="concat('variant-id', $delim)"/>
        <xsl:value-of select="concat('title', $delim)"/>
        <xsl:value-of select="concat('brand', $delim)"/>
        <xsl:value-of select="concat('product-type', $delim)"/>
        <xsl:value-of select="concat('price', $delim)"/>
        <xsl:value-of select="concat('sku', $delim)"/>
        <xsl:value-of select="concat('barcode', $delim)"/>
        <xsl:value-of select="concat('weight', $delim)"/>
        <xsl:value-of select="concat('weight-unit', $delim)"/>
        <xsl:for-each select="options/option">
            <xsl:value-of select="concat(name, $delim)"/>
        </xsl:for-each>
        <xsl:value-of select="concat('product-url', $delim)"/>
        <xsl:value-of select="concat('image-url', $delim)"/>
        <xsl:value-of select="concat('alt-image-url', $delim)"/>
        <xsl:value-of select="concat('description', $break)"/>

        <xsl:for-each select="variants/variant">
            <!-- product-id -->
            <xsl:value-of select="concat(normalize-space(../../id), $delim)"/>

            <!-- variant-id -->
            <xsl:value-of select="concat(normalize-space(id), $delim)"/>

            <xsl:value-of select="concat(normalize-space(../../title), $delim)"/>

            <xsl:value-of select="concat(normalize-space(../../vendor), $delim)"/>

            <xsl:value-of select="concat(normalize-space(../../product-type), $delim)"/>

            <xsl:value-of select="concat(normalize-space(price), $delim)"/>

            <xsl:value-of select="concat(normalize-space(sku), $delim)"/>
            
            <xsl:value-of select="concat(normalize-space(barcode), $delim)"/>
            
            <xsl:value-of select="concat(normalize-space(weight), $delim)"/>
            
            <xsl:value-of select="concat(normalize-space(weight-unit), $delim)"/>
            
            <xsl:for-each select="*[starts-with(name(), 'option')]">
                <xsl:if test=".!=''">
                    <xsl:value-of select="concat(., $delim)"/>
                </xsl:if>             
            </xsl:for-each>

            <xsl:value-of select="concat(normalize-space($purl), $delim)"/>
            
            <xsl:for-each select="../../image">
                <xsl:value-of select="concat(normalize-space(src), $delim)"/>
            </xsl:for-each>
            
            <xsl:for-each select="../../images/image">
                <xsl:if test="position > 1">
                    <xsl:value-of select="normalize-space(src)"/>
                    <xsl:if test="position() != last()">
                        <xsl:value-of select="'|'"/>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:value-of select="$break"/>


        </xsl:for-each>

    </xsl:template>


</xsl:stylesheet>
