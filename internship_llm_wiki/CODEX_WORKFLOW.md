# CODEX_WORKFLOW.md

本文件說明如何使用 Codex Desktop 協助維護 `internship_llm_wiki`。

本專案的原則是：

```text
使用者負責記錄與審核
Codex 負責整理、分類、連結與維護
```

Codex 不應取代使用者判斷，也不應擅自刪除原始筆記、改變目錄架構或保存敏感資訊。

---

# 1. Workspace 邊界

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

才是正式的 Obsidian vault 與 Codex Desktop workspace。

使用 Codex Desktop 時，請開啟：

```text
internship_llm_wiki/
```

不要開啟外層：

```text
llm-wiki-V2/
```

原因：

1. `llm-wiki-V2/` 是 repository 外層工作區。
2. `others/` 只放備份、zip、臨時檔或舊版產物，不是正式 LLM-Wiki。
3. `archive/` 只作為外層封存區，不是正式 LLM-Wiki。
4. Codex 若開外層，可能把備份、範例、舊檔或封存內容誤判為正式知識來源。

Codex 應只處理正式 workspace 內的內容：

```text
internship_llm_wiki/
```

除非使用者明確要求，否則 Codex 不應主動讀取、整理、萃取或修改外層 `others/` 與 `archive/`。

---

# 2. Codex 在本專案中的角色

Codex 的主要工作是協助將原始實習筆記整理成可長期維護的 LLM-Wiki。

Codex 可以協助：

1. 讀取 `raw/inbox/` 或 `raw/imported_notes/` 中的原始 Markdown 筆記。
2. 將原始筆記匯入並整理到 `raw/imported_notes/`。
3. 檢查原始筆記是否含有敏感資訊。
4. 產生 `logs/daily/` 每日學習摘要。
5. 從原始筆記中整理 `logs/meetings/` 會議紀錄。
6. 從 daily log 中萃取正式知識到 `wiki/`。
7. 建立或更新工具、概念、流程、任務、專案、錯誤排除、資料筆記、公式、業務背景與術語頁面。
8. 更新 `indexes/` 中的索引。
9. 補上 frontmatter、tags、source trace 與相關筆記連結。
10. 檢查是否有重複頁面、缺少索引、敏感資訊或待確認內容。
11. 產生每週與每月學習總結。

Codex 不應該：

1. 刪除 `raw/` 中的原始筆記。
2. 覆蓋或大幅改寫原始筆記。
3. 任意新增頂層資料夾。
4. 任意新增 `wiki/` 大分類資料夾。
5. 任意新增 `logs/` 主題資料夾。
6. 直接把原始筆記完整複製到 `wiki/`。
7. 保存未抽象化的公司敏感資訊。
8. 編造不存在的主管要求、專案背景或公司流程。
9. 把不確定的公式、流程或業務規則寫成已確認事實。
10. 將外層 `others/`、外層 `archive/` 或 `.agents/skills/*/examples/` 當成正式來源。
11. 將 `.codex_requests/` 當成正式 wiki 內容。

---

# 3. 整體工作流程

本專案的主要資料流如下：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

Codex 的標準整理流程是：

1. 匯入或確認原始筆記。
2. 檢查敏感資訊。
3. 產生 daily log 或 meeting note。
4. 判斷可沉澱的正式知識。
5. 建立或更新 wiki 頁面。
6. 更新相關 index。
7. 回報新增、修改與待確認項目。

更細的流程如下：

```text
raw/inbox/
        ↓
prompts/01_import_raw_note.md
        ↓
raw/imported_notes/
        ↓
prompts/08_sensitive_info_review.md
        ↓
logs/daily/ 或 logs/meetings/
        ↓
prompts/03_extract_wiki_notes.md
        ↓
wiki/
        ↓
prompts/04_update_indexes.md
        ↓
indexes/
```

注意：

1. `03_extract_wiki_notes.md` 只負責建立或更新 `wiki/`。
2. `04_update_indexes.md` 才負責更新 `indexes/`。
3. 不要把 wiki 萃取與 index 更新混成同一步。
4. 若任務涉及敏感資訊，應先使用或參考 `08_sensitive_info_review.md`。

---

# 4. 使用 scripts 產生 Codex Request

本專案提供 PowerShell 輔助腳本。

scripts 不直接呼叫固定 Codex CLI。
scripts 的用途是產生 `.codex_requests/` 中的 Markdown request，並盡可能複製到剪貼簿，讓使用者貼到 Codex Desktop。

請在正式 workspace 根目錄執行：

```powershell
cd path\to\llm-wiki-V2\internship_llm_wiki
```

查看建議流程：

```powershell
.\scripts\show_workflow.ps1
```

建議流程：

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

常用指令：

```powershell
.\scripts\import_note.ps1 raw\inbox\note.md

.\scripts\sensitive_review.ps1 raw\imported_notes\2026\2026_07_03_Fri.md -Mode ReviewOnly

.\scripts\generate_daily.ps1 raw\imported_notes\2026\2026_07_03_Fri.md -Date 2026-07-03

.\scripts\meeting_note.ps1 raw\imported_notes\2026\2026_07_03_Fri.md -Date 2026-07-03 -Topic team_meeting

.\scripts\extract_wiki.ps1 logs\daily\2026-07-03.md

.\scripts\update_indexes.ps1 wiki\concepts\proof_of_concept.md

.\scripts\weekly_summary.ps1 logs\daily\2026-07-03.md -Week 2026-W27

.\scripts\monthly_review.ps1 logs\weekly\2026-W27.md -Month 2026-07
```

常用選項：

```powershell
-NoClipboard
-Open
```

說明：

1. `-NoClipboard`：只產生 request file，不複製到剪貼簿。
2. `-Open`：產生後直接開啟 request file。
3. `.codex_requests/` 是執行時產物，不是正式 wiki 內容。
4. `.codex_requests/` 不應被萃取成 `wiki/`。
5. `.codex_requests/` 可加入 `.gitignore`，避免提交到 GitHub。

---

# 5. Prompt 對應表

本專案使用以下 prompts：

| Prompt                          | 用途                | 主要輸入                                          | 主要輸出                  |
| ------------------------------- | ----------------- | --------------------------------------------- | --------------------- |
| `01_import_raw_note.md`         | 匯入原始筆記            | `raw/inbox/` 或使用者提供的 Markdown                 | `raw/imported_notes/` |
| `02_generate_daily_log.md`      | 產生 daily log      | `raw/imported_notes/`                         | `logs/daily/`         |
| `03_extract_wiki_notes.md`      | 萃取 wiki notes     | `logs/daily/` 與 source trace                  | `wiki/`               |
| `04_update_indexes.md`          | 更新 indexes        | `wiki/`、`logs/` 或前一步摘要                        | `indexes/`            |
| `05_generate_weekly_summary.md` | 產生 weekly summary | `logs/daily/`、`logs/meetings/`                | `logs/weekly/`        |
| `06_generate_monthly_review.md` | 產生 monthly review | `logs/weekly/`、`logs/daily/`、`logs/meetings/` | `logs/monthly/`       |
| `07_process_meeting_note.md`    | 整理 meeting note   | `raw/imported_notes/`                         | `logs/meetings/`      |
| `08_sensitive_info_review.md`   | 敏感資訊審查            | `raw/`、`logs/`、`wiki/`、`indexes/`             | 審查結果或修正建議             |

分工規則：

1. `01_import_raw_note.md` 不產生 daily log、不建立 wiki、不更新 indexes。
2. `02_generate_daily_log.md` 不建立 wiki、不更新 indexes。
3. `03_extract_wiki_notes.md` 不更新 indexes。
4. `04_update_indexes.md` 不建立 wiki。
5. `05_generate_weekly_summary.md` 不建立 wiki、不更新 indexes。
6. `06_generate_monthly_review.md` 不建立 wiki、不更新 indexes。
7. `07_process_meeting_note.md` 不建立 wiki、不更新 indexes。
8. `08_sensitive_info_review.md` 可用於檢查，也可依使用者要求提出修正建議。

---

# 6. 原始筆記匯入流程

## 6.1 使用情境

當使用者新增一份原始筆記時，先放到：

```text
raw/inbox/
```

或直接放到：

```text
raw/imported_notes/
```

若從 `raw/inbox/` 開始，應使用：

```text
prompts/01_import_raw_note.md
```

將其匯入正式 raw note 位置。

---

## 6.2 給 Codex 的指令範例

```text
請讀取 raw/inbox/note.md，
根據 AGENTS.md 與 PROJECT_RULES.md 的規則，
將它匯入 raw/imported_notes/。

請注意：
1. 保留原始筆記內容。
2. 不要產生 daily log。
3. 不要建立 wiki note。
4. 不要更新 indexes。
5. 補上必要 metadata。
6. 標記是否需要敏感資訊審查。
7. 最後列出你建立或修改的檔案。
```

---

## 6.3 輸出位置

建議輸出到：

```text
raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
```

範例：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

若原始筆記有圖片或附件，建議使用「一篇筆記一個資料夾」：

```text
raw/imported_notes/2026/2026_07_03_Fri/
├── 2026_07_03_Fri.md
└── attachments/
    ├── image_001.png
    └── file_001.pdf
```

---

# 7. 敏感資訊審查流程

## 7.1 使用情境

以下情況應先進行敏感資訊審查：

1. 原始筆記包含截圖。
2. 原始筆記包含附件。
3. 原始筆記包含會議內容。
4. 原始筆記涉及內部系統、資料表、欄位、流程或角色。
5. 原始筆記可能包含客戶、保單、帳密、API Key、Token 或完整內部 URL。
6. 內容準備從 raw 進入 logs 或 wiki。

使用 prompt：

```text
prompts/08_sensitive_info_review.md
```

---

## 7.2 給 Codex 的指令範例

```text
請根據 prompts/08_sensitive_info_review.md，
檢查 raw/imported_notes/2026/2026_07_03_Fri.md 是否含有敏感資訊。

請分類：
1. 可以保留的內容。
2. 需要抽象化的內容。
3. 不應寫入 logs 或 wiki 的內容。
4. 需要人工確認的內容。

請不要刪除原始筆記。
請回報建議處理方式。
```

---

## 7.3 敏感資訊處理原則

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

若需要保留學習價值，應改寫為抽象描述。

---

# 8. 每日筆記整理流程

## 8.1 使用情境

當原始筆記已匯入並通過初步敏感資訊檢查後，應整理成 daily log。

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

---

## 8.2 給 Codex 的指令範例

```text
請讀取 raw/imported_notes/2026/2026_07_03_Fri.md，
根據 AGENTS.md 與 PROJECT_RULES.md 的規則，
整理成 logs/daily/2026-07-03.md。

請注意：
1. 不要修改原始筆記。
2. 不要直接複製整份原始筆記。
3. 若有敏感資訊，請抽象化處理並標記待確認。
4. 請保留今日學到的主題、工具、概念、任務、會議重點、公式與待整理事項。
5. 請加入 YAML frontmatter。
6. 請保留 source trace。
7. 請列出可萃取成 wiki 的候選項目。
8. 不要建立 wiki note。
9. 不要更新 indexes。
10. 最後列出你建立或修改的檔案。
```

---

## 8.3 Daily Log 建議內容

`logs/daily/YYYY-MM-DD.md` 建議包含：

```markdown
# Daily Log - YYYY-MM-DD

## 1. 今日摘要

## 2. 今日學習重點

## 3. 今日任務

## 4. 今日使用或接觸的工具

## 5. 今日遇到的問題

## 6. 待確認事項

## 7. 可萃取成 Wiki 的候選項目

## 8. 可能需要更新的 Index

## 9. 敏感資訊檢查

## 10. 明日或後續建議

## 11. Source Trace
```

---

# 9. 會議紀錄整理流程

## 9.1 使用情境

如果原始筆記中有會議內容，Codex 可以萃取成 meeting note。

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

---

## 9.2 給 Codex 的指令範例

```text
請根據 prompts/07_process_meeting_note.md，
從 raw/imported_notes/2026/2026_07_03_Fri.md 中萃取會議相關內容，
整理成 logs/meetings/2026-07-03_team_meeting.md。

請包含：
1. 會議日期。
2. 會議主題。
3. 重要討論內容。
4. 主管或同事提醒。
5. 待辦事項。
6. 可整理成 wiki 的主題。
7. 需要人工確認或可能涉及敏感資訊的內容。
8. Source Trace。

請不要：
1. 保存完整內部會議決策。
2. 保存未抽象化的內部流程。
3. 建立 wiki note。
4. 更新 indexes。
```

---

## 9.3 Meeting Note 建議內容

`logs/meetings/YYYY-MM-DD_short_meeting_name.md` 建議包含：

```markdown
# Meeting Note - YYYY-MM-DD - Meeting Topic

## 1. 會議基本資訊

## 2. 會議摘要

## 3. 重要討論內容

## 4. 決議與待辦事項

## 5. 可整理成 Wiki 的候選項目

## 6. 可能需要更新的 Index

## 7. 敏感資訊檢查

## 8. 待確認事項

## 9. Source Trace
```

---

# 10. 從 Daily Log 萃取 Wiki 的流程

## 10.1 使用情境

當 `logs/daily/` 已經有每日摘要後，Codex 應進一步判斷哪些內容值得沉澱成正式 wiki。

例如 daily log 中出現：

* Google ADK
* PoC
* EAB
* CAB
* 報告產製流程
* 某個公式
* 某個錯誤與解法
* 某個資料欄位理解
* 某個業務背景

Codex 應將這些內容整理到對應的 `wiki/` 分類。

使用 prompt：

```text
prompts/03_extract_wiki_notes.md
```

---

## 10.2 分類規則

| 內容類型       | 目標位置                     |
| ---------- | ------------------------ |
| 概念         | `wiki/concepts/`         |
| 工具         | `wiki/tools/`            |
| 流程         | `wiki/workflows/`        |
| 單次任務       | `wiki/tasks/`            |
| 多階段專案      | `wiki/projects/`         |
| 錯誤排除       | `wiki/troubleshooting/`  |
| 資料理解       | `wiki/data_notes/`       |
| 公式、模型、指標計算 | `wiki/formulas/`         |
| 業務背景       | `wiki/business_context/` |
| 術語         | `wiki/glossary/`         |

---

## 10.3 給 Codex 的指令範例

```text
請根據 prompts/03_extract_wiki_notes.md，
讀取 logs/daily/2026-07-03.md，
並根據其 Source Trace 參考必要的 raw note。

請判斷哪些內容應該整理成正式 wiki 頁面。

請執行：
1. 檢查 wiki/ 中是否已有相同或相近主題。
2. 若已有頁面，優先更新既有頁面。
3. 若沒有頁面，才建立新頁面。
4. 根據內容分類到 concepts、tools、workflows、tasks、projects、troubleshooting、data_notes、formulas、business_context 或 glossary。
5. 每個新增或修改的頁面都加入 frontmatter。
6. 每個頁面都保留來源與相關學習紀錄。
7. 每個正式 wiki note 都加入 Knowledge Graph 關聯區塊。
8. 若有公式，請整理到 wiki/formulas/，並使用 LaTeX、符號說明與使用情境。
9. 不要保存敏感資訊。
10. 不要更新 indexes。
11. 最後列出 Potential index updates，供下一步使用 prompts/04_update_indexes.md 更新。
12. 回報新增、修改與待確認項目。
```

---

## 10.4 重要限制

本步驟只負責：

```text
logs/daily/ 或 source trace
        ↓
wiki/
```

本步驟不負責：

```text
wiki/
        ↓
indexes/
```

也就是：

1. 可以建立 wiki note。
2. 可以更新既有 wiki note。
3. 可以列出需要更新哪些 indexes。
4. 不可以直接修改 indexes。
5. 不可以建立新的 index。
6. 不可以建立 `knowledge_graph_index.md`。

---

# 11. Index 更新流程

## 11.1 使用情境

當 `wiki/` 或 `logs/` 有新增或修改後，應更新 `indexes/`。

使用 prompt：

```text
prompts/04_update_indexes.md
```

以下情況需要更新 `indexes/`：

1. 新增 wiki 頁面。
2. 修改 wiki 頁面的主題或用途。
3. 新增 daily log、weekly summary、monthly review 或 meeting note。
4. 新增工具筆記。
5. 新增專案筆記。
6. 新增流程筆記。
7. 新增公式筆記。
8. 新增術語筆記。
9. 新增業務背景筆記。
10. 發現某頁沒有被任何 index 連到。
11. 整理週報或月報時發現索引缺漏。

---

## 11.2 Index 對應規則

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

## 11.3 給 Codex 的指令範例

```text
請根據 prompts/04_update_indexes.md，
檢查以下 wiki note 或上一階段的 Potential index updates：

wiki/concepts/proof_of_concept.md
wiki/tools/google_adk.md

請根據 AGENTS.md 與 PROJECT_RULES.md 更新 indexes/。

請注意：
1. index 只做導覽，不要寫成完整文章。
2. 使用 Obsidian 雙向連結或 Markdown 連結。
3. 新增公式頁面時，請更新 formula_index.md。
4. 新增業務背景頁面時，請更新 business_context_index.md。
5. 新增工具頁面時，請更新 tool_index.md。
6. 新增專案頁面時，請更新 project_index.md。
7. 不要建立新的 index。
8. 不要建立 knowledge_graph_index.md。
9. 最後列出更新了哪些 index。
```

---

## 11.4 允許更新的 Indexes

本專案只允許更新以下 index：

```text
indexes/home.md
indexes/learning_index.md
indexes/concept_index.md
indexes/task_index.md
indexes/project_index.md
indexes/tool_index.md
indexes/workflow_index.md
indexes/troubleshooting_index.md
indexes/data_index.md
indexes/formula_index.md
indexes/business_context_index.md
indexes/glossary_index.md
```

不建立：

```text
indexes/knowledge_graph_index.md
indexes/source_index.md
indexes/daily_index.md
indexes/meeting_index.md
indexes/attachment_index.md
indexes/screenshot_index.md
```

---

# 12. 公式整理流程

## 12.1 使用情境

如果原始筆記、daily log 或 wiki note 中出現：

* 數學公式
* 統計公式
* 模型定義
* 損失函數
* 評分公式
* 指標計算公式
* 權重計算
* 符號定義
* 公式截圖

Codex 應判斷是否需要建立或更新：

```text
wiki/formulas/
```

---

## 12.2 公式整理規則

公式頁面應包含：

1. 背景
2. 公式
3. 符號說明
4. 使用情境
5. 計算範例
6. 注意事項
7. 來源
8. 相關學習紀錄
9. 相關筆記
10. Knowledge Graph 關聯

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

---

## 12.3 給 Codex 的指令範例

```text
請根據 logs/daily/2026-07-03.md 與相關 source trace，
找出其中的公式、模型定義、指標計算方式或符號說明。

請根據 AGENTS.md 的公式規則：
1. 判斷是否需要建立或更新 wiki/formulas/ 中的公式頁面。
2. 使用 LaTeX 表示公式。
3. 補上符號說明。
4. 補上使用情境。
5. 補上來源與相關學習紀錄。
6. 補上 Knowledge Graph 關聯。
7. 若公式可能涉及公司內部敏感計算邏輯，請抽象化處理。
8. 若公式不確定，請標記為 needs_review。
9. 不要在本步驟直接更新 indexes。
10. 若新增或更新公式頁面，最後列出應更新 indexes/formula_index.md。
```

---

# 13. 業務背景整理流程

## 13.1 使用情境

如果原始筆記、daily log 或 meeting note 中出現：

* 業務背景
* 組織流程
* 審查流程
* 上線流程
* 部門協作背景
* 金融或壽險相關概念
* EAB / CAB 類型概念
* 實習任務脈絡

Codex 應判斷是否需要建立或更新：

```text
wiki/business_context/
```

---

## 13.2 業務背景整理規則

業務背景頁面應包含：

1. 背景摘要。
2. 出現情境。
3. 抽象化後的流程或角色說明。
4. 和任務、專案、工具或流程的關係。
5. 敏感資訊檢查。
6. 待確認事項。
7. 來源。
8. Knowledge Graph 關聯。

---

## 13.3 給 Codex 的指令範例

```text
請根據 logs/daily/2026-07-03.md 與相關 source trace，
找出其中涉及業務背景、審查流程、上線流程或組織角色的內容。

請根據 AGENTS.md 與 PROJECT_RULES.md：
1. 判斷是否需要建立或更新 wiki/business_context/ 中的業務背景筆記。
2. 抽象化任何內部流程、角色、系統名稱或具體部門名稱。
3. 不保存完整審查規則。
4. 不保存完整上線流程。
5. 不保存可識別具體部門、人員或內部系統的資訊。
6. 補上來源與相關學習紀錄。
7. 補上 Knowledge Graph 關聯。
8. 不要在本步驟直接更新 indexes。
9. 若新增或更新業務背景頁面，最後列出應更新 indexes/business_context_index.md。
```

---

# 14. 錯誤排除整理流程

## 14.1 使用情境

如果實習過程中遇到錯誤，例如：

* Python 執行錯誤
* SQL 查詢錯誤
* API 連線錯誤
* Google ADK 執行錯誤
* Docker / WSL / 環境設定錯誤
* Excel 公式錯誤
* 資料格式錯誤
* PowerShell 指令錯誤
* Git push 錯誤

應整理成：

```text
wiki/troubleshooting/
```

---

## 14.2 給 Codex 的指令範例

```text
請根據 logs/daily/2026-07-03.md 中記錄的錯誤，
整理成 wiki/troubleshooting/ 下的錯誤排除筆記。

請包含：
1. 錯誤名稱。
2. 發生情境。
3. 錯誤訊息。
4. 可能原因。
5. 解決方式。
6. 驗證方式。
7. 預防方式。
8. 相關學習紀錄。
9. 相關筆記。
10. Knowledge Graph 關聯。

請移除或抽象化任何敏感資訊。
不要在本步驟直接更新 indexes。
若新增或更新 troubleshooting note，最後列出應更新 indexes/troubleshooting_index.md。
```

---

# 15. 專案整理流程

## 15.1 使用情境

如果某個主題已經跨越多天或多個任務，例如：

* Google ADK PoC
* LLM-Wiki 建置
* RAG 原型
* 資料解析 pipeline
* 報表自動化
* Agent workflow demo

應整理成：

```text
wiki/projects/
```

---

## 15.2 給 Codex 的指令範例

```text
請根據 logs/daily/、logs/weekly/ 與相關 wiki 頁面，
整理或更新 wiki/projects/google_adk_poc_project.md。

請包含：
1. 專案背景。
2. 專案目標。
3. 目前進度。
4. 已完成項目。
5. 使用工具。
6. 相關任務。
7. 相關流程。
8. 風險與待確認事項。
9. Source Trace。
10. Knowledge Graph 關聯。

請不要保存敏感資訊。
請不要編造不存在的主管要求。
不要在本步驟直接更新 indexes。
若新增或更新 project note，最後列出應更新 indexes/project_index.md。
```

---

# 16. 每週整理流程

## 16.1 使用情境

每週結束時，請 Codex 根據本週每日紀錄與會議紀錄產生週報。

來源：

```text
logs/daily/
logs/meetings/
```

輸出位置：

```text
logs/weekly/YYYY-Www.md
```

例如：

```text
logs/weekly/2026-W27.md
```

使用 prompt：

```text
prompts/05_generate_weekly_summary.md
```

---

## 16.2 給 Codex 的指令範例

```text
請根據 prompts/05_generate_weekly_summary.md，
整理 logs/daily/ 與 logs/meetings/ 中本週的學習紀錄，
產生 logs/weekly/2026-W27.md。

請包含：
1. 本週學習重點。
2. 本週完成的任務。
3. 本週參與或推進的專案。
4. 本週學到的工具與流程。
5. 本週新增或更新的 wiki 頁面。
6. 本週遇到的問題與解法。
7. 本週出現的重要公式或模型。
8. 可以向主管回報的成果。
9. 下週應繼續學習或確認的主題。
10. Source Trace。

請不要保存敏感資訊。
若有不確定內容，請標記待確認。
不要建立 wiki note。
不要更新 indexes。
```

---

# 17. 每月整理流程

## 17.1 使用情境

每月結束時，請 Codex 根據本月週報、每日紀錄與會議紀錄產生月報。

來源：

```text
logs/weekly/
logs/daily/
logs/meetings/
```

輸出位置：

```text
logs/monthly/YYYY-MM.md
```

例如：

```text
logs/monthly/2026-07.md
```

使用 prompt：

```text
prompts/06_generate_monthly_review.md
```

---

## 17.2 給 Codex 的指令範例

```text
請根據 prompts/06_generate_monthly_review.md，
整理 logs/weekly/、logs/daily/ 與 logs/meetings/ 中本月的學習紀錄，
產生 logs/monthly/2026-07.md。

請包含：
1. 本月主要學習主題。
2. 本月完成的任務與專案。
3. 本月新增的重要 wiki 頁面。
4. 本月學到的工具、流程、業務背景與公式。
5. 本月遇到的主要問題與解法。
6. 本月能力成長。
7. 可向主管回報的成果。
8. 下個月需要補強的主題。
9. Source Trace。

請避免保存敏感資訊。
若有不確定內容，請標記待確認。
不要建立 wiki note。
不要更新 indexes。
```

---

# 18. Obsidian 檢查流程

Codex 產生或修改檔案後，使用者應在 Obsidian 中檢查：

1. 檔案是否放在正確資料夾。
2. 檔名是否符合命名規則。
3. frontmatter 是否完整。
4. Source Trace 是否正確。
5. 是否有未抽象化的敏感資訊。
6. 是否有不確定內容被寫成事實。
7. Obsidian 雙向連結是否能正常跳轉。
8. 是否有重複頁面。
9. 是否有應更新但尚未更新的 index。
10. wiki note 是否包含 Knowledge Graph 關聯區塊。

---

# 19. GitHub 推送流程

當完成修改後，請在 Git repository 外層根目錄執行。

例如：

```powershell
cd path\to\llm-wiki-V2
```

查看狀態：

```powershell
git status
```

加入全部修改：

```powershell
git add -A
```

建立 commit：

```powershell
git commit -m "Update llm wiki files"
```

推送到 GitHub：

```powershell
git push origin main
```

若只想推送特定檔案，例如本文件：

```powershell
git add .\internship_llm_wiki\CODEX_WORKFLOW.md
git commit -m "Update Codex workflow"
git push origin main
```

推送前應確認沒有把不想上傳的 zip、臨時檔或敏感資料加入 commit。

---

# 20. 第一輪測試建議

前置作業完成後，建議先用一份非敏感測試 raw note 跑完整流程。

測試流程：

```text
raw/inbox/test_note.md
        ↓
01_import_raw_note.md
        ↓
raw/imported_notes/2026/2026_07_XX_Test.md
        ↓
08_sensitive_info_review.md
        ↓
02_generate_daily_log.md
        ↓
logs/daily/2026-07-XX.md
        ↓
03_extract_wiki_notes.md
        ↓
wiki/
        ↓
04_update_indexes.md
        ↓
indexes/
```

測試目標：

1. 確認 raw note 可以匯入。
2. 確認 daily log 可以產生。
3. 確認 wiki note 可以萃取。
4. 確認 index 可以更新。
5. 確認 Obsidian 雙向連結可用。
6. 確認 sensitive review 有發揮作用。
7. 確認 Codex 不會誤讀外層 `others/` 或 `archive/`。
8. 確認 `.codex_requests/` 不會被當成正式內容。

---

# 21. 不應該做的事

使用 Codex 時，不應該：

1. 開啟外層 `llm-wiki-V2/` 作為 Codex workspace。
2. 把外層 `others/` 當成正式來源。
3. 把外層 `archive/` 當成正式來源。
4. 把 skill examples 當成實習紀錄。
5. 把 `.codex_requests/` 當成正式筆記。
6. 在正式 workspace 中新增 `examples/` 資料夾。
7. 在正式 workspace 中新增 `raw/processed/` 資料夾。
8. 在正式 workspace 中新增 `assets/diagrams/` 資料夾。
9. 把所有內容都放在 `raw/` 不整理。
10. 把所有內容都放在 `logs/` 不萃取 wiki。
11. 每遇到新主題就新增資料夾。
12. 把 `logs/` 改成主題分類。
13. 把 `wiki/` 改成主題資料夾分類。
14. 直接複製整份 raw note 到 wiki。
15. 保存未抽象化的公司敏感資訊。
16. 保存未遮蔽的內部系統截圖。
17. 保存真實客戶資料。
18. 保存內部帳密、API Key 或 Token。
19. 未經確認就整理公司內部公式或決策邏輯。
20. 讓 Codex 編造不存在的主管要求、公司流程或專案背景。

---

# 22. 最終原則

Codex 的任務不是一次把所有內容變成 wiki，而是協助使用者依序完成：

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

任何整理、分類、連結與更新，都應服務於這個流向。

若不確定內容是否正確，標記為待確認。
若不確定內容是否敏感，先不要寫入正式 wiki。
若不確定應放在哪裡，先保留在 `logs/` 或列為 wiki 候選，不要新增資料夾。
