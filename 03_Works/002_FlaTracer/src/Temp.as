//

// 타이틀 사운드 멈추기
owner.title_mc.snd_mc.d_stop();


// 신한은행
//110-419-848288


// 타이틀 사운드 멈추기
MovieClip(owner.title_mc.snd_mc).d_stop();
KDB_Util.snd_title_clear(owner);

// 정답보기버튼 효과음
MovieClip(owner.se_1).d_play('#_11');
KDB_Util.snd_effect(owner, '#_11');

// 다시하기버튼 효과음
MovieClip(owner.se_1).d_play('#_12');
KDB_Util.snd_effect(owner, '#_12');

// 팝업열기 효과음
MovieClip(owner.se_1).d_play('#_6');
KDB_Util.snd_effect(owner, '#_6');

// 애니보기 효과음
MovieClip(owner.se_1).d_play('#_6');
KDB_Util.snd_effect(owner, '#_6');

// <이전 다음>
MovieClip(owner.se_1).d_play('#_7');
KDB_Util.snd_effect(owner, '#_7');

// 정답일때 효과음
MovieClip(owner.se_1).d_play('#_9');
KDB_Util.snd_effect(owner, '#_9');

// 오답일때 효과음
MovieClip(owner.se_1).d_play('#_1');
KDB_Util.snd_effect(owner, '#_1');


// 막기판 설정
KDB_Util.mak_set(owner, false);
KDB_Util.mak_set(owner, true);


// 텍스트 재생 활성화
	var t_na:int = KDB_Util.get_lastIndex2(name, 0);
	var t_nb:int = KDB_Util.get_lastIndex2(name, 1);
	var t_vm:MovieClip = owner['vm_' + t_na + '_' + t_nb];
	if (t_vm != null)
	{
		KDB_Util.set_filters(t_vm, KDB_Util.FILTERS_1);
		KDB_Util.set_colorAt(t_vm, 0, KDB_Util.COLOR_JUNG);
		KDB_Util.set_filters_no(t_vm);
		KDB_Util.set_colorAt_no(t_vm, 0);
	}

// ::
function p_mps_select_yes(cont:MovieClip, name:String):void
{
	KDB_Util.set_filters(MovieClip(cont[name]), KDB_Util.FILTERS_1);
	KDB_Util.set_colorAt(MovieClip(cont[name]), 0, KDB_Util.COLOR_JUNG);
}

// ::
function p_mps_select_no(cont:MovieClip, name:String):void
{
	KDB_Util.set_filters_no(MovieClip(cont[name]));
	KDB_Util.set_colorAt_no(MovieClip(cont[name]), 0);
}


// 정답보기
HB_Proxy.hb_mc_addClickHandler_roo(owner.ub_1,
	function(me:MouseEvent):void
	{

		KDB_Util.snd_title_clear(owner);
		KDB_Util.snd_playSingle_clear();
		KDB_Util.snd_effect(owner, '#_11');
	}
);

// 다시하기
HB_Proxy.hb_mc_addClickHandler_roo(owner.ub_2,
	function(me:MouseEvent):void
	{
		KDB_Util.snd_title_clear(owner);
		KDB_Util.snd_playSingle_clear();
		KDB_Util.snd_effect(owner, '#_12');
	}
);


// 타이틀 사운드 클릭시
HB_Proxy.hb_mc_addClickHandler(owner.title_mc,
	function(me:MouseEvent):void
	{
		//Com_SoundController(owner._csc).stop();
		//owner.title_mc.snd_mc.d_stop();
	}
);


owner.addEventListener(Event.REMOVED_FROM_STAGE,
	function(e:Event):void
	{
		IEventDispatcher(e.currentTarget).removeEventListener(e.type, arguments.callee);
		//
		// 여기에 메모리 해제 코드를 넣어주세요.
		// 1) 재생중인 사운드 멈추기
		// 2) 재생중인 애니메이션 멈추기
		// 3) 진행중인 Timer, setInterval, setTimeout, TweenLite 코드 멈추기

		//HB_SndUtil.clear(_do);
		//HB_SndUtil.playgClear();

		trace('========================================================== 메모리 해제');
	}
);



// 대본 열기
owner.svc_mc.d_open();







./../_Libs
./../_Cheetah









Common_kc1.log( -> trace(









녹음을 듣고 알맞은 성모를 골라 빈칸에 넣어 보세요.
사진을 가져와 반 친구와 아래 표현을 사용해 이야기 해보세요.
녹음을 잘 듣고, 알맞은 성조를 골라 빈칸에 동그라미표 하세요.
재민이는 다음 상황에서 어떻게 말해야 할까요? 보기에서 골라 가져다 놓으세요.
복운모(ai,ei,ui)를 앞에 배운 성모와 연결하여 발음해 보세요.



	// {{ 하단 사운드 컨트롤러

				case Com_SoundController.EVENT_TYPE_PLAY_START:
				{
					KDB_Util.snd_playSingle_clear();

					break;
				}




import flash.events.MouseEvent;
import flash.display.MovieClip;


var _do:Object = {};

HB_Proxy.hb_mc_addClickHandler_roo(owner.mq_1,
	function(me:MouseEvent):void
	{
		Com_SoundController(owner._csc).stop();

		KDB_Util.snd_playSingle(_do, {
			cont: owner, name: 'mq_1', snd: Sound(new Snd_05()),
			select_yes: function(cont:MovieClip, name:String):void
			{
				KDB_Util.set_filters(MovieClip(cont[name]), KDB_Util.FILTERS_1);
				KDB_Util.set_colorAt(MovieClip(cont[name]), 0, KDB_Util.COLOR_JUNG);
			},
			select_no: function(cont:MovieClip, name:String):void
			{
				KDB_Util.set_filters_no(MovieClip(cont[name]));
				KDB_Util.set_colorAt_no(MovieClip(cont[name]), 0);
			}
		});
	}
);
