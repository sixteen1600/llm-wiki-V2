---
type: daily_log
date: YYYY-MM-DD
source:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
topics:
  - topic_1
  - topic_2
status: draft
---

# Daily Log - YYYY-MM-DD

## 1. 今日摘要

簡要整理今天實習中主要學到的內容、接觸到的任務、會議重點與後續需要整理的知識。

範例：

```text
今天主要學習了 ______，並接觸到 ______。其中 ______ 可以進一步整理成正式 wiki 筆記。
```

---

## 2. 今日原始筆記來源

| 類型 | 路徑 |
|---|---|
| 原始筆記 | `raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md` |
| 相關附件 |  |
| 相關截圖 |  |

---

## 3. 今日學到的主題

| 主題 | 類型 | 是否需要整理成 wiki | 目標位置 |
|---|---|---|---|
|  | concept / tool / workflow / task / project / troubleshooting / data_note / business_context / formula / glossary | 是 / 否 | `wiki/...` |

---

## 4. 今日接觸的工具

記錄今天使用、看到或初步了解的工具。

| 工具名稱 | 學習內容 | 後續整理位置 |
|---|---|---|
|  |  | `wiki/tools/` |

---

## 5. 今日學到的概念

記錄今天學到的概念、術語、業務名詞或技術觀念。

| 概念 | 簡要說明 | 後續整理位置 |
|---|---|---|
|  |  | `wiki/concepts/` 或 `wiki/glossary/` |

---

## 6. 今日任務紀錄

記錄今天實際執行、被交辦或正在理解的任務。

| 任務 | 需求來源 | 目前狀態 | 後續動作 |
|---|---|---|---|
|  | 主管 / 同事 / 自主學習 | 未開始 / 進行中 / 已完成 / 待確認 |  |

---

## 7. 今日會議或主管提醒

若今天有會議、主管說明、同事提醒或流程說明，整理在這裡。

| 來源 | 重點 | 是否需整理成正式筆記 |
|---|---|---|
| 會議 / 主管 / 同事 |  | 是 / 否 |

可進一步整理至：

```text
logs/meetings/
wiki/business_context/
wiki/workflows/
wiki/tasks/
```

---

## 8. 今日遇到的問題

記錄今天遇到的錯誤、卡關、疑問或尚未理解的地方。

| 問題 | 發生情境 | 解決狀態 | 後續整理位置 |
|---|---|---|---|
|  |  | 未解決 / 已解決 / 待確認 | `wiki/troubleshooting/` |

---

## 9. 今日解決方式

如果今天有解決任何問題，記錄解法。

| 問題 | 解法 | 驗證方式 |
|---|---|---|
|  |  |  |

---

## 10. 今日出現的公式、模型或計算方式

若今天的筆記中有數學公式、統計公式、模型定義、指標計算方式或符號說明，整理在這裡。

| 公式或模型 | 用途 | 是否需整理成公式筆記 | 目標位置 |
|---|---|---|---|
|  |  | 是 / 否 / 待確認 | `wiki/formulas/` |

若需要保留公式，可使用 LaTeX：

```text
$$
formula = here
$$
```

注意：

- 不確定的公式要標記為待確認。
- 公式若涉及公司內部敏感計算邏輯，應抽象化處理。
- 正式公式頁面應整理到 `wiki/formulas/`。

---

## 11. 今日可整理成 wiki 的項目

| 項目 | 建議分類 | 建議檔案 |
|---|---|---|
|  | `wiki/concepts/` |  |
|  | `wiki/tools/` |  |
|  | `wiki/workflows/` |  |
|  | `wiki/tasks/` |  |
|  | `wiki/projects/` |  |
|  | `wiki/troubleshooting/` |  |
|  | `wiki/data_notes/` |  |
|  | `wiki/business_context/` |  |
|  | `wiki/formulas/` |  |
|  | `wiki/glossary/` |  |

---

## 12. 今日更新或新增的 wiki 頁面

| 狀態 | 路徑 | 說明 |
|---|---|---|
| 新增 / 更新 / 待建立 | `wiki/...` |  |

---

## 13. 今日需要更新的 indexes

| Index | 是否需要更新 | 原因 |
|---|---|---|
| `indexes/learning_index.md` | 是 / 否 |  |
| `indexes/task_index.md` | 是 / 否 |  |
| `indexes/project_index.md` | 是 / 否 |  |
| `indexes/tool_index.md` | 是 / 否 |  |
| `indexes/workflow_index.md` | 是 / 否 |  |
| `indexes/troubleshooting_index.md` | 是 / 否 |  |
| `indexes/data_index.md` | 是 / 否 |  |
| `indexes/formula_index.md` | 是 / 否 |  |
| `indexes/glossary_index.md` | 是 / 否 |  |

---

## 14. 待確認事項

記錄需要使用者、主管、同事或後續實作確認的內容。

| 待確認事項 | 類型 | 優先度 |
|---|---|---|
|  | 內容正確性 / 敏感資訊 / 公式 / 任務需求 / 技術細節 | 高 / 中 / 低 |

---

## 15. 敏感資訊檢查

| 檢查項目 | 是否出現 | 處理方式 |
|---|---|---|
| 客戶個資 | 是 / 否 | 移除 / 抽象化 / 待確認 |
| 保單或交易資料 | 是 / 否 | 移除 / 抽象化 / 待確認 |
| 帳號、密碼、API Key、Token | 是 / 否 | 移除 / 抽象化 / 待確認 |
| 未遮蔽內部系統截圖 | 是 / 否 | 移除 / 遮蔽 / 待確認 |
| 公司內部完整資料表名稱 | 是 / 否 | 抽象化 / 待確認 |
| 敏感欄位代碼 | 是 / 否 | 抽象化 / 待確認 |
| 公司內部敏感公式或決策邏輯 | 是 / 否 | 抽象化 / 待確認 |

---

## 16. 明日待辦

- [ ] 
- [ ] 
- [ ] 

---

## 17. 相關筆記

- 
- 
- 
