/* ######################################################
	@ name :: ���ֻ��Ǵ� �Լ� ����
	@ author : jungheebum
	@ date : 070509
##################################################### */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////	����, ����, �迭 ����
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ���ڿ����� Ư������ ġȯ�ϱ�
	@ params :: {}
	@ use :: {
		var targetStr:String = 'AABBCC';
		var replaceFrom:String = 'AA';
		var replaceTo:String = 'XX';

		trace(hb_stringReplace(targetStr, replaceFrom, replaceTo));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_stringReplace(targetStr:String, replaceFrom:String, replaceTo:String):String {
	return targetStr.split(replaceFrom).join(replaceTo);
}



/*++++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: XML�� CDATA�� �ִ� �ٹٲ� ���� ����� ǥ���ϱ�
	@ params :: {}
	@ use :: {
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_CDATAReturnReal(sp:String):String {
	return sp.split("\\n").join("\n");
}


/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ��Ʈ�� ��������
	@ params :: {}
	@ use :: {
		hb_notNoreWhite('������ ���� �� �� ��.');
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_notNoreWhite(sp:String):String {
	return sp.split(' ').join('');
}



/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ��Ʈ������ ������ ���� ��������
	@ params :: {}
	@ use :: {
		trace(hb_nameLastNumber('list100090dasdasd94', 4));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_nameLastNumber(str:String, lastIndex:Number):String {
	return str.substr(lastIndex, str.length-lastIndex);
}


/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: ��հ��
	@ params :: {
		tArr - ����� ���� ���� ���ڵ��� ������ �迭
	}
	@ use :: {
		// - ����, ����, ���� ������ ���� 98, 78, 35�϶� �� ������ ����� ���Ͽ���.
		trace(hb_getMean([98,78,35]));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getMean(tArr:Array):Number {
	var sum:Number = 0;;
	var tArrLen:Number = tArr.length;
	var i:Number = 0;
	while(i<tArrLen) {
		sum = sum+tArr[i];
		i++;
	}
	return sum/tArrLen;
}


/*++++++++++++++++++++++++++++++++++++++++++++++
	@ name :: �Ľ�Į �޺� Ư�����ڿ� �������� äũ�ϱ�
	@ params :: {
		n - ����� �Ǵ� ����
		r - ���յ� ����
	}
	@ use :: {
		trace(hb_pascalCombi(10, 2));
	}
	@ coments :: {
		trace(hb_pascalCombi(3, 2));
		��� �Ѵٶ��
		1, 2, 3������
		1�� 2
		2�� 3
		1�� 3
		�̷��� 3���� ���� ���ڸ� �����Ҽ� �ִ�.
		�̰��� �Ľ�Į ���ñ� ��� �ϴ���...
		�ڼ��� ���� ���а��θ� ���� ����
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_pascalCombi(n:Number, r:Number):Number {
   var p:Number = 1;
   for(var i:Number=1;i<=r;i++) {
      p = p*(n-i+1)/i;
   }

   return p;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭�� ������ �˻�
	@ params :: {}
	@ use :: {
		var p:Array = [0,1,2,3];
		var q:Array = [0,1,2,3];
		trace(hb_arrIsEqual(p, q));
		trace(hb_arrIsEqual([0,1,2,3], [0,1,2,3]));
		trace(hb_arrIsEqual([0,1,2,3], [0,1,2,5]));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_arrIsEqual(a:Array, b:Array):Boolean {
	if(a == b) return true;
	var i:Number = a.length;
	if(i != b.length) return false;
	while(i--) if(a[i] != b[i]) return false;
	return true;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭�� Ư�� �������� �Ӽ����� �����
	@ params :: {}
	@ use :: {
		var personArr:Array = ["Matthias", "Caroline", "Martin", "Ralf"];
		hb_arrToVar(personArr, this, 'personMembers');
		trace(this.personMembers_0);
		trace(this.personMembers_1);
		trace(this.personMembers_2);
		trace(this.personMembers_3);
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++ */
// Array in Variablen umwandeln
function hb_arrToVar(a:Array, scope:Object, varName:String):Void {
	if(!varName) return;
	var aLen:Number = a.length;
	for(var i:Number=0;i<aLen;i++) {
		scope[varName+"_"+i] = a[i];
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭 ��ü���� ��� ������ ����ϱ�
	@ params :: {}
	@ use :: {
		var myArray:Array = new Array(1,2,3);
		myArray["foo"] = "bar";
		myArray.oadns = function() {

		};
		trace(hb_arrToStringAll(myArray));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrToStringAll(a:Array):String {
	var tempArr:Array  = [];
	for(var i:String in a) {
		tempArr.push(a[i]);
	}
	return String(tempArr);
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭���� �ش��ε��� ���� ��ü
	@ params :: {}
	@ use :: {
		var a:Array = [0, 1, 2, 3, 4, 5];
		hb_arrExchange(a, 0, 5);
		hb_arrExchange(a, 1, 2);
		trace(a);
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrExchange(a:Array, i:Number, j:Number):Void {
  if(i != j) with(a[i]) {
    a[i] = a[j];
    a[j] = valueOf();
  }
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭 ������Ʈ �Ȱ����� ������
	@ params :: {}
	@ use :: {
		var a:Array = [{test:"val"}, 0, [10, 11, 12, [120, [1210, 1211], 122, {keyval:"true"}], 13], 2, 3, [40, 41, 42], 5];
		trace(a)
		hb_mda_reverse(a);
		trace(a)
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_mda_reverse(a:Array):Void {
	a.reverse ();
	for(var i:String in a) {
		if(typeof a[i] == "object")
			arguments.callee(a[i]);
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �������� ���� ǥ���ϱ�
	@ params :: {
		tn :: ����(��Ʈ��)
	}
	@ use :: {
		trace(hb_makeNumber('50000')+'��');
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_makeNumber(tn:String):String {
	var numStrLen:Number = tn.length;
	var tempS1:String = "";
	var tempS2:String = "";
	if(numStrLen<=3) return tn;
	for(i=numStrLen-1; i>=0; i--) {
		tempS1 += tn.charAt(i);
	}
	for(i=numStrLen-1; i>=0; i--) {
		tempS2 += tempS1.charAt(i);
		if(i%3 == 0 && i != 0) {
			tempS2 += ",";
		}
	}
	return tempS2;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �������� ���� ǥ���ϱ�
	@ params :: {
		num :: ����(��Ʈ��)
	}
	@ use :: {
		trace(hb_thousandNumberCut('1111100'));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_thousandNumberCut(num:String):String {
	num = String(num);
	var mStr:Number = num.length%3;
	var nStr:Number = Math.floor(num.length/3);
	var num_array:Array = new Array();
	num_array.push(num.substr(0,mStr));
	for(var i:Number=0; i<nStr; i++) {
		num_array.push(num.substr(mStr+(3*i),3));
	}
	if(mStr == 0) {
		num_array.shift();
	}
	return num_array.toString();
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: 1���ڸ� ���ڿ� 0���̱�
	@ params :: {
		num - number
	}
	@ use :: {

	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_make10Num(num:Number):String {
	var proc:String = String(num);
	return (proc.length == 1) ? "0"+proc : proc;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: To Number RGM Format
	@ params :: {
	}
	@ use :: {

	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_formatRGB(no:Number):String {
	var temp_str:String = no.toString(16);
	var hn:String = "000000";
	return (hn.substr(0, 6 - temp_str.length) + temp_str).toUpperCase();
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: MovieClip Get Last Number {
		����Ŭ������ �ش� ���� ������
	}
	@ params :: {
		tmc :: target mc
		num :: last number
	}
	@ use :: {
		hb_getLastNumber(symbol_0, 1);
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_getLastNumber(tmc:MovieClip, num:Number):String {
	return(tmc._name.substr(tmc._name.length-num));
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: String get bytes
	@ params :: {
	}
	@ use :: {
		trace(hb_getBytes('�ȳ��ϼ��� ������ �ݰ����ϴ�'));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_getBytes(str:String):Number {
	var totalCount:Number = 0;
	var strLen:Number = str.length;
	for(var i:Number=0;i<strLen;i++) {
		totalCount += escape(str.charAt(i)).length>4 ? 2 : 1;
	}
	return totalCount;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Shuffling Array
	@ params :: {
	}
	@ use :: {
		var tempArr:Array = [0,1,2,3,4,5,6,7,8,9];
		trace(tempArr);
		hb_shuffleArray(tempArr);
		trace(tempArr);
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_shuffleArray(ao:Array):Void {
	var aoLen:Number = ao.length;
	for(var i:Number=0;i<aoLen;i++){
		var tmp = ao[i];
		var randomNum = random(aoLen);
		ao[i] = ao[randomNum];
		ao[randomNum] = tmp;
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Make Plus Zero
	@ params :: {
	}
	@ use :: {
		trace(hb_plusZero(100, 10));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_plusZero(nv:Object, num:Number):String {
	var tempStr:String = String(nv);
	var strLen:Number = tempStr.length;
	var i:Number = 1;
	while(i<=(num-strLen)) {
		tempStr = "0"+tempStr;
		i++;
	}
	return tempStr;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Make Minus Zero
	@ params :: {
	}
	@ use :: {
		trace(hb_minusZero(hb_plusZero(100, 10)));
	}
+++++++++++++++++++++++++++++++++++++++ */
function hb_minusZero(v:Object):String {
	var tempStr:String = String(v);
	var strLen:Number = tempStr.length;
	var i:Number = 1;
	while(i<=strLen) {
		if(tempStr.charAt(0) == "0") {
			tempStr = tempStr.substring(1, strLen);
		} else break;
		i++;
	}
	if(i == "") tempStr = "0";
	return tempStr;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Array Combi Object Convertor
	@ params :: {
	}
	@ use :: {
		var myArr:Array = [
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver",
			"Inmingun", "Jung", "Hee", "Bum", "longtime", "Inmingun", "Jung", "Hee", "bum",
			"apple", "pineapple", "lion", "bus", "phone", "TV", "Room", "Water", "Movie",
			"Flash", "PhotoShop", "Dreamweaver", "AfterEffect", "Windows", "good", "naver"
		];
		var myObj:Object = arrayCombination(this, "myArr");
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrayCombination(tmc:MovieClip, objStr:String):Object {
	if(tmc[objStr] == undefined) {
		return null;
	}
    var nowNum:Number = 0;
	var myArrLen:Number = tmc[objStr].length;
	var myObj:Object = {};
    myObj[tmc[objStr][nowNum]] = 0;
    for(var i:Number=0;i<myArrLen;i++) {
        if(tmc[objStr][nowNum] == tmc[objStr][i]) {
            myObj[tmc[objStr][nowNum]]++;
        } else {
            nowNum = i;
            if(myObj[tmc[objStr][nowNum]] == undefined) {
                myObj[tmc[objStr][nowNum]] = 0;
            }
        myObj[tmc[objStr][nowNum]]++;
        }
    }
	return myObj;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Array Mix and Make Mix
	@ params :: {
	}
	@ use :: {
		var tempArr:Array = [0,1,2,3,4,5,6,7,8,9];
		trace(hb_arrayMix(null, null, tempArr));
		trace(hb_arrayMix(0, 100));
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrayMix(startNum:Number, endNum:Number, array:Array):Array {
	var chk_array:Array = new Array();
	if(!array) {
		// - ������ �������� ��� array�� ���� ���
		var temp_array:Array = new Array();
		for(var i:Number=startNum; i<endNum; i++) {
			temp_array.push(i);
		}
		chk_array = temp_array;
		var lengthNum:Number = chk_array.length;
	} else {
		chk_array = array;
		var lengthNum:Number = chk_array.length;
	}
	var return_array:Array = new Array();   // return array
	for(var i:Number=0;i<lengthNum;i++) {
		var index:Number = Math.floor(Math.random() * chk_array.length);
		return_array.push(chk_array[index]);
		chk_array.splice(index,1);
	}
	return return_array;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭 ������(�ߺ� ����)
	@ params :: {
	}
	@ use :: {
		var minArr:Array = [0,1,2,5,8,10,121,123,21,43];
		var maxArr:Array = [9,5,10,11,21,67];
		var resultArr:Array = hb_ArrUnion(minArr, maxArr);
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_ArrUnion(arr0:Array, arr1:Array):Array
{
	var rv:Array = null;

	var maxArr:Array = null;
	var minArr:Array = null;

	if(arr0.length > arr1.length)
	{
		maxArr = arr0;
		minArr = arr1;
	}
	else if(arr1.length > arr0.length)
	{
		maxArr = arr1;
		minArr = arr0;
	}

	var maxLen:uint = maxArr.length;
	var minLen:uint = minArr.length;

	var t_flag:Boolean = true;

	var t_arr:Array = [];

	for(var i:uint = 0; i < maxLen; i++)
	{
		for(var a:uint = 0; a < minLen; a++)
		{
			if(maxArr[i] == minArr[a])
			{
				t_flag = false;
				break;
			}
		}

		if(t_flag)
		{
			t_arr.push(maxArr[i]);
		}
		else
		{
			t_flag = true;
		}
	}


	rv = minArr.concat(t_arr);

	return rv;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: randRange Random
	@ params :: {
	}
	@ use :: {
		this.onEnterFrame = function() {
			var temp:Number = hb_randRange(0, 100);
			if(temp >= 100 || temp <= 0)
				trace(temp);
		};
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_randRange(min:Number,max:Number):Number {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: getCardNum {
		ī���ȣ �����
	}
	@ params :: {
	}
	@ use :: {
		trace(hb_getCardNum(('3333333333333333').toString()));
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_getCardNum(inputString:String):String{
	var returnString:String=inputString.substr(0,4)+"-****-****-"+inputString.substr(12,4);
	return returnString;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �ؽ�Ʈ �ʵ忡 ���ݸ�ŭ �ؽ�Ʈ �ֱ�
	@ params :: {
		to : TextField
		texts : String
		gan : pixel Number
	}
	@ use :: {
		hb_textCutting(tf, 'AAAAAAAAAAAAAAAAAAAAAAA', 60);
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_textCutting(to:Object, texts:String, gan:Number):Void {
	var i:Number, textsLen:Number = texts.length;
	var pushText:String = "";
	for(i=0;i<textsLen;i++) {
		pushText = pushText + texts.charAt(i);
		to.text = pushText;
		if(to.textWidth >= gan) {
			to.text += "...";
			break;
			return;
		}
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �ֹι�ȣ üũ
	@ params :: {}
	@ use :: {
		trace(hb_isJumin("760101","123456"));
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_isJumin(id0:String,id1:String):Boolean{
	var id:String = id0+id1;
	var sum:Number = 0;
	var digit:String = id.substr(-1,1);
	for(var i=0;i<12;i++){
		if(i<8) {
			sum += int(id.substr(i,1))*int((i+2));
		} else {
			sum += int(id.substr(i,1))*int((i-6));
		}
	}
	var magicDigit:Number = (11-sum%11)%10;
	if(magicDigit==Number(digit)) {
		return true;
	}else{
		return false;
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �������� �̸������� Ȯ��
	@ params :: {}
	@ use :: {
		trace(hb_isEmail("keynut@kobalt.coms"));
	}
+++++++++++++++++++++++++++++++++++++++++++++ */
function hb_isEmail(str:String):Boolean {
	if(str.indexOf("@") == -1 || str.indexOf(".") == -1) {
		return false;
	} else {
		return true;
	}
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭���� �ش���� index ��ȯ
	@ params :: {}
	@ use :: {
		trace(hb_arrGetElementIndex([0, 1, 3, 4, 5, 6, 7], 3));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrGetElementIndex(input_ary:Array, element:Object):Number {
	var _array:Array = input_ary.concat();
	var _arrayLen:Number = _array.length;
	for(var i:Number=0;i<_arrayLen;i++) {
		if(_array[i] == element) {
			return i;
		}
	}
	return -1;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭���� �ش�index ���һ���
	@ params :: {}
	@ use :: {
		trace(hb_arrDeleteElement([0, 1, 3, 4, 5, 6, 7], 5));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrDeleteElement(input_ary:Array, index:Number):Array {
	var _array:Array = input_ary.concat();
	_array.splice(index,1);
	return _array;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭���� �����ϰ� ���� ����
	@ params :: {}
	@ use :: {
		trace(hb_arrGetElementRandom([0, 1, 3, 4, 5, 6, 7]));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrGetElementRandom(input_ary:Array):Object {
	var _array:Array = input_ary.concat();
	return _array[int(Math.random()*_array.length)];
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭 ��� ������, ������
	@ params :: {}
	@ use :: {
		trace(hb_arrEndRotate([0,1,2,3,4,5]));
		trace(hb_arrStartRotate([0,1,2,3,4,5]));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrEndRotate(input_ary:Array):Array {
	var _array:Array = input_ary.concat();
	_array.push(_array.shift());
	return _array;
}
function hb_arrStartRotate(input_ary:Array):Array{
	var _array:Array = input_ary.concat();
	_array.unshift(_array.pop());
	return _array;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �迭���� Ư�� ���� ���� ����
	@ params :: {}
	@ use :: {
		trace(hb_arrExist([0,1,2,3,4,5], 6));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_arrExist(input_ary:Array,element:Object):Boolean {
	var _array:Array = input_ary.concat();
	var _result:Boolean = false;
	var _arrayLen:Number = _array.length;
	for(var i:Number=0;i<_arrayLen;i++) {
		if(_array[i] == element) {
			_result = true;
		}
	}
	return _result;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: ���� �ڸ��� 0���� ǥ��
	@ params :: {}
	@ use :: {
		trace(hb_zeroNum('1000', 5));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_zeroNum(_input:String, len:Number):String {
	var vL:Number = _input.length;
	var nA:Array = [];
	var i:Number;
	for(i=1;i<=len;i++) {
		nA.push("0");
	}
	for(i=1;i<=vL;i++) {
		nA.shift();
		nA.push(_input.substr(i-1,1));
	}
	var _result:String = nA.join("");
	return _result;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Ư������ �˻��ؼ� �ٲٱ�
	@ params :: {}
	@ use :: {
		trace(hb_replace('000011330000', '11', '22'));
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_replace(input_str:String, find_str:String, replace_str:String):String {
	return input_str.split(find_str).join(replace_str);
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Ȧ�� ¦�� ã��
	@ params :: {}
	@ use :: {
		trace(hb_isOddEven(1));
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_isOddEven(n:Number):Boolean {
	return (n%2) ? false : true;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: ���ڿ� ������
	@ params :: {}
	@ use :: {
		trace(hb_reverse('abcdefghijklmnopq'));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_reverse(input_str:String):String {
	var _array:Array = input_str.split("");
	_array.reverse();
	return _array.join("");
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: ���ڿ� Ư�� �� ��ŭ �����ϱ�
	@ params :: {}
	@ use :: {
		trace(hb_multiply('1111', 2));
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_multiply(str:String, n:Number):String {
	var temp:String = "";
	for(var i:Number=0;i<n;i++)
		temp = temp + str;

	return temp;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////	���а��İ���
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �������� �Ÿ� ���ϱ�
	@ params :: {
	}
	@ use :: {
		trace(hb_distanceAB({x:100, y:100}, {x:100, y:100}));
	}
++++++++++++++++++++++++++++++++++++++++ */
function hb_distanceAB(A:Object,B:Object):Number{
	var diffX:Number=A.x-B.x;
	var diffY:Number=A.y-B.y;
	var distance:Number=Math.sqrt(diffX*diffX+diffY*diffY);
	return distance;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Frame Delay Excute
	@ params :: {
		delayNum :: ������ �÷��Ӽ�
		scope :: �Լ��� ����� ������
		exeFunc :: ����� �Լ�
		paraObj :: �Լ�����
	}
	@ use :: {
		// - 4���������� ����
		delayExcute(4, this, function() {
			trace('4�������� �������ϴ� ^^');
		}, null);
	}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_delayExcute(delayNum:Number, scope:Object, exeFunc:Function, paraObj:Object):Void {
	var iLoop:Number = 0;
	var befMC:MovieClip;
	befMC = scope.createEmptyMovieClip("befMC__$", 999998);
	befMC.onEnterFrame = function() {
		if(iLoop >= delayNum) {
			delete this.onEnterFrame;
			this.removeMovieClip();
			exeFunc.call(scope, paraObj);
			return true;
		}
		iLoop++;
		//trace(iLoop);
	};
};

/*+++++++++++++++++++++++++++++++++++++++
	@ name :: XML To Object
	@ params :: {
		delayNum :: ������ �÷��Ӽ�
		scope :: �Լ��� ����� ������
		exeFunc :: ����� �Լ�
		paraObj :: �Լ�����
	}
	@ use :: {}
+++++++++++++++++++++++++++++++++++++++ */
function hb_xml2Obj(xObj:XML):Object {
	var obj:Object = {};
	var a:String, c:String, nName:Object, nType:Object, nValue:Object;
	for(a in xObj.attributes) {
		obj[a] = xObj.attributes[a];
	}
	for(c in xObj.childNodes) {
		nName = xObj.childNodes[c].nodeName;
		nType = xObj.childNodes[c].nodeType;
		nValue = xObj.childNodes[c].nodeValue;
		if(nType == 3) {
			obj._value = nValue;
			obj._type = "text";
		}
		if(nType == 1 && nName != null) {
			if(obj[nName] == null) {
				obj[nName] = arguments.callee(xObj.childNodes[c], {});
			} else if (obj[nName]._type != "array") {
				obj[nName] = [obj[nName]];
				obj[nName]._type = "array";
			}
			if(obj[nName]._type == "array") {
				obj[nName].unshift(arguments.callee(xObj.childNodes[c], {}));
			}
		}
	}
	return obj;
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Tracer Test (Debug��)
	@ params :: {
		msg :: Ʈ���̵̽� ����
	}
	@ use :: {}
+++++++++++++++++++++++++++++++++++++++ */
_global.$hb_test = function(msg:String):Void {
	var send_lc = new LocalConnection();
	send_lc.send("_lc_test_jhb", "methodToExecute", msg);
};


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Bitmap Fill
	@ params :: {

	}
	@ use :: {}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_spreadBitmap(tmc:MovieClip, bitmap:BitmapData, x:Number, y:Number, w:Number, h:Number):Void {
   var temp_mt:Object = {
		a:1, b:0, c:0, d:1, tx:x, ty:y
   };
   with(tmc) {
	   beginBitmapFill(bitmap, temp_mt, true, true);
	   moveTo(x, y);
	   lineTo(x, y+h);
	   lineTo(x+w, y+h);
	   lineTo(x+w, y);
	   lineTo(x, y);
	   endFill();
   }
}


/*+++++++++++++++++++++++++++++++++++++++
	@ name :: Easing Motion
	@ params :: {
		to :: target object
		prop :: property
		func :: easing equations
		cpN :: chage position number
		drN :: duration number
		co :: callback object
	}
	@ use :: {
		hb_easeTo(rect_mc, '_x', book_easeOutCubic, 300, 30, {func:function() {trace('AAA');}});
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_easeTo(to:Object, prop:String, func:Function, cpN:Number, drN:Number, co:Object):Void {
    var timeN:Number = 0, bpN:Number = to[prop];
	cpN = cpN-bpN;
    to.onEnterFrame = function () {
        if(timeN>drN) {
            delete this.onEnterFrame;
            if(co) co.func.apply(co.scope, co.arg);
            trace("�� Last : " + to[prop]);
            return;
        }
        to[prop] = func(timeN, bpN, cpN, drN);
        timeN++;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////	����Ŭ�� ���� ����
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*+++++++++++++++++++++++++++++++++++++++
	@ name :: �ش� ����Ŭ���� ����� ���ϵ�� ��� ����Ŭ���� ������ ����
	@ params :: {}
	@ use :: {
		hb_freezeMC(this);
	}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
function hb_freezeMC(tmc:MovieClip, isSub:Boolean):Void {
	var temp_mc:MovieClip;
	if(isSub == undefined) isSub = true;
	for(var i:String in tmc) {
		if(typeof tmc[i] != 'movieclip')
			continue;
		temp_mc = tmc[i];
		if(temp_mc._totalframes > 1)
			temp_mc.stop();
		if(temp_mc.onEnterFrame)
			delete temp_mc.onEnterFrame;
		if(isSub) arguments.callee(temp_mc, isNotSub);
	}
}