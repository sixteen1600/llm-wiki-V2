# OBSIDIAN_GUIDE.md

本文件說明如何使用 Obsidian 閱讀、整理與維護 `internship_llm_wiki`。

本專案的主要整理工作可以由 Codex 協助完成；Obsidian 則主要用來：

1. 閱讀筆記。
2. 搜尋主題。
3. 建立雙向連結。
4. 查看每日、每週與每月學習紀錄。
5. 回顧工具、流程、專案與公式。
6. 將實習學習內容整理成可長期複習的知識庫。

---

# 1. 開啟專案

請用 Obsidian 開啟整個專案資料夾：

```text
internship_llm_wiki/
```

不要只開啟 `wiki/`、`logs/` 或 `raw/` 其中一個子資料夾。

正確做法：

```text
Obsidian → Open folder as vault → 選擇 internship_llm_wiki/
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

---

# 3. Obsidian 中的主要資料夾用途

## 3.1 raw/

`raw/` 是原始資料層。

```text
raw/
├── imported_notes/
├── inbox/
└── processed/
```

在 Obsidian 中，`raw/imported_notes/` 用來保存你原本寫的 Markdown 筆記。

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

注意：`raw/` 是原始來源，不是正式 wiki。

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
```

`logs/` 不依主題分類。
如果你想找 Google ADK、SQL、PoC、公式或某個流程，應該從 `wiki/` 或 `indexes/` 找。

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
├── business_context/
├── formulas/
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
| `business_context/` | 業務背景與公司流程理解 |
| `formulas/`         | 公式、模型與指標計算  |
| `glossary/`         | 專有名詞字典      |

---

## 3.4 indexes/

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

在 Obsidian 中，`indexes/` 是最適合用來快速找筆記的地方。

建議常用：

| 檔案                          | 用途     |
| --------------------------- | ------ |
| `indexes/home.md`           | 首頁     |
| `indexes/learning_index.md` | 學習主題總覽 |
| `indexes/tool_index.md`     | 工具總覽   |
| `indexes/project_index.md`  | 專案總覽   |
| `indexes/workflow_index.md` | 流程總覽   |
| `indexes/formula_index.md`  | 公式總覽   |
| `indexes/glossary_index.md` | 術語總覽   |

---

# 4. 建議的 Obsidian 工作方式

## 4.1 每天寫原始筆記

每天先把筆記寫在：

```text
raw/imported_notes/
```

例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

原始筆記不需要照模板。

你可以自由記錄：

```text
今天學到 PoC
主管提到 EAB / CAB
Google ADK 可能可以產固定格式報告
遇到某個錯誤
貼一張截圖
先記下一個公式
```

重點是先完整記錄，不要一開始就花太多時間整理格式。

---

## 4.2 用 Codex 整理成 logs

寫完原始筆記後，再請 Codex 整理成：

```text
logs/daily/YYYY-MM-DD.md
```

例如：

```text
logs/daily/2026-07-03.md
```

每日 log 是時間序摘要，不是正式 wiki。

---

## 4.3 用 Codex 萃取成 wiki

當某些內容值得長期保留時，請 Codex 整理到 `wiki/`。

例如：

```text
wiki/tools/google_adk.md
wiki/concepts/proof_of_concept.md
wiki/business_context/eab_review_process.md
wiki/formulas/weighted_average.md
```

---

## 4.4 用 indexes 導覽

新增或修改 wiki 頁面後，應更新相關 index。

例如：

```text
wiki/tools/google_adk.md
```

應該出現在：

```text
indexes/tool_index.md
indexes/learning_index.md
```

如果新增：

```text
wiki/formulas/weighted_average.md
```

應該更新：

```text
indexes/formula_index.md
```

---

# 5. Obsidian 雙向連結使用方式

Obsidian 支援雙向連結。

格式：

```markdown
[[google_adk]]
[[proof_of_concept]]
[[weighted_average]]
```

建議在 wiki 頁面中使用雙向連結串接相關內容。

例如在 `wiki/tools/google_adk.md` 中可以寫：

```markdown
## 相關筆記

- [[proof_of_concept]]
- [[google_adk_report_generation_workflow]]
- [[google_adk_poc_project]]
```

在 `wiki/formulas/weighted_average.md` 中可以寫：

```markdown
## 相關筆記

- [[data_quality_score]]
- [[evaluation_metric]]
```

---

# 6. 建議的首頁設計

建議將 `indexes/home.md` 設為 Obsidian 的主要入口頁。

`indexes/home.md` 可以包含：

```markdown
# Internship LLM-Wiki Home

## 快速入口

- [[learning_index]]
- [[tool_index]]
- [[project_index]]
- [[workflow_index]]
- [[troubleshooting_index]]
- [[data_index]]
- [[formula_index]]
- [[glossary_index]]

## 最近學習紀錄

- [[2026-07-03]]

## 目前進行中的專案

- [[google_adk_poc_project]]

## 常用工具

- [[google_adk]]
- [[sql]]
- [[python]]
```

---

# 7. 建議開啟的 Obsidian 功能

## 7.1 Backlinks

建議開啟 Backlinks。

用途：

```text
查看哪些筆記連到目前這篇筆記。
```

例如你開啟 `google_adk.md`，可以看到哪些任務、專案、流程或每日紀錄提到 Google ADK。

---

## 7.2 Graph View

Graph View 可以用來查看筆記之間的連結關係。

適合用來觀察：

* 哪些主題被多次提到
* 哪些工具連到多個專案
* 哪些公式被多個流程使用
* 哪些筆記是孤立頁面

但 Graph View 只是輔助，不應取代 `indexes/`。

---

## 7.3 Tags

可以使用 tags 補充主題分類。

例如：

```markdown
#google_adk
#poc
#formula
#data_warehouse
#troubleshooting
```

建議 tags 用在 frontmatter 裡：

```yaml
---
tags:
  - google_adk
  - poc
  - formula
---
```

不要用 tags 取代資料夾分類。
資料夾負責穩定結構，tags 負責彈性主題。

---

## 7.4 Search

Obsidian 搜尋可以用來快速查找主題。

常用搜尋：

```text
google_adk
PoC
formula
needs_review
source:
```

如果使用 frontmatter，可以搜尋：

```text
type: formula
status: needs_review
```

---

# 8. Frontmatter 使用方式

正式的 `logs/` 與 `wiki/` 筆記建議使用 frontmatter。

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

工具筆記範例：

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

| 欄位             | 用途     |
| -------------- | ------ |
| `type`         | 筆記類型   |
| `topic`        | 主題     |
| `date`         | 日期     |
| `source`       | 來源     |
| `related_logs` | 相關學習紀錄 |
| `tags`         | 標籤     |
| `status`       | 狀態     |

建議狀態：

| 狀態             | 意義     |
| -------------- | ------ |
| `draft`        | 初稿     |
| `reviewed`     | 已確認    |
| `needs_review` | 需要人工確認 |
| `archived`     | 已封存    |

---

# 9. 公式在 Obsidian 中的寫法

如果筆記中有公式，建議使用 LaTeX。

行內公式：

```markdown
$score = raw\_score \times weight$
```

區塊公式：

```markdown
$$
decay\_weight = TIME\_DECAY\_FACTOR^{period\_gap}
$$
```

公式頁面建議放在：

```text
wiki/formulas/
```

例如：

```text
wiki/formulas/weighted_average.md
wiki/formulas/time_decay_weight.md
wiki/formulas/t_test_formula.md
```

公式筆記應包含：

* 背景
* 公式
* 符號說明
* 使用情境
* 計算範例
* 注意事項
* 相關學習紀錄
* 相關筆記

如果公式是從圖片轉寫而來，應標記：

```text
待確認：公式由圖片轉寫，需人工確認正確性。
```

---

# 10. 附件與圖片使用方式

## 10.1 原始筆記中的附件

如果附件是原始筆記的一部分，建議放在該原始筆記旁邊：

```text
raw/imported_notes/2026/2026_07_03_Fri/
├── 2026_07_03_Fri.md
└── attachments/
    ├── image_001.png
    └── file_001.pdf
```

## 10.2 正式 wiki 使用的圖片

如果圖片已經確認可以放入正式筆記，且不含敏感資訊，可以放入：

```text
assets/images/
```

流程圖、架構圖可以放入：

```text
assets/diagrams/
```

正式 wiki 引用的非敏感附件可以放入：

```text
assets/files/
```

## 10.3 圖片注意事項

不要將以下內容放入 `assets/`：

* 未遮蔽的內部系統截圖
* 客戶資料截圖
* 帳號、網址、API Key、Token
* 公司內部機密文件
* 未經允許的程式碼截圖

---

# 11. 建議的 Obsidian 檔案瀏覽順序

如果你要回顧一天的學習：

```text
logs/daily/
```

如果你要查某個工具：

```text
indexes/tool_index.md
wiki/tools/
```

如果你要查某個流程：

```text
indexes/workflow_index.md
wiki/workflows/
```

如果你要查某個專案：

```text
indexes/project_index.md
wiki/projects/
```

如果你要查某個公式：

```text
indexes/formula_index.md
wiki/formulas/
```

如果你要查某個術語：

```text
indexes/glossary_index.md
wiki/glossary/
```

如果你要確認來源：

```text
raw/imported_notes/
```

---

# 12. 每日使用流程

建議每天按照以下流程使用 Obsidian：

1. 在 `raw/imported_notes/` 放入當日原始筆記。
2. 使用 Codex 整理出 `logs/daily/YYYY-MM-DD.md`。
3. 在 Obsidian 中檢查每日摘要。
4. 使用 Codex 將重要內容整理成 `wiki/` 頁面。
5. 在 Obsidian 中確認新增頁面是否可讀。
6. 檢查相關 `indexes/` 是否有連結。
7. 對不確定內容標記 `needs_review`。
8. 涉及敏感資訊時，改寫或移除。

---

# 13. 每週使用流程

建議每週按照以下流程使用 Obsidian：

1. 回顧本週 `logs/daily/`。
2. 產生或檢查 `logs/weekly/YYYY-Www.md`。
3. 查看本週新增的 wiki 頁面。
4. 檢查 `indexes/` 是否完整。
5. 檢查是否有重複頁面。
6. 檢查是否有 `needs_review`。
7. 整理可向主管回報的學習成果。

---

# 14. 每月使用流程

建議每月按照以下流程使用 Obsidian：

1. 回顧本月 `logs/weekly/`。
2. 產生或檢查 `logs/monthly/YYYY-MM.md`。
3. 查看本月主要新增的工具、流程、專案、公式。
4. 檢查 `indexes/home.md` 是否需要更新。
5. 檢查過時內容是否需要移到 `archive/`。
6. 整理下個月要補強的主題。

---

# 15. Obsidian 中不建議做的事

不建議：

1. 直接在 `wiki/` 裡寫未整理的原始筆記。
2. 把每日流水帳直接放進 `wiki/`。
3. 在 `logs/` 底下依主題新增資料夾。
4. 在 `wiki/` 底下依單一主題新增大資料夾。
5. 在正式 wiki 中貼未遮蔽內部截圖。
6. 在正式 wiki 中保存真實客戶資料。
7. 在正式 wiki 中保存公司內部帳密、API Key 或 Token。
8. 將不確定的公式或業務規則寫成已確認內容。
9. 大量重新命名已經建立連結的檔案。
10. 忽略 `indexes/`，只靠搜尋找筆記。

---

# 16. 建議的首頁與常用頁面

建議將以下頁面加入 Obsidian 書籤或常用區：

```text
indexes/home.md
indexes/learning_index.md
indexes/tool_index.md
indexes/project_index.md
indexes/workflow_index.md
indexes/formula_index.md
logs/daily/
```

如果 Obsidian 有設定書籤功能，可以將 `indexes/home.md` 設為主要入口。

---

# 17. 與 Codex 搭配使用

Obsidian 主要負責閱讀與檢查，Codex 主要負責整理與維護。

建議工作方式：

```text
Obsidian：寫 raw 筆記、閱讀、確認內容
Codex：整理 logs、萃取 wiki、更新 indexes
```

給 Codex 任務時，建議一律加上：

```text
請遵守 AGENTS.md、PROJECT_RULES.md 與 CODEX_WORKFLOW.md。
```

常用指令範例：

```text
請讀取 raw/imported_notes/2026/2026_07_03_Fri.md，
整理成 logs/daily/2026-07-03.md，
並列出可進一步整理成 wiki 的主題。
```

```text
請根據 logs/daily/2026-07-03.md，
整理可沉澱的正式 wiki 頁面，
並更新相關 indexes。
```

```text
請檢查 wiki/formulas/ 是否有公式缺少符號說明、來源或相關學習紀錄。
```

---

# 18. 總結

Obsidian 在本專案中的用途是：

```text
閱讀
搜尋
連結
回顧
檢查
複習
```

本專案的主要使用邏輯是：

```text
raw/imported_notes/  保留原始筆記
logs/                追蹤時間序學習
wiki/                沉澱正式知識
indexes/             建立主題導覽
```

寫筆記時不需要一開始就完美。
重點是先完整記錄，再透過 Codex 與 Obsidian 將內容逐步整理成穩定、可查詢、可長期維護的 LLM-Wiki。
