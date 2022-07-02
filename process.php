<?php
// Author: Jalal Maqdisi (jalmaq01)
// I confirm that this coursework submission is entirely my own work, except where explicitly stated otherwise.
// start processing the form data

$year = ($_POST['yearProcessed'] == 'Contains' && $_POST['year']) ? $_POST['year'] : "";
$category = ($_POST['categoryProcessed'] == 'Contains' && $_POST['category']) ? $_POST['category'] : "";
$info = ($_POST['infoProcessed'] == 'Contains' && $_POST['info']) ? $_POST['info'] : "";
$nominee = ($_POST['nomineeProcessed'] == 'Contains' && $_POST['nominee']) ? $_POST['nominee'] : "";
$won = ($_POST['wonradio'])? $_POST['wonradio']: "";

$xsl = new DOMDocument;
$xsl->load('./oscarsStyle.xsl');

// Load the XML source
$xml = new DOMDocument;
$xml->load('./oscars.xml');

// Configure the transformer
$proc = new XSLTProcessor;
// Set parameters
$proc->setParameter('', 'year', $year);
$proc->setParameter('', 'category', $category);
$proc->setParameter('', 'info', $info);
$proc->setParameter('', 'nominee', $nominee);
$proc->setParameter('', 'won', $won);
// attach the xsl rules
$proc->importStyleSheet($xsl); 
$xsl = $proc->importStylesheet($xsl);
// Save to output file
$proc->transformToURI($xml, 'oscarsSearchResults.html');
// Redirect to result page
header('Location: oscarsSearchResults.html');
exit();

?>
