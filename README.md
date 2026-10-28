# 拾旅

出國時記帳、看預算、整理清單（行前待辦、行李、購物）、看統計、換算匯率的網頁。給家人出國用，參考「探險熊熊」的使用經驗做得更好。

- 網址：https://shilu-trip.web.app/ （測試版：https://shilu-trip.web.app/beta/ ）
- 舊網址 https://shawwwwn041.github.io/travel-helper/ 會自動轉到新網址（這台裝置在舊網址還有自己的資料時，先留下來等登入搬上雲端）
- 修改紀錄：見 [CHANGELOG.md](CHANGELOG.md)

## 架構

- 網頁：單一 HTML 檔，放在 Firebase Hosting（`site/` 資料夾）
- 登入：Firebase Authentication（Google 登入）；也可以用訪客模式，資料只存在這台裝置
- 資料：Cloud Firestore，`users/{uid}/trips/{tripId}` 底下有 `items`（清單）、`photos`（照片）、`expenses`（記帳）
- 資料庫規則：`firestore.rules`（只有本人能讀寫自己的資料，寫入要通過格式檢查）；修改後要到 Firebase 主控台手動發布

## 資料夾

| 路徑 | 用途 |
|---|---|
| `site/` | 新網址的網站檔案（Firebase Hosting 部署這個資料夾） |
| `index.html`、`beta/` | 舊網址（GitHub Pages）版本，多一段自動轉址 |
| `icons/` | 圖示與分享預覽圖 |
| `firebase.json`、`.firebaserc` | Firebase Hosting 的部署設定與網站對照 |
| `deploy.bat` | 一鍵部署：抓最新版本後部署到 shilu-trip.web.app |
| `firestore.rules` | 資料庫規則（參考用，實際以主控台發布的為準） |

## 部署

1. 修改推上 GitHub 後，舊網址（GitHub Pages）會自動更新。
2. 在已安裝 Node.js、Git、firebase-tools 並 `firebase login` 的電腦上，雙擊 `deploy.bat` 更新新網址。
