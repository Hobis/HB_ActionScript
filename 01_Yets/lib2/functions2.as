/* ######################################################
	@ name :: ���ֻ��Ǵ� �Լ� ����
	@ author : jungheebum
	@ date : 070509
##################################################### */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////	����, ����, �迭 ����
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ������� �������� ��ȯ
	@ params :: {}
	@ use :: {
	}
++++++++++++++++++++++++++++++++++++++++++++++*/
function hb_getMinusPlus():Number {
	var t_ran:Number = random(2);
	return (t_ran == 0) ? -1 : t_ran;
}



/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ���ߺ� �����迭 ����
	@ params :: {
		num : ���� ���� (0����)
	}
	@ use :: {
		// �׽�Ʈ�غ��
		trace(hb_createNumberOfSix(50));
	}
++++++++++++++++++++++++++++++++++++++++++++++*/
function hb_createNumberOfSix(num:Number):Array {
	// code assistanced by ecj2000@hanmir.com
	var temp:Array = [];
	var returnArray:Array = [];
	var rand:Number = random(temp.length);
	for(var i:Number=0;i<num;i++) {
		temp.push(i);
	}
	for(i=0;i<num;i++) {
		rand = random(temp.length);
		returnArray.push(temp[rand]);
		temp.splice(rand, 1);
	}
	return returnArray;
}



/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: Ư���������� Ȯ���� index �迭 ����
	@ params :: {
		num : ���� ���� (0����)
		ran : Ȯ�� ����
	}
	@ use :: {
	}
++++++++++++++++++++++++++++++++++++++++++++++*/
function hb_stepWiseRandomArray(num:Number, ran:Number):Array {
	var ramdomArr:Array = [];
	var a:Number = 0;
	while(a<num) {
		// Ȯ���� �� �ֱ�
		if(random(ran) == 0) {
			ramdomArr.push(a);
		}
		a++;
	}
	return ramdomArr;
}



/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ���ڰ� ���ų� �������� �� ������ ���
	@ params :: {
	}
	@ use :: {
	}
++++++++++++++++++++++++++++++++++++++++++++++*/
function hb_isNull(v:String):Boolean {
	if(v == null || v == '' || v.split(' ').join('').length < 1) {
		return true;
	} else {
		return false;
	}
}



/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ���� ���ڷ� ��ȯ
	@ params :: {

	}
	@ use :: {
		var ARGB:Number = 0xFF99CC66;
		trace(hb_hexToString(ARGB)); // yay, traces "ff99cc66"
	}
++++++++++++++++++++++++++++++++++++++++++++++*/
function hb_hexToString(p_hex:Number):String {
	// Code By Grant Skinner
	// http://www.gskinner.com/
	// this should be all one line:
	return (((p_hex>>24) != 0) ? Number(p_hex>>>24).toString(16):"") +
		Number(p_hex&0xFFFFFF).toString(16);
}



/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Shuffling Array2
	@ params :: {
	}
	@ use :: {

		var t_arr:Array = [0, 1, 2, 3, 4, 5];

		this.onMouseUp = function()
		{
			hb_shuffleArray2(t_arr);
			trace(t_arr);
		};

	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_shuffleArray2(ao:Array):Void {
	var t_func:Function = function():Number
	{
		var tn:Number = Math.floor(Math.random()*3)-1;
		return tn;
	};

	ao.sort(t_func);
	ao.sort(t_func);
	ao.sort(t_func);
	ao.sort(t_func);
}



/*+++++++++++++++++++++++++++++++++++++++
	@ name :: ������ ���� ������ �� ���ϱ�
	@ params :: {
	}
	@ use :: {
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_getLastDayOld(day:Date):Date {

	var dd:uint = 31;

	var yyyy:uint = day.getFullYear();
	var mm:uint = day.getMonth() + 1;

	switch(mm) {

		case 4 :
		case 6 :
		case 9 :
		case 11 :
			dd = 30;
			break;

		case 2 :
			if ((yyyy % 4) == 0 || (yyyy % 100) == 0) {
				dd = 29;
			} else {
				dd = 28;
			}
			break;

	}

	var lastDay:Date = new Date(yyyy, (mm-1), dd);
	return lastDay;


}
function hb_getLastDay(day:Date):Date {
	var lastDay:Date = new Date(day);
	lastDay.setMonth(lastDay.getMonth() + 1, 0);
	return lastDay;

}

/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �� �簢���� �������ΰ� ����
	@ params :: {
	}
	@ use ::
	{
		var r1_rect:Object =
		{
			left: r1._x,
			right: r1._x + r1._width,
			up: r1._y,
			down: r1._y + r1._height,
			width: r1._width,
			height: r1._height
		};

		var r2_rect:Object =
		{
			left: r2._x,
			right: r2._x + r2._width,
			up: r2._y,
			down: r2._y + r2._height,
			width: r2._width,
			height: r2._height
		};

		trace(this.p_getRectIsCrossing(r1_rect, r2_rect));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_getRectIsCrossing(r1:Object, r2:Object):Boolean
{
	var t_rv:Boolean =
		(
			((r1.left > r2.left) && (r1.left < r2.right)) ||
			((r1.right > r2.left) && (r1.right < r2.right)) ||
			(
				(r1.width >= r2.width) &&
				((r1.left <= r2.left) && (r1.right >= r2.right))
			)
		) &&
		(
			((r1.up > r2.up) && (r1.up < r2.down)) ||
			((r1.down > r2.up) && (r1.down < r2.down)) ||
			(
				(r1.height >= r2.height) &&
				((r1.up <= r2.up) && (r1.down >= r2.down))
			)
		);
	return t_rv;
}