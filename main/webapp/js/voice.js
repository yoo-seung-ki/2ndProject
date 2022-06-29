const $ = (el) => document.querySelector(el);

const voice = {
    texts: '',
    isRecognizing: true
};

(() => {
	
    
    let SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (!("webkitSpeechRecognition" in window)) {
        alert("지원 하지않는 브라우저 입니다.") //파이어폭스, 오페라 지원안됨
    } else {
        const recognition = new SpeechRecognition();
        recognition.interimResults = true; // true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
        recognition.lang = 'ko-KR'; // 값이 없으면 HTML의 <html lang="en">을 참고 ko-KR, en-US
        recognition.continuous = false; //각 인식에 대해 연속 결과가 반환되는지 아니면 단일 결과만 반환되는지를 제어 기본값은 단일( false.)
        recognition.maxAlternatives = 20000; // maxAlternatives가 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체

        recognition.onspeechend = function () { //음성 감시 끝날때 실행
            recognition.stop();
            $('.dictate').classList.remove("on");
            voice.isRecognizing = true;
            $("#mic").blur(); //음성 감지 종료 시 포커스 빼기
        };

        recognition.onresult = function (e) { //result이벤트는 음성 인식 서비스가 결과를 반환할 때 시작
            voice.texts = Array.from(e.results)
                .map(results => results[0].transcript).join("");

            console.log(voice.texts)
            $('input[type=text]').value = voice.texts;
        };
        /* // Speech API END */

        const active = () => {
            $('.dictate').classList.add('on')
            recognition.start();
            voice.isRecognizing = false;
            $("#mic").focus(); //음성 감지 시작 시 검색창에 포커스 주기
        };

        const unactive = () => {
            $('.dictate').classList.remove('on')
            recognition.stop();
            voice.isRecognizing = true;
        };

        $('.dictate').addEventListener('click', () => {
            if (voice.isRecognizing) {
                active();
            } else {
                unactive();
            }
        });
    }
})();