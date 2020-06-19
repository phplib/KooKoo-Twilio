<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes" />
  <xsl:template match="/">
      <response>
        <xsl:apply-templates />
      </response>
  </xsl:template>

  <xsl:template match ="Say">
      <playtext>
        <xsl:apply-templates />
      </playtext>
  </xsl:template>

  <xsl:template match ="Play">
    <playaudio>
      <xsl:apply-templates />
    </playaudio>
  </xsl:template>

  <xsl:template match ="Redirect">
    <gotourl>
      <xsl:apply-templates />
    </gotourl>
  </xsl:template>

  <xsl:template match ="Record"><xsl:element name="record" use-attribute-sets="recordAttrs">
    <xsl:apply-templates />
      </xsl:element>
  </xsl:template>

  <xsl:attribute-set name="recordAttrs">
    <xsl:attribute name="format">
      <xsl:value-of select="wav"/>
    </xsl:attribute>
    <xsl:attribute name="silence">
      <xsl:value-of select="@timeout"/>
    </xsl:attribute>
    <xsl:attribute name="maxduration">
      <xsl:value-of select="@maxLength"/>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match ="Gather"><xsl:element name="collectdtmf" use-attribute-sets="gatherAttrs">
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:attribute-set name="gatherAttrs">
    <xsl:attribute name="o">
      <xsl:value-of select="@timeout"/>
    </xsl:attribute>
    <xsl:attribute name="t">
      <xsl:value-of select="@finishOnKey"/>
    </xsl:attribute>
    <xsl:attribute name="l">
      <xsl:value-of select="@numDigits"/>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match ="Dial">
    <dial>
      <xsl:apply-templates />
    </dial>
  </xsl:template>

  <xsl:template match ="Hangup">
    <hangup>
    <xsl:apply-templates />
    </hangup>
  </xsl:template>

</xsl:stylesheet>
