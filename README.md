# **Ncloud Chat iOS SDK**
iOS용 채팅 개발을 위한 Ncloud Chat iOS SDK 사용법에 대해 설명합니다. SDK를 설치하고 환경을 
구성함으로써 채팅과 대시보드를 연동할 수 있습니다.

## **요구사항**
iOS용 Ncloud Chat SDK를 사용하기 위한 요구 사양은 다음과 같습니다.
- iOS 13.0 이상 설치된 실행 가능한 기기
- Swift 5.0 and later
- Xcode 13 이상

## **SDK 설치 방법**
Ncloud Chat iOS SDK를 설치한 후, Ncloud Chat 대시보드와 연동하고 개발에 필요한 기능을 사용할 
수 있습니다.
### **Swift Package Manager (SPM)**
[Swift Package Manager](https://www.swift.org/package-manager/)는 Swift의 자동 코드 배포 도구이며, Swift 컴파일러에 통합되어 있습니다. 
Swift package 셋업을 마친 뒤, NcloudChat를 dependency로 추가하기 위해, `Package.swift`에 `dependencies` 를 추가 합니다.
```swift
dependencies: [
    .package(url: "https://github.com/nbase-io/NcloudChat-SDK-iOS.git")
]
```

---
## **1. 초기화와 이벤트**
### **초기화**
Ncloud Chat을 사용하기 전에 기초 설정과 초기화가 필요 합니다, 방법은 다음과 같습니다.
1. 서버 URL과 소켓 URL을 설정 합니다 **(해외에서 사용 하는 경우만 해당 됩니다)**.
   - **한국 유저분들은 1. 단계를 건너 뛰시고, 다음 단계인 2. 으로 넘어가주세요.**
     - 서버 URL과 소켓 URL 설정을 건너 뛰시면 아래 기본 URL을 사용하게 됩니다.
     - 기본 서버 URL: https://ncloudchat.apigw.ntruss.com/gpapps/v1
     - 기본 소켓 URL: https://soc.ncloudchat.ntruss.com
   - 해외에서 SDK를 사용하시는 경우 URL 세팅이 필요한 경우가 있습니다. 
   - 서버 URL과 소켓 URL을 CloudChat 객체 생성 이전에 설정 할 수 있습니다.
```swift
...
import NcloudChat

class CustomViewController: UIViewController, CloudChatDelegate {
    var nc: CloudChat?
    ...
    override func viewDidLoad() {
        super.viewDidLoad()

        // CloudChat 생성 전에 서버, 소켓 URL 설정 (해외일 경우만 설정이 요구됨)
        CloudChat.setServerURL(url: SERVER_URL)
        CloudChat.setSocketURL(url: SOCKET_URL)
        ...
    }
}
```
2. 대시보드에서 확인한 프로젝트 ID를 추가해 주십시오.
3. 프로젝트 아이디를 통해, CloudChat 초기화 및 delegate를 설정합니다.

```swift
...
import NcloudChat

class CustomViewController: UIViewController, CloudChatDelegate {
    var nc: CloudChat?
    ...
    override func viewDidLoad() {
        super.viewDidLoad()

        // CloudChat 생성 전에 delegate 설정
        CloudChat.setDelegate(delegate: self)

        // CloudChat 초기화
        self.nc = CloudChat.init(projectId: projectId) {
            result in
            switch result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
            }
        }
        ...
    }
}

// SceneDelegate.swift
// App이 Foreground 또는 Background 이동 시 소켓을 재연결 또는 해제 하는 용도 입니다.
...
import NcloudChat

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    ...
    func sceneWillEnterForeground(_ scene: UIScene) {
        CloudChat.applicationWillEnterForeground()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CloudChat.applicationDidEnterBackground()
    }
}
```
### **CloudChatDelegate**
Delegate 함수들을 이용해서 이벤트시 원하는 작업 처리를 합니다.
```swift
...
import NcloudChat

extenstion CustomViewController: CloudChatDelegate {

    // CloudChat Socket 연결 완료 시 전달되는 이벤트
    func onConnect() { }

    // 사용자에 의한 CloudChat Socket 연결 해제 시 전달되는 이벤트
    func onDisconnect() { }

    // CloudChat Socket 연결 상태 변경시 전달되는 이벤트
    func onStatusChange(status): Any) { }

    // CloudChat Message 수신 시 전달되는 이벤트
    func onMessage(data: Any) { }

    // CloudChat "start typing" 수신 시 전달되는 이벤트
    func onStartTyping(data: Any) { }

    // CloudChat "stop typing" 수신 시 전달되는 이벤트
    func onStopTyping(data: Any) { }

    // CloudChat "event" 수신 시 전달되는 이벤트
    func onEvent(data: Any) { }

    // CloudChat 새 맴버가 구독 채널 입장 시 전달되는 이벤트
    func onMemberJoined(data: Any) { }
    
    // CloudChat 구독 채널 맴버가 채널 퇴장 시 전달되는 이벤트
    func onMemberLeft(data: Any) { }
    
    // CloudChat 채널 맴버 업데이트 시 전달되는 이벤트
    func onMemberUpdated(data: Any) { }
    
    // CloudChat 채널 맴버 삭제 시 전달되는 이벤트
    func onMemberDeleted(data: Any) { }
    
    // CloudChat 채널 맴버 차단 시 전달되는 이벤트
    func onMemberBanned(data: Any) { }
    
    // CloudChat Socket 재연결 시 전달되는 이벤트
    func onReconnect(data: Any) { }
    
    // CloudChat Socket 재연결 시도 시 전달되는 이벤트
    func onReconnectAttempt(data: Any) { }

    // CloudChat Error 발생 Socket 연결 해제 시 전달되는 이벤트
    func onError(error: Any) { }
}
```
---
## **2. 접속**
### **connect**
유저아이디를 통해, CloudChat 소켓 서버에 접속합니다.
- NCloudChat 프로젝트 내에서, 유저 아이디는 고유한 값입니다.
- 연결 시 onConnect 이벤트로 연결 완료 이벤트가 전달됩니다.
```swift
nc.connect(
    userId: USER_ID, 
    userToken: USER_TOKEN, 
    profile: PROFILE, 
    name: NAME, 
    customField: CUSTOM_FIELD
    ) {
    result in
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error)
        }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| userId | String | 유저 고유 아이디 |
| uesrToken | String? | 유저 토큰 |
| profile | String? | 유저 프로파일 이미지 URL |
| name | String? | 유저 이름 |
| customField | String? | 커스텀 옵션 |

### **disconnect**
연결된 CloudChat 소켓서버와의 연결을 해제 합니다.
- 연결 해제 완료 시 onDisconnect 이벤트로 연결 해제 이벤트가 전달됩니다.
```swift
nc.disconnect() {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
---
## **3. 유저 정보 갱신**
### **updateUser**
유저 정보를 수정 합니다.
```swift
nc.updateUser(userId: USER_ID, name: NAME, profile: PROFILE) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| userId | String | 유저 고유 아이디 |
| name | String? | 유저 토큰 |
| profile | String? | 유저 프로파일 이미지 URL |
---
## **4. 구독**
### **subscribe**
채널 아이디로, 특정 채널에 subscribe 합니다.
```swift
nc.subscribe(channelId: CHANNEL_ID, options: OPTIONS) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 아이디 |
| options | String? | 옵션 |
### **unsubscribe**
채널 아이디로, 특정 채널에 unsubscribe 합니다.
```swift
nc.unsubscribe(channelId: CHANNEL_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 아이디 |
### **getSubscription**
특정 채널의 subscription 데이터를 요청 합니다.
```swift
nc.getSubscription(channelId: CHANNEL_ID, subscriptionId: SUBSCRIPTION_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 아이디 |
### **getSubscriptions**
특정 채널의 subscription 데이터들을 리스트 형태로 불러옵니다.
```swift
nc.getSubscriptions(
    filter: ["channel_id": CHANNEL_ID], 
    option: ["offset": 0, "limit": 100], 
    sort: ["created_at": -1]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
---
## **5. 채널**
### **createChannel**
신규 채널을 생성합니다.
```swift
nc.createChannel(
    channelType: CHANNEL_TYPE,
    channelName: CHANNEL_NAME,
    uniqueId: UNIQUE_ID,
    members: [MEMBER_ID],
    customFiled: CUSTOM_FIELD,
    disabled: DISABLED,
    mutes: MUTES,
    push: PUSH,
    imageUrl: IMAGE_URL,
    id: ID,
    translation: TRANSLATION
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelType | String | 채널 타입 (PUBLIC 또는 PRIVATE) |
| channelName | String | 채널 이름 |
| uniqueId | String? | 채널 아이디 |
| members | String? | 채널 초대 유저 |
| customFiled | String? | 커스텀 옵션 |
| disabled | Bool? | 채널 아이디 |
| mutes | Bool? | 음소거 |
| push | Bool? | 푸시 알림 |
| imageUrl | String? | 채널 이미지 URL |
| id | String? | 채널 아이디 |
| translation | Bool? | 통역 기능|
### **updateChannel**
채널 정보를 업데이트 합니다.
```swift
nc.updateChannel(
    channelId: CHANNEL_ID,
    channelType: CHANNEL_TYPE,
    channelName: CHANNEL_NAME,
    members: [MEMBER],
    push: PUSH,
    imageUrl: IMAGE_URL,
    translation: TRANSLATION
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| channelType | String | 채널 타입 (PUBLIC 또는 PRIVATE) |
| channelName | String | 채널 이름 |
| members | String? | 채널 초대 유저 |
| push | Bool? | 푸시 알림 |
| imageUrl | String? | 채널 이미지 URL |
| translation | Bool? | 통역 기능|
### **deleteChannel**
해당 채널을 삭제 합니다.
```swift
nc.deleteChannel(
    channelId: CHANNEL_ID
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
### **mute**
해당 채널을 음소거 합니다.
```swift
nc.mute(channelId: CHANNEL_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
### **unmute**
해당 채널의 음소거를 해제 합니다.
```swift
nc.unmute(channelId: CHANNEL_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
### **getChannel**
개별 채널에 대한 정보를 가져올 수 있습니다.
```swift
nc.getChannel(channelId: CHANNEL_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
### **getChannels**
(프로젝트 내) Channel 데이터를 리스트 형태로 불러 옵니다.
```swift
nc.getChannels(
    filter: ["state": true], 
    sort: ["created_at": -1],
    option: ["offset": 0, "limit": 100]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
---
## **6. 메세지**
### **sendMessage**
채널 아이디로 특정 채널에 메시지를 송신합니다.
```swift
nc.sendMessage(channelId: CHANNEL_ID, message: MESSAGE) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| message | String | 메세지 |
### **sendExpressMessage**
오직 고속으로 메시지를 발송하기 위한 함수 입니다. 시간 지연이 걸릴 수 있는 부분을 모두 스킵하여 
기존 대비 10배 빠르게 메시지 전송이 가능합니다. 일반 sendMessage와 차이점은 아래와 같습니다.
| Function | Description | 필터링 | 차단 | 번역 |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| sendMessage | 일반 메시지 발송     | O | O | O |
| sendExpressMessage | 빠른 메시지 발송 | X | X | X |

게임 내에서 실시간 PvP를 제작하거나 고속의 Broadcasting 이 필요한 모든 서비스에 이용이 가능합니다.
```swift
nc.sendExpressMessage(channelId: CHANNEL_ID, message: MESSAGE) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| message | String | 메세지 |
### **sendImage**
현재 채널에 접속된 사용자들에게 이미지 메시지를 보낼 수 있습니다.
```swift
nc.sendImage(
    channelId: CHANNEL_ID, 
    file: FILE, 
    fileName: FILE_NAME, 
    mimeType: MIME_TYPE
    ) {
        result in
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error)
        }
    }
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| file | Data | 이미지 파일 |
| fileName | String | 이미지 파일 이름 (확장자 포함) |
| mimeType | String | 미디어 타입 |
### **startTyping**
현재 채널에 접속된 사용자들에게 입력 시작 이라는 메시지를 보낼 수 있습니다.
```swift
nc.startTyping(channelId: CHANNEL_ID, threadId: THREAD_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| threadId | String | 메세지 ID |
### **stopTyping**
현재 채널에 접속된 사용자들에게 입력 멈춤 이라는 메시지를 보낼 수 있습니다.
```swift
nc.stopTyping(channelId: CHANNEL_ID, threadId: THREAD_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| threadId | String | 메세지 ID |
### **markRead**
마지막 읽은 메시지의 정보를 전달합니다.
```swift
nc.markRead(
    channelId: CHANNEL_ID, 
    userId: USER_ID, 
    messageId: MESSAGE_ID, 
    sortId: SORT_ID, 
    option: OPTION
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| userId | String | 유저 ID |
| messageId | String | 메세지 ID |
| sortId | String | 소트 ID |
### **unreadCount**
마크된 이후의 읽지 않은 메시지 전체 개수를 리턴 합니다.
```swift
nc.unreadCount(channelId: CHANNEL_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
### **getMessage**
개별 메시지에 대한 정보를 가져올 수 있습니다.
```swift
nc.getMessage(channelId: CHANNEL_ID, messageId: MESSAGE_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| messageId | String | 메세지 ID |
### **getMessages**
전체 메시지에 대해 가져올 수 있습니다.
```swift
nc.getMessages(
    filter: ["channel_id": CHANNEL_ID], 
    sort: ["created_at": -1],
    option: ["offset": 0, "limit": 100]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
---
## **7. 채널 맴버**
### **addUsers**
PRIVATE 채널의 경우 참여하고자 하는 사용자를 채널로 초대 합니다.
```swift
nc.addUsers(channelId: CHANNEL_ID, memberIds: [MEMBER_ID]) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| memberIds | [String] | Array of 유저 ID |
### **removeUsers**
PRIVATE 채널의 경우 참여된 사용자를 채널에서 제외 합니다.
```swift
nc.removeUsers(channelId: CHANNEL_ID, memberIds: [MEMBER_ID]) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| memberIds | [String] | Array of 유저 ID |
### **banUser**
채널 내에 사용자를 차단합니다. 채널을 생성한 권한을 가지고 있거나 전체 관리자만 사용이 가능합니다.
```swift
nc.banUser(
    channelId: CHANNEL_ID, 
    memberId: MEMBER_ID, 
    options: ["timeout": 30000, "reason": "비속어 사용"]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| memberId | String | 유저 ID |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| timeout | Int | 차단 시간 (초) |
| reason | String | 차단 사유 |
### **unbanUser**
채널 내에 차단한 사용자에 대해 차단을 해제합니다. 채널을 생성한 권한을 가지고 있거나 전체 관리자만 
사용이 가능합니다.
```swift
nc.unbanUser(channelId: CHANNEL_ID, memberId: MEMBER_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| channelId | String | 채널 ID |
| memberId | String | 유저 ID |
### **getUsers**
특정 아이디에 대한 정보를 가져옵니다. (보안상 닉네임만 전달됩니다.)
```swift
nc.getUsers(
    filter: ["id": USER_ID], 
    sort: ["created_at": -1],
    option: ["offset": 0, "limit": 100]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
### **getBannedUser**
정지된 사용자들 정보를 가져옵니다
```swift
nc.getBannedUser(
    filter: ["status": 1], 
    sort: ["created_at": -1],
    option: ["offset": 0, "limit": 100]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
---
## **8. 친구**
Ncloud Chat은 친구들을 초대/수락/리젝/삭제 등의 관리를 하실 수 있는 기능을 제공합니다.
### **requestFriendship**
특정 사용자에게 친구 초대 요청 합니다.
```swift
nc.requestFriendship(friendId: FRIEND_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| friendId | String | 유저 ID |
### **acceptFriendship**
초대에 대한 수락할 때 사용 합니다.
```swift
nc.acceptFriendship(friendId: FRIEND_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| friendId | String | 유저 ID |
### **rejectFriendship**
초대에 대한 거절할 때 사용합니다.
```swift
nc.rejectFriendship(friendId: FRIEND_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| friendId | String | 유저 ID |
### **deleteFriendship**
친구 여부나 초대 상태에 관계없이 삭제할 때 사용합니다.
```swift
nc.deleteFriendship(friendId: FRIEND_ID) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| friendId | String | 유저 ID |
### **getFriendships**
현재 모든 상태의 친구 목록을 가져 옵니다. offset, limit에 따라 수 많은 사용자를 가져올 수 있습니다.
```swift
nc.getFriendships(
    filter: ["status": "accepted"], // accepted, pending, rejected 값을 필터로 지정합니다.
    sort: ["created_at": -1],
    option: ["offset": 0, "limit": 100]
    ) {
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```
| ID | Type | Description |
| ----------- | ----------- | ----------- |
| filter | Dictionary<String, Any> | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| sort | Dictionary<String, Any> | 소트하고자 하는 필드의 필터를 정의합니다 |
| option | Dictionary<String, Any> | 옵션이 존재할 경우 아래를 참고하세요 |

- Option

| ID | Type | Description |
| ----------- | ----------- | ----------- |
| offset | Int | 쿼리를 필터 모든 필드에 대해서 검색이 가능합니다 |
| per_page | Int | 소트하고자 하는 필드의 필터를 정의합니다 |
---
## **9. 푸시 알림**
Ncloud Chat 은 SENS 를 통한 푸시 알림만을 지원합니다.
**iOS Push 설정을 위한 용도로 Dashboard >> 설정 >> 프로젝트 설정 >> SENS Push 가 설정 되어야 
사용 가능합니다.**

푸시 알림 발송 규칙
- 푸시 알림은 새 메시지에 대해서 발송됩니다.
- 채널생성 옵션에 푸시가 허용이고 사용자가 푸시 토큰이 등록된 경우 받습니다.
- 채널은 최대 1000명의 회원에게 푸시 알림이 전송됩니다.
- 온라인 여부 관계없이 푸시 알림을 받습니다.
- 음소거된 사용자는 메시지를 받지 않습니다.
---
## **10. 에러**
CloudChat API 사용 중에 발생하는 에러에 대한 설명 입니다. CloudChat 에러들은 
.errorDescription을 이용하면, String으로 된 에러의 description을 사용 할수 있습니다.
```swift
switch result {
case .success(let data):
case .failure(let error):
    print(error.errorDescription)
}
```

| Error | Comment | Description |
| ----------- | ----------- | ----------- |
| failToConnect | Fail To Connect | Failed to connect, please try again. |
| failToDisconnect | Fail To Disconnect | Failed to disconnect, please try again. |
| noProjectId | No Project ID | Please input a project id. |
| noSocket | No Socket Connection Found | Please connect before run the methods. |
| noFile | No File | Please provide a file. |
| noFileName | No File Name | Please provide a file name. |
| noMimeType | No Mime Type | Please provide a mime type. |
| noMessage | No Message | Please provide a context of the message. |
| noThreadId | No Thread ID | Please provide a thread id of the message (thread id is the message id). |
| noUser | No User Information | Please provide a user informations. |
| noUserId | No User ID | Please provide a user id. |
| noChannelId | No Channel ID | Please provide a channel id. |
| noChannelType | No Channel Type | Please provide a channel type (private or public). |
| noChannelName | No Channel Name | Please provide a channel name. |
| noSubscriptionId | No Subscription ID | Please provide a subscription id. |
| noPinId | No Pin ID | Please provide a pin id. |
| notInitialized | Initialization Required | Please initialize before connecting. |
| failed(message:) | Unexpected Error | message |
