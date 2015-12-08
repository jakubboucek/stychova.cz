<?php

namespace App\Presenters;

use Nette;

class HomepagePresenter extends Nette\Application\UI\Presenter
{

	private $staticFilesLocator;

	public function injectStaticFilesLocator(\App\staticFilesLocator $staticFilesLocator)
	{
		$this->staticFilesLocator = $staticFilesLocator;
	}

	public function renderZivotopis() {
		$response = new \Nette\Application\Responses\FileResponse(
			$this->staticFilesLocator->locate('/files/zivotopis.pdf'),
			'Životopis - Lucie Štychová.pdf',
			'application/pdf',
			FALSE
		);

		$this->sendResponse($response);
	}
}
