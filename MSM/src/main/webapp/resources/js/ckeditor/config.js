/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.filebrowserUploadUrl='/product/ckUpload';
	config.font_defaultLabel = '맑은 고딕'; // 기본 폰트 지정
    config.font_names =  '맑은 고딕; 돋움; 바탕; 돋음; 궁서;'; // 폰트 목록
    config.fontSize_defaultLabel = '11px'; // 기본 폰트 크기 지정
	config.enterMode =CKEDITOR.ENTER_BR;	
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};
