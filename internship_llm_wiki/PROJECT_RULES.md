# PROJECT_RULES.md

本文件是 `internship_llm_wiki` 的專案規則。
用途是讓使用者在維護實習 LLM-Wiki 時，有一套固定、穩定、不容易混亂的操作原則。

詳細給 Codex / LLM Agent 使用的完整規範請見：

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

# 2. Repository 與 Workspace 邊界

本 GitHub repository 的外層可能長這樣：

```text
llm-wiki-V2/
├── internship_llm_wiki/
├── others/
└── archive/
```

其中：

```text
llm-wiki-V2/internship_llm_wiki/
```

才是正式的 Obsidian vault 與 Codex workspace。

也就是說，Obsidian 與 Codex Desktop 都應該開啟：

```text
internship_llm_wiki/
```

不要開啟外層的：

```text
llm-wiki-V2/
```

外層資料夾定位如下：

| 資料夾                    | 定位                            | 是否屬於正式 LLM-Wiki |
| ---------------------- | ----------------------------- | --------------- |
| `internship_llm_wiki/` | 正式 Obsidian / Codex workspace | 是               |
| `others/`              | 備份、zip、臨時腳本、舊版產物              | 否               |
| `archive/`             | 外層封存區、舊版或棄用內容                 | 否               |

規則：

1. `internship_llm_wiki/` 是正式工作區。
2. `others/` 不屬於正式知識庫。
3. `archive/` 不屬於正式知識庫。
4. Codex 不應主動讀取、整理、萃取或修改外層 `others/` 與 `archive/`。
5. 除非使用者明確要求，否則外層資料夾不得被當成 raw、logs、wiki 或 indexes 的來源。
6. 若有 `.agents/`，應放在正式 workspace 內，作為 agent skill 或工具設定使用，但不屬於正式 wiki 內容來源。

---

# 3. 核心資料流

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

基本原則：

1. 原始筆記放在 `raw/imported_notes/`。
2. 每日、每週、每月與會議紀錄放在 `logs/`。
3. 正式整理後的知識放在 `wiki/`。
4. 主題導覽放在 `indexes/`。
5. 圖片與正式附件放在 `assets/`。
6. 筆記模板放在 `templates/`。
7. Codex 常用提示詞放在 `prompts/`。
8. PowerShell 輔助腳本放在 `scripts/`。
9. 不要任意新增頂層資料夾。
10. 不要任意新增 `wiki/` 的大分類資料夾。
11. 新主題應透過新增 Markdown 頁面、更新 index、加入 tag 與 frontmatter 管理。
12. 涉及公司敏感資訊時，必須先抽象化再整理。

---

# 4. 正式 Workspace 結構

正式 workspace 應維持以下結構：

```text
internship_llm_wiki/
│
├── AGENTS.md
├── README.md
├── PROJECT_RULES.md
├── CODEX_WORKFLOW.md
├── OBSIDIAN_GUIDE.md
│
├── raw/
│   ├── inbox/
│   └── imported_notes/
│
├── logs/
│   ├── daily/
│   ├── weekly/
│   ├── monthly/
│   └── meetings/
│
├── wiki/
│   ├── concepts/
│   ├── tools/
│   ├── workflows/
│   ├── tasks/
│   ├── projects/
│   ├── troubleshooting/
│   ├── data_notes/
│   ├── formulas/
│   ├── business_context/
│   └── glossary/
│
├── indexes/
│   ├── home.md
│   ├── learning_index.md
│   ├── concept_index.md
│   ├── task_index.md
│   ├── project_index.md
│   ├── tool_index.md
│   ├── workflow_index.md
│   ├── troubleshooting_index.md
│   ├── data_index.md
│   ├── formula_index.md
│   ├── business_context_index.md
│   └── glossary_index.md
│
├── assets/
│   ├── images/
│   └── files/
│
├── templates/
│   ├── daily_log.md
│   ├── weekly_summary.md
│   ├── monthly_review.md
│   ├── meeting_note.md
│   ├── task_note.md
│   ├── project_note.md
│   ├── concept_note.md
│   ├── tool_note.md
│   ├── workflow_note.md
│   ├── troubleshooting_note.md
│   ├── data_note.md
│   └── formula_note.md
│
├── prompts/
│   ├── 01_import_raw_note.md
│   ├── 02_generate_daily_log.md
│   ├── 03_extract_wiki_notes.md
│   ├── 04_update_indexes.md
│   ├── 05_generate_weekly_summary.md
│   ├── 06_generate_monthly_review.md
│   ├── 07_process_meeting_note.md
│   └── 08_sensitive_info_review.md
│
├── scripts/
│   ├── README.md
│   ├── _shared.ps1
│   ├── import_note.ps1
│   ├── generate_daily.ps1
│   ├── extract_wiki.ps1
│   ├── update_indexes.ps1
│   ├── weekly_summary.ps1
│   ├── monthly_review.ps1
│   ├── meeting_note.ps1
│   ├── sensitive_review.ps1
│   └── show_workflow.ps1
│
└── .agents/
    └── skills/
        └── karpathy-llm-wiki/
```

注意：

1. `raw/processed/` 目前不作為正式使用資料夾。
2. `assets/diagrams/` 目前不作為正式使用資料夾。
3. `examples/` 不放在正式 workspace 內。
4. `archive/` 不放在正式 workspace 內，而是放在 repository 外層。
5. `others/` 不放在正式 workspace 內，而是放在 repository 外層。
6. `.agents/` 若存在，只作為 agent skill 或工具設定使用，不屬於正式 wiki 內容。

---

# 5. raw/ 使用規則

`raw/` 是原始資料層。

```text
raw/
├── inbox/
└── imported_notes/
```

---

## 5.1 raw/inbox/

`raw/inbox/` 是臨時暫存區。

適合放：

* 尚未確認是否要整理的筆記
* 臨時文字
* 未分類素材
* 待確認附件
* 尚未匯入的 Markdown 原始筆記

規則：

1. `raw/inbox/` 不應長期堆積。
2. 確認要整理後，應使用 `prompts/01_import_raw_note.md` 匯入至 `raw/imported_notes/`。
3. 不需要保留的素材應由使用者自行判斷是否刪除。
4. Codex 不應擅自刪除 `raw/inbox/` 的內容。

---

## 5.2 raw/imported_notes/

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
6. 如果原始筆記含有公式，整理時應保留公式的數學意義，不可任意改寫。
7. 如果原始筆記含有圖片或附件，應保留引用關係。
8. 圖片或附件若尚未確認是否可公開，不得移入 `assets/`。

建議放置方式：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

若筆記有附件，建議使用「一篇筆記一個資料夾」：

```text
raw/imported_notes/2026/2026_07_03_Fri/
├── 2026_07_03_Fri.md
└── attachments/
    ├── image_001.png
    └── file_001.pdf
```

---

# 6. logs/ 使用規則

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

---

## 6.1 logs/daily/

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
* 可能需要整理成 wiki 的主題
* 來源原始筆記
* 敏感資訊檢查狀態
* 待確認事項

規則：

1. daily log 是整理後的時間序摘要，不是 raw note。
2. 不要把 raw note 原文完整複製到 daily log。
3. daily log 應保留 source trace。
4. daily log 應列出後續可整理成 wiki 的候選項目。
5. daily log 不直接取代 wiki。
6. 可複習、可查詢、可長期維護的內容應進一步整理到 `wiki/`。

---

## 6.2 logs/weekly/

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
* 本週新增或更新的 wiki 頁面
* 本週遇到的問題
* 本週待確認事項
* 可向主管回報的成果
* 下週待學習主題

規則：

1. weekly summary 是週次回顧，不是正式 wiki。
2. 不要在 weekly summary 中保存完整敏感內容。
3. 若發現新主題，應列為 wiki 候選，而不是直接寫成完整知識頁。
4. 若發現 index 缺漏，應在後續使用 `prompts/04_update_indexes.md` 更新。

---

## 6.3 logs/monthly/

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
* 本月工具與流程學習
* 本月遇到的主要問題
* 本月能力成長
* 後續需要補強的地方
* 可向主管回報的成果

規則：

1. monthly review 是月度回顧，不是正式 wiki。
2. 不要在 monthly review 中保存完整敏感內容。
3. 可長期複習的內容應進一步沉澱到 `wiki/`。
4. 若有過時內容，可由使用者決定是否移至外層 `archive/`。

---

## 6.4 logs/meetings/

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
* 需要人工確認或可能涉及敏感資訊的內容

規則：

1. meeting note 是會議內容整理，不是正式 wiki。
2. 不要保存完整內部會議決策。
3. 不要保存敏感流程細節。
4. 若內容涉及內部流程，應抽象化。
5. 若會議中出現可長期使用的知識，應列為 wiki 候選。

---

## 6.5 logs/ 的限制

1. `logs/` 不依主題新增資料夾。
2. 不要建立 `logs/google_adk/`、`logs/sql/`、`logs/formulas/` 這類資料夾。
3. 若要依主題查詢，應使用 `wiki/` 與 `indexes/`。
4. `logs/` 是時間紀錄，不是正式知識頁。
5. 重要內容應進一步整理到 `wiki/`。

---

# 7. wiki/ 使用規則

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
├── formulas/
├── business_context/
└── glossary/
```

---

## 7.1 wiki/concepts/

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

---

## 7.2 wiki/tools/

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

---

## 7.3 wiki/workflows/

放可重複執行的流程。

適合內容：

* 報告產製流程
* 資料清洗流程
* 資料管線流程
* 上線前檢查流程
* Google ADK 產報告流程
* wiki 整理流程

---

## 7.4 wiki/tasks/

放單次任務紀錄。

適合內容：

* 某天完成的主管交辦事項
* 某份報表整理
* 某次資料修正
* 某次測試或驗證
* 某次文件整理任務

命名建議：

```text
task_YYYYMMDD_short_description.md
```

---

## 7.5 wiki/projects/

放多階段專案紀錄。

適合內容：

* Google ADK PoC
* RAG 原型
* LLM-Wiki 建置
* 資料解析 pipeline
* 報表自動化專案

---

## 7.6 wiki/troubleshooting/

放錯誤排除紀錄。

適合內容：

* 安裝錯誤
* 執行錯誤
* API 錯誤
* SQL 錯誤
* 資料格式錯誤
* Python 環境錯誤
* PowerShell 腳本錯誤

---

## 7.7 wiki/data_notes/

放資料理解與資料處理相關筆記。

適合內容：

* 欄位邏輯
* 日期格式
* 缺失值處理
* 資料清洗注意事項
* 資料品質問題
* 資料表概念
* API 回傳資料理解

注意：

1. 不得保存真實客戶資料。
2. 不得保存完整內部表名。
3. 不得保存敏感欄位代碼。
4. 必要時使用抽象化描述。

---

## 7.8 wiki/formulas/

放公式類筆記。

適合內容：

* 數學公式
* 統計公式
* 模型定義
* 評分公式
* 損失函數
* 指標計算公式
* 符號定義
* 公式截圖轉寫

公式應使用 LaTeX 格式，並補上符號說明與使用情境。

---

## 7.9 wiki/business_context/

放業務背景與公司流程理解。

適合內容：

* 壽險相關概念
* 金融業務背景
* 部門流程
* 審核流程
* 上線流程
* EAB / CAB 類型概念
* 實習工作情境背景

注意：

1. 應使用抽象化描述。
2. 不保存內部機密細節。
3. 不保存完整審查規則。
4. 不保存完整上線流程。
5. 不保存可識別具體部門、人員或內部系統的資訊。

---

## 7.10 wiki/glossary/

放專有名詞字典。

適合內容：

* 英文縮寫
* 公司或業務中常聽到的術語
* 技術名詞
* 金融或壽險名詞
* 中文翻譯
* 中英文對照

命名建議：

```text
wiki/glossary/poc.md
wiki/glossary/api.md
wiki/glossary/etl.md
```

若是完整概念說明，應放在 `wiki/concepts/`；若只是縮寫或術語解釋，放在 `wiki/glossary/`。

---

## 7.11 wiki/ 的共同規則

1. `wiki/` 只放整理後的正式知識。
2. 不要把原始筆記完整複製到 `wiki/`。
3. 不要在 `wiki/` 中保存未處理的敏感資訊。
4. 若同一主題已有頁面，優先更新既有頁面。
5. 不要建立重複頁面。
6. 新增頁面時，應盡量加入 frontmatter。
7. 新增或更新 wiki note 後，應更新相關 index。
8. 不要新增 `wiki/google_adk/`、`wiki/sql/`、`wiki/rag/` 這類主題型資料夾。
9. 主題應透過頁面、tag、frontmatter 與 index 管理。
10. 正式 wiki note 應包含 Knowledge Graph 關聯區塊。
11. 不確定的內容應標記為待確認。

---

# 8. Knowledge Graph 使用規則

本專案不另外建立獨立的 Knowledge Graph index。
Knowledge Graph 關係分散維護在每一篇正式 `wiki/` 筆記中。

正式 wiki note 應包含：

```markdown
## Knowledge Graph 關聯

### 上游知識（Prerequisites）

### 下游知識（Used By）

### 相關知識（Related）

### 關聯類型整理
```

可使用的關聯類型：

| 關聯類型           | 說明                        |
| -------------- | ------------------------- |
| `prerequisite` | 理解本筆記前需要先理解的內容            |
| `used_by`      | 本筆記內容會被哪些任務、專案、流程、工具或公式使用 |
| `related`      | 相關但不是明確上下游的內容             |
| `input`        | 本筆記是某個流程、工具、公式或任務的輸入      |
| `output`       | 本筆記是某個流程、工具、公式或任務的輸出      |
| `similar`      | 與另一筆記概念相近，容易混淆或可比較        |
| `depends_on`   | 本筆記依賴另一筆記中的內容             |
| `part_of`      | 本筆記是某個專案、流程或任務的一部分        |

規則：

1. 關聯必須根據來源內容建立。
2. 不要建立來源沒有支持的關聯。
3. 不要只因為常識上相關就連結。
4. 不要建立會暴露敏感內部流程或系統細節的關聯。
5. 不確定的關聯放入「待確認事項」，不要寫成確定關聯。
6. 優先使用 Obsidian 雙向連結，例如 `[[google_adk]]`。
7. 不要使用 escaped underscore，例如 `[[google\_adk]]`。

---

# 9. indexes/ 使用規則

`indexes/` 是導覽層。

```text
indexes/
├── home.md
├── learning_index.md
├── concept_index.md
├── task_index.md
├── project_index.md
├── tool_index.md
├── workflow_index.md
├── troubleshooting_index.md
├── data_index.md
├── formula_index.md
├── business_context_index.md
└── glossary_index.md
```

使用規則：

1. 新增 wiki 頁面後，應更新相關 index。
2. 新增 logs 頁面後，應更新 `learning_index.md`。
3. Index 應簡潔，不要寫成完整文章。
4. Index 應使用 Markdown 連結或 Obsidian 雙向連結。
5. 主題導覽應放在 index，不要靠新增資料夾解決。
6. 若新增公式頁面，應更新 `indexes/formula_index.md`。
7. 若新增術語頁面，應更新 `indexes/glossary_index.md`。
8. 若新增業務背景頁面，應更新 `indexes/business_context_index.md`。
9. 不建立 `knowledge_graph_index.md`。
10. 不建立 `source_index.md`。
11. 不建立 `daily_index.md`、`meeting_index.md`、`attachment_index.md` 或 `screenshot_index.md`。

Index 對應規則：

| 新增內容                                   | 應更新 index                           |
| -------------------------------------- | ----------------------------------- |
| daily / weekly / monthly / meeting log | `indexes/learning_index.md`         |
| concept note                           | `indexes/concept_index.md`          |
| task note                              | `indexes/task_index.md`             |
| project note                           | `indexes/project_index.md`          |
| tool note                              | `indexes/tool_index.md`             |
| workflow note                          | `indexes/workflow_index.md`         |
| troubleshooting note                   | `indexes/troubleshooting_index.md`  |
| data note                              | `indexes/data_index.md`             |
| formula note                           | `indexes/formula_index.md`          |
| business context note                  | `indexes/business_context_index.md` |
| glossary note                          | `indexes/glossary_index.md`         |
| 重要入口或近期重點                              | `indexes/home.md`                   |

---

# 10. templates/ 使用規則

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

規則：

1. templates 應保持簡潔。
2. templates 不應包含真實公司資料或敏感資訊。
3. 原始筆記不需要照 templates 撰寫。
4. templates 主要用於整理後的 `logs/` 與 `wiki/`。
5. 若某類型暫時沒有專用 template，可使用相近 template 或 prompt 中的通用格式。

---

# 11. prompts/ 使用規則

`prompts/` 放 Codex 可重複使用的任務指令。

```text
prompts/
├── 01_import_raw_note.md
├── 02_generate_daily_log.md
├── 03_extract_wiki_notes.md
├── 04_update_indexes.md
├── 05_generate_weekly_summary.md
├── 06_generate_monthly_review.md
├── 07_process_meeting_note.md
└── 08_sensitive_info_review.md
```

用途：

| Prompt                          | 用途                        |
| ------------------------------- | ------------------------- |
| `01_import_raw_note.md`         | 匯入原始筆記                    |
| `02_generate_daily_log.md`      | 產生 daily log              |
| `03_extract_wiki_notes.md`      | 從 daily log 萃取 wiki notes |
| `04_update_indexes.md`          | 更新 indexes                |
| `05_generate_weekly_summary.md` | 產生 weekly summary         |
| `06_generate_monthly_review.md` | 產生 monthly review         |
| `07_process_meeting_note.md`    | 整理 meeting note           |
| `08_sensitive_info_review.md`   | 進行敏感資訊審查                  |

規則：

1. prompts 是給 Codex 的任務指令，不是正式 wiki 內容。
2. Agent 應依照 prompt 分工執行，不要把多個步驟混在一起。
3. `03_extract_wiki_notes.md` 只負責建立或更新 `wiki/`，不直接更新 `indexes/`。
4. `04_update_indexes.md` 才負責更新 `indexes/`。
5. 若涉及敏感資訊，應先使用或參考 `08_sensitive_info_review.md`。
6. prompts 不應保存真實公司敏感資料。

---

# 12. scripts/ 使用規則

`scripts/` 放 PowerShell 輔助腳本。

```text
scripts/
├── README.md
├── _shared.ps1
├── import_note.ps1
├── generate_daily.ps1
├── extract_wiki.ps1
├── update_indexes.ps1
├── weekly_summary.ps1
├── monthly_review.ps1
├── meeting_note.ps1
├── sensitive_review.ps1
└── show_workflow.ps1
```

規則：

1. `.ps1` 檔案只放 PowerShell 執行邏輯。
2. `.ps1` 不放長篇任務說明。
3. 長篇任務說明應放在 `prompts/*.md`。
4. scripts 不直接呼叫固定 Codex CLI。
5. scripts 主要負責產生 `.codex_requests/` 中的 Markdown request。
6. `.codex_requests/` 是執行時產物，不屬於正式知識內容。
7. `.codex_requests/` 不應被萃取成 `wiki/`。
8. `.codex_requests/` 可加入 `.gitignore`，避免提交到 GitHub。

推薦流程：

```text
1. import_note.ps1
2. sensitive_review.ps1

Choose one of the following:

3A. generate_daily.ps1
    For normal learning notes.

3B. meeting_note.ps1
    For meeting notes.

Then continue with:

4. extract_wiki.ps1
5. update_indexes.ps1
6. weekly_summary.ps1
7. monthly_review.ps1
```

---

# 13. assets/ 使用規則

`assets/` 放正式筆記可引用的非敏感圖片與附件。

```text
assets/
├── images/
└── files/
```

用途：

* `assets/images/`：正式筆記引用的非敏感圖片。
* `assets/files/`：正式筆記引用的非敏感附件。

規則：

1. 原始筆記中的圖片或附件應優先跟隨 raw note 保存。
2. 只有已確認可引用且不含敏感資訊的圖片，才可放入 `assets/images/`。
3. 只有已確認可引用且不含敏感資訊的附件，才可放入 `assets/files/`。
4. 敏感資料不得放入 `assets/`。
5. 未遮蔽內部系統截圖不得放入 `assets/`。
6. 若公式來自截圖，應優先轉寫成 LaTeX；若無法可靠轉寫，才將圖片作為補充附件並標記待確認。

---

# 14. .agents/ 使用規則

`.agents/` 若存在，用於保存 agent skill 或工具設定。

建議位置：

```text
internship_llm_wiki/.agents/
└── skills/
    └── karpathy-llm-wiki/
```

規則：

1. `.agents/` 不屬於正式 LLM-Wiki 內容。
2. `.agents/` 不應被整理成 `logs/`。
3. `.agents/` 不應被萃取成 `wiki/`。
4. `.agents/skills/*/examples/` 若存在，只是 skill 的參考範例，不是真實實習筆記。
5. Agent 不應將 skill examples 當作使用者的正式知識來源。
6. 若使用者明確要求檢查或修改 skill，才可處理 `.agents/` 內容。

---

# 15. 命名規則

## 15.1 原始筆記

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

若同一天有多份筆記，可使用：

```text
2026_07_03_Fri_01.md
2026_07_03_Fri_02.md
```

---

## 15.2 logs

```text
logs/daily/YYYY-MM-DD.md
logs/weekly/YYYY-Www.md
logs/monthly/YYYY-MM.md
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

---

## 15.3 wiki

檔名使用英文小寫與底線。

範例：

```text
wiki/tools/google_adk.md
wiki/concepts/proof_of_concept.md
wiki/workflows/report_generation_workflow.md
wiki/projects/google_adk_poc_project.md
wiki/formulas/weighted_average.md
wiki/business_context/eab_review_process.md
wiki/glossary/poc.md
```

規則：

1. 不使用中文檔名。
2. 不使用空白。
3. 不使用特殊符號。
4. 不使用過長檔名。
5. 同一主題已有頁面時，優先更新既有頁面。
6. 縮寫術語可在 `wiki/glossary/` 使用小寫縮寫命名。
7. 完整概念應放在 `wiki/concepts/`。

---

# 16. Frontmatter 規則

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
sensitive_review_status: needs_review
created: 2026-07-03
updated: 2026-07-03
---
```

wiki 筆記範例：

```yaml
---
type: wiki_note
category: tool
status: draft
source_daily_log:
  - logs/daily/2026-07-03.md
source_raw_note:
  - raw/imported_notes/2026/2026_07_03_Fri.md
tags:
  - google_adk
  - poc
sensitive_review_status: reviewed
created: 2026-07-03
updated: 2026-07-03
---
```

公式筆記範例：

```yaml
---
type: wiki_note
category: formula
status: draft
source_daily_log:
  - logs/daily/2026-07-03.md
source_raw_note:
  - raw/imported_notes/2026/2026_07_03_Fri.md
tags:
  - formula
  - metric
sensitive_review_status: needs_review
created: 2026-07-03
updated: 2026-07-03
---
```

常用欄位：

| 欄位                        | 用途           |
| ------------------------- | ------------ |
| `type`                    | 筆記類型         |
| `category`                | wiki 筆記分類    |
| `date`                    | 日期           |
| `source`                  | 來源           |
| `source_daily_log`        | 來源 daily log |
| `source_raw_note`         | 來源 raw note  |
| `topics`                  | 主題           |
| `tags`                    | 標籤           |
| `status`                  | 狀態           |
| `sensitive_review_status` | 敏感資訊檢查狀態     |
| `created`                 | 建立日期         |
| `updated`                 | 更新日期         |

建議狀態值：

```text
status: draft / active / reviewed / needs_review / archived
sensitive_review_status: unchecked / needs_review / reviewed / sensitive / abstracted
```

---

# 17. 公式規則

如果筆記中出現公式，應優先整理到：

```text
wiki/formulas/
```

公式類內容包括：

* 數學公式
* 統計公式
* 模型定義
* 評分公式
* 權重計算
* 損失函數
* 指標計算公式
* 符號定義
* 公式截圖

公式應使用 LaTeX。

行內公式：

```text
$score = raw_score \times weight$
```

區塊公式：

```text
$$
decay_weight = TIME_DECAY_FACTOR^{period_gap}
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
9. Knowledge Graph 關聯

公式規則：

1. 不只貼公式，必須補上解釋。
2. 不任意改寫原始公式的數學意義。
3. 不確定的公式應標記為 `needs_review`。
4. 若公式來自圖片，應轉寫成 LaTeX 並標記待確認。
5. 若公式涉及公司內部敏感計算邏輯，應抽象化處理。
6. 新增公式筆記後，應更新 `indexes/formula_index.md`。

---

# 18. 保密規則

本專案不得保存或擴散敏感資訊。

不得寫入正式筆記的內容包括：

1. 客戶姓名、身分證字號、電話、地址、Email。
2. 保單號碼、交易資料、真實客戶紀錄。
3. 公司內部帳號、密碼、API Key、Token、憑證。
4. 完整內部系統網址。
5. 未遮蔽的內部系統截圖。
6. 未經允許的公司內部原始碼。
7. 公司內部完整資料表名稱。
8. 敏感欄位代碼。
9. 可反推公司內部系統架構的細節。
10. 非公開商業策略。
11. 內部會議決策。
12. 公司內部敏感計算公式或決策公式。
13. 未抽象化的審查規則。
14. 未抽象化的上線流程。
15. 可識別具體個人、部門或內部角色的資訊。

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

抽象化規則：

| 原始內容類型  | 建議抽象化方式                     |
| ------- | --------------------------- |
| 具體人名    | 使用「主管」、「同事」、「架構師」、「業務窗口」    |
| 具體部門或組織 | 使用「審查單位」、「業務單位」、「系統單位」      |
| 內部系統名稱  | 使用「內部系統」、「來源系統」、「目標系統」      |
| 完整內部網址  | 使用「內部系統連結」                  |
| 內部資料表名稱 | 使用「內部資料表」                   |
| 敏感欄位名稱  | 使用「識別欄位」、「狀態欄位」、「日期欄位」等抽象名稱 |
| 審查細節    | 使用「審查流程」、「確認項目」、「審查條件」      |
| 上線細節    | 使用「上線前檢核」、「變更確認」、「部署前確認」    |

---

# 19. Codex 使用規則

使用 Codex 整理筆記時，應要求 Codex：

1. 只處理正式 workspace `internship_llm_wiki/` 內的內容。
2. 不主動處理外層 `others/` 或 `archive/`。
3. 不修改原始筆記。
4. 不刪除原始資料。
5. 先檢查是否有敏感資訊。
6. 先整理 `logs/daily/` 或 `logs/meetings/`。
7. 再萃取正式知識到 `wiki/`。
8. 新增或修改 wiki 後，再更新 index。
9. 若有公式，整理到 `wiki/formulas/`。
10. 若不確定內容正確性，標記為待確認。
11. 回報新增、修改與需要人工確認的檔案。

不要讓 Codex：

1. 任意新增資料夾。
2. 刪除原始資料。
3. 大量重構整個專案。
4. 直接複製原始筆記到正式 wiki。
5. 編造不存在的主管要求或專案背景。
6. 保存未抽象化的公司敏感資訊。
7. 將 `others/`、`archive/` 或 `.agents/skills/*/examples/` 當成正式來源。
8. 將 `.codex_requests/` 當成正式知識內容。
9. 將 examples 或 zip 備份檔萃取成 wiki。
10. 在未經使用者要求時修改外層 repository 輔助資料夾。

---

# 20. 每日維護流程

每日建議流程：

1. 將原始 Markdown 筆記放入 `raw/inbox/` 或直接放入 `raw/imported_notes/`。
2. 使用 `prompts/01_import_raw_note.md` 匯入或整理 raw note 位置。
3. 使用 `prompts/08_sensitive_info_review.md` 檢查敏感資訊。
4. 使用 `prompts/02_generate_daily_log.md` 產生 `logs/daily/YYYY-MM-DD.md`。
5. 檢查每日摘要是否正確。
6. 使用 `prompts/03_extract_wiki_notes.md` 從每日摘要中整理可沉澱的 wiki 頁面。
7. 使用 `prompts/04_update_indexes.md` 更新相關 index。
8. 標記需要人工確認的內容。

---

# 21. 每週維護流程

每週建議流程：

1. 整理本週 `logs/daily/` 與 `logs/meetings/`。
2. 使用 `prompts/05_generate_weekly_summary.md` 產生 `logs/weekly/YYYY-Www.md`。
3. 檢查本週新增的 wiki 頁面。
4. 使用 `prompts/04_update_indexes.md` 更新 indexes。
5. 檢查是否有重複頁面。
6. 整理可向主管回報的學習成果。
7. 標記下週需要繼續學習的主題。

---

# 22. 每月維護流程

每月建議流程：

1. 整理本月 `logs/weekly/`、`logs/daily/` 與 `logs/meetings/`。
2. 使用 `prompts/06_generate_monthly_review.md` 產生 `logs/monthly/YYYY-MM.md`。
3. 檢查本月新增的任務與專案。
4. 檢查重要工具、流程、公式是否已整理成正式 wiki。
5. 使用 `prompts/04_update_indexes.md` 更新 indexes。
6. 整理本月能力成長與後續補強方向。
7. 若有過時內容，可由使用者決定是否移至外層 `archive/`。

---

# 23. 不應該做的事

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
13. 把外層 `others/` 當成正式資料來源。
14. 把外層 `archive/` 當成正式資料來源。
15. 把 skill examples 當成實習學習紀錄。
16. 把 `.codex_requests/` 當成正式筆記。
17. 在正式 workspace 中新增不必要的 `examples/` 資料夾。
18. 在正式 workspace 中新增不必要的 `raw/processed/` 資料夾。
19. 在正式 workspace 中新增不必要的 `assets/diagrams/` 資料夾。

---

# 24. 本專案的判斷標準

整理任何內容時，先問以下問題：

1. 這是原始筆記嗎？
   → 放 `raw/imported_notes/`

2. 這是尚未確認是否要整理的素材嗎？
   → 放 `raw/inbox/`

3. 這是某一天學到的內容嗎？
   → 放 `logs/daily/`

4. 這是會議內容嗎？
   → 放 `logs/meetings/`

5. 這是每週總結嗎？
   → 放 `logs/weekly/`

6. 這是每月回顧嗎？
   → 放 `logs/monthly/`

7. 這是可重複使用的正式知識嗎？
   → 放 `wiki/`

8. 這是工具嗎？
   → 放 `wiki/tools/`

9. 這是概念嗎？
   → 放 `wiki/concepts/`

10. 這是流程嗎？
    → 放 `wiki/workflows/`

11. 這是任務嗎？
    → 放 `wiki/tasks/`

12. 這是跨多日或多階段的專案嗎？
    → 放 `wiki/projects/`

13. 這是錯誤與解法嗎？
    → 放 `wiki/troubleshooting/`

14. 這是資料欄位、資料來源或資料品質理解嗎？
    → 放 `wiki/data_notes/`

15. 這是公式、模型或計算邏輯嗎？
    → 放 `wiki/formulas/`

16. 這是業務背景或公司流程理解嗎？
    → 放 `wiki/business_context/`

17. 這是縮寫、術語或中英文對照嗎？
    → 放 `wiki/glossary/`

18. 這是導覽或索引嗎？
    → 放 `indexes/`

19. 這是圖片或附件嗎？
    → 原始附件優先跟隨 raw note；正式非敏感附件才放 `assets/`

20. 這是備份、zip、舊版腳本或範例嗎？
    → 不放入正式 workspace；應放在外層 `others/` 或由使用者自行管理

21. 這是過時或棄用內容嗎？
    → 不放入正式 workspace；可由使用者決定是否移至外層 `archive/`

---

# 25. 最終原則

本專案的核心不是建立很多資料夾，而是讓實習期間的原始學習紀錄，逐步轉換為可查詢、可維護、可連結、可回顧的 Markdown 知識庫。

最重要的流向是：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

任何新增、修改或整理，都應服務於這個流向。
