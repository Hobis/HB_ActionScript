/* ######################################################
	@ name :: ���ֻ��Ǵ� ���а��� �Լ�
	@ author : jungheebum
	@ date : 070908
##################################################### */


/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: �ޱ� -> ����
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getAToR(a:Number):Number {
	return a*(Math.PI/180);
}

/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ���� -> �ޱ�
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getRToA(r:Number):Number {
	return r*(180/Math.PI);
}

/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ȣ�� ����
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getArcL(r:Number, t:Number):Number {
	return r*t;
}

/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ȣ�� ����
		������������ ���� �ϴϱ�
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getArcS(r:Number, t:Number):Number {
	return (Math.pow(r, 2)/2)*t;
}