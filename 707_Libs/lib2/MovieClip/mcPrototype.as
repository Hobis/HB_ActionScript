/* ######################################################################

	MovieClip Prototype Library
	
	Written : Kobalt60 - Jung Hee Bum
	Date : 060314
	
	Comment : 
	
		- ����Ŭ�� ���� ��� ���� ������Ÿ�� ����
		- �޼��� �ߺ��� ���ϱ� ���Ͽ� #include���� �巡�� �ؼ� �������.
		
###################################################################### */
/* =============================================================================
	MovieClip Loading Processing
	
	- ���� !! ���ι����� ù��° �����ӿ����� �����ε��� �ɸ��� �ʴ´�.
	- ex) mcName.mcLoadProcs();
============================================================================= */
MovieClip.prototype.mcLoadProcs = function() {
	this.onEnterFrame = function () {
		var totalN = this.getBytesTotal();
		var nowN = this.getBytesLoaded();
		var perN = Math.round((nowN/totalN)*100);
		// ---- �ε������� �ʿ��� ����Ŭ�� ���� ----
		//this.loader.bar._xscale = this.percent;
		//this.loader.parcent.text = this.percent + "%";
		//trace(perN);
		if(nowN >= totalN) {
			delete this.onEnterFrame;
			//nextExcutive();
		}
	};
};//end function
/* =============================================================================
	MovieClip Color Changed
	
	- mc�� ƾƮ�÷��� �ο��Ҷ� ���
	- ex)
	
		mcName.mcColorTo();
		this.onMouseDown = function() {
			mc.mcColorTo("#000000");	
		};
		this.onMouseDown = function() {
			mc.mcColorTo("#CC0000");	
		};		
============================================================================= */
MovieClip.prototype.mcColorChange = function(cStr) {
	if(cStr.charAt(0) == "#") {
		cStr = cStr.slice(1, 7);
	} else return;
	var colorValue = "0x" + cStr;
	var myColor = new Color(this);
	myColor.setRGB(colorValue);
};

/* =============================================================================
	��� ����Ŭ�� ����
============================================================================= */
MovieClip.prototype.mcPlayAll = function() {
	for(var i in this) {
		if(this[i] instanceof MovieClip) {
			trace(i);
			this[i].play();
		}
	}
};

/* =============================================================================
	��� ����Ŭ�� ����
============================================================================= */
MovieClip.prototype.mcStopAll = function() {
	this.stop();
	for(var i in this) {
		if(this[i] instanceof MovieClip) {
			this[i].stop();
		}
	}
};

/* =============================================================================
	����Ŭ�� ����������
============================================================================= */
MovieClip.prototype.frameOO = function(type:String):Void {	
	if(type == "over") {
		var ef:Function = function() {
			if(this._currentframe >= this._totalframes) {
				delete this.onEnterFrame;
				return;
			}
			this.nextFrame();
		};
	} else if(type == "out") {
		var ef:Function = function() {
			if(this._currentframe <= 1) {
				delete this.onEnterFrame;
				return;
			}
			this.prevFrame();
		};
	}
	this.onEnterFrame = ef;
};

/* =============================================================================
	�������� �ݺ���ȯ
============================================================================= */
MovieClip.prototype.autoFrame = function(totalFrame) {
	this.gotoAndStop(this._currentframe%totalFrame+1);
};