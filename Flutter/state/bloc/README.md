# bloc

view에 매치되는 bloc controller 를 만들고 
인스턴스화 한다음, Stream Biulder 에 스트림 연결을 해주면 상태관리 가 obs하게 됨.

하지만 상태값을 추적해줄 위젯은 반드시 StreamBuilder로 감싸 리턴되는 snapshot.data를 받아와야 한다.

상태를 추적해줄 변수가 추가 되면 변수마다 스트림을 등록 해줘야 하며, 너무 많아지면 구조화를 하거나 class로 말아야 한다.


# BehaviorSubject vs StreamController

BehaviorSubject 는 StreamController의 broadcast 와 같지만 Stream 이 아닌 Observable 를 반환한다.