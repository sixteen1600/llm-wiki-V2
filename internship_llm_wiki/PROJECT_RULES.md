# PROJECT_RULES.md

本文件是 `internship_llm_wiki` 的專案規則。
用途是讓使用者在維護實習 LLM-Wiki 時，有一套固定、穩定、不容易混亂的操作原則。

詳細給 Codex / LLM Agent 使用的規範請見：

```text
AGENTS.md
```

---

# 1. 專案定位

本專案是一個「實習學習紀錄型 LLM-Wiki」。

它不是單純的每日筆記資料夾，也不是一般程式碼專案，而是用來整理實習期間學到的：

* 工具
* 概念
* 工作流程
* 任務紀錄
* 專案紀錄
* 錯誤排除
* 資料處理知識
* 業務背景知識
* 專有名詞
* 數學公式、統計公式、模型公式與指標計算方式

本專案的目標是讓實習學習內容可以被長期保存、查詢、複習，並且能夠整理成可向主管說明的學習成果。

---

# 2. 核心資料流

本專案採用以下資料流：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

各層用途如下：

| 層級                    | 用途                     |
| --------------------- | ---------------------- |
| `raw/imported_notes/` | 保存原始匯入的混合式 Markdown 筆記 |
| `logs/`               | 保存整理後的時間序學習紀錄          |
| `wiki/`               | 保存整理後的正式主題知識           |
| `indexes/`            | 保存主題導覽與索引              |

---

# 3. 基本原則

本專案必須遵守以下原則：

1. 原始筆記放在 `raw/imported_notes/`。
2. 每日、每週、每月與會議紀錄放在 `logs/`。
3. 正式整理後的知識放在 `wiki/`。
4. 主題導覽放在 `indexes/`。
5. 圖片、圖表與正式附件放在 `assets/`。
6. 筆記模板放在 `templates/`。
7. Codex 常用提示詞放在 `prompts/`。
8. 過時或棄用內容放在 `archive/`。
9. 不要任意新增頂層資料夾。
10. 不要任意新增 `wiki/` 的大分類資料夾。
11. 新主題應透過新增 Markdown 頁面、更新 index、加入 tag 與 frontmatter 管理。
12. 涉及公司敏感資訊時，必須先抽象化再整理。

---

# 4. raw/ 使用規則

`raw/` 是原始資料層。

```text
raw/
├── imported_notes/
├── inbox/
└── processed/
```

## 4.1 raw/imported_notes/

`raw/imported_notes/` 用來保存正式匯入的原始 Markdown 筆記。

這些筆記可能同時包含：

* 文字內容
* 截圖引用
* 附件引用
* 會議重點
* 任務紀錄
* 工具學習
* 概念說明
* 公式
* 尚未整理的想法

規則：

1. 原始筆記應盡量保留原樣。
2. 不要直接刪除原始筆記。
3. 不要把原始筆記直接當成正式 wiki。
4. 原始筆記整理後，應產生對應的 `logs/` 或 `wiki/` 內容。
5. 如果原始筆記含有敏感資訊，整理到正式筆記時必須抽象化。

建議放置方式：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

若筆記有附件，建議使用：

```text
raw/imported_notes/2026/2026_07_03_Fri/
├── 2026_07_03_Fri.md
└── attachments/
    ├── image_001.png
    └── file_001.pdf
```

## 4.2 raw/inbox/

`raw/inbox/` 是臨時暫存區。

適合放：

* 尚未確認是否要整理的筆記
* 臨時文字
* 未分類素材
* 待確認附件

規則：

1. `raw/inbox/` 不應長期堆積。
2. 確認要整理後，應移至 `raw/imported_notes/`。
3. 不需要保留的素材應由使用者自行判斷是否刪除。

## 4.3 raw/processed/

`raw/processed/` 用來保存已經處理過，但仍需要保留的原始資料副本或處理紀錄。

規則：

1. 不應把 `raw/processed/` 當成正式知識庫。
2. 正式知識仍應放在 `wiki/`。
3. 若內容過時或不需要，可視情況移至 `archive/`。

---

# 5. logs/ 使用規則

`logs/` 是時間序紀錄層。

```text
logs/
├── daily/
├── weekly/
├── monthly/
└── meetings/
```

`logs/` 的目標是回答：

> 我在什麼時間學到了什麼？

## 5.1 logs/daily/

每日摘要放在：

```text
logs/daily/
```

命名格式：

```text
YYYY-MM-DD.md
```

範例：

```text
logs/daily/2026-07-03.md
```

每日摘要應包含：

* 今日主要學習內容
* 今日任務
* 今日接觸的工具
* 今日學到的概念
* 今日遇到的問題
* 後續可整理成 wiki 的主題
* 來源原始筆記

## 5.2 logs/weekly/

每週總結放在：

```text
logs/weekly/
```

命名格式：

```text
YYYY-Www.md
```

範例：

```text
logs/weekly/2026-W27.md
```

每週總結應包含：

* 本週學習重點
* 本週完成任務
* 本週新增 wiki 頁面
* 本週遇到的問題
* 可向主管回報的成果
* 下週待學習主題

## 5.3 logs/monthly/

每月回顧放在：

```text
logs/monthly/
```

命名格式：

```text
YYYY-MM.md
```

範例：

```text
logs/monthly/2026-07.md
```

每月回顧應包含：

* 本月主要學習主題
* 本月參與的任務與專案
* 本月新增的正式知識
* 本月能力成長
* 後續需要補強的地方

## 5.4 logs/meetings/

會議紀錄放在：

```text
logs/meetings/
```

命名格式：

```text
YYYY-MM-DD_short_meeting_name.md
```

範例：

```text
logs/meetings/2026-07-03_team_meeting.md
```

會議紀錄應包含：

* 會議日期
* 會議主題
* 重要討論內容
* 主管或同事提醒
* 待辦事項
* 可整理成 wiki 的知識

## 5.5 logs/ 的限制

1. `logs/` 不依主題新增資料夾。
2. 不要建立 `logs/google_adk/`、`logs/sql/`、`logs/formulas/` 這類資料夾。
3. 若要依主題查詢，應使用 `wiki/` 與 `indexes/`。
4. `logs/` 是時間紀錄，不是正式知識頁。
5. 重要內容應進一步整理到 `wiki/`。

---

# 6. wiki/ 使用規則

`wiki/` 是正式知識層。

```text
wiki/
├── concepts/
├── tools/
├── workflows/
├── tasks/
├── projects/
├── troubleshooting/
├── data_notes/
├── business_context/
├── formulas/
└── glossary/
```

## 6.1 wiki/concepts/

放概念解釋。

適合內容：

* PoC
* API
* ETL
* RAG
* Data Warehouse
* Agent Workflow
* 資料治理
* 系統架構概念

## 6.2 wiki/tools/

放工具使用筆記。

適合內容：

* Google ADK
* Python
* SQL
* Excel
* Power BI
* Git
* Docker
* Codex Desktop
* Obsidian

## 6.3 wiki/workflows/

放可重複執行的流程。

適合內容：

* 報告產製流程
* 資料清洗流程
* 資料管線流程
* 上線前檢查流程
* Google ADK 產報告流程
* wiki 整理流程

## 6.4 wiki/tasks/

放單次任務紀錄。

適合內容：

* 某天完成的主管交辦事項
* 某份報表整理
* 某次資料修正
* 某次測試或驗證

命名建議：

```text
task_YYYYMMDD_short_description.md
```

## 6.5 wiki/projects/

放多階段專案紀錄。

適合內容：

* Google ADK PoC
* RAG 原型
* LLM-Wiki 建置
* 資料解析 pipeline
* 報表自動化專案

## 6.6 wiki/troubleshooting/

放錯誤排除紀錄。

適合內容：

* 安裝錯誤
* 執行錯誤
* API 錯誤
* SQL 錯誤
* 資料格式錯誤
* Python 環境錯誤

## 6.7 wiki/data_notes/

放資料理解與資料處理相關筆記。

適合內容：

* 欄位邏輯
* 日期格式
* 缺失值處理
* 資料清洗注意事項
* 資料品質問題
* 資料表概念

注意：不得保存真實客戶資料、完整內部表名、敏感欄位代碼。

## 6.8 wiki/business_context/

放業務背景與公司流程理解。

適合內容：

* 壽險相關概念
* 金融業務背景
* 部門流程
* 審核流程
* 上線流程
* EAB / CAB 類型概念

注意：應使用抽象化描述，不保存內部機密細節。

## 6.9 wiki/formulas/

放公式類筆記。

適合內容：

* 數學公式
* 統計公式
* 模型定義
* 評分公式
* 損失函數
* 指標計算公式
* 符號定義

公式應使用 LaTeX 格式，並補上符號說明與使用情境。

## 6.10 wiki/glossary/

放專有名詞字典。

適合內容：

* 英文縮寫
* 公司或業務中常聽到的術語
* 技術名詞
* 金融或壽險名詞

---

# 7. indexes/ 使用規則

`indexes/` 是導覽層。

```text
indexes/
├── home.md
├── learning_index.md
├── task_index.md
├── project_index.md
├── tool_index.md
├── workflow_index.md
├── troubleshooting_index.md
├── data_index.md
├── formula_index.md
└── glossary_index.md
```

使用規則：

1. 新增 wiki 頁面後，應更新相關 index。
2. Index 應簡潔，不要寫成完整文章。
3. Index 應使用 Markdown 連結或 Obsidian 雙向連結。
4. 主題導覽應放在 index，不要靠新增資料夾解決。
5. 若新增公式頁面，應更新 `indexes/formula_index.md`。
6. 若新增術語頁面，應更新 `indexes/glossary_index.md`。

---

# 8. templates/ 使用規則

`templates/` 放筆記模板。

新增筆記時，應優先參考對應模板。

| 筆記類型 | 模板                                  |
| ---- | ----------------------------------- |
| 每日摘要 | `templates/daily_log.md`            |
| 每週總結 | `templates/weekly_summary.md`       |
| 每月回顧 | `templates/monthly_review.md`       |
| 會議紀錄 | `templates/meeting_note.md`         |
| 任務紀錄 | `templates/task_note.md`            |
| 專案紀錄 | `templates/project_note.md`         |
| 概念筆記 | `templates/concept_note.md`         |
| 工具筆記 | `templates/tool_note.md`            |
| 流程筆記 | `templates/workflow_note.md`        |
| 錯誤排除 | `templates/troubleshooting_note.md` |
| 資料筆記 | `templates/data_note.md`            |
| 公式筆記 | `templates/formula_note.md`         |

模板應保持簡潔，不應包含真實公司資料或敏感資訊。

---

# 9. 命名規則

## 9.1 原始筆記

建議格式：

```text
YYYY_MM_DD_Ddd.md
```

範例：

```text
2026_07_03_Fri.md
```

建議路徑：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

## 9.2 logs

```text
logs/daily/YYYY-MM-DD.md
logs/weekly/YYYY-Www.md
logs/monthly/YYYY-MM.md
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

## 9.3 wiki

檔名使用英文小寫與底線。

範例：

```text
wiki/tools/google_adk.md
wiki/concepts/proof_of_concept.md
wiki/workflows/report_generation_workflow.md
wiki/projects/google_adk_poc_project.md
wiki/formulas/weighted_average.md
```

規則：

1. 不使用中文檔名。
2. 不使用空白。
3. 不使用特殊符號。
4. 不使用過長檔名。
5. 同一主題已有頁面時，優先更新既有頁面。

---

# 10. Frontmatter 規則

正式 `logs/` 與 `wiki/` 筆記建議加入 YAML frontmatter。

每日紀錄範例：

```yaml
---
type: daily_log
date: 2026-07-03
source:
  - raw/imported_notes/2026/2026_07_03_Fri.md
topics:
  - google_adk
  - poc
  - eab
  - cab
status: draft
---
```

wiki 筆記範例：

```yaml
---
type: tool
topic: google_adk
source:
  - raw/imported_notes/2026/2026_07_03_Fri.md
related_logs:
  - logs/daily/2026-07-03.md
tags:
  - google_adk
  - poc
status: draft
---
```

公式筆記範例：

```yaml
---
type: formula
topic: weighted_average
source:
  - raw/imported_notes/2026/2026_07_03_Fri.md
related_logs:
  - logs/daily/2026-07-03.md
tags:
  - formula
  - metric
status: draft
---
```

常用欄位：

| 欄位             | 用途                                      |
| -------------- | --------------------------------------- |
| `type`         | 筆記類型                                    |
| `topic`        | 主要主題                                    |
| `date`         | 日期                                      |
| `source`       | 來源原始筆記                                  |
| `related_logs` | 相關時間序紀錄                                 |
| `tags`         | 主題標籤                                    |
| `status`       | 狀態，例如 `draft`、`reviewed`、`needs_review` |

---

# 11. 公式規則

如果筆記中出現公式，應優先整理到：

```text
wiki/formulas/
```

公式應使用 LaTeX。

行內公式：

```text
$score = raw\_score \times weight$
```

區塊公式：

```text
$$
decay\_weight = TIME\_DECAY\_FACTOR^{period\_gap}
$$
```

公式筆記應包含：

1. 背景
2. 公式
3. 符號說明
4. 使用情境
5. 計算範例
6. 注意事項
7. 來源
8. 相關筆記

公式規則：

1. 不只貼公式，必須補上解釋。
2. 不任意改寫原始公式的數學意義。
3. 不確定的公式應標記為 `needs_review`。
4. 若公式來自圖片，應轉寫成 LaTeX 並標記待確認。
5. 若公式涉及公司內部敏感計算邏輯，應抽象化處理。

---

# 12. 保密規則

本專案不得保存或擴散敏感資訊。

不得寫入正式筆記的內容包括：

1. 客戶姓名、身分證字號、電話、地址、Email。
2. 保單號碼、交易資料、真實客戶紀錄。
3. 公司內部帳號、密碼、API Key、Token、憑證。
4. 未遮蔽的內部系統截圖。
5. 未經允許的公司內部原始碼。
6. 公司內部完整資料表名稱。
7. 敏感欄位代碼。
8. 可反推公司內部系統架構的細節。
9. 非公開商業策略。
10. 內部會議決策。
11. 公司內部敏感計算公式或決策公式。

若需要記錄，應改寫成抽象描述。

範例：

不應寫：

```text
某客戶的姓名、身分證字號與保單號碼。
```

應改寫為：

```text
某筆客戶資料包含身分識別欄位與保單識別欄位，處理時必須先去識別化。
```

不應寫：

```text
公司內部實際核准公式 = 欄位A * 權重B + 欄位C。
```

應改寫為：

```text
某內部流程使用加權評分概念，整理筆記時僅保留抽象計算邏輯。
```

---

# 13. Codex 使用規則

使用 Codex 整理筆記時，應要求 Codex：

1. 不修改原始筆記。
2. 先檢查是否有敏感資訊。
3. 先整理 `logs/daily/`。
4. 再萃取正式知識到 `wiki/`。
5. 新增或修改 wiki 後更新 index。
6. 若有公式，整理到 `wiki/formulas/`。
7. 若不確定內容正確性，標記為待確認。
8. 回報新增、修改與需要人工確認的檔案。

不要讓 Codex：

1. 任意新增資料夾。
2. 刪除原始資料。
3. 大量重構整個專案。
4. 直接複製原始筆記到正式 wiki。
5. 編造不存在的主管要求或專案背景。
6. 保存未抽象化的公司敏感資訊。

---

# 14. 每日維護流程

每日建議流程：

1. 將原始 Markdown 筆記放入 `raw/imported_notes/`。
2. 請 Codex 產生 `logs/daily/YYYY-MM-DD.md`。
3. 檢查每日摘要是否正確。
4. 請 Codex 從每日摘要中整理可沉澱的 wiki 頁面。
5. 更新相關 index。
6. 標記需要人工確認的內容。

---

# 15. 每週維護流程

每週建議流程：

1. 整理本週 `logs/daily/`。
2. 產生 `logs/weekly/YYYY-Www.md`。
3. 檢查本週新增的 wiki 頁面。
4. 更新 indexes。
5. 檢查是否有重複頁面。
6. 整理可向主管回報的學習成果。
7. 標記下週需要繼續學習的主題。

---

# 16. 每月維護流程

每月建議流程：

1. 整理本月 `logs/weekly/`。
2. 產生 `logs/monthly/YYYY-MM.md`。
3. 檢查本月新增的任務與專案。
4. 檢查重要工具、流程、公式是否已整理成正式 wiki。
5. 檢查是否有過時內容需要移至 `archive/`。
6. 整理本月能力成長與後續補強方向。

---

# 17. 不應該做的事

本專案不應該：

1. 把所有內容都放在 `raw/` 不整理。
2. 把所有內容都放在 `logs/` 不萃取 wiki。
3. 每遇到新主題就新增資料夾。
4. 把 `logs/` 改成主題分類。
5. 把 `wiki/` 改成主題資料夾分類。
6. 保存公司敏感資訊。
7. 保存未遮蔽的內部截圖。
8. 保存真實客戶資料。
9. 保存內部帳密或 API Key。
10. 未經確認就整理公司內部公式或決策邏輯。
11. 讓 Codex 大量改動原始筆記。
12. 讓 Codex 編造不存在的內容。

---

# 18. 本專案的判斷標準

整理任何內容時，先問以下問題：

1. 這是原始筆記嗎？
   → 放 `raw/imported_notes/`

2. 這是某一天學到的內容嗎？
   → 放 `logs/daily/`

3. 這是可重複使用的正式知識嗎？
   → 放 `wiki/`

4. 這是工具嗎？
   → 放 `wiki/tools/`

5. 這是概念嗎？
   → 放 `wiki/concepts/`

6. 這是流程嗎？
   → 放 `wiki/workflows/`

7. 這是任務嗎？
   → 放 `wiki/tasks/`

8. 這是多階段專案嗎？
   → 放 `wiki/projects/`

9. 這是錯誤與解法嗎？
   → 放 `wiki/troubleshooting/`

10. 這是資料處理或欄位理解嗎？
    → 放 `wiki/data_notes/`

11. 這是業務背景或部門流程嗎？
    → 放 `wiki/business_context/`

12. 這是公式、模型或指標計算嗎？
    → 放 `wiki/formulas/`

13. 這是術語嗎？
    → 放 `wiki/glossary/`

14. 這需要被查到嗎？
    → 更新 `indexes/`

15. 這可能有敏感資訊嗎？
    → 先抽象化或標記待確認

---

# 19. 總結

本專案的核心精神是：

```text
原始筆記保留在 raw/
時間紀錄整理到 logs/
正式知識沉澱到 wiki/
主題導覽維護在 indexes/
```

使用者負責提供原始筆記與審核內容。
Codex 負責協助整理、分類、更新與維護。
所有內容都必須遵守保密原則，並以長期可查詢、可複習、可回顧為目標。
