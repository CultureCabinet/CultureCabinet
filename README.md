# CultureCabinet <img src="https://user-images.githubusercontent.com/41771874/134630167-2cbae8d2-86f5-447d-9ab9-382e5809a18b.png" width = 105 align = left>
[<img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg">](https://apps.apple.com/us/app/culturecabinet/id1583912485)   

**Culture Cabinet**은 나만의 문화생활(영화, 드라마, 스포츠, 전시회, 연극)을 기록하는 어플입니다.    
사진과 감상 내용, 별점을 기록하고, 캘린더에서 날짜별 기록을 확인할 수 있습니다.    
마이페이지에서는 지금까지 기록한 횟수를 카테고리별로 확인할 수 있습니다.    
지나칠 수 있는 소중한 경험을 Culture Cabinet에서 간직해보세요.   

## Project
- 프로젝트 기간: 2021.6.26 ~ 2021.08.28   
- 추가 개발 및 유지보수 기간: 2021.08.28 ~ 2021.09.04   
- 앱스토어 출시: 2021.09.12

## Screen Shots
<div>
<img src="https://user-images.githubusercontent.com/41771874/134752983-9a10b8f0-4f06-4369-abfa-2c1f7f6d190c.png" width = 200>
<img src="https://user-images.githubusercontent.com/41771874/134752980-f197060d-da62-470d-88b1-4b1e15274163.png" width = 200>
</div>


## iOS Developers
| <center>권예진</center><br><img src="https://user-images.githubusercontent.com/41771874/134752886-99bd59e3-2761-462d-9f91-810376c1e16d.png" width = 150 align = center><br>[yejin0928](https://github.com/yejin0928) | <center>임수정</center><br><img src="https://user-images.githubusercontent.com/41771874/134629129-65b78708-e620-469b-8618-b3e7f140efa9.png" width = 140 align = center><br>[sio2whocodes](https://github.com/sio2whocodes) | <center>정지우</center><br><img src="https://user-images.githubusercontent.com/41771874/134625950-3d9fa1b8-9d29-4062-a253-1ee30703e7ae.png" width = 150><br>[jjuyaa](https://github.com/jjuyaa) |
| - | - | - |


## Develop Environment
![SWIFT](https://img.shields.io/static/v1?style=for-the-badge&logo=swift&message=SWIFT&label=&color=FA7343&labelColor=000000)

iOS Deployment Target : iOS 14.4

## Library
- [Cosmos](https://github.com/evgenyneu/Cosmos)
- [FSCalendar](https://github.com/WenchaoD/FSCalendar)

## Features
| 기능 | 구현 | 담당자 |
| - | - | - |
| <center>전체 리뷰 모음 화면</center> | <center>✅</center> | <center>임수정</center> |
| <center>리뷰 별 상세화면</center> | <center>✅</center> | <center>권예진</center> |
| <center>리뷰 생성, 삭제</center> | <center>✅</center> | <center>권예진</center> |
| <center>캘린더 형태 리뷰 모음 화면</center> | <center>✅</center> | <center>정지우</center> |
| <center>일별 리뷰 모음 화면</center> | <center>✅</center> | <center>정지우</center> |
| <center>마이페이지</center> | <center>✅</center> | <center>임수정</center> |

## Vesion
- 1.0 (2021.09.12)
- 1.1 : 글 작성 UI 수정 (2021.09.14)
   

## Structure

```
.
├─ Resource
|   ├── CategoryName.swift
|   ├── PostData.swift
|   |
├─ First (record tab)
|   ├── MainPage.storyboard
|   ├── MainpageViewController.swift
|   ├── DetailViewController.storyboard
|   ├── DetailViewController.swift
|   ├── InformHelper.swift
|   ├── PostHelper.swift
|   |
├─ Second (create tab)
|   ├── Record.storyboard
|   ├── RecordViewController.swift
|   ├── UserInformation.swift
|   |
├─ Third (calendar tab)
|   ├── Third.storyboard
|   ├── CalendarVC.swift
|   ├── CabinetCVC.xib
|   ├── CabinetCVC.swift
|   |
├─ Fourth (my page tab)
|   ├── MyPage.storyboard
|   ├── MyPageViewController.swift
|   ├── UserData.swift
|   ├── UserHelper.swift
|   └── CategoryHelper.swift


```
