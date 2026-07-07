# OBSIDIAN_GUIDE.md

本文件說明如何使用 Obsidian 閱讀、整理與維護 `internship_llm_wiki`。

本專案的主要整理工作可以由 Codex 協助完成；Obsidian 則主要用來：

1. 閱讀筆記。
2. 搜尋主題。
3. 建立與檢查雙向連結。
4. 查看每日、每週與每月學習紀錄。
5. 回顧工具、流程、專案、資料筆記、公式與業務背景。
6. 將實習學習內容整理成可長期複習的 Markdown 知識庫。

---

# 1. 開啟專案

## 1.1 正確開啟位置

如果 GitHub repository 結構是：

```text
llm-wiki-V2/
├── internship_llm_wiki/
├── others/
└── archive/
```

請用 Obsidian 開啟：

```text
llm-wiki-V2/internship_llm_wiki/
```

也就是正式的 Obsidian vault 與 Codex workspace。

正確做法：

```text
Obsidian → Open folder as vault → 選擇 llm-wiki-V2/internship_llm_wiki/
```

不要開啟外層：

```text
llm-wiki-V2/
```

原因：

1. `llm-wiki-V2/` 是 repository 外層工作區。
2. `others/` 只放備份、zip、舊版腳本、臨時檔，不是正式 LLM-Wiki。
3. `archive/` 只放外層封存內容，不是正式 LLM-Wiki。
4. Obsidian 若開外層，會把 `others/`、`archive/` 也納入搜尋與連結範圍，容易混淆。

---

## 1.2 不要只開子資料夾

不要只開啟：

```text
wiki/
logs/
raw/
indexes/
```

原因：

1. `wiki/` 只包含正式知識頁，缺少 raw、logs、indexes、templates 與 prompts 的上下文。
2. `logs/` 只包含時間序紀錄，不能代表完整知識庫。
3. `raw/` 是原始來源，不是正式閱讀入口。
4. `indexes/` 是導覽層，必須搭配 `wiki/` 與 `logs/` 使用。

正確 vault 根目錄應是：

```text
internship_llm_wiki/
```

---

# 2. 建議閱讀入口

開啟 Obsidian 後，建議優先從以下檔案開始：

```text
indexes/home.md
README.md
PROJECT_RULES.md
```

其中：

| 檔案                  | 用途                        |
| ------------------- | ------------------------- |
| `indexes/home.md`   | 整個知識庫的首頁                  |
| `README.md`         | 專案用途與資料流說明                |
| `PROJECT_RULES.md`  | 使用者維護規則                   |
| `AGENTS.md`         | 給 Codex / LLM Agent 的完整規範 |
| `CODEX_WORKFLOW.md` | 使用 Codex 整理筆記的流程          |
| `OBSIDIAN_GUIDE.md` | Obsidian 使用方式             |

建議日常閱讀順序：

```text
indexes/home.md
        ↓
indexes/learning_index.md
        ↓
相關 logs 或 wiki 筆記
        ↓
相關 index 或 Knowledge Graph 連結
```

---

# 3. Obsidian 中的主要資料夾用途

正式 vault 應維持以下結構：

```text
internship_llm_wiki/
├── raw/
├── logs/
├── wiki/
├── indexes/
├── assets/
├── templates/
├── prompts/
├── scripts/
└── .agents/
```

其中，日常閱讀與整理主要使用：

```text
raw/
logs/
wiki/
indexes/
assets/
```

`templates/`、`prompts/`、`scripts/`、`.agents/` 是輔助層，不是主要閱讀層。

---

## 3.1 raw/

`raw/` 是原始資料層。

```text
raw/
├── inbox/
└── imported_notes/
```

### raw/inbox/

`raw/inbox/` 是暫存區。

適合放：

* 尚未確認是否要整理的筆記
* 臨時文字
* 未分類素材
* 待確認附件
* 尚未匯入的 Markdown 原始筆記

`raw/inbox/` 不應長期堆積。確認要整理後，應匯入到：

```text
raw/imported_notes/
```

---

### raw/imported_notes/

`raw/imported_notes/` 用來保存正式匯入的原始 Markdown 筆記。

這些筆記可以比較自由，不需要一開始就整理得很工整。

例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

原始筆記可能包含：

* 今日學到什麼
* 主管提醒
* 會議內容
* 截圖
* 附件
* 工具操作
* 錯誤紀錄
* 公式
* 尚未整理的關鍵字

注意：

1. `raw/` 是原始來源，不是正式 wiki。
2. 原始筆記應盡量保留原樣。
3. 不要直接把 raw note 當成正式知識頁。
4. 若 raw note 有附件，附件應優先跟隨原始筆記保存。
5. 若 raw note 有敏感資訊，整理到 logs 或 wiki 時必須抽象化。

---

## 3.2 logs/

`logs/` 是時間序紀錄層。

```text
logs/
├── daily/
├── weekly/
├── monthly/
└── meetings/
```

在 Obsidian 中，`logs/` 用來查看：

```text
我在什麼時間學到了什麼？
```

例如：

```text
logs/daily/2026-07-03.md
logs/weekly/2026-W27.md
logs/monthly/2026-07.md
logs/meetings/2026-07-03_team_meeting.md
```

`logs/` 不依主題分類。

如果你想找 Google ADK、SQL、PoC、公式或某個流程，應該從 `wiki/` 或 `indexes/` 找。

---

### logs/daily/

每日學習摘要放在：

```text
logs/daily/
```

建議命名：

```text
YYYY-MM-DD.md
```

例如：

```text
logs/daily/2026-07-03.md
```

每日紀錄應包含：

* 今日摘要
* 今日學習重點
* 今日任務
* 今日遇到的問題
* 待確認事項
* 可萃取成 wiki 的候選項目
* 可能需要更新的 index
* 敏感資訊檢查
* Source Trace

---

### logs/weekly/

每週整理放在：

```text
logs/weekly/
```

建議命名：

```text
YYYY-Www.md
```

例如：

```text
logs/weekly/2026-W27.md
```

每週整理應包含：

* 本週學習重點
* 本週完成事項
* 本週進行中事項
* 本週遇到的問題
* 本週新增或更新的 wiki 頁面
* 本週待確認事項
* 下週建議

---

### logs/monthly/

每月回顧放在：

```text
logs/monthly/
```

建議命名：

```text
YYYY-MM.md
```

例如：

```text
logs/monthly/2026-07.md
```

每月回顧應包含：

* 本月主要學習主題
* 本月參與的任務與專案
* 本月新增的正式知識
* 本月工具與流程學習
* 本月問題與卡點
* 本月能力成長
* 下月建議

---

### logs/meetings/

會議紀錄放在：

```text
logs/meetings/
```

建議命名：

```text
YYYY-MM-DD_short_meeting_name.md
```

例如：

```text
logs/meetings/2026-07-03_team_meeting.md
```

會議紀錄應包含：

* 會議日期
* 會議主題
* 重要討論內容
* 主管或同事提醒
* 待辦事項
* 可整理成 wiki 的項目
* 需要人工確認或可能涉及敏感資訊的內容

---

## 3.3 wiki/

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

在 Obsidian 中，`wiki/` 是最主要的複習區。

各資料夾用途如下：

| 資料夾                 | 用途          |
| ------------------- | ----------- |
| `concepts/`         | 概念解釋        |
| `tools/`            | 工具使用筆記      |
| `workflows/`        | 可重複執行的流程    |
| `tasks/`            | 單次任務紀錄      |
| `projects/`         | 多階段專案紀錄     |
| `troubleshooting/`  | 錯誤排除        |
| `data_notes/`       | 資料理解與資料處理   |
| `formulas/`         | 公式、模型與指標計算  |
| `business_context/` | 業務背景與公司流程理解 |
| `glossary/`         | 專有名詞字典      |

---

### wiki/concepts/

放概念解釋。

例如：

```text
wiki/concepts/proof_of_concept.md
wiki/concepts/data_warehouse.md
wiki/concepts/api.md
```

適合內容：

* 技術概念
* 管理概念
* 資料概念
* 系統概念
* AI 或資料處理方法

---

### wiki/tools/

放工具使用筆記。

例如：

```text
wiki/tools/google_adk.md
wiki/tools/python.md
wiki/tools/git.md
```

適合內容：

* 工具用途
* 使用情境
* 指令或操作方式
* 常見問題
* 和其他流程的關係

---

### wiki/workflows/

放可重複執行的流程。

例如：

```text
wiki/workflows/report_generation_workflow.md
wiki/workflows/raw_to_daily_log_workflow.md
```

適合內容：

* 操作步驟
* 輸入與輸出
* 前置條件
* 注意事項
* 和工具、任務、專案的關係

---

### wiki/tasks/

放單次任務紀錄。

例如：

```text
wiki/tasks/task_20260703_report_review.md
```

適合內容：

* 主管交辦事項
* 單次文件整理
* 單次資料處理
* 單次測試或驗證
* 任務狀態與待確認事項

---

### wiki/projects/

放多階段專案紀錄。

例如：

```text
wiki/projects/google_adk_poc_project.md
wiki/projects/internship_llm_wiki_project.md
```

適合內容：

* PoC
* Prototype
* Demo
* 跨多日任務
* 多階段工作主題

---

### wiki/troubleshooting/

放錯誤排除紀錄。

例如：

```text
wiki/troubleshooting/powershell_command_not_found.md
wiki/troubleshooting/git_push_error.md
```

適合內容：

* 錯誤訊息
* 發生情境
* 可能原因
* 解決方式
* 驗證方式
* 預防方式

---

### wiki/data_notes/

放資料理解與資料處理相關筆記。

例如：

```text
wiki/data_notes/date_field_format.md
wiki/data_notes/missing_value_handling.md
```

適合內容：

* 欄位理解
* 資料來源
* 資料品質
* 缺失值處理
* 資料清理
* API 回傳資料理解

注意：

1. 不保存真實客戶資料。
2. 不保存完整內部表名。
3. 不保存敏感欄位代碼。
4. 必要時使用抽象描述。

---

### wiki/formulas/

放公式類筆記。

例如：

```text
wiki/formulas/time_decay_weight.md
wiki/formulas/weighted_average.md
```

適合內容：

* 數學公式
* 統計公式
* 模型定義
* 評分公式
* 權重計算
* 損失函數
* 指標計算方式
* 符號說明

公式應優先使用 LaTeX。

---

### wiki/business_context/

放業務背景與公司流程理解。

例如：

```text
wiki/business_context/eab_review_process.md
wiki/business_context/cab_deployment_control.md
```

適合內容：

* 業務背景
* 組織流程
* 審查流程
* 上線流程
* 實習任務脈絡
* 金融或壽險背景知識

注意：

1. 應使用抽象化描述。
2. 不保存完整內部流程。
3. 不保存可識別具體部門、人員或內部系統的資訊。
4. 不保存未抽象化的審查規則或上線流程。

---

### wiki/glossary/

放專有名詞字典。

例如：

```text
wiki/glossary/poc.md
wiki/glossary/api.md
wiki/glossary/etl.md
```

適合內容：

* 英文縮寫
* 中文翻譯
* 術語定義
* 使用情境
* 相關概念連結

若只是縮寫或名詞解釋，放 `wiki/glossary/`。
若要整理完整概念，放 `wiki/concepts/`。

---

## 3.4 indexes/

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

在 Obsidian 中，`indexes/` 是最適合用來快速找筆記的地方。

建議常用：

| 檔案                                  | 用途     |
| ----------------------------------- | ------ |
| `indexes/home.md`                   | 首頁     |
| `indexes/learning_index.md`         | 學習紀錄總覽 |
| `indexes/concept_index.md`          | 概念總覽   |
| `indexes/task_index.md`             | 任務總覽   |
| `indexes/project_index.md`          | 專案總覽   |
| `indexes/tool_index.md`             | 工具總覽   |
| `indexes/workflow_index.md`         | 流程總覽   |
| `indexes/troubleshooting_index.md`  | 錯誤排除總覽 |
| `indexes/data_index.md`             | 資料筆記總覽 |
| `indexes/formula_index.md`          | 公式總覽   |
| `indexes/business_context_index.md` | 業務背景總覽 |
| `indexes/glossary_index.md`         | 術語總覽   |

Index 的用途是導覽，不是完整筆記本體。

完整內容應放在：

```text
wiki/
logs/
```

---

## 3.5 assets/

`assets/` 放正式筆記可以引用的非敏感圖片與附件。

```text
assets/
├── images/
└── files/
```

用途：

| 資料夾              | 用途           |
| ---------------- | ------------ |
| `assets/images/` | 正式筆記引用的非敏感圖片 |
| `assets/files/`  | 正式筆記引用的非敏感附件 |

規則：

1. 原始圖片與附件應優先跟隨 raw note 保存。
2. 只有確認不含敏感資訊、且需要被正式 wiki 引用的圖片，才放入 `assets/images/`。
3. 只有確認不含敏感資訊、且需要被正式 wiki 引用的附件，才放入 `assets/files/`。
4. 未遮蔽內部系統截圖不得放入 `assets/`。
5. 公司敏感資料不得放入 `assets/`。

---

## 3.6 templates/

`templates/` 是筆記格式層。

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

使用方式：

1. 原始筆記不用照 template 寫。
2. 整理成 logs 或 wiki 時，才參考 template。
3. 若手動新增正式 wiki note，可以先複製對應 template。
4. template 不應保存真實公司資料或敏感資訊。

---

## 3.7 prompts/

`prompts/` 是 Codex 任務指令層。

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

在 Obsidian 中，你可以閱讀 prompts 來理解 Codex 每個步驟的工作範圍。

但 prompts 不是正式知識內容，不應被當成 wiki note。

---

## 3.8 scripts/

`scripts/` 是 PowerShell 輔助腳本層。

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

用途：

1. 產生 Codex request。
2. 輔助執行固定流程。
3. 減少每次手動複製 prompt 的成本。

注意：

1. scripts 不是正式 wiki 內容。
2. `.codex_requests/` 是執行時產物，不應被當成正式知識。
3. PowerShell 腳本只負責執行邏輯，長篇任務說明在 `prompts/` 中。

---

## 3.9 .agents/

`.agents/` 若存在，用於保存 agent skill 或工具設定。

建議位置：

```text
.agents/
└── skills/
    └── karpathy-llm-wiki/
```

注意：

1. `.agents/` 不是正式筆記內容。
2. `.agents/skills/*/examples/` 是 skill 參考範例，不是實習紀錄。
3. 不要把 skill examples 萃取成 `logs/` 或 `wiki/`。
4. 只有在需要調整 skill 時，才處理 `.agents/` 內容。

---

# 4. 建議的 Obsidian 工作方式

## 4.1 每天寫原始筆記

每天先把筆記寫在：

```text
raw/inbox/
```

或直接寫在：

```text
raw/imported_notes/
```

建議正式匯入後的位置：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

原始筆記不需要照模板。

你可以自由記錄：

```text
今天學到 PoC
主管提到 EAB / CAB
Google ADK 可能可以產固定格式報告
遇到 PowerShell 指令錯誤
貼截圖
記公式
先寫下還不確定的問題
```

之後再用 Codex 依照 prompts 整理。

---

## 4.2 每天整理 Daily Log

當 raw note 完成後，請使用 Codex 或 scripts 產生：

```text
logs/daily/YYYY-MM-DD.md
```

對應 prompt：

```text
prompts/02_generate_daily_log.md
```

daily log 主要回答：

```text
今天學到了什麼？
今天做了什麼？
有哪些內容值得沉澱成 wiki？
```

Daily log 不是正式 wiki。
如果某個內容需要長期複習，應再整理到 `wiki/`。

---

## 4.3 從 Daily Log 萃取 Wiki

當 `logs/daily/` 已經整理完成後，可以使用 Codex 根據 daily log 產生正式 wiki note。

對應 prompt：

```text
prompts/03_extract_wiki_notes.md
```

常見輸出位置：

```text
wiki/concepts/
wiki/tools/
wiki/workflows/
wiki/tasks/
wiki/projects/
wiki/troubleshooting/
wiki/data_notes/
wiki/formulas/
wiki/business_context/
wiki/glossary/
```

注意：

1. 若同一主題已經有 wiki note，應更新既有頁面。
2. 不要建立重複頁面。
3. 不要把 raw note 完整複製到 wiki。
4. 不確定的內容應標記為待確認。
5. 敏感資訊應先抽象化。

---

## 4.4 更新 Indexes

新增或更新 wiki note 後，應更新對應 index。

對應 prompt：

```text
prompts/04_update_indexes.md
```

對應規則：

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

## 4.5 每週回顧

每週結束時，使用：

```text
prompts/05_generate_weekly_summary.md
```

產生：

```text
logs/weekly/YYYY-Www.md
```

週回顧應協助你回答：

```text
這週主要學到了什麼？
完成了哪些任務？
新增了哪些 wiki？
有哪些問題還沒解？
下週要繼續做什麼？
```

---

## 4.6 每月回顧

每月結束時，使用：

```text
prompts/06_generate_monthly_review.md
```

產生：

```text
logs/monthly/YYYY-MM.md
```

月回顧應協助你回答：

```text
這個月的主要學習成果是什麼？
有哪些專案或任務推進？
有哪些工具或流程變熟？
有哪些內容可以向主管回報？
下個月需要補強什麼？
```

---

# 5. Obsidian 連結使用方式

## 5.1 雙向連結

Obsidian 支援雙向連結。

建議格式：

```text
[[google_adk]]
[[proof_of_concept]]
[[eab_review_process]]
```

不要寫成：

```text
[[google\_adk]]
[[proof\_of\_concept]]
```

底線不需要 escape。

---

## 5.2 連到不同資料夾的筆記

如果檔名唯一，可以直接寫：

```text
[[google_adk]]
```

如果未來出現同名檔案，可以寫完整路徑：

```text
[[wiki/tools/google_adk]]
```

建議優先保持檔名唯一，降低連結混淆。

---

## 5.3 連到標題

可以連到特定標題：

```text
[[google_adk#常見問題]]
[[proof_of_concept#實習中的使用情境]]
```

這適合在 index 或 wiki note 中導向特定段落。

---

## 5.4 連到 block

若需要連到特定段落，可以使用 Obsidian block reference。

範例：

```text
[[note_name#^block-id]]
```

但本專案不建議過度使用 block reference。
大多數情況下，連到 note 或標題即可。

---

# 6. Tag 使用方式

Tag 可以輔助搜尋，但不應取代 index。

建議使用簡單、穩定的 tag：

```text
#poc
#google_adk
#workflow
#formula
#data_note
#business_context
#troubleshooting
#needs_review
```

規則：

1. tag 用於輔助查找。
2. index 才是主要導覽。
3. 不要建立太多相似 tag。
4. 不要同時使用 `#google_adk`、`#google-adk`、`#GoogleADK` 這類變體。
5. 若已有 index 可管理，不要只靠 tag。

---

# 7. Graph View 使用方式

Obsidian Graph View 可以用來查看筆記之間的連結。

本專案的 Knowledge Graph 不建立獨立總表，而是分散在每一篇正式 `wiki/` 筆記中。

正式 wiki note 應包含：

```markdown
## Knowledge Graph 關聯
```

主要關係類型包括：

| 關聯類型           | 用途                   |
| -------------- | -------------------- |
| `prerequisite` | 理解本頁前應先理解的上游知識       |
| `used_by`      | 本頁內容被哪些任務、專案、流程或公式使用 |
| `related`      | 一般相關知識               |
| `input`        | 流程、工具或公式的輸入          |
| `output`       | 流程、工具或公式的輸出          |
| `similar`      | 相似或容易混淆的概念           |
| `depends_on`   | 執行或理解上依賴的工具、資料或流程    |
| `part_of`      | 本頁屬於某個較大的任務、專案或流程    |

使用原則：

1. 優先使用 Obsidian 雙向連結，例如 `[[tool_name]]`。
2. 不確定頁面是否已存在時，也可以先建立 `[[note_name]]`。
3. 不要過度連結。
4. 只保留有助於理解、查詢與複習的關聯。
5. 不要建立會暴露敏感內部流程或系統細節的連結。
6. `indexes/` 負責分類導覽；Knowledge Graph 關係由 `wiki/` 內文維護。

---

# 8. Search 使用方式

Obsidian 搜尋適合用於快速查找：

* 工具名稱
* 錯誤訊息
* 日期
* 主管提醒
* 公式名稱
* 專案名稱
* 術語縮寫

常見搜尋方式：

```text
google_adk
PoC
needs_review
source_raw_note
sensitive_review_status
```

也可以搜尋資料夾：

```text
path:wiki/tools google_adk
path:logs/daily PoC
path:wiki/formulas weight
```

建議：

1. 查主題時先看 `indexes/`。
2. 查原始來源時看 `raw/imported_notes/`。
3. 查時間脈絡時看 `logs/`。
4. 查正式知識時看 `wiki/`。
5. 查公式時看 `wiki/formulas/` 與 `indexes/formula_index.md`。
6. 查業務背景時看 `wiki/business_context/` 與 `indexes/business_context_index.md`。

---

# 9. 敏感資訊注意事項

使用 Obsidian 維護本專案時，必須注意敏感資訊。

不要保存：

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

如果需要記錄，請使用抽象描述。

例如：

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

若不確定是否敏感，請標記：

```text
needs_review
```

並使用：

```text
prompts/08_sensitive_info_review.md
```

進行檢查。

---

# 10. 建議的日常操作流程

## 10.1 一般學習筆記流程

```text
raw/inbox/
        ↓
raw/imported_notes/
        ↓
logs/daily/
        ↓
wiki/
        ↓
indexes/
```

步驟：

1. 將原始筆記放入 `raw/inbox/` 或 `raw/imported_notes/`。
2. 使用 `prompts/01_import_raw_note.md` 匯入原始筆記。
3. 使用 `prompts/08_sensitive_info_review.md` 檢查敏感資訊。
4. 使用 `prompts/02_generate_daily_log.md` 產生 daily log。
5. 使用 `prompts/03_extract_wiki_notes.md` 萃取 wiki notes。
6. 使用 `prompts/04_update_indexes.md` 更新 indexes。
7. 在 Obsidian 中檢查連結與內容是否合理。

---

## 10.2 會議筆記流程

```text
raw/imported_notes/
        ↓
logs/meetings/
        ↓
wiki/ 或 indexes/
```

步驟：

1. 將含會議內容的原始筆記放入 `raw/imported_notes/`。
2. 使用 `prompts/07_process_meeting_note.md` 整理 meeting note。
3. 檢查是否有敏感資訊。
4. 若有長期可用知識，再整理到 `wiki/`。
5. 若新增 wiki note，再更新 indexes。

---

## 10.3 錯誤排除流程

```text
logs/daily/
        ↓
wiki/troubleshooting/
        ↓
indexes/troubleshooting_index.md
```

步驟：

1. 在 daily log 中記錄錯誤。
2. 若錯誤具有重複參考價值，建立 troubleshooting note。
3. 補上錯誤訊息、發生情境、原因、解法、驗證方式。
4. 更新 `indexes/troubleshooting_index.md`。

---

## 10.4 公式整理流程

```text
raw/imported_notes/ 或 logs/daily/
        ↓
wiki/formulas/
        ↓
indexes/formula_index.md
```

步驟：

1. 找出公式、模型定義、權重計算或指標計算方式。
2. 轉寫成 LaTeX。
3. 補上符號說明。
4. 補上使用情境。
5. 標記是否涉及敏感計算邏輯。
6. 更新 `indexes/formula_index.md`。

---

## 10.5 業務背景整理流程

```text
raw/imported_notes/ 或 logs/daily/
        ↓
wiki/business_context/
        ↓
indexes/business_context_index.md
```

步驟：

1. 找出業務背景、審查流程、上線流程、組織角色或實習情境脈絡。
2. 先抽象化敏感內容。
3. 不保存完整內部流程。
4. 不保存具體部門、人名、系統名稱或內部規則。
5. 整理成 business context note。
6. 更新 `indexes/business_context_index.md`。

---

# 11. 不要在 Obsidian 中做的事

不要：

1. 把外層 `others/` 當成正式筆記來源。
2. 把外層 `archive/` 當成正式筆記來源。
3. 在正式 workspace 中新增 `examples/` 資料夾。
4. 在正式 workspace 中新增 `raw/processed/` 資料夾。
5. 在正式 workspace 中新增 `assets/diagrams/` 資料夾。
6. 把所有內容都放在 `raw/` 不整理。
7. 把所有內容都放在 `logs/` 不萃取 wiki。
8. 每遇到新主題就新增資料夾。
9. 把 `logs/` 改成主題分類。
10. 把 `wiki/` 改成主題資料夾分類。
11. 把 prompts 當成 wiki note。
12. 把 scripts 當成 wiki note。
13. 把 `.agents/skills/*/examples/` 當成實習筆記。
14. 保存未抽象化的公司敏感資訊。
15. 保存未遮蔽的內部截圖。
16. 保存真實客戶資料。
17. 保存內部帳密、API Key 或 Token。
18. 未經確認就整理公司內部公式或決策邏輯。

---

# 12. 建議首頁設定

建議將以下檔案作為 Obsidian 的主要入口：

```text
indexes/home.md
```

你可以將它釘選在 Obsidian 左側或加入書籤。

常用入口順序：

```text
indexes/home.md
indexes/learning_index.md
indexes/tool_index.md
indexes/concept_index.md
indexes/workflow_index.md
indexes/project_index.md
indexes/formula_index.md
indexes/business_context_index.md
indexes/glossary_index.md
```

---

# 13. 建議使用習慣

建議每天：

1. 先寫 raw note。
2. 不急著分類。
3. 當天或隔天用 Codex 整理 daily log。
4. 只把真正可重複使用的內容萃取成 wiki。
5. 每次新增 wiki note 後更新 index。
6. 不確定內容標記為 `needs_review`。
7. 敏感內容只保留抽象版本。

建議每週：

1. 檢查本週 daily logs。
2. 產生 weekly summary。
3. 檢查新增的 wiki notes 是否已被 index 收錄。
4. 檢查是否有重複頁面。
5. 整理可向主管回報的成果。

建議每月：

1. 產生 monthly review。
2. 檢查本月任務與專案進度。
3. 檢查重要工具、流程、公式與業務背景是否已有正式 wiki note。
4. 檢查過時內容是否需要移到外層 `archive/`。
5. 整理下個月需要補強的主題。

---

# 14. 最終原則

Obsidian 的角色是幫助你閱讀、搜尋、連結與複習。
Codex 的角色是協助你整理、分類、萃取與更新。

本專案最重要的流向是：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

日常使用時，只要維持這個流向，就能避免筆記散亂、重複或混入敏感資訊。
