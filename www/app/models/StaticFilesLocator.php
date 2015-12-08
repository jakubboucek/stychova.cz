<?php

namespace App;

class staticFilesLocator {
	private $wwwDir;

	public function __construct( $wwwDir ) {
		$this->wwwDir = $wwwDir;
	}

	public function locate($name) {
		return $this->wwwDir . $name;
	}
}