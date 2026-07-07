---

# Learning Index

本頁用於整理 `logs/` 中的學習紀錄，包含每日紀錄、每週摘要、每月回顧與會議整理。

`learning_index.md` 的重點不是保存完整筆記內容，而是提供時間序導覽，幫助快速查詢：

- 哪一天學了什麼
- 哪一週完成了哪些任務
- 哪些學習內容已整理成正式 `wiki/` 筆記
- 哪些內容仍需要補成概念、工具、流程、任務、專案、資料、公式或術語筆記

---

## 1. Index 說明

本 index 對應以下資料夾：

| 類型 | 位置 | 說明 |
|---|---|---|
| 每日紀錄 | `logs/daily/` | 每日學習內容、任務、問題、後續整理項目 |
| 每週摘要 | `logs/weekly/` | 每週學習重點、任務進度、問題整理與回顧 |
| 每月回顧 | `logs/monthly/` | 每月成果、能力成長、重要主題與下月計畫 |
| 會議整理 | `logs/meetings/` | 會議重點、決議、提醒與待辦事項 |

本 index 不直接管理 `wiki/` 內的正式知識頁。  
正式知識頁應由對應分類 index 管理，例如：

| 類型 | 對應 Index |
|---|---|
| 概念 | [[concept_index]] |
| 工具 | [[tool_index]] |
| 流程 | [[workflow_index]] |
| 任務 | [[task_index]] |
| 專案 | [[project_index]] |
| 錯誤排除 | [[troubleshooting_index]] |
| 資料筆記 | [[data_index]] |
| 公式筆記 | [[formula_index]] |
| 業務背景 | [[business_context_index]] |
| 術語 | [[glossary_index]] |

---

## 2. 快速入口

| 區塊 | 用途 |
|---|---|
| [[#3. 每日學習紀錄]] | 查看每日學習內容與整理狀態 |
| [[#4. 每週學習摘要]] | 查看每週學習成果與進度 |
| [[#5. 每月學習回顧]] | 查看每月總結與能力成長 |
| [[#6. 會議整理紀錄]] | 查看會議重點與待辦 |
| [[#7. 主題時間線]] | 查看某個主題在哪些日期出現過 |
| [[#8. Wiki 轉換追蹤]] | 追蹤哪些 log 已整理成正式 wiki 筆記 |
| [[#9. 待整理項目]] | 查看尚未補成 wiki 的內容 |

---

## 3. 每日學習紀錄

本區塊列出 `logs/daily/` 中的每日紀錄。

| 日期 | Daily Log | 主要主題 | 相關任務 / 專案 | Wiki 整理狀態 | 備註 |
|---|---|---|---|---|---|
| YYYY-MM-DD | `logs/daily/YYYY-MM-DD.md` |  |  | not_started / partial / completed |  |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 日期 | 學習紀錄日期 |
| Daily Log | 對應的每日整理檔 |
| 主要主題 | 當天接觸的概念、工具、流程、任務或問題 |
| 相關任務 / 專案 | 若當天內容與特定任務或專案有關，填入對應連結 |
| Wiki 整理狀態 | 是否已從 daily log 萃取正式 wiki 筆記 |
| 備註 | 需要補充的狀態、問題或提醒 |

---

## 4. 每週學習摘要

本區塊列出 `logs/weekly/` 中的每週摘要。

| 週次 | 日期範圍 | Weekly Summary | 本週重點 | 任務進度 | 待補 Wiki | 備註 |
|---|---|---|---|---|---|---|
| YYYY-WW | YYYY-MM-DD ~ YYYY-MM-DD | `logs/weekly/YYYY-WW.md` |  |  |  |  |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 週次 | 使用 `YYYY-WW` 格式 |
| 日期範圍 | 該週涵蓋的日期 |
| Weekly Summary | 對應的每週摘要檔 |
| 本週重點 | 本週最重要的學習主題 |
| 任務進度 | 本週任務或專案推進狀態 |
| 待補 Wiki | 需要從本週內容整理出的正式 wiki 筆記 |
| 備註 | 其他補充事項 |

---

## 5. 每月學習回顧

本區塊列出 `logs/monthly/` 中的每月回顧。

| 月份 | Monthly Review | 本月重點 | 主要成果 | 能力成長 | 下月方向 |
|---|---|---|---|---|---|
| YYYY-MM | `logs/monthly/YYYY-MM.md` |  |  |  |  |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 月份 | 使用 `YYYY-MM` 格式 |
| Monthly Review | 對應的每月回顧檔 |
| 本月重點 | 本月主要學習主題 |
| 主要成果 | 本月完成的任務、專案或文件 |
| 能力成長 | 技術、工具、業務理解或工作流程上的成長 |
| 下月方向 | 下月應持續追蹤或補強的內容 |

---

## 6. 會議整理紀錄

本區塊列出 `logs/meetings/` 中的會議整理。

| 日期 | Meeting Note | 會議主題 | 相關任務 / 專案 | 待辦事項 | 敏感資訊狀態 |
|---|---|---|---|---|---|
| YYYY-MM-DD | `logs/meetings/YYYY-MM-DD_meeting_topic.md` |  |  |  | unchecked / reviewed / abstracted |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 日期 | 會議日期 |
| Meeting Note | 對應的會議整理檔 |
| 會議主題 | 會議主要討論內容 |
| 相關任務 / 專案 | 會議內容涉及的任務或專案 |
| 待辦事項 | 會議後需要執行或確認的事項 |
| 敏感資訊狀態 | 是否已檢查或抽象化敏感資訊 |

### 會議內容注意事項

- 會議紀錄通常較容易包含敏感資訊。
- 不要在本 index 中保存完整會議內容。
- 不要保存未遮蔽截圖、內部系統網址、帳號、密碼、API Key、Token 或客戶資料。
- 若會議內容涉及內部系統或組織流程，應使用抽象化描述。

---

## 7. 主題時間線

本區塊用於追蹤某個主題在不同日期出現的情況。

| 主題 | 類型 | 首次出現日期 | 出現紀錄 | 目前整理狀態 | 對應 Wiki |
|---|---|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary | YYYY-MM-DD | `logs/daily/...` | not_started / partial / completed |  |

### 使用方式

當某個主題在多天反覆出現時，可以在此建立時間線，例如：

| 主題 | 類型 | 首次出現日期 | 出現紀錄 | 目前整理狀態 | 對應 Wiki |
|---|---|---|---|---|---|
| Google ADK | tool | YYYY-MM-DD | `logs/daily/YYYY-MM-DD.md` | partial | `wiki/tools/google_adk.md` |
| PoC | concept | YYYY-MM-DD | `logs/daily/YYYY-MM-DD.md` | completed | `wiki/concepts/proof_of_concept.md` |

---

## 8. Wiki 轉換追蹤

本區塊用於追蹤哪些 `logs/` 內容已經整理成正式 `wiki/` 筆記。

| 來源 Log | 可整理項目 | 建議分類 | 已建立 Wiki | 狀態 |
|---|---|---|---|---|
| `logs/daily/YYYY-MM-DD.md` |  | `wiki/concepts/` |  | not_started / partial / completed |

### 建議分類

| 建議分類 | 適用內容 |
|---|---|
| `wiki/concepts/` | 概念、理論、技術名詞、抽象知識 |
| `wiki/tools/` | 工具、平台、套件、系統操作 |
| `wiki/workflows/` | 流程、步驟、輸入輸出、判斷條件 |
| `wiki/tasks/` | 任務、待辦、交付內容 |
| `wiki/projects/` | 專案、PoC、原型、階段性工作 |
| `wiki/troubleshooting/` | 錯誤、異常、排查、解法 |
| `wiki/data_notes/` | 資料來源、欄位、資料品質、資料處理 |
| `wiki/formulas/` | 公式、模型、指標、計算方式 |
| `wiki/business_context/` | 業務背景、組織流程、審查流程、上線流程 |
| `wiki/glossary/` | 縮寫、術語、英文專有名詞與中文翻譯 |

---

## 9. 待整理項目

本區塊整理目前尚未補成正式 wiki 筆記的內容。

| 項目 | 來源 | 建議分類 | 優先度 | 原因 |
|---|---|---|---|---|
|  | `logs/daily/YYYY-MM-DD.md` | `wiki/concepts/` | 高 / 中 / 低 |  |

### 優先度判斷

| 優先度 | 判斷標準 |
|---|---|
| 高 | 會重複使用、主管要求、任務核心、專案核心、容易忘記或容易出錯 |
| 中 | 有學習價值，但目前不是主要任務核心 |
| 低 | 只是輔助背景，短期內不影響任務執行 |

---

## 10. 近期更新紀錄

| 日期 | 更新內容 | 相關位置 |
|---|---|---|
| YYYY-MM-DD |  |  |

---

## 11. 維護規則

### 必須維護

- 新增 `logs/daily/` 檔案後，應更新 [[#3. 每日學習紀錄]]。
- 新增 `logs/weekly/` 檔案後，應更新 [[#4. 每週學習摘要]]。
- 新增 `logs/monthly/` 檔案後，應更新 [[#5. 每月學習回顧]]。
- 新增 `logs/meetings/` 檔案後，應更新 [[#6. 會議整理紀錄]]。
- 從 log 萃取正式 wiki 筆記後，應更新 [[#8. Wiki 轉換追蹤]]。
- 若某個主題多次出現，應更新 [[#7. 主題時間線]]。

### 不建議

- 不要把完整 daily log、weekly summary、monthly review 或 meeting note 複製到本頁。
- 不要在本頁保存完整會議內容。
- 不要在本頁保存客戶資料、帳號、密碼、API Key、Token、完整內部系統網址或未遮蔽截圖。
- 不要把本頁當成正式知識頁；正式知識應整理到 `wiki/`。
- 不要在本頁建立 Knowledge Graph 關聯區塊；Knowledge Graph 關係應放在正式 `wiki/` 筆記內。

---

## 12. 與其他 Index 的關係

| Index | 關係 |
|---|---|
| [[home]] | 從首頁進入本學習索引 |
| [[concept_index]] | 從學習紀錄萃取出的概念筆記會進入此 index |
| [[tool_index]] | 從學習紀錄萃取出的工具筆記會進入此 index |
| [[workflow_index]] | 從學習紀錄萃取出的流程筆記會進入此 index |
| [[task_index]] | 從學習紀錄萃取出的任務筆記會進入此 index |
| [[project_index]] | 從學習紀錄萃取出的專案筆記會進入此 index |
| [[troubleshooting_index]] | 從學習紀錄萃取出的錯誤排除筆記會進入此 index |
| [[data_index]] | 從學習紀錄萃取出的資料筆記會進入此 index |
| [[formula_index]] | 從學習紀錄萃取出的公式筆記會進入此 index |
| [[business_context_index]] | 從學習紀錄萃取出的業務背景筆記會進入此 index |
| [[glossary_index]] | 從學習紀錄萃取出的術語筆記會進入此 index |

---

## 13. 下一步

- [ ] 新增每日紀錄到 [[#3. 每日學習紀錄]]
- [ ] 新增每週摘要到 [[#4. 每週學習摘要]]
- [ ] 新增每月回顧到 [[#5. 每月學習回顧]]
- [ ] 新增會議整理到 [[#6. 會議整理紀錄]]
- [ ] 檢查是否有待整理成 wiki 的項目
- [ ] 更新 [[home]] 的近期學習重點
