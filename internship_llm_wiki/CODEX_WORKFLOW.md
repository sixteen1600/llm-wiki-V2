# CODEX_WORKFLOW.md

本文件說明如何使用 Codex Desktop 協助維護 `internship_llm_wiki`。

本專案的原則是：

```text
使用者負責記錄與審核
Codex 負責整理、分類、連結與維護
```

Codex 不應取代使用者判斷，也不應擅自刪除原始筆記、改變目錄架構或保存敏感資訊。

---

# 1. Codex 在本專案中的角色

Codex 的主要工作是協助將原始實習筆記整理成可長期維護的 LLM-Wiki。

Codex 可以協助：

1. 讀取 `raw/imported_notes/` 中的原始 Markdown 筆記。
2. 產生 `logs/daily/` 每日學習摘要。
3. 從每日摘要中萃取正式知識到 `wiki/`。
4. 建立或更新工具、概念、流程、任務、專案、錯誤排除、資料筆記、業務背景、公式與術語頁面。
5. 更新 `indexes/` 中的索引。
6. 補上 frontmatter、tags 與相關筆記連結。
7. 檢查是否有重複頁面、缺少索引、敏感資訊或待確認內容。
8. 產生每週與每月學習總結。

Codex 不應該：

1. 刪除 `raw/imported_notes/` 中的原始筆記。
2. 覆蓋或大幅改寫原始筆記。
3. 任意新增頂層資料夾。
4. 任意新增 `wiki/` 大分類資料夾。
5. 任意新增 `logs/` 主題資料夾。
6. 直接把原始筆記完整複製到 `wiki/`。
7. 保存未抽象化的公司敏感資訊。
8. 編造不存在的主管要求、專案背景或公司流程。
9. 把不確定的公式、流程或業務規則寫成已確認事實。

---

# 2. 整體工作流程

本專案的主要資料流如下：

```text
raw/imported_notes/
        ↓
logs/daily/
        ↓
wiki/
        ↓
indexes/
```

Codex 的標準整理流程是：

1. 讀取原始筆記。
2. 檢查敏感資訊。
3. 產生每日摘要。
4. 判斷可沉澱的正式知識。
5. 建立或更新 wiki 頁面。
6. 更新相關 index。
7. 回報新增、修改與待確認項目。

---

# 3. 每日筆記整理流程

## 3.1 使用情境

當使用者新增一份原始筆記，例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

應請 Codex 先整理成：

```text
logs/daily/2026-07-03.md
```

每日摘要不是正式 wiki，而是時間序紀錄。
它的目標是回答：

> 今天學到了什麼？

---

## 3.2 給 Codex 的指令範例

可以使用以下 prompt：

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
6. 最後列出你建立或修改的檔案。
```

---

## 3.3 每日摘要建議內容

`logs/daily/YYYY-MM-DD.md` 建議包含：

```markdown
# Daily Log - YYYY-MM-DD

## 今日摘要

## 今日學到的主題

## 今日使用或接觸的工具

## 今日任務

## 今日會議或主管提醒

## 今日遇到的問題

## 今日出現的公式或模型

## 可整理成 wiki 的項目

## 待確認事項

## 來源
```

---

# 4. 從 logs 萃取 wiki 的流程

## 4.1 使用情境

當 `logs/daily/` 已經有每日摘要後，Codex 應進一步判斷哪些內容值得沉澱成正式 wiki。

例如每日摘要中出現：

* Google ADK
* PoC
* EAB
* CAB
* 報告產製流程
* 某個公式
* 某個錯誤與解法

Codex 應將這些內容整理到對應的 `wiki/` 分類。

---

## 4.2 分類規則

| 內容類型       | 目標位置                     |
| ---------- | ------------------------ |
| 概念         | `wiki/concepts/`         |
| 工具         | `wiki/tools/`            |
| 流程         | `wiki/workflows/`        |
| 單次任務       | `wiki/tasks/`            |
| 多階段專案      | `wiki/projects/`         |
| 錯誤排除       | `wiki/troubleshooting/`  |
| 資料理解       | `wiki/data_notes/`       |
| 業務背景       | `wiki/business_context/` |
| 公式、模型、指標計算 | `wiki/formulas/`         |
| 術語         | `wiki/glossary/`         |

---

## 4.3 給 Codex 的指令範例

```text
請讀取 logs/daily/2026-07-03.md，
根據 AGENTS.md 與 PROJECT_RULES.md 的規則，
判斷哪些內容應該整理成正式 wiki 頁面。

請執行：
1. 檢查 wiki/ 中是否已有相同或相近主題。
2. 若已有頁面，優先更新既有頁面。
3. 若沒有頁面，才建立新頁面。
4. 根據內容分類到 concepts、tools、workflows、tasks、projects、troubleshooting、data_notes、business_context、formulas 或 glossary。
5. 每個新增或修改的頁面都加入 frontmatter。
6. 每個頁面都保留來源與相關學習紀錄。
7. 若有公式，請整理到 wiki/formulas/，並使用 LaTeX、符號說明與使用情境。
8. 不要保存敏感資訊。
9. 最後更新相關 indexes/。
10. 回報新增、修改與待確認項目。
```

---

# 5. index 更新流程

## 5.1 什麼時候要更新 index？

以下情況需要更新 `indexes/`：

1. 新增 wiki 頁面。
2. 修改 wiki 頁面的主題或用途。
3. 新增工具筆記。
4. 新增專案筆記。
5. 新增流程筆記。
6. 新增公式筆記。
7. 新增術語筆記。
8. 發現某頁沒有被任何 index 連到。
9. 整理週報或月報時發現索引缺漏。

---

## 5.2 index 對應規則

| 新增內容   | 應更新 index                          |
| ------ | ---------------------------------- |
| 任務     | `indexes/task_index.md`            |
| 專案     | `indexes/project_index.md`         |
| 工具     | `indexes/tool_index.md`            |
| 流程     | `indexes/workflow_index.md`        |
| 錯誤排除   | `indexes/troubleshooting_index.md` |
| 資料筆記   | `indexes/data_index.md`            |
| 公式     | `indexes/formula_index.md`         |
| 術語     | `indexes/glossary_index.md`        |
| 一般學習主題 | `indexes/learning_index.md`        |
| 重要入口頁  | `indexes/home.md`                  |

---

## 5.3 給 Codex 的指令範例

```text
請檢查 wiki/ 底下最近新增或修改的頁面，
並根據 AGENTS.md 與 PROJECT_RULES.md 更新 indexes/。

請注意：
1. index 只做導覽，不要寫成完整文章。
2. 使用 Obsidian 雙向連結或 Markdown 連結。
3. 新增公式頁面時，請更新 formula_index.md。
4. 新增工具頁面時，請更新 tool_index.md。
5. 新增專案頁面時，請更新 project_index.md。
6. 最後列出更新了哪些 index。
```

---

# 6. 公式整理流程

## 6.1 使用情境

如果原始筆記或每日摘要中出現：

* 數學公式
* 統計公式
* 模型定義
* 損失函數
* 評分公式
* 指標計算公式
* 符號定義
* 公式截圖

Codex 應判斷是否需要建立或更新：

```text
wiki/formulas/
```

---

## 6.2 公式整理規則

公式頁面應包含：

1. 背景
2. 公式
3. 符號說明
4. 使用情境
5. 計算範例
6. 注意事項
7. 相關學習紀錄
8. 相關筆記

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

---

## 6.3 給 Codex 的指令範例

```text
請檢查 logs/daily/2026-07-03.md 與相關 wiki 頁面，
找出其中的公式、模型定義、指標計算方式或符號說明。

請根據 AGENTS.md 的公式規則：
1. 判斷是否需要建立或更新 wiki/formulas/ 中的公式頁面。
2. 使用 LaTeX 表示公式。
3. 補上符號說明。
4. 補上使用情境。
5. 補上來源與相關學習紀錄。
6. 若公式可能涉及公司內部敏感計算邏輯，請抽象化處理。
7. 若公式不確定，請標記為 needs_review。
8. 更新 indexes/formula_index.md。
```

---

# 7. 每週整理流程

## 7.1 使用情境

每週結束時，請 Codex 根據本週每日紀錄產生週報。

輸出位置：

```text
logs/weekly/YYYY-Www.md
```

例如：

```text
logs/weekly/2026-W27.md
```

---

## 7.2 給 Codex 的指令範例

```text
請整理 logs/daily/ 中本週的每日學習紀錄，
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

請不要保存敏感資訊。
若有不確定內容，請標記待確認。
```

---

# 8. 每月整理流程

## 8.1 使用情境

每月結束時，請 Codex 根據本月週報與每日紀錄產生月報。

輸出位置：

```text
logs/monthly/YYYY-MM.md
```

例如：

```text
logs/monthly/2026-07.md
```

---

## 8.2 給 Codex 的指令範例

```text
請整理 logs/weekly/ 與 logs/daily/ 中本月的學習紀錄，
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

請避免保存敏感資訊。
若有不確定內容，請標記待確認。
```

---

# 9. 會議紀錄整理流程

## 9.1 使用情境

如果原始筆記中有會議內容，Codex 可以萃取成：

```text
logs/meetings/YYYY-MM-DD_short_meeting_name.md
```

---

## 9.2 給 Codex 的指令範例

```text
請從 raw/imported_notes/2026/2026_07_03_Fri.md 中萃取會議相關內容，
整理成 logs/meetings/2026-07-03_team_meeting.md。

請包含：
1. 會議日期。
2. 會議主題。
3. 重要討論內容。
4. 主管或同事提醒。
5. 待辦事項。
6. 可整理成 wiki 的主題。
7. 需要人工確認或可能涉及敏感資訊的內容。

請不要保存完整內部會議決策或敏感資訊。
```

---

# 10. 錯誤排除整理流程

## 10.1 使用情境

如果實習過程中遇到錯誤，例如：

* Python 執行錯誤
* SQL 查詢錯誤
* API 連線錯誤
* Google ADK 執行錯誤
* Docker / WSL / 環境設定錯誤
* Excel 公式錯誤
* 資料格式錯誤

應整理成：

```text
wiki/troubleshooting/
```

---

## 10.2 給 Codex 的指令範例

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

請移除或抽象化任何敏感資訊。
```

---

# 11. 專案整理流程

## 11.1 使用情境

如果某個主題已經跨越多天或多個任務，例如：

* Google ADK PoC
* LLM-Wiki 建置
* RAG 原型
* 資料解析 pipeline
* 報表自動化

應整理成：

```text
wiki/projects/
```

---

## 11.2 給 Codex 的指令範例

```text
請根據 logs/daily/ 與相關 wiki 頁面，
整理或更新 wiki/projects/google_adk_poc_project.md。

請包含：
1. 專案背景。
2. 專案目標。
3. 目前進度。
4. 已完成項目。
5. 使用工具。
6. 相關流程。
7. 遇到的問題。
8. 待辦事項。
9. 相關學習紀錄。
10. 相關 wiki 頁面。

請不要加入未經確認的專案資訊。
若內容不確定，請標記待確認。
```

---

# 12. 保密檢查流程

## 12.1 使用情境

每次從 `raw/` 整理到 `logs/` 或 `wiki/` 前，都應進行保密檢查。

需要特別檢查：

* 客戶個資
* 保單號碼
* 交易資料
* 帳號密碼
* API Key
* Token
* 未遮蔽內部截圖
* 內部完整資料表名稱
* 敏感欄位代碼
* 公司內部決策邏輯
* 公司內部敏感公式

---

## 12.2 給 Codex 的指令範例

```text
請檢查以下檔案是否包含敏感資訊：
[填入檔案路徑]

請根據 AGENTS.md 與 PROJECT_RULES.md 的保密規則檢查：
1. 客戶個資。
2. 保單號碼。
3. 帳號、密碼、API Key、Token。
4. 未遮蔽內部系統截圖。
5. 公司內部完整資料表名稱。
6. 敏感欄位代碼。
7. 公司內部決策邏輯或敏感公式。
8. 其他可能不適合寫入正式 wiki 的內容。

請輸出：
1. 是否發現敏感資訊。
2. 建議如何抽象化。
3. 哪些內容需要人工確認。
```

---

# 13. 維護與檢查流程

## 13.1 建議定期檢查項目

每週或每月可請 Codex 檢查：

1. 是否有 `raw/imported_notes/` 尚未整理。
2. 是否有 `logs/daily/` 尚未萃取 wiki。
3. 是否有 wiki 頁面沒有 index 連結。
4. 是否有重複主題頁面。
5. 是否有公式缺少符號說明。
6. 是否有公式缺少來源。
7. 是否有頁面缺少 frontmatter。
8. 是否有敏感資訊。
9. 是否有過時內容需要移到 archive。
10. 是否有主題被錯誤新增成資料夾。

---

## 13.2 給 Codex 的指令範例

```text
請根據 AGENTS.md 與 PROJECT_RULES.md，
檢查目前專案是否需要維護。

請檢查：
1. raw/imported_notes/ 是否有尚未整理的筆記。
2. logs/daily/ 是否有尚未萃取成 wiki 的內容。
3. wiki/ 是否有重複頁面。
4. wiki/ 是否有頁面缺少 frontmatter。
5. indexes/ 是否缺少連結。
6. wiki/formulas/ 是否有公式缺少符號說明或來源。
7. 是否有疑似敏感資訊。
8. 是否有過時內容需要移到 archive。

請只提出檢查結果與建議，不要直接大量重構。
```

---

# 14. 建議工作節奏

## 每日

1. 將原始 Markdown 筆記放入 `raw/imported_notes/`。
2. 請 Codex 整理成 `logs/daily/`。
3. 檢查每日摘要是否正確。
4. 請 Codex 萃取可沉澱的 wiki 頁面。
5. 更新 index。
6. 標記待確認內容。

## 每週

1. 請 Codex 整理 `logs/weekly/`。
2. 檢查本週新增或修改的 wiki 頁面。
3. 更新 indexes。
4. 檢查是否有重複或未連結頁面。
5. 整理可向主管回報的成果。

## 每月

1. 請 Codex 整理 `logs/monthly/`。
2. 檢查專案、工具、流程與公式是否完整。
3. 檢查是否有過時內容。
4. 整理能力成長與後續補強方向。

---

# 15. 最重要的操作原則

使用 Codex 時，永遠先提醒它：

```text
請遵守 AGENTS.md 與 PROJECT_RULES.md。
```

最推薦的通用開頭是：

```text
請根據 AGENTS.md 與 PROJECT_RULES.md 的規則處理以下任務。
不要修改 raw/imported_notes/ 的原始筆記。
不要新增未定義的資料夾。
不要保存敏感資訊。
若有不確定內容，請標記待確認。
```

---

# 16. 總結

Codex 在本專案中的標準工作方式是：

```text
讀取 raw
整理 logs
萃取 wiki
更新 indexes
回報變更
標記待確認
```

本專案的重點不是讓 Codex 自動產生大量筆記，而是讓 Codex 協助使用者把實習過程中真正重要的知識整理成穩定、可查詢、可複習的 LLM-Wiki。
