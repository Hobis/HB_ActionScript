/* #####################################################################
	mcRotate3D
	Written : Kobalt60 - Jung Hee Bum
	Date : 060515
	
	Comment : {		
		MovieClip 3D Rotate prototype
		�� �Լ� �ߺ��� ���ϱ� ���Ͽ� #include���� �巡�� �ؼ� �������.
		ex : 
			function mcRotate3D(tmc) {
				var cxN = 0;
				var cyN = 0;
				var czN = 0;
				var fN = 200;
				var tN = 0.05;
				tmc.xN = 0;
				tmc.yN = 0;
				tmc.zN = 100;
				tmc.onEnterFrame = function() {
					// - ���콺�� y��ǥ�� ���� ȸ���� ���� ����.
					//var xAngle = this._parent._ymouse/2000;
					//this.rotateX(xAngle, cyN, czN);
					// - x���� �߽����� t��ŭ ȸ��.
					//this.rotateX(tN, cyN, czN);
					// - y���� �߽����� t��ŭ ȸ��.
					this.rotateY(tN, czN, cxN);
					// - z���� �߽����� t��ŭ ȸ��.
					//this.rotateZ(tN, cxN, cyN);
					// - ���� ȿ���� ������ plot3d �޼��� ȣ��.
					this.plot3d(fN);
				};
			}
			mcRotate3D(circle_mc);
	}
##################################################################### */
/* ======================================================================
	x�� ȸ�� �޼���
====================================================================== */
MovieClip.prototype.rotateX = function(tN, cyN, czN) {
	var tempy = cyN+(this.yN-cyN)*Math.cos(tN)-(this.zN-czN)*Math.sin(tN);
	this.zN = czN+(this.yN-cyN)*Math.sin(tN)+(this.zN-czN)*Math.cos(tN);
	this.yN = tempy;
};
/* ======================================================================
	y�� ȸ�� �޼���
====================================================================== */
MovieClip.prototype.rotateY = function(tN, czN, cxN) {
	var tempz = czN+(this.zN-czN)*Math.cos(tN)-(this.xN-cxN)*Math.sin(tN);
	this.xN = cxN+(this.zN-czN)*Math.sin(tN)+(this.xN-cxN)*Math.cos(tN);
	this.zN = tempz;
};
/* ======================================================================
	z�� ȸ�� �޼���
====================================================================== */
MovieClip.prototype.rotateZ = function(tN, cxN, cyN) {
	var tempx = cxN+(this.xN-cxN)*Math.cos(tN)-(this.yN-cyN)*Math.sin(tN);
	this.yN = cyN+(this.xN-cxN)*Math.sin(tN)+(this.yN-cyN)*Math.cos(tN);
	this.xN = tempx;
};
/* ======================================================================
	3d ���� ǥ�� �޼���
====================================================================== */
MovieClip.prototype.plot3d = function(fN, vP) {
	// - z��ǥ�� -f���� ������ ����Ŭ���� ������ �ʰ� ��.
	if(this.zN <- fN) {
		this._visible = false;
	} else {
		this._visible = true;
		// - z���� ���� scale���� ����.
		var scaleN = fN/(fN+this.zN);
		this._xscale = this._yscale = scaleN*100;
		// - ȸ���� ��ǥ�� ����Ŭ�� �Ӽ����� ����.
		this._x = this.xN*scaleN;
		this._y = this.yN*scaleN - vP*this.zN;
		// z���� ���� depths ����.
		this.swapDepths(50000-100*this.zN);
	}
};
/* ======================================================================
	����Ҷ� Ư������ ����.
====================================================================== */
MovieClip.prototype.rotateTo = function(tX, tY) {
	var diffX = tX-this._x;
	var diffY = tY-this._y;
	this._rotation = Math.atan2(diffY, diffX)*180/Math.PI;
};






































/*
// EX : mc.mcRotateY(200, 100);
MovieClip.prototype.mcRotateY = function(fN, zN) {
	var cxN = 0;
	var cyN = 0;
	var czN = 0;
	var tN = 0.05;
	this.xN = 0;
	this.yN = 0;
	this.zN = zN;
	this.onEnterFrame = function() {
		var xAngle = this._parent._xmouse/2000;
		this.rotateY(xAngle, czN, cxN);
		this.plot3d(fN);
	};
};
// EX : mc.mcRotateX(200, 100);
MovieClip.prototype.mcRotateX = function(fN, zN) {
	var cxN = 0;
	var cyN = 0;
	var czN = 0;
	var tN = 0.05;
	this.xN = 0;
	this.yN = 0;
	this.zN = zN;
	this.onEnterFrame = function() {
		var yAngle = this._parent._ymouse/2000;
		this.rotateX(yAngle, cyN, czN);
		this.plot3d(fN);
	};
};
// EX : mc.mcRotateX(200, 100);
MovieClip.prototype.mcRotateZ = function(fN, xyN) {
	var cxN = 0;
	var cyN = 0;
	var czN = 0;
	var tN = 0.05;
	this.xN = xyN;
	this.yN = xyN;
	this.zN = 0;
	this.onEnterFrame = function() {
		var xAngle = this._parent._xmouse/100;
		this.rotateZ(xAngle, cxN, cyN);
		this.plot3d(fN);
	};
};
*/