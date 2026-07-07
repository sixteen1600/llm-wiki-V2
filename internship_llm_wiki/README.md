# Internship LLM-Wiki

本專案是一個「實習學習紀錄型 LLM-Wiki」，用於整理實習期間學到的知識、工具、流程、任務、錯誤排除經驗、會議重點、業務背景，以及可能出現的公式與模型概念。

本專案搭配：

* Obsidian：作為主要閱讀、複習與知識連結工具。
* Codex Desktop：協助整理原始筆記、產生 wiki 頁面、更新索引與維護知識庫。
* Markdown：作為所有筆記與知識文件的主要格式。

---

## 專案目標

本專案的目標不是單純保存每日筆記，而是將實習中零散學到的內容逐步整理成可長期維護的知識庫。

主要目標包括：

1. 保存原始實習學習紀錄。
2. 將每日筆記整理成時間序摘要。
3. 將可重複使用的知識整理成正式 wiki 頁面。
4. 建立可查詢、可回顧、可向主管說明的學習成果。
5. 使用 index、frontmatter、tags 與雙向連結管理主題。
6. 避免筆記重複、散亂或混入敏感資訊。

---

## 核心資料流

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

說明如下：

| 層級                    | 用途                     |
| --------------------- | ---------------------- |
| `raw/imported_notes/` | 保存原始匯入的混合式 Markdown 筆記 |
| `logs/`               | 保存整理後的時間序學習紀錄          |
| `wiki/`               | 保存整理後的正式主題知識           |
| `indexes/`            | 保存主題導覽與索引              |

---

## 專案目錄

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
├── indexes/
├── prompts/
└── archive/
```

---

## 主要資料夾說明

### `raw/`

`raw/` 是原始資料層，用於保存尚未整理或剛匯入的筆記。

主要使用：

```text
raw/imported_notes/
```

這裡放的是原始混合式 Markdown 筆記。這類筆記可能同時包含：

* 文字筆記
* 截圖引用
* 附件引用
* 任務紀錄
* 會議重點
* 工具學習
* 概念解釋
* 數學公式或模型公式

原則上，`raw/imported_notes/` 是 source of truth，不應任意刪除或大幅修改。

---

### `logs/`

`logs/` 是時間序紀錄層，用於保存整理後的每日、每週、每月與會議紀錄。

```text
logs/
├── daily/
├── weekly/
├── monthly/
└── meetings/
```

`logs/` 的重點是回答：

> 我在什麼時間學到了什麼？

`logs/` 不依主題新增資料夾。
如果想查某個主題，例如 Google ADK、SQL、資料倉儲或某個公式，應從 `wiki/` 或 `indexes/` 查找。

---

### `wiki/`

`wiki/` 是正式知識層，用於保存整理後、可複習、可查詢、可長期維護的主題知識。

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

分類原則：

| 資料夾                 | 用途                    |
| ------------------- | --------------------- |
| `concepts/`         | 概念解釋                  |
| `tools/`            | 工具使用筆記                |
| `workflows/`        | 可重複執行的流程              |
| `tasks/`            | 單次任務紀錄                |
| `projects/`         | 多階段專案紀錄               |
| `troubleshooting/`  | 錯誤排除紀錄                |
| `data_notes/`       | 資料理解、欄位邏輯、資料處理注意事項    |
| `business_context/` | 業務背景、部門流程、金融或壽險相關背景   |
| `formulas/`         | 數學公式、統計公式、模型定義、指標計算公式 |
| `glossary/`         | 專有名詞字典                |

---

### `indexes/`

`indexes/` 是導覽層，用於幫助使用者與 Codex 快速找到相關筆記。

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

新增或修改 `wiki/` 頁面後，應同步檢查是否需要更新對應 index。

---

### `templates/`

`templates/` 保存各類筆記模板。

常見模板包括：

* 每日紀錄
* 每週總結
* 會議紀錄
* 任務紀錄
* 專案紀錄
* 工具筆記
* 流程筆記
* 錯誤排除筆記
* 資料筆記
* 公式筆記

新增筆記時，應優先參考對應模板。

---

## 日常使用方式

### Step 1：匯入原始筆記

將每日原始 Markdown 筆記放入：

```text
raw/imported_notes/
```

建議依年份存放，例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

如果該筆記有附件，可使用一篇筆記一個資料夾的方式：

```text
raw/imported_notes/2026/2026_07_03_Fri/
├── 2026_07_03_Fri.md
└── attachments/
    ├── image_001.png
    └── file_001.pdf
```

---

### Step 2：整理成每日摘要

請 Codex 根據原始筆記產生：

```text
logs/daily/YYYY-MM-DD.md
```

每日摘要應保留當天學到的主題、任務、會議重點、問題與後續待辦。

---

### Step 3：萃取正式知識

從每日摘要或原始筆記中，將可重複使用的知識整理到 `wiki/`。

例如：

```text
wiki/tools/google_adk.md
wiki/concepts/proof_of_concept.md
wiki/business_context/eab_review_process.md
wiki/workflows/google_adk_report_generation_workflow.md
wiki/formulas/time_decay_weight.md
```

---

### Step 4：更新索引

新增或修改 wiki 頁面後，應更新相關索引，例如：

```text
indexes/tool_index.md
indexes/project_index.md
indexes/workflow_index.md
indexes/formula_index.md
indexes/glossary_index.md
```

---

## 命名規則

### 原始筆記

建議格式：

```text
YYYY_MM_DD_Ddd.md
```

範例：

```text
2026_07_03_Fri.md
```

---

### 每日紀錄

```text
logs/daily/YYYY-MM-DD.md
```

範例：

```text
logs/daily/2026-07-03.md
```

---

### 每週紀錄

```text
logs/weekly/YYYY-Www.md
```

範例：

```text
logs/weekly/2026-W27.md
```

---

### wiki 筆記

檔名建議使用英文小寫與底線：

```text
wiki/tools/google_adk.md
wiki/concepts/proof_of_concept.md
wiki/workflows/report_generation_workflow.md
wiki/formulas/weighted_average.md
```

---

## 公式筆記原則

如果筆記中出現數學公式、統計公式、模型定義、損失函數或指標計算方式，應整理到：

```text
wiki/formulas/
```

公式應優先使用 LaTeX 格式。

行內公式範例：

```text
$score = raw\_score \times weight$
```

區塊公式範例：

```text
$$
decay\_weight = TIME\_DECAY\_FACTOR^{period\_gap}
$$
```

公式筆記應包含：

* 背景
* 公式
* 符號說明
* 使用情境
* 計算範例
* 注意事項
* 來源
* 相關筆記

---

## 保密原則

本專案是實習學習知識庫，不應保存或擴散敏感資訊。

不得寫入正式筆記的內容包括：

* 客戶個資
* 保單號碼
* 交易資料
* 帳號密碼
* API Key
* Token
* 未遮蔽的內部系統截圖
* 未經允許的公司內部程式碼
* 公司內部完整資料表名稱
* 敏感欄位代碼
* 可反推公司內部決策邏輯的完整公式
* 非公開商業策略或內部會議決策

如果需要記錄相關內容，應抽象化處理。

例如：

不應寫：

```text
某客戶姓名、身分證字號、保單號碼。
```

應改寫為：

```text
某筆客戶資料包含身分識別欄位與保單識別欄位，處理時必須先去識別化。
```

---

## 與 Codex 的分工

使用者負責：

1. 匯入原始筆記。
2. 確認整理結果是否正確。
3. 判斷哪些內容需要保留、抽象化或刪除。
4. 最終審核涉及公司情境或公式的內容。

Codex 負責：

1. 讀取原始筆記。
2. 整理每日摘要。
3. 萃取正式 wiki 頁面。
4. 建立或更新 index。
5. 補上 frontmatter、tags 與雙向連結。
6. 檢查重複頁面、敏感資訊與未整理內容。
7. 標示需要人工確認的內容。

---

## 建議工作節奏

### 每日

1. 將當日原始筆記放入 `raw/imported_notes/`。
2. 請 Codex 產生 `logs/daily/`。
3. 標記當日可整理成 wiki 的主題。

### 每週

1. 整理 `logs/weekly/`。
2. 檢查本週新增的 wiki 頁面。
3. 更新 index。
4. 整理可向主管回報的學習成果。

### 每月

1. 產生 `logs/monthly/`。
2. 檢查學習主題是否有重複或缺漏。
3. 整理重要專案、工具與流程。
4. 歸檔過時或不再使用的內容。

---

## 重要規則

1. 不要直接刪除 `raw/imported_notes/` 的原始筆記。
2. 不要把原始筆記完整複製到 `wiki/`。
3. 不要讓 `logs/` 依主題新增資料夾。
4. 不要讓 `wiki/` 依單一主題新增大分類資料夾。
5. 新主題應透過新增 Markdown 頁面、更新 index、加入 tag 與 frontmatter 管理。
6. 新增公式時，應更新 `indexes/formula_index.md`。
7. 涉及公司敏感資訊時，應先抽象化再整理。
8. 不確定的內容應標記為待確認。

---

## 相關文件

* `AGENTS.md`：給 Codex / LLM Agent 使用的完整維護規範。
* `PROJECT_RULES.md`：給使用者看的專案規則。
* `CODEX_WORKFLOW.md`：Codex 實際操作流程。
* `OBSIDIAN_GUIDE.md`：Obsidian 使用方式。
* `templates/`：各類筆記模板。
* `prompts/`：可重複使用的 Codex 指令。
