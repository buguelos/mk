<?php

namespace GitGis\Whatsapp\Model;

require_once(MAINDIR.'/vendor/WhatsAPI/src/php/whatsprot.class.php');
require_once(MAINDIR.'/vendor/WhatsAPI/src/php/vCard.php');

/**
 * Overrides standard WhatsProt class
 * 
 * Its purpose is to store debug info
 *
 */
class WhatsProt extends \WhatsProt {

    protected $debugBuf = '';

	/**
	 * Sent nodes are nodes of protocols which were sent
	 * 
	 * @var array
	 */
	protected $sentNodes = array();
	
	public function getSentNodes() {
		return $this->sentNodes;
	}
	
	public function sendNode($node) {
		parent::sendNode($node);
		$this->sentNodes[] = $node;
	}

    public function loginWithPassword($password, $profileSubscribe = false) {
        parent::loginWithPassword($password, $profileSubscribe);
    }

    protected function processInboundDataNode( \ProtocolNode $node ) {
        parent::processInboundDataNode($node);
    }

    protected function debugPrint($debugMsg) {
        if ($this->debug) {
            $this->debugBuf .= $debugMsg;
        }
    }

    public function cleanDebug() {
        $this->debugBuf = '';
    }

    public function getDebugBuf() {
        return $this->debugBuf;
    }


    protected function loadChallengeData()
    {
        $senderDao = new SenderDAO();
        $sender = $senderDao->fetchByUserName($this->phoneNumber);
        if (empty($sender)) return;

        $challengeData = $sender->getChallengeData();
        if (!empty($challengeData)) {
            $challengeData = base64_decode($sender->getChallengeData());
        }
        $this->challengeData = $challengeData;
    }

    protected function saveChallengeData($challengeData)
    {
        $senderDao = new SenderDAO();
        $sender = $senderDao->fetchByUserName($this->phoneNumber);
        if (empty($sender)) return;

        $sender->setChallengeData(base64_encode($challengeData));
        $senderDao->save($sender);
    }

}
