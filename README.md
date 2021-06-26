# 用Flutter製作購物車 App

##目前功能

+多國語系(en, zh-TW)<br/>

+主題切換(暗黑、一班)<br/>

+登入、登出、註冊、訪客等會員機制<br/>

<br/>
2021.06.26<br/>
  登入登出機制修正，原本訪客身分的使用者要登入的時候會進到另外一個畫面<br/>
  我用的是Navigator進到另一個畫面。當使用者帳密輸入都OK確定的時候再用<br/>
  pushAndRemoveUntil進到載入user資料的畫面+管理資料的notifier。<br/>
  上面這個缺點是，會從原本的Widget Tree多建立意外的子Widget出來。<br/>
  然後載入資料的Notifier跟pushAndRemoveUntil一起建立。登入功能都能正<br/>
  常使用。只是登出的時候畫面卻沒更新。找好久才發現畫面是更新到多建立出來子<br/>
  Widget而已，導致部分登入的畫面沒更新到。<br/>
  修正方法是用Navigator.pop的方式，然後把Load Data的Notifier建立最上層。<br/>
  要否載入User值就用configNotifier的isLogin做判斷。<br/>
  (不知道這解法484好解法。感覺程式變得又塞在一起)<br/>
