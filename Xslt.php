<?php
//Author @anoop kumar
class Xslt {

	private $xml;
	private $xsl;
	private $proc;

	public function __construct() {
		// Create Dom
		$this->xml = new DOMDocument;
		$this->xsl = new DOMDocument;
		// Configure the transformer
		$this->proc = new XSLTProcessor;

	}

	public function ttok($data)
	{
		// Load XML file
		$this->xml->load($data);//you can directly load the xml url also
		// Load XSL file
		$this->xsl->load('t2k.xsl');
		// Attach the xsl rules
		$this->proc->importStyleSheet($this->xsl);
		return $this->proc->transformToXML($this->xml);

	}

}

?>
