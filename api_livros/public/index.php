<?php

// configuracoes de erro
error_reporting(E_ALL);
ini_set('display_erros', 1);

// cabecalho para o JSON
header('Content-Type: application/json; charset=utf-8');

// recuperar URL, limpa a URL, e prepara para rota configuracao de rota
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

?>
