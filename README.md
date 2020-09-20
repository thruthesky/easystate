# Easystate

* Easystate 는 플러터의 State manager 중 가장 간단하고 쉬운 State manager 입니다.
* Easystate 를 배우면 다른 State management 패키지를 쉽게 배울 수 있을 것입니다.

## 특징

### 상태 관리 지정

* 변수 상태 관리 모델을 저장하고 사용합니다.
  * Provider 는 상태 관리를 하고자 하는 영역에 모델을 ChnageNotifier 로 등록합니다. 그리고 필요 한 곳에 Consumer 또는 Select 를 통해서 쓰죠.
  * Get 은 모델(컨트롤러) 컨테이너에 보관합니다. 그리고 필요한 곳에 GetBuilder 나 GetX 를 통해서 씁니다.
  * Easystate 는 그냥 변수에 모델을 저장하고, 플러터의 가장 기본적인 위젯인 StreamBuilder 를 통해서 씁니다.
    즉, Easystate 로 하면, 따로 뭔가를 배울 필요가 없는 것입니다.


## References

* see [Easystate Sample App](https://github.com/thruthesky/easystate_sample) for example.


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

