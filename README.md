# CultureCabinet <img src="dfdsfs" width = 45 align = right>
[<img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg">](https://apps.apple.com/us/app/culturecabinet/id1583912485)

## Project
---
프로젝트 기간: 2021.6.26 ~ 2021.08.28   
추가 개발 및 유지보수 기간: 2021.08.28 ~ 2021.09.04   
앱스토어 출시: 2021.09.12

## iOS Developers
---
| <center>권예진</center> <img src="" width = 150 align = center>[yegin0928](https://github.com/yejin0928) | <center>임수정</center><img src="" width = 150 align = center>[sio2whocodes](https://github.com/sio2whocodes) | <center>정지우</center><img src="" width = 150 align = center> [jjuyaa](https://github.com/jjuyaa) |
| :- | - | -: |



## Develop Environment
---
![SWIFT](https://img.shields.io/static/v1?style=for-the-badge&logo=swift&message=SWIFT&label=&color=FA7343&labelColor=000000)

iOS Deployment Target : iOS 14.4

## Library
---
- [Cosmos](https://github.com/evgenyneu/Cosmos)
- [FSCalendar](https://github.com/WenchaoD/FSCalendar)

## Features
---
| <center>기능</center> | <center>구현 여부</center> | <center>담당자</center> |
| :- | - | -: |
| <center>전체 리뷰 모음 화면</center> | <center>완료</center> | <center>임수정</center> |
| <center>리뷰 별 상세화면</center> | <center>완료</center> | <center>권예진</center> |
| <center>리뷰 생성, 삭제</center> | <center>완료</center> | <center>권예진</center> |
| <center>캘린더 형태 리뷰 모음 화면</center> | <center>완료</center> | <center>정지우</center> |
| <center>일별 리뷰 모음 화면</center> | <center>완료</center> | <center>정지우</center> |
| <center>마이페이지</center> | <center>완료</center> | <center>임수정</center> |




## Structure
---

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