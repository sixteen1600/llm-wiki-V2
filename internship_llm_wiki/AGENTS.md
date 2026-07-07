# AGENTS.md

本文件是給 Codex Desktop 或其他 LLM Agent 使用的專案維護規範。  
當 Agent 在本專案中讀取、整理、修改或新增 Markdown 檔案時，必須遵守本文件規則。

---

# 1. Project Overview

本專案名稱為：

```text
internship_llm_wiki
```

本專案是一個「實習學習紀錄型 LLM-Wiki」，用於整理使用者在實習期間學到的知識、工具、流程、任務、錯誤排除經驗、會議重點、業務背景理解，以及可能出現的數學公式、統計公式、模型定義與指標計算方式。

本專案採用「展開式 LLM-Wiki 結構」。

相較於一般 LLM-Wiki 常見的：

```text
raw/
wiki/
index.md
log.md
AGENTS.md
```

本專案將 `index.md` 與 `log.md` 展開為：

```text
indexes/   # 多個主題索引
logs/      # 每日、每週、每月與會議紀錄
```

本專案的核心流程是：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

也就是：

1. `raw/imported_notes/` 保存原始混合式 Markdown 筆記。
2. `logs/` 保存整理後的時間序學習紀錄。
3. `wiki/` 保存整理後的正式主題知識。
4. `indexes/` 保存可供 Obsidian 與 Codex 導覽的索引。

本專案的主要目標是：

1. 將實習期間的每日學習內容累積成可長期維護的 Markdown Wiki。
2. 讓 Codex 協助整理原始筆記、更新 wiki 頁面、建立交叉連結與維護索引。
3. 讓 Obsidian 作為主要閱讀、複習與知識導航工具。
4. 將實習經驗整理成可回顧、可查詢、可向主管回報的學習紀錄。
5. 避免實習筆記散亂、重複、無法查詢或混入敏感資訊。
6. 將重要公式整理成可重複引用、可解釋、可追溯來源的公式筆記。

---

# 2. Core Principles

Agent 必須遵守以下核心原則：

1. `raw/imported_notes/` 是原始資料層，是 source of truth，不得任意覆蓋、刪除或大幅改寫。
2. `logs/` 是時間序紀錄層，用於整理每日、每週、每月與會議紀錄。
3. `wiki/` 是正式知識層，用於保存可複習、可查詢、可長期維護的主題知識。
4. `indexes/` 是導航層，用於協助使用者與 Agent 快速找到相關筆記。
5. `templates/` 是格式規範層，新筆記應盡量遵守對應模板。
6. `prompts/` 是 Agent 工作提示詞層，用於保存可重複使用的 Codex 指令。
7. 不得保存公司機密、客戶個資、帳號密碼、API Key、Token、內部系統敏感資訊或未經允許的內部程式碼。
8. 主要使用繁體中文撰寫，必要時保留英文術語。
9. 數學公式應優先使用 Markdown / Obsidian 可讀的 LaTeX 格式。
10. 目錄架構已定稿，不得為了新主題任意新增頂層資料夾或 `wiki/` 大分類。
11. 新主題應透過新增 Markdown 頁面、更新 index、加入 tag 或 frontmatter 管理，而不是新增資料夾。
12. 每次新增或修改 wiki 頁面後，應盡量同步更新相關 index。
13. Agent 不得把猜測內容寫成事實；不確定的內容應標記為待確認。

---

# 3. Directory Structure

本專案目錄結構如下：

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
│   ├── imported_notes/
│   ├── inbox/
│   └── processed/
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
│   ├── business_context/
│   ├── formulas/
│   └── glossary/
│
├── assets/
│   ├── images/
│   ├── diagrams/
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
├── indexes/
│   ├── home.md
│   ├── learning_index.md
│   ├── task_index.md
│   ├── project_index.md
│   ├── tool_index.md
│   ├── workflow_index.md
│   ├── troubleshooting_index.md
│   ├── data_index.md
│   ├── formula_index.md
│   └── glossary_index.md
│
├── prompts/
│   ├── codex_ingest_imported_note.md
│   ├── codex_summarize_daily_log.md
│   ├── codex_create_wiki_note.md
│   ├── codex_update_indexes.md
│   └── codex_weekly_review.md
│
└── archive/
    ├── old_notes/
    └── deprecated/
```

---

# 4. Directory Rules

## 4.1 raw/

`raw/` 用於保存尚未整理或剛匯入的原始資料。

本專案的主要原始資料型態是「混合式 Markdown 筆記」。一份 `.md` 檔案中可能同時包含：

- 文字筆記
- 每日學習紀錄
- 主管交代事項
- 任務描述
- 會議重點
- 概念解釋
- 工具學習紀錄
- 截圖引用
- 附件引用
- 尚未整理的術語或流程說明
- 數學公式、統計公式、模型定義、指標計算公式或符號說明

因此，`raw/` 不以「文字、截圖、附件、公式」分開管理，而是以「原始筆記」作為主要單位。

```text
raw/
├── imported_notes/
├── inbox/
└── processed/
```

用途：

- `raw/imported_notes/`：保存正式匯入的原始 Markdown 筆記。這些筆記應盡量保留原樣，作為 source of truth。
- `raw/inbox/`：臨時放入尚未確認是否要正式匯入的素材。
- `raw/processed/`：保存已經由 Agent 整理過、但仍需要保留的原始資料副本或處理紀錄。

建議原始筆記保存方式：

如果一份 Markdown 沒有外部附件，可直接保存為：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

如果一份 Markdown 需要搭配外部圖片或附件，應採用「一篇筆記一個資料夾」：

```text
raw/imported_notes/
└── 2026/
    └── 2026_07_03_Fri/
        ├── 2026_07_03_Fri.md
        └── attachments/
            ├── image_001.png
            └── file_001.pdf
```

規則：

1. `raw/imported_notes/` 是原始來源層，應保留原樣。
2. Agent 可以讀取 `raw/imported_notes/`，但不得任意覆蓋、刪除或大幅改寫原始筆記。
3. Agent 整理原始筆記時，應將整理結果寫入 `logs/` 或 `wiki/`，而不是直接改寫原始 `.md`。
4. 若原始 Markdown 中包含圖片或附件引用，Agent 應保留引用關係，不應任意拆散。
5. 若圖片或附件需要被正式 wiki 引用，且已確認不含敏感資訊，可複製或整理至 `assets/`。
6. 若原始筆記含有敏感資訊，Agent 不得將敏感內容擴散到 `logs/` 或 `wiki/`，應改寫為抽象描述並提醒使用者確認。
7. 若原始筆記含有公式，Agent 整理時應保留公式的數學意義，不得任意改寫公式內容。
8. `raw/inbox/` 只作為暫存區，不應長期保存已確認的正式筆記。
9. 整理完成後，可建議使用者將已處理素材移至 `raw/processed/`，但 Agent 不應擅自刪除原始資料。

---

## 4.2 logs/

`logs/` 用於保存由 Agent 整理後的時間序紀錄。

```text
logs/
├── daily/
├── weekly/
├── monthly/
└── meetings/
```

本專案需要明確區分：

```text
raw/imported_notes/   # 原始匯入筆記
logs/                 # 整理後的時間序摘要
wiki/                 # 正式主題知識頁
indexes/              # 主題導覽與索引
```

用途：

- `logs/daily/`：由 Agent 根據原始筆記整理出的每日學習摘要。
- `logs/weekly/`：每週學習總結。
- `logs/monthly/`：每月回顧。
- `logs/meetings/`：從原始筆記中萃取出的會議紀錄或會議重點。

規則：

1. `logs/` 的核心用途是保存時間序紀錄，而不是依主題分類知識。
2. `logs/` 底下的資料夾應保持固定，不應根據 Markdown 內容的領域自動新增資料夾。
3. 原始每日 Markdown 筆記應放在 `raw/imported_notes/`，不要直接放在 `logs/daily/`。
4. `logs/daily/` 應保存 Agent 整理後的每日摘要，而不是完整複製原始筆記。
5. 如果一份原始筆記同時包含多個主題，例如工具、概念、流程、任務、公式與會議內容，Agent 應在 `logs/daily/` 中保留該日摘要，並將正式知識分別萃取到 `wiki/` 的對應分類。
6. 若使用者想依主題查看學習歷程，例如 Google ADK、SQL、RAG、資料倉儲、某個公式或某個評分指標，Agent 應優先透過 `wiki/` 頁面與 `indexes/` 建立主題導覽，而不是在 `logs/` 下新增主題資料夾。
7. `logs/daily/` 可以使用標籤或段落記錄當日涉及的主題，例如 `#google_adk`、`#poc`、`#data_warehouse`、`#formula`。
8. `wiki/` 中的主題頁可以保留「學習時間線」或「相關學習紀錄」段落，連回相關的 `logs/daily/`。
9. Agent 可以根據 `raw/imported_notes/` 產生或更新 `logs/daily/`。
10. Agent 可以根據 `logs/daily/` 進一步萃取正式知識到 `wiki/`。
11. 如果原始筆記中包含會議內容，Agent 可視情況將其整理到 `logs/meetings/`。
12. `logs/` 不應保存公司敏感資訊、客戶個資、未遮蔽截圖或完整內部文件內容。
13. `logs/` 不應取代 `wiki/`；可複習、可查詢的正式知識應整理至 `wiki/`。

---

## 4.3 wiki/

`wiki/` 是整理後的正式知識庫。

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

`wiki/` 的資料夾結構必須保持穩定。  
未來新增主題時，應新增 Markdown 頁面、更新 index 或加入 tag，不應新增新的 `wiki/` 大分類資料夾。

用途：

- `wiki/concepts/`：概念解釋，例如概念驗證(PoC, Proof of Concept)、資料倉儲(Data Warehouse)、ETL、API、RAG。
- `wiki/tools/`：工具使用筆記，例如 Google ADK、SQL、Python、Excel、Power BI、Git、Codex Desktop。
- `wiki/workflows/`：流程整理，例如報告產製流程、資料清洗流程、資料管線流程、上線前檢查流程。
- `wiki/tasks/`：單次任務紀錄，例如整理某份需求、修正某份報表、完成某次資料處理。
- `wiki/projects/`：多階段專案紀錄，例如 Google ADK PoC、RAG 原型、資料解析 pipeline、LLM-Wiki 建置。
- `wiki/troubleshooting/`：錯誤排除紀錄，例如環境錯誤、SQL 錯誤、資料格式錯誤、工具安裝錯誤。
- `wiki/data_notes/`：資料理解、欄位邏輯、資料品質與資料處理注意事項。
- `wiki/business_context/`：業務背景、部門流程、審核流程、金融與壽險相關背景。
- `wiki/formulas/`：數學公式、統計公式、模型定義、評分公式、損失函數、指標計算公式與符號說明。
- `wiki/glossary/`：專有名詞字典。

分類規則：

1. 這是概念嗎？放入 `wiki/concepts/`。
2. 這是工具嗎？放入 `wiki/tools/`。
3. 這是可重複執行的流程嗎？放入 `wiki/workflows/`。
4. 這是單次任務嗎？放入 `wiki/tasks/`。
5. 這是跨多日或多階段的工作嗎？放入 `wiki/projects/`。
6. 這是錯誤與解法嗎？放入 `wiki/troubleshooting/`。
7. 這是資料表、欄位、資料品質或資料處理理解嗎？放入 `wiki/data_notes/`。
8. 這是業務、公司流程、金融、壽險或部門背景嗎？放入 `wiki/business_context/`。
9. 這是數學公式、統計公式、模型定義、評分公式、損失函數、指標計算公式或符號定義嗎？放入 `wiki/formulas/`。
10. 這是術語解釋嗎？放入 `wiki/glossary/` 或更新既有 glossary 頁面。

若一個主題可同時歸入多個分類，應以「該頁面的主要目的」決定位置。

範例：

```text
Google ADK 是什麼？ → wiki/tools/google_adk.md
用 Google ADK 產出固定格式報告的流程 → wiki/workflows/google_adk_report_generation_workflow.md
用 Google ADK 做概念驗證 → wiki/projects/google_adk_poc_project.md
Google ADK 執行錯誤 → wiki/troubleshooting/google_adk_execution_error.md
PoC 的定義 → wiki/concepts/proof_of_concept.md
EAB / CAB 的流程背景 → wiki/business_context/
時間衰減權重公式 → wiki/formulas/time_decay_weight.md
統計檢定公式 → wiki/formulas/t_test_formula.md
模型損失函數 → wiki/formulas/loss_function.md
```

規則：

1. `wiki/` 只放整理後的正式知識。
2. 每篇 wiki 筆記應該有清楚標題、背景、重點、實習情境與相關連結。
3. 若同一主題已有筆記，應更新既有頁面，不要建立重複頁面。
4. 若新增頁面，應同步更新相關 `indexes/`。
5. 新增頁面時，應盡量加入 frontmatter。
6. 不要把原始筆記完整複製到 `wiki/`。
7. 不要在 `wiki/` 中保存未處理的敏感資訊。
8. 不要新增 `wiki/google_adk/`、`wiki/sql/`、`wiki/rag/` 這類主題型資料夾；主題應透過頁面、tag 與 index 管理。
9. 公式頁面應保留公式、符號說明、使用情境與來源。
10. Agent 不得任意改寫原始公式的數學意義。

---

## 4.4 assets/

`assets/` 用於保存正式 wiki 會引用的圖片、圖表與檔案。

```text
assets/
├── images/
├── diagrams/
└── files/
```

用途：

- `assets/images/`：正式筆記引用的圖片。
- `assets/diagrams/`：流程圖、架構圖、概念圖。
- `assets/files/`：正式筆記需要引用的非敏感附件。

規則：

1. 原始筆記中的圖片或附件應優先跟隨原始 Markdown 保存在 `raw/imported_notes/`。
2. 只有已確認可引用、已去除敏感資訊的圖片才可放入 `assets/images/`。
3. 流程圖或架構圖應放入 `assets/diagrams/`。
4. 正式筆記需要引用的非敏感附件可放入 `assets/files/`。
5. 敏感資料不得放入 `assets/`。
6. Agent 不得將未檢查的原始截圖直接複製到 `assets/`。
7. 若公式是以截圖形式存在，應優先轉寫成 LaTeX；若無法可靠轉寫，才將原圖作為補充附件，並標記需要人工確認。

---

## 4.5 templates/

`templates/` 用於保存不同類型筆記的固定格式。

```text
templates/
├── daily_log.md
├── weekly_summary.md
├── monthly_review.md
├── meeting_note.md
├── task_note.md
├── project_note.md
├── concept_note.md
├── tool_note.md
├── workflow_note.md
├── troubleshooting_note.md
├── data_note.md
└── formula_note.md
```

規則：

1. Agent 新增 `logs/` 或 `wiki/` 筆記時，應優先參考對應模板。
2. 不應隨意刪除模板。
3. 若模板需要修改，應保持簡潔、穩定與通用。
4. 模板不得包含公司敏感資訊。
5. 公式類筆記應優先參考 `templates/formula_note.md`。

---

## 4.6 indexes/

`indexes/` 用於保存導覽與索引。

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

用途：

- `indexes/home.md`：整個 wiki 的入口頁。
- `indexes/learning_index.md`：學習主題總覽。
- `indexes/task_index.md`：任務總覽。
- `indexes/project_index.md`：專案總覽。
- `indexes/tool_index.md`：工具筆記總覽。
- `indexes/workflow_index.md`：流程筆記總覽。
- `indexes/troubleshooting_index.md`：錯誤排除總覽。
- `indexes/data_index.md`：資料筆記總覽。
- `indexes/formula_index.md`：公式、模型、指標與符號索引。
- `indexes/glossary_index.md`：術語索引。

規則：

1. Agent 新增或修改 wiki 頁面後，應檢查是否需要更新相關 index。
2. Index 應使用 Markdown 連結或 Obsidian 雙向連結。
3. Index 內容應簡潔，不要寫成完整文章。
4. Index 的目標是幫助使用者與 Agent 快速找到相關筆記。
5. 主題導覽應放在 `indexes/`，不要透過新增 `logs/` 或 `wiki/` 資料夾解決。
6. 若某一主題跨越多個頁面，例如 Google ADK，應在 `learning_index.md` 或相關 index 中建立主題群組。
7. 若新增或更新 `wiki/formulas/` 頁面，應同步更新 `indexes/formula_index.md`。

---

## 4.7 prompts/

`prompts/` 用於保存常用 Codex 工作提示詞。

```text
prompts/
├── codex_ingest_imported_note.md
├── codex_summarize_daily_log.md
├── codex_create_wiki_note.md
├── codex_update_indexes.md
└── codex_weekly_review.md
```

規則：

1. prompts 是給使用者複製貼給 Codex 的工作指令。
2. prompts 應明確、可重複使用。
3. prompts 不應包含公司敏感資訊。
4. 若工作流程更新，應同步更新對應 prompt。

---

## 4.8 archive/

`archive/` 用於保存舊資料或已停用內容。

```text
archive/
├── old_notes/
└── deprecated/
```

規則：

1. 不要直接刪除可能還有價值的舊筆記。
2. 舊版筆記可移至 `archive/old_notes/`。
3. 已棄用流程或過時文件可移至 `archive/deprecated/`。
4. 敏感內容不應因歸檔而保留，仍應移除或改寫。
5. Agent 不應在未經使用者要求時大量移動檔案到 archive。

---

# 5. Naming Rules

檔案命名應使用英文小寫、底線分隔，避免空白與特殊符號。

## 5.1 raw imported notes

原始筆記可保留使用者原本的命名，但建議統一為：

```text
YYYY_MM_DD_Ddd.md
```

範例：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

如果一篇筆記有附件：

```text
raw/imported_notes/2026/2026_07_03_Fri/2026_07_03_Fri.md
raw/imported_notes/2026/2026_07_03_Fri/attachments/image_001.png
```

## 5.2 logs

```text
logs/daily/YYYY-MM-DD.md
logs/weekly/YYYY-Www.md
logs/monthly/YYYY-MM.md
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

範例：

```text
logs/daily/2026-07-03.md
logs/weekly/2026-W27.md
logs/monthly/2026-07.md
logs/meetings/2026-07-03_team_meeting.md
```

## 5.3 wiki

```text
wiki/concepts/concept_short_name.md
wiki/tools/tool_short_name.md
wiki/workflows/workflow_short_name.md
wiki/tasks/task_YYYYMMDD_short_description.md
wiki/projects/project_short_name.md
wiki/troubleshooting/troubleshooting_short_description.md
wiki/data_notes/data_short_description.md
wiki/business_context/business_short_description.md
wiki/formulas/formula_short_name.md
wiki/glossary/term_short_name.md
```

範例：

```text
wiki/concepts/proof_of_concept.md
wiki/tools/google_adk.md
wiki/workflows/google_adk_report_generation_workflow.md
wiki/projects/google_adk_poc_project.md
wiki/tasks/task_20260703_report_format_review.md
wiki/troubleshooting/google_adk_execution_error.md
wiki/business_context/eab_review_process.md
wiki/business_context/cab_change_control.md
wiki/formulas/time_decay_weight.md
wiki/formulas/support_score_calculation.md
wiki/formulas/weighted_average.md
wiki/formulas/t_test_formula.md
wiki/formulas/loss_function.md
wiki/glossary/poc.md
```

規則：

1. 檔名應穩定，避免頻繁改名。
2. 標題可以使用繁體中文，但檔名建議使用英文小寫。
3. 若同一主題已有筆記，應更新既有筆記，不要建立重複頁面。
4. 若需要新增頁面，應先檢查 `indexes/` 和相關 `wiki/` 資料夾是否已有相近主題。
5. 不要用過長檔名。
6. 不要用中文、空白、括號或特殊符號作為檔名。

---

# 6. Frontmatter Rules

正式的 `logs/` 與 `wiki/` 筆記建議加入 YAML frontmatter，方便 Obsidian、Codex 與未來查詢。

## 6.1 logs/daily frontmatter

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

## 6.2 wiki frontmatter

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
  - agent
status: draft
---
```

## 6.3 formula frontmatter

```yaml
---
type: formula
topic: time_decay_weight
source:
  - raw/imported_notes/2026/2026_07_03_Fri.md
related_logs:
  - logs/daily/2026-07-03.md
tags:
  - formula
  - metric
  - time_decay
status: draft
---
```

常用欄位：

- `type`：頁面類型，例如 `concept`、`tool`、`workflow`、`task`、`project`、`troubleshooting`、`data_note`、`business_context`、`formula`、`glossary`、`daily_log`。
- `topic`：主要主題。
- `date`：日期，主要用於 logs。
- `source`：來源原始筆記。
- `related_logs`：相關時間序紀錄。
- `tags`：主題標籤。
- `status`：狀態，例如 `draft`、`reviewed`、`archived`。
- `confidentiality`：可選，例如 `public_learning_note`、`internal_abstracted`、`needs_review`。

規則：

1. frontmatter 不得包含敏感資訊。
2. `source` 應記錄來源路徑，方便追溯。
3. `tags` 用於主題彈性管理，不應取代資料夾分類。
4. 若不確定某頁是否已審核，`status` 應設為 `draft` 或 `needs_review`。
5. 公式頁面的 `type` 應設為 `formula`。

---

# 7. Language and Formula Rules

本專案主要使用繁體中文。

英文專有名詞應盡量保留，格式建議如下：

```text
概念驗證(PoC, Proof of Concept)
資料倉儲(Data Warehouse)
資料管線(Data Pipeline)
檢索增強生成(RAG, Retrieval-Augmented Generation)
大型語言模型(LLM, Large Language Model)
應用程式介面(API, Application Programming Interface)
抽取、轉換、載入(ETL, Extract, Transform, Load)
```

語言規則：

1. 解釋內容以繁體中文為主。
2. 第一次出現重要英文術語時，應補上英文原文。
3. 常用縮寫可以保留，例如 SQL、API、RAG、LLM、ETL、PoC。
4. 不要把整份筆記寫成英文，除非使用者明確要求。
5. 若原始筆記中有英文術語，整理時應保留，並補上繁體中文說明。

## 7.1 Formula Writing Rules

若筆記中包含數學公式，應優先使用 Markdown / Obsidian 可讀的 LaTeX 格式。

行內公式使用：

```text
$score = raw\_score \times weight$
```

區塊公式使用：

```text
$$
decay\_weight = TIME\_DECAY\_FACTOR^{period\_gap}
$$
```

公式整理規則：

1. 公式應盡量使用 LaTeX 表示。
2. 公式下方應補上符號說明。
3. 不應只貼公式而不解釋用途。
4. 若公式來自原始筆記，應保留來源。
5. 若公式是 Agent 推導或整理出來的，應標記為「整理」或「推導」，不得假裝是原始來源。
6. 若公式涉及公司內部評分邏輯、商業規則或敏感計算方式，應抽象化處理。
7. 若公式無法確定是否正確，應標記為 `status: needs_review` 或在內容中標示「待確認」。
8. 不得任意改寫原始公式的數學意義。
9. 若原始公式是圖片，應優先轉寫成 LaTeX，並標記需要人工確認。
10. 若公式和特定工具、流程、專案有關，應在相關頁面建立雙向連結。

---

# 8. Privacy and Confidentiality Rules

本專案涉及實習學習內容，Agent 必須嚴格避免保存或擴散公司敏感資訊。

不得寫入 `logs/`、`wiki/`、`indexes/` 或 `assets/` 的內容包括：

1. 客戶姓名、身分證字號、電話、地址、Email。
2. 保單號碼、交易資料、真實客戶紀錄。
3. 公司內部帳號、密碼、API Key、Token、憑證。
4. 未遮蔽的內部系統截圖。
5. 未經允許的公司內部原始碼。
6. 公司內部完整資料表名稱、敏感欄位代碼或可反推系統架構的細節。
7. 非公開商業策略、內部會議決策或部門敏感資訊。
8. 任何可識別個人、客戶、同事或內部系統的資料。
9. 任何使用者未明確允許保存的機密工作內容。
10. 公司內部敏感評分公式、商業規則公式或可反推內部決策邏輯的完整計算方式。

若需要記錄相關內容，必須改寫為抽象描述。

範例：

不應寫：

```text
客戶王小明，身分證 A123456789，保單號碼 XXXXX。
```

應改寫為：

```text
某筆客戶資料包含身分識別欄位與保單識別欄位，處理時必須先去識別化。
```

不應寫：

```text
內部資料表名稱為 xxx_customer_policy_detail。
```

應改寫為：

```text
某保單明細資料表包含客戶識別欄位、保單狀態欄位與日期欄位。
```

不應寫：

```text
完整內部系統截圖顯示了系統名稱、網址、帳號與資料內容。
```

應改寫為：

```text
某內部系統畫面顯示資料查詢流程，整理筆記時應僅保留抽象操作概念。
```

不應寫：

```text
公司內部實際核准分數 = 權重A * 客戶欄位X + 權重B * 內部欄位Y。
```

應改寫為：

```text
某內部評分流程會根據多個條件加權計算，整理時僅保留「加權評分」概念，不保存實際公式與欄位。
```

若 Agent 發現敏感資訊，應：

1. 不將其寫入正式筆記。
2. 在回覆中提醒使用者。
3. 建議使用者遮蔽或移除。
4. 必要時將該頁標記為 `confidentiality: needs_review`。

---

# 9. Wiki Page Writing Rules

新增或更新 wiki 頁面時，應盡量包含以下元素：

```markdown
# 標題

## 背景

## 實習中接觸到的情境

## 核心概念

## 操作流程或重點整理

## 常見問題

## 注意事項

## 相關學習紀錄

## 相關筆記
```

不是每篇都必須包含全部段落，但 Agent 應保持結構清楚。

規則：

1. 每篇筆記應有清楚標題。
2. 筆記內容應簡潔，但不能只是一句話。
3. 若內容來自 `raw/imported_notes/` 或 `logs/`，應保留來源提示。
4. 若同一主題已有頁面，應更新原頁面，而不是新增重複頁。
5. 若新增頁面，應加入相關 `indexes/`。
6. 優先使用 Obsidian 雙向連結格式，例如 `[[google_adk]]`，或使用相對 Markdown 連結。
7. 不要在 wiki 中保存未處理的原始資料。
8. 不要把 `logs/daily/` 直接複製成 wiki。
9. 若該頁與某個學習日期有關，應加入「相關學習紀錄」段落。

## 9.1 Formula Page Writing Rules

公式類筆記建議包含：

```markdown
# 公式名稱

## 背景

## 公式

## 符號說明

## 使用情境

## 計算範例

## 注意事項

## 相關學習紀錄

## 相關筆記
```

公式頁面規則：

1. 公式頁面應放在 `wiki/formulas/`。
2. 公式應使用 LaTeX。
3. 必須補上符號說明。
4. 應說明公式用途與使用情境。
5. 如果有簡單數值範例，應提供計算範例。
6. 應標示來源，例如整理自哪一份 `raw/imported_notes/` 或哪一天的 `logs/daily/`。
7. 若公式與某個專案、工具或流程有關，應在「相關筆記」中連結。
8. 若公式為推導結果，應清楚標示為「推導」或「整理」。
9. 若公式未經確認，應標示 `status: needs_review`。

---

# 10. Ingest Workflow

當使用者要求 Agent 整理原始 Markdown 筆記時，Agent 應按照以下流程：

1. 讀取指定的 `raw/imported_notes/` 或 `raw/inbox/` Markdown 檔案。
2. 確認該筆記是否為混合式筆記，亦即是否同時包含文字、截圖引用、附件引用、會議內容、任務內容、術語解釋或公式。
3. 檢查 Markdown 中是否包含敏感資訊，例如客戶個資、帳號密碼、API Key、未遮蔽內部系統截圖、真實保單資料、內部完整資料表名稱、公司機密或內部敏感公式。
4. 若包含敏感資訊，整理到 `logs/` 或 `wiki/` 時必須改寫為抽象描述，必要時提醒使用者人工確認。
5. 從原始筆記中萃取時間序內容，產生或更新對應的 `logs/daily/` 筆記。
6. 若原始筆記中包含會議內容，可產生或更新 `logs/meetings/`。
7. 判斷筆記中可沉澱為正式知識的內容類型：
   - concept
   - tool
   - workflow
   - task
   - project
   - troubleshooting
   - data_note
   - business_context
   - formula
   - glossary
8. 若原始筆記中包含數學公式、模型公式、統計公式、指標計算方式或符號定義，Agent 應判斷是否需要建立或更新 `wiki/formulas/` 中的公式頁面。
9. 檢查 `wiki/` 中是否已有相同或相近主題。
10. 若已有相關頁面，優先更新既有頁面。
11. 若沒有相關頁面，才建立新的 wiki 頁面。
12. 新增或更新 wiki 頁面時，應使用對應模板，並保留來源提示。
13. 若圖片或附件需要在正式 wiki 中引用，應先確認不含敏感資訊，再整理到 `assets/`。
14. 若圖片中包含公式，應優先轉寫成 LaTeX；若無法可靠轉寫，應標記為待確認。
15. 更新相關 `indexes/`。
16. 最後回報：
    - 新增哪些 `logs/` 檔案
    - 新增或修改哪些 `wiki/` 檔案
    - 更新哪些 `indexes/`
    - 哪些內容可能涉及敏感資訊，需要使用者確認
    - 哪些公式需要人工確認

---

# 11. Query Workflow

當使用者詢問某個主題時，Agent 應按照以下流程：

1. 優先查看 `indexes/`。
2. 再查看相關 `wiki/` 分類。
3. 若是公式、模型、指標計算或符號定義，優先查看 `indexes/formula_index.md` 與 `wiki/formulas/`。
4. 必要時查看 `logs/` 補充時間序背景。
5. 只有在使用者要求追溯來源或正式知識不足時，才查看 `raw/imported_notes/`。
6. 不應直接依賴未整理的 `raw/` 作為最終答案，除非使用者明確要求查 raw。
7. 回答時應指出相關筆記位置。
8. 若發現 wiki 中缺少該主題，可建議建立新頁面。
9. 若發現同一主題分散在多個頁面，可建議整併，但不得擅自大量重構。

---

# 12. Update Workflow

當 Agent 修改現有 wiki 時，應遵守：

1. 優先小幅更新既有頁面。
2. 避免建立重複頁面。
3. 保留原有有價值內容。
4. 若內容過時，可新增「舊版說明」段落或建議放入 `archive/`。
5. 更新相關索引。
6. 若變更較大，應在回覆中列出修改摘要。
7. 不得因為新增主題而新增 `wiki/` 大分類資料夾。
8. 不得任意改變 `logs/`、`wiki/`、`indexes/` 的基本結構。
9. 修改公式時，必須保留原公式的數學意義；若有疑問，應標記為待確認，不得自行修正成未經確認的版本。

---

# 13. Lint and Maintenance Rules

定期維護時，Agent 應檢查：

1. 是否有重複主題頁面。
2. 是否有孤立頁面未被 index 連結。
3. 是否有敏感資訊。
4. 是否有錯誤分類。
5. 是否有過長或過短的筆記。
6. 是否有缺少標題的 Markdown。
7. 是否有尚未整理的 `raw/inbox/` 資料。
8. 是否有尚未整理的 `raw/imported_notes/` 原始筆記。
9. 是否有原始筆記已整理成 `logs/`，但尚未萃取正式知識到 `wiki/`。
10. 是否有原始 Markdown 中的圖片或附件引用失效。
11. 是否有需要移到 `archive/` 的過時資料。
12. 是否有 wiki 頁面缺少 frontmatter。
13. 是否有新增 wiki 頁面但未更新 index。
14. 是否有 topic 應該用 tag 或 index 管理，卻被錯誤新增成資料夾。
15. 是否有公式散落在 `concepts/`、`data_notes/`、`projects/` 或其他頁面中，但應整理成 `wiki/formulas/`。
16. 是否有公式缺少符號說明。
17. 是否有公式缺少來源。
18. 是否有公式格式不符合 Markdown / LaTeX 可讀性。
19. 是否有公式可能涉及公司敏感計算邏輯，需要抽象化或人工確認。

Agent 可以提出清單，但不應在未經使用者要求時大量重構整個專案。

---

# 14. Do Not Rules

Agent 不得執行以下行為：

1. 不得刪除原始資料。
2. 不得覆蓋或大幅改寫 `raw/imported_notes/` 中的原始 Markdown 筆記。
3. 不得保存或擴散敏感資訊。
4. 不得任意新增頂層資料夾。
5. 不得任意新增 `wiki/` 大分類資料夾。
6. 不得根據主題自動新增 `logs/` 資料夾。
7. 不得把 `logs/` 當成正式 wiki。
8. 不得把 `raw/imported_notes/` 的完整內容直接複製到 `wiki/`。
9. 不得將未檢查的圖片或附件直接放入 `assets/`。
10. 不得建立大量重複頁面。
11. 不得任意改變已定稿的目錄架構。
12. 不得將公司內部資訊寫成可外流的完整文件。
13. 不得把猜測內容寫成事實。
14. 不得在沒有依據的情況下補充不存在的實習內容。
15. 不得為了讓筆記看起來完整而自行編造主管要求、專案背景或公司流程。
16. 不得任意改寫原始公式的數學意義。
17. 不得把不確定的公式推導寫成已確認事實。
18. 不得將公司內部敏感計算公式完整寫入正式 wiki；必要時應抽象化。
19. 不得將公式截圖誤判成已確認的 LaTeX 公式；若轉寫不確定，必須標記待確認。

---

# 15. Stable Structure Policy

本專案目錄已定稿。  
日後除非使用者明確要求，Agent 不應建議大幅更改資料夾架構。

若遇到新內容，應優先歸入現有分類：

- 原始混合式 Markdown 筆記 → `raw/imported_notes/`
- 尚未確認的臨時素材 → `raw/inbox/`
- 已處理但仍需保留的原始資料 → `raw/processed/`
- 每日整理摘要 → `logs/daily/`
- 每週整理摘要 → `logs/weekly/`
- 每月整理摘要 → `logs/monthly/`
- 會議整理紀錄 → `logs/meetings/`
- 概念 → `wiki/concepts/`
- 工具 → `wiki/tools/`
- 流程 → `wiki/workflows/`
- 單次任務 → `wiki/tasks/`
- 多階段專案 → `wiki/projects/`
- 錯誤排除 → `wiki/troubleshooting/`
- 資料理解 → `wiki/data_notes/`
- 業務背景 → `wiki/business_context/`
- 公式、模型定義、評分公式、統計公式、損失函數、符號定義 → `wiki/formulas/`
- 術語 → `wiki/glossary/`
- 正式 wiki 引用圖片 → `assets/images/`
- 正式 wiki 引用圖表 → `assets/diagrams/`
- 正式 wiki 引用檔案 → `assets/files/`

主題擴充應透過：

1. 新增 Markdown 頁面。
2. 更新 `indexes/`。
3. 加入 frontmatter。
4. 加入 tags。
5. 在相關頁面建立雙向連結。

不得透過新增資料夾解決一般主題分類問題。

---

# 16. Preferred Response Style for Agent

當 Agent 回覆使用者時，應盡量：

1. 使用繁體中文。
2. 清楚列出新增、修改、待確認項目。
3. 若涉及目錄與檔案，使用明確路徑。
4. 若有敏感資訊疑慮，直接提醒。
5. 若不確定分類，優先選擇最穩定的既有分類，不新增資料夾。
6. 若使用者要求整理內容，應產出可直接保存為 Markdown 的結果。
7. 若修改多個檔案，應列出修改摘要。
8. 若需要人工確認，應明確標記「待確認」。
9. 若涉及公式，應標示公式來源、公式用途與是否需要人工確認。

---

# 17. Example: Imported Note Processing

若使用者匯入：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

且其中包含：

- PoC 概念
- Google ADK 工具學習
- EAB / CAB 流程背景
- 截圖或附件引用
- 主管對固定格式報告的期待
- 指標計算公式或數學公式

Agent 應可能產生或更新：

```text
logs/daily/2026-07-03.md

wiki/concepts/proof_of_concept.md
wiki/tools/google_adk.md
wiki/projects/google_adk_poc_project.md
wiki/workflows/google_adk_report_generation_workflow.md
wiki/business_context/eab_review_process.md
wiki/business_context/cab_change_control.md
wiki/formulas/example_metric_formula.md

indexes/learning_index.md
indexes/tool_index.md
indexes/project_index.md
indexes/workflow_index.md
indexes/formula_index.md
indexes/glossary_index.md
```

Agent 不應建立：

```text
logs/google_adk/
logs/formulas/
wiki/google_adk/
wiki/poc/
wiki/eab/
wiki/cab/
```

因為主題應透過頁面、index、tag 與 frontmatter 管理，而不是透過新增資料夾管理。

---

# 18. Formula Note Template Reference

公式類筆記應參考 `templates/formula_note.md`，建議格式如下：

```markdown
# 公式名稱

---

## 背景

說明這個公式是在什麼情境下學到或使用。

---

## 公式

$$
formula = here
$$

---

## 符號說明

| 符號 | 說明 |
|---|---|
|  |  |

---

## 使用情境

說明這個公式可以用在哪些任務、模型、指標或流程中。

---

## 計算範例

```text
範例計算放這裡。
```

---

## 注意事項

- 

---

## 相關學習紀錄

- 

---

## 相關筆記

- 
```

---

# 19. Summary

本專案不是一般筆記資料夾，而是實習學習型 LLM-Wiki。

Agent 的主要工作不是單純回答問題，而是協助使用者：

1. 將原始混合式 Markdown 筆記整理成時間序摘要。
2. 從時間序摘要中萃取正式 wiki 知識。
3. 將公式、模型與指標計算方式整理成可追溯、可理解、可重複引用的公式筆記。
4. 維護穩定的 Markdown 知識庫。
5. 建立可查詢、可回顧、可向主管說明的學習成果。
6. 透過 indexes、frontmatter、tags 與雙向連結管理主題。
7. 遵守保密原則。
8. 避免重複、混亂與過度重構。
