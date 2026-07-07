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

# 2. Workspace Boundary

本 GitHub repository 的外層資料夾可能包含：

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

Agent 必須將以下資料夾視為正式工作區：

```text
internship_llm_wiki/
```

外層資料夾：

```text
others/
archive/
```

不屬於正式 LLM-Wiki 內容。
它們只作為備份、舊版檔案、zip 檔、臨時腳本或封存資料使用。

Agent 不應主動讀取、整理、萃取、修改或引用外層 `others/`、`archive/` 的內容，除非使用者明確要求。

---

# 3. Core Principles

Agent 必須遵守以下核心原則：

1. `raw/imported_notes/` 是原始資料層，是 source of truth，不得任意覆蓋、刪除或大幅改寫。
2. `logs/` 是時間序紀錄層，用於整理每日、每週、每月與會議紀錄。
3. `wiki/` 是正式知識層，用於保存可複習、可查詢、可長期維護的主題知識。
4. `indexes/` 是導航層，用於協助使用者與 Agent 快速找到相關筆記。
5. `templates/` 是格式規範層，新筆記應盡量遵守對應模板。
6. `prompts/` 是 Agent 工作提示詞層，用於保存可重複使用的 Codex 指令。
7. `scripts/` 是 PowerShell 輔助腳本層，只負責產生 Codex request，不保存長篇任務內容。
8. `assets/` 用於保存正式筆記可引用的非敏感圖片或附件。
9. `.agents/` 若存在，只作為 agent skill 或工具設定使用，不屬於正式 wiki 內容來源。
10. 不得保存公司機密、客戶個資、帳號密碼、API Key、Token、完整內部系統網址、未遮蔽截圖、未經允許的內部程式碼或敏感業務資料。
11. 主要使用繁體中文撰寫，必要時保留英文術語。
12. 數學公式應優先使用 Markdown / Obsidian 可讀的 LaTeX 格式。
13. 目錄架構已定稿，不得為了新主題任意新增頂層資料夾或 `wiki/` 大分類。
14. 新主題應透過新增 Markdown 頁面、更新 index、加入 tag 或 frontmatter 管理，而不是新增資料夾。
15. 每次新增或修改 wiki 頁面後，應盡量同步更新相關 index。
16. Agent 不得把猜測內容寫成事實；不確定的內容應標記為待確認。

---

# 4. Directory Structure

正式 workspace 結構如下：

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

說明：

1. `raw/processed/` 目前不作為正式使用資料夾。
2. `assets/diagrams/` 目前不作為正式使用資料夾。
3. `archive/` 不放在正式 workspace 內，而是放在 repository 外層。
4. `others/` 不放在正式 workspace 內，而是放在 repository 外層。
5. `examples/` 不放在正式 workspace 內；若有範例檔，應放在外層備份區或 skill 自己的 examples 目錄中。
6. `.agents/skills/karpathy-llm-wiki/examples/` 若存在，只屬於 skill 的參考資料，不是正式 raw、logs、wiki 或 indexes。

---

# 5. Directory Rules

## 5.1 raw/

`raw/` 用於保存尚未整理或剛匯入的原始資料。

本專案的主要原始資料型態是「混合式 Markdown 筆記」。一份 `.md` 檔案中可能同時包含：

* 文字筆記
* 每日學習紀錄
* 主管交代事項
* 任務描述
* 會議重點
* 概念解釋
* 工具學習紀錄
* 截圖引用
* 附件引用
* 尚未整理的術語或流程說明
* 數學公式、統計公式、模型定義、指標計算公式或符號說明

因此，`raw/` 不以「文字、截圖、附件、公式」分開管理，而是以「原始筆記」作為主要單位。

```text
raw/
├── inbox/
└── imported_notes/
```

用途：

* `raw/inbox/`：臨時放入尚未確認是否要正式匯入的素材。
* `raw/imported_notes/`：保存正式匯入的原始 Markdown 筆記。這些筆記應盡量保留原樣，作為 source of truth。

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
9. Agent 不應擅自刪除 `raw/` 中的資料。

---

## 5.2 logs/

`logs/` 用於保存由 Agent 整理後的時間序紀錄。

```text
logs/
├── daily/
├── weekly/
├── monthly/
└── meetings/
```

用途：

* `logs/daily/`：由 Agent 根據原始筆記整理出的每日學習摘要。
* `logs/weekly/`：每週學習總結。
* `logs/monthly/`：每月回顧。
* `logs/meetings/`：從原始筆記中萃取出的會議紀錄或會議重點。

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

## 5.3 wiki/

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
├── formulas/
├── business_context/
└── glossary/
```

`wiki/` 的資料夾結構必須保持穩定。
未來新增主題時，應新增 Markdown 頁面、更新 index 或加入 tag，不應新增新的 `wiki/` 大分類資料夾。

用途：

* `wiki/concepts/`：概念解釋，例如概念驗證(PoC, Proof of Concept)、資料倉儲(Data Warehouse)、ETL、API、RAG。
* `wiki/tools/`：工具使用筆記，例如 Google ADK、SQL、Python、Excel、Power BI、Git、Codex Desktop。
* `wiki/workflows/`：流程整理，例如報告產製流程、資料清洗流程、資料管線流程、上線前檢查流程。
* `wiki/tasks/`：單次任務紀錄，例如整理某份需求、修正某份報表、完成某次資料處理。
* `wiki/projects/`：多階段專案紀錄，例如 Google ADK PoC、RAG 原型、資料解析 pipeline、LLM-Wiki 建置。
* `wiki/troubleshooting/`：錯誤排除紀錄，例如環境錯誤、SQL 錯誤、資料格式錯誤、工具安裝錯誤。
* `wiki/data_notes/`：資料理解、欄位邏輯、資料品質與資料處理注意事項。
* `wiki/formulas/`：數學公式、統計公式、模型定義、評分公式、損失函數、指標計算公式與符號說明。
* `wiki/business_context/`：業務背景、部門流程、審核流程、金融與壽險相關背景。
* `wiki/glossary/`：專有名詞字典。

分類規則：

1. 這是概念嗎？放入 `wiki/concepts/`。
2. 這是工具嗎？放入 `wiki/tools/`。
3. 這是可重複執行的流程嗎？放入 `wiki/workflows/`。
4. 這是單次任務嗎？放入 `wiki/tasks/`。
5. 這是跨多日或多階段的工作嗎？放入 `wiki/projects/`。
6. 這是錯誤與解法嗎？放入 `wiki/troubleshooting/`。
7. 這是資料表、欄位、資料品質或資料處理理解嗎？放入 `wiki/data_notes/`。
8. 這是數學公式、統計公式、模型定義、評分公式、損失函數、指標計算公式或符號定義嗎？放入 `wiki/formulas/`。
9. 這是業務、公司流程、金融、壽險或部門背景嗎？放入 `wiki/business_context/`。
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

## 5.4 indexes/

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

用途：

* `indexes/home.md`：整個 LLM-Wiki 的首頁與入口。
* `indexes/learning_index.md`：每日、每週、每月與會議紀錄導覽。
* `indexes/concept_index.md`：概念筆記導覽。
* `indexes/task_index.md`：任務筆記導覽。
* `indexes/project_index.md`：專案筆記導覽。
* `indexes/tool_index.md`：工具筆記導覽。
* `indexes/workflow_index.md`：流程筆記導覽。
* `indexes/troubleshooting_index.md`：錯誤排除筆記導覽。
* `indexes/data_index.md`：資料筆記導覽。
* `indexes/formula_index.md`：公式筆記導覽。
* `indexes/business_context_index.md`：業務背景筆記導覽。
* `indexes/glossary_index.md`：術語與縮寫導覽。

規則：

1. `indexes/` 只做導覽，不寫成完整文章。
2. 新增或更新 `wiki/` 頁面後，應更新對應 index。
3. 新增或更新 `logs/` 頁面後，應更新 `learning_index.md`。
4. 不建立 `knowledge_graph_index.md`。
5. 不建立 `source_index.md`。
6. 不建立 `daily_index.md`、`meeting_index.md`、`attachment_index.md` 或 `screenshot_index.md`。
7. Knowledge Graph 關係應保留在每篇正式 `wiki/` 筆記中，不集中放入 index。
8. index 可以使用 Obsidian 雙向連結，例如 `[[google_adk]]`。
9. 不要將底線 escape 成 `[[google\_adk]]`。

---

## 5.5 assets/

`assets/` 用於保存正式 wiki 會引用的圖片、圖表與檔案。

```text
assets/
├── images/
└── files/
```

用途：

* `assets/images/`：正式筆記引用的非敏感圖片。
* `assets/files/`：正式筆記需要引用的非敏感附件。

規則：

1. 原始筆記中的圖片或附件應優先跟隨原始 Markdown 保存在 `raw/imported_notes/`。
2. 只有已確認可引用、已去除敏感資訊的圖片才可放入 `assets/images/`。
3. 正式筆記需要引用的非敏感附件可放入 `assets/files/`。
4. 敏感資料不得放入 `assets/`。
5. Agent 不得將未檢查的原始截圖直接複製到 `assets/`。
6. 若公式是以截圖形式存在，應優先轉寫成 LaTeX；若無法可靠轉寫，才將原圖作為補充附件，並標記需要人工確認。

---

## 5.6 templates/

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

1. 新增 `logs/` 或 `wiki/` 筆記時，應優先參考對應 template。
2. templates 只定義格式，不保存正式內容。
3. templates 不應包含真實公司資料、客戶資料或未遮蔽截圖。
4. 若某類筆記尚未有專用 template，可依照相近 template 或 prompt 中的通用結構產生。
5. template 中可包含 Knowledge Graph 區塊，但正式關聯內容應根據實際來源填寫。
6. 原始筆記不需要照 template 撰寫；template 主要用於整理後的 `logs/` 與 `wiki/`。

---

## 5.7 prompts/

`prompts/` 用於保存 Codex 可重複使用的任務指令。

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

* `01_import_raw_note.md`：匯入原始筆記。
* `02_generate_daily_log.md`：由 raw note 產生 daily log。
* `03_extract_wiki_notes.md`：由 daily log 萃取 wiki notes。
* `04_update_indexes.md`：更新 indexes。
* `05_generate_weekly_summary.md`：產生 weekly summary。
* `06_generate_monthly_review.md`：產生 monthly review。
* `07_process_meeting_note.md`：整理 meeting note。
* `08_sensitive_info_review.md`：進行敏感資訊審查。

規則：

1. prompts 是給 Codex 的任務說明，不是正式 wiki 內容。
2. Agent 應依照 prompt 的分工執行，不應把多個步驟混在一起。
3. `03_extract_wiki_notes.md` 只建立或更新 `wiki/` 筆記，不直接更新 `indexes/`。
4. `04_update_indexes.md` 才負責更新 `indexes/`。
5. 若任務涉及敏感內容，應先使用或參考 `08_sensitive_info_review.md`。
6. 不要在 prompts 中保存真實公司敏感資料。

---

## 5.8 scripts/

`scripts/` 用於保存 PowerShell 輔助腳本。

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
2. `.ps1` 不應包含長篇繁體中文任務說明。
3. 長篇任務說明應放在 `prompts/*.md`。
4. scripts 不直接呼叫固定 Codex CLI。
5. scripts 主要負責產生 `.codex_requests/` 中的 Markdown request。
6. `.codex_requests/` 是執行時產生的工作檔，不屬於正式 LLM-Wiki 知識內容。
7. `.codex_requests/` 可加入 `.gitignore`，避免提交到 GitHub。
8. Agent 不應將 `.codex_requests/` 當作正式來源萃取成 wiki。

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

## 5.9 .agents/

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

# 6. Standard Workflow

## 6.1 匯入原始筆記

來源：

```text
raw/inbox/
```

或使用者提供的 Markdown 筆記。

輸出：

```text
raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
```

使用 prompt：

```text
prompts/01_import_raw_note.md
```

規則：

1. 保留原始筆記內容。
2. 加入必要 metadata。
3. 標記是否需要敏感資訊審查。
4. 不產生 daily log。
5. 不建立 wiki。
6. 不更新 index。

---

## 6.2 敏感資訊審查

使用 prompt：

```text
prompts/08_sensitive_info_review.md
```

適用情境：

1. 原始筆記含截圖、附件或內部流程。
2. 原始筆記可能包含客戶、保單、資料表、欄位、帳密、API Key、Token 或完整內部 URL。
3. 要將 raw note 轉成 logs 或 wiki 之前。
4. 使用者要求檢查敏感資訊時。

規則：

1. 高風險資訊不得進入 logs 或 wiki。
2. 中風險內部流程應抽象化。
3. 不確定的資訊應標記為 `needs_review`。
4. 不得自行判定敏感內容可以公開。

---

## 6.3 產生 Daily Log

來源：

```text
raw/imported_notes/
```

輸出：

```text
logs/daily/YYYY-MM-DD.md
```

使用 prompt：

```text
prompts/02_generate_daily_log.md
```

規則：

1. daily log 是時間序摘要。
2. 不直接複製整份 raw note。
3. 不建立 wiki。
4. 不更新 indexes。
5. 必須保留 source trace。
6. 必須列出可萃取成 wiki 的候選項目。
7. 必須標記需要敏感資訊確認的內容。

---

## 6.4 產生 Meeting Note

來源：

```text
raw/imported_notes/
```

輸出：

```text
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

使用 prompt：

```text
prompts/07_process_meeting_note.md
```

規則：

1. meeting note 是會議內容整理，不是正式 wiki。
2. 不建立 wiki。
3. 不更新 indexes。
4. 不保存完整內部決策或敏感會議內容。
5. 涉及內部流程時應抽象化。
6. 可列出後續 wiki 候選項目。

---

## 6.5 萃取 Wiki Notes

來源：

```text
logs/daily/
```

必要時可參考：

```text
raw/imported_notes/
logs/meetings/
```

輸出：

```text
wiki/
```

使用 prompt：

```text
prompts/03_extract_wiki_notes.md
```

規則：

1. 根據 daily log 與 source trace 建立或更新 wiki notes。
2. 若同一主題已有頁面，優先更新既有頁面。
3. 不要建立重複頁面。
4. 不要直接複製原始筆記。
5. 不要使用外部知識補充來源中沒有出現的內容。
6. 不確定內容標記為待確認。
7. 必須加入來源追蹤。
8. 必須加入敏感資訊檢查。
9. 正式 wiki note 應包含 Knowledge Graph 關聯區塊。
10. 本步驟不直接更新 indexes，只列出可能需要更新的 indexes。

---

## 6.6 更新 Indexes

來源：

```text
wiki/
logs/
```

輸出：

```text
indexes/
```

使用 prompt：

```text
prompts/04_update_indexes.md
```

規則：

1. 只更新既有 index。
2. 不新增其他 index。
3. Index 只做導覽，不保存完整知識內容。
4. 不建立完整 Knowledge Graph 總表。
5. 新增 concept note 後更新 `concept_index.md`。
6. 新增 tool note 後更新 `tool_index.md`。
7. 新增 workflow note 後更新 `workflow_index.md`。
8. 新增 task note 後更新 `task_index.md`。
9. 新增 project note 後更新 `project_index.md`。
10. 新增 troubleshooting note 後更新 `troubleshooting_index.md`。
11. 新增 data note 後更新 `data_index.md`。
12. 新增 formula note 後更新 `formula_index.md`。
13. 新增 business context note 後更新 `business_context_index.md`。
14. 新增 glossary note 後更新 `glossary_index.md`。
15. 新增 daily、weekly、monthly 或 meeting note 後更新 `learning_index.md`。

---

## 6.7 產生 Weekly Summary

來源：

```text
logs/daily/
logs/meetings/
```

輸出：

```text
logs/weekly/YYYY-Www.md
```

使用 prompt：

```text
prompts/05_generate_weekly_summary.md
```

規則：

1. weekly summary 是週次整理。
2. 不建立 wiki。
3. 不更新 indexes。
4. 應列出本週學習重點、完成事項、進行中事項、問題、待確認內容、wiki 建置進度與下週建議。
5. 必須保留 source trace。
6. 不保存敏感資訊。

---

## 6.8 產生 Monthly Review

來源：

```text
logs/weekly/
logs/daily/
logs/meetings/
```

輸出：

```text
logs/monthly/YYYY-MM.md
```

使用 prompt：

```text
prompts/06_generate_monthly_review.md
```

規則：

1. monthly review 是月度回顧。
2. 不建立 wiki。
3. 不更新 indexes。
4. 應整理本月主題、任務、專案、工具、流程、問題、能力成長與下月建議。
5. 必須保留 source trace。
6. 不保存敏感資訊。

---

# 7. Knowledge Graph Rules

本專案不建立獨立的 Knowledge Graph index。
Knowledge Graph 關聯分散維護於每一篇正式 `wiki/` 筆記中。

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

# 8. Formula Rules

若原始筆記、daily log 或 wiki note 中出現公式，應判斷是否需要整理到：

```text
wiki/formulas/
```

公式類內容包括：

* 數學公式
* 統計公式
* 模型定義
* 損失函數
* 評分公式
* 權重計算
* 指標計算
* 符號說明
* 公式截圖

公式整理規則：

1. 優先使用 LaTeX 表示公式。
2. 不只貼公式，必須補上背景、符號說明、使用情境與來源。
3. 不任意改寫原始公式的數學意義。
4. 不確定的公式應標記為 `needs_review`。
5. 若公式來自圖片，應轉寫成 LaTeX 並標記待確認。
6. 若公式涉及公司內部敏感計算邏輯，應抽象化處理。
7. 新增公式筆記後，應更新 `indexes/formula_index.md`。
8. 若公式只是某個 concept、tool、workflow、data note 的一部分，也可以先在該筆記中簡短說明，並視需要建立獨立 formula note。

LaTeX 範例：

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

---

# 9. Sensitive Information Rules

本專案不得保存或擴散敏感資訊。

不得寫入正式 `logs/`、`wiki/`、`indexes/` 或 `assets/` 的內容包括：

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

# 10. Naming Rules

## 10.1 Raw Notes

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

## 10.2 Logs

```text
logs/daily/YYYY-MM-DD.md
logs/weekly/YYYY-Www.md
logs/monthly/YYYY-MM.md
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

---

## 10.3 Wiki Notes

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
6. 縮寫術語可在 `wiki/glossary/` 使用小寫縮寫命名，例如 `poc.md`、`api.md`。
7. 完整概念應放在 `wiki/concepts/`，例如 `proof_of_concept.md`。

---

# 11. Frontmatter Rules

正式 `logs/` 與 `wiki/` 筆記建議加入 YAML frontmatter。

Daily log 範例：

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

Wiki note 範例：

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

Formula note 範例：

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

# 12. Codex Operating Rules

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

---

# 13. Daily Maintenance Workflow

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

# 14. Weekly Maintenance Workflow

每週建議流程：

1. 整理本週 `logs/daily/` 與 `logs/meetings/`。
2. 使用 `prompts/05_generate_weekly_summary.md` 產生 `logs/weekly/YYYY-Www.md`。
3. 檢查本週新增的 wiki 頁面。
4. 使用 `prompts/04_update_indexes.md` 更新 indexes。
5. 檢查是否有重複頁面。
6. 整理可向主管回報的學習成果。
7. 標記下週需要繼續學習的主題。

---

# 15. Monthly Maintenance Workflow

每月建議流程：

1. 整理本月 `logs/weekly/`、`logs/daily/` 與 `logs/meetings/`。
2. 使用 `prompts/06_generate_monthly_review.md` 產生 `logs/monthly/YYYY-MM.md`。
3. 檢查本月新增的任務與專案。
4. 檢查重要工具、流程、公式是否已整理成正式 wiki。
5. 使用 `prompts/04_update_indexes.md` 更新 indexes。
6. 整理本月能力成長與後續補強方向。
7. 若有過時內容，可由使用者決定是否移至外層 `archive/`。

---

# 16. Things Not To Do

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

# 17. Decision Checklist

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

# 18. Final Rule

本專案的核心不是建立很多資料夾，而是讓實習期間的原始學習紀錄，逐步轉換為可查詢、可維護、可連結、可回顧的 Markdown 知識庫。

Agent 應優先維持以下簡單流向：

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
