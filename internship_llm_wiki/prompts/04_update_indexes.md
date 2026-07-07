# 04 Update Indexes Prompt

本 prompt 用於指示 Codex 根據已建立或更新的 `wiki/` 筆記，更新對應的 `indexes/` 導覽頁。

本步驟負責維護 `indexes/`，讓 Obsidian 能夠穩定查找概念、任務、專案、工具、流程、問題、資料、公式、業務背景與術語。

本步驟會更新 `indexes/`，但不負責建立新的 `wiki/` 筆記。  
wiki 筆記建立應由前一步處理：

```text
prompts/03_extract_wiki_notes.md
```

---

## 1. 目標

請根據指定的 daily log、wiki note 或前一步的萃取結果，更新相關 index。

目標是讓所有新建立或已更新的 wiki 筆記，都能在對應 index 中被查到。

完成後，應能回答：

- 哪些 wiki 筆記已新增或更新？
- 每個 wiki 筆記應該出現在什麼 index？
- 每個 index 的哪個區塊需要更新？
- `home.md` 是否需要同步更新？
- 是否有待確認、敏感資訊或尚未完成的項目？
- index 是否仍只負責導覽，而沒有變成筆記本體？

---

## 2. 適用情境

當以下情況發生時，使用本 prompt：

- `prompts/03_extract_wiki_notes.md` 已建立或更新 `wiki/` 筆記
- 有新的概念、任務、專案、工具、流程、錯誤排除、資料、公式、業務背景或術語筆記需要加入對應 index
- daily log、weekly summary 或 monthly review 需要更新到 `learning_index.md`
- 近期重要內容需要更新到 `home.md`

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
logs/daily/YYYY-MM-DD.md
```

或：

```text
wiki/concepts/example_concept.md
wiki/tools/example_tool.md
wiki/workflows/example_workflow.md
```

或：

```text
prompts/03_extract_wiki_notes.md 的完成摘要
```

請優先使用已存在的 wiki note metadata、檔案位置與內容判斷 index 更新方式。

---

## 4. 輸出位置

本 prompt 只允許更新以下 `indexes/` 檔案：

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

不可新增其他 index。

不要建立：

```text
indexes/knowledge_graph_index.md
indexes/source_index.md
indexes/daily_index.md
indexes/meeting_index.md
indexes/attachment_index.md
indexes/screenshot_index.md
```

---

## 5. 重要原則

請嚴格遵守以下原則。

### 5.1 Index 只做導覽

index 的用途是分類、導覽、追蹤狀態。

index 可以包含：

- 筆記連結
- 類型
- 狀態
- 優先度
- 更新日期
- 來源簡述
- 對應任務、專案、工具或流程
- 待確認標記
- 敏感性狀態
- 下一步追蹤

index 不應包含：

- 完整概念說明
- 完整工具教學
- 完整流程步驟
- 完整任務內容
- 完整專案文件
- 完整資料字典
- 完整公式推導
- 完整業務流程細節
- 完整 troubleshooting 過程
- 完整 Knowledge Graph 關聯區塊

完整內容應保留在對應 `wiki/` 筆記中。

### 5.2 不建立 Knowledge Graph Index

本專案不建立獨立的 Knowledge Graph index。

Knowledge Graph 關聯應放在正式 `wiki/` 筆記內。`indexes/` 只負責導覽與追蹤，不負責保存完整關聯圖。

### 5.3 不補充來源沒有出現的內容

更新 index 時，只能根據以下來源：

- 已建立的 wiki note
- daily log
- raw note source trace
- 前一步 wiki extraction summary
- 既有 index 內容

不可以使用外部知識補充、擴寫公司流程、推論工具用途或把待確認內容寫成已確認。

### 5.4 保留既有內容

更新 index 時，必須保留既有內容。

可以新增新列、更新紀錄、待建立項目、對應關係與狀態更新。不可以任意刪除既有列、改寫已確認內容或改變 index 結構。

若既有內容與新內容衝突，請標記為 `needs_review`，不要直接覆蓋。

---

## 6. Wiki 類型與 Index 對應規則

請依照 wiki note 的 `category` 或所在資料夾判斷要更新哪個 index。

| Wiki 位置 | 類型 | 必須更新的 Index |
|---|---|---|
| `wiki/concepts/` | concept | `indexes/concept_index.md` |
| `wiki/tasks/` | task | `indexes/task_index.md` |
| `wiki/projects/` | project | `indexes/project_index.md` |
| `wiki/tools/` | tool | `indexes/tool_index.md` |
| `wiki/workflows/` | workflow | `indexes/workflow_index.md` |
| `wiki/troubleshooting/` | troubleshooting | `indexes/troubleshooting_index.md` |
| `wiki/data_notes/` | data | `indexes/data_index.md` |
| `wiki/formulas/` | formula | `indexes/formula_index.md` |
| `wiki/business_context/` | business_context | `indexes/business_context_index.md` |
| `wiki/glossary/` | glossary | `indexes/glossary_index.md` |

---

## 7. Learning Index 更新規則

若本次處理涉及 daily log、weekly summary、monthly review 或 meeting note，請更新：

```text
indexes/learning_index.md
```

### 7.1 daily log

若新增或更新：

```text
logs/daily/YYYY-MM-DD.md
```

請更新 `learning_index.md` 中與每日學習紀錄有關的區塊。

建議新增欄位內容：

| 日期 | Daily Log | 今日重點 | Wiki 萃取狀態 | Index 更新狀態 |
|---|---|---|---|---|
| YYYY-MM-DD | `[[YYYY-MM-DD]]` |  | not_started / partial / completed / needs_review | not_started / partial / completed / needs_review |

### 7.2 weekly summary

若新增或更新：

```text
logs/weekly/YYYY-WW.md
```

請更新 weekly summary 對應區塊。

### 7.3 monthly review

若新增或更新：

```text
logs/monthly/YYYY-MM.md
```

請更新 monthly review 對應區塊。

### 7.4 meeting note

若新增或更新：

```text
logs/meetings/YYYY-MM-DD_meeting_topic.md
```

請更新 meeting note 對應區塊。

---

## 8. Home Index 更新規則

`indexes/home.md` 是總入口，不是所有筆記的完整清單。

只有符合以下情況時，才更新 `home.md`：

- 新增近期重要專案
- 新增近期重要工具
- 新增近期重要流程
- 新增近期重要業務背景
- 新增目前卡住的主要問題
- 新增本週或本月重點學習主題
- 更新下一步工作順序
- 更新 wiki 建置進度

不要把所有新筆記都塞進 `home.md`。

---

## 9. 各 Index 更新規則

### 9.1 concept_index.md

當新增或更新 `wiki/concepts/` 筆記時，更新 `indexes/concept_index.md`。

應更新的區塊：概念總表、概念分類、概念來源追蹤、概念關聯追蹤、待補概念、容易混淆的概念、近期更新紀錄。

建議新增列：

| 概念 | 類型 | 狀態 | 來源 | 相關筆記 | 更新日期 |
|---|---|---|---|---|---|
| `[[concept_name]]` | technical / business / data / ai / other | draft / active / reviewed / needs_review | `logs/daily/YYYY-MM-DD.md` |  | YYYY-MM-DD |

### 9.2 task_index.md

當新增或更新 `wiki/tasks/` 筆記時，更新 `indexes/task_index.md`。

| 任務 | 任務類型 | 狀態 | 優先度 | 相關專案 | 更新日期 |
|---|---|---|---|---|---|
| `[[task_name]]` | research / implementation / documentation / testing / review / other | todo / doing / blocked / pending / done / archived | 高 / 中 / 低 | `[[project_name]]` | YYYY-MM-DD |

### 9.3 project_index.md

當新增或更新 `wiki/projects/` 筆記時，更新 `indexes/project_index.md`。

| 專案 | 專案類型 | 目前階段 | 狀態 | 優先度 | 更新日期 |
|---|---|---|---|---|---|
| `[[project_name]]` | poc / prototype / demo / development / documentation / research / data / other | planning / poc / prototype / implementation / testing / review / completed | draft / active / blocked / reviewed / archived | 高 / 中 / 低 | YYYY-MM-DD |

### 9.4 tool_index.md

當新增或更新 `wiki/tools/` 筆記時，更新 `indexes/tool_index.md`。

| 工具 | 工具類型 | 主要用途 | 學習狀態 | 相關任務 / 專案 | 更新日期 |
|---|---|---|---|---|---|
| `[[tool_name]]` | development / ai / data / documentation / system / package / other |  | learning / usable / familiar / needs_review |  | YYYY-MM-DD |

### 9.5 workflow_index.md

當新增或更新 `wiki/workflows/` 筆記時，更新 `indexes/workflow_index.md`。

| 流程 | 流程類型 | 主要用途 | 狀態 | 相關工具 | 更新日期 |
|---|---|---|---|---|---|
| `[[workflow_name]]` | note / tool / data / development / documentation / review / troubleshooting / other |  | draft / active / verified / needs_review / archived | `[[tool_name]]` | YYYY-MM-DD |

### 9.6 troubleshooting_index.md

當新增或更新 `wiki/troubleshooting/` 筆記時，更新 `indexes/troubleshooting_index.md`。

| 問題 | 問題類型 | 發生位置 | 解決狀態 | 相關工具 | 更新日期 |
|---|---|---|---|---|---|
| `[[troubleshooting_note]]` | install / config / permission / runtime / api / data / workflow / formula / review / other | tool / workflow / task / project / data / environment / other | unresolved / workaround / solved / pending | `[[tool_name]]` | YYYY-MM-DD |

### 9.7 data_index.md

當新增或更新 `wiki/data_notes/` 筆記時，更新 `indexes/data_index.md`。

| 資料主題 | 資料類型 | 主要用途 | 敏感性 | 相關流程 | 更新日期 |
|---|---|---|---|---|---|
| `[[data_topic]]` | table / text / report / api / excel / csv / json / log / other |  | none / abstracted / needs_review / sensitive | `[[workflow_name]]` | YYYY-MM-DD |

### 9.8 formula_index.md

當新增或更新 `wiki/formulas/` 筆記時，更新 `indexes/formula_index.md`。

| 公式 | 公式類型 | 主要用途 | 敏感性 | 驗證狀態 | 更新日期 |
|---|---|---|---|---|---|
| `[[formula_name]]` | math / statistics / metric / model / loss_function / weighting / business_rule / other |  | none / abstracted / needs_review / sensitive | not_verified / partially_verified / verified / needs_review | YYYY-MM-DD |

### 9.9 business_context_index.md

當新增或更新 `wiki/business_context/` 筆記時，更新 `indexes/business_context_index.md`。

| 業務背景 | 類型 | 主要說明 | 敏感性 | 相關專案 / 任務 | 更新日期 |
|---|---|---|---|---|---|
| `[[business_context_name]]` | process / review / approval / deployment / role / organization / business_rule / other |  | none / abstracted / needs_review / sensitive |  | YYYY-MM-DD |

### 9.10 glossary_index.md

當新增或更新 `wiki/glossary/` 筆記時，更新 `indexes/glossary_index.md`。

| 術語 | 中文翻譯 | 英文全名 | 縮寫 | 術語類型 | 狀態 | 更新日期 |
|---|---|---|---|---|---|---|
| `[[term_name]]` |  |  |  | technical / tool / data / project / business / formula / other | draft / active / reviewed / needs_review | YYYY-MM-DD |

---

## 10. 更新順序

請依照以下順序更新 index。

```text
1. 讀取輸入來源
2. 判斷新增或更新了哪些 wiki note
3. 根據 wiki note 類型決定要更新哪些 index
4. 先更新各類型 index
5. 再更新 learning_index.md
6. 最後判斷是否需要更新 home.md
7. 檢查是否有重複連結
8. 檢查是否有敏感資訊
9. 檢查是否有錯誤的 Obsidian link
10. 回覆更新摘要
```

---

## 11. Obsidian Link 規則

請使用 Obsidian 雙向連結。

正確：

```text
[[concept_name]]
[[tool_name]]
[[workflow_name]]
[[project_name]]
```

不要使用：

```text
[[concept\_name]]
[[tool\_name]]
[[workflow\_name]]
```

不要在底線前加反斜線。

若檔名和標題不同，可使用：

```text
[[file_name|Display Name]]
```

---

## 12. 重複項目處理規則

更新 index 前，請檢查是否已存在相同筆記連結。

若已存在相同連結：

- 不要新增重複列
- 更新既有列的狀態、日期或相關欄位
- 若內容衝突，標記為 `needs_review`

若疑似相同但不確定：

- 不要自動合併
- 保留新項目
- 在近期更新紀錄或待確認區標記：

```text
possible_duplicate: needs_review
```

---

## 13. 敏感資訊處理規則

更新 index 時，不要保存敏感資訊原文。

不可保存：

- 客戶資料
- 保單資料
- 個人資料
- 帳號
- 密碼
- API Key
- Token
- 完整內部系統網址
- 未遮蔽截圖
- 完整內部資料表名稱
- 敏感欄位名稱
- 未抽象化的內部審查流程
- 未抽象化的上線流程
- 可識別具體個人、部門或內部角色的資訊

若 wiki note metadata 顯示：

```yaml
sensitive_review_status: needs_review
```

則 index 中只記錄：

```text
needs_review
```

不要複製敏感內容。

若內容已抽象化，可記錄：

```text
abstracted
```

---

## 14. 近期更新紀錄

每次更新 index 時，應在該 index 的「近期更新紀錄」加入一列。

格式：

| 日期 | 更新內容 | 相關位置 |
|---|---|---|
| YYYY-MM-DD | 新增 / 更新 `[[note_name]]` | `wiki/.../note_name.md` |

若同一次更新多個筆記，可以合併描述：

| 日期 | 更新內容 | 相關位置 |
|---|---|---|
| YYYY-MM-DD | 新增 3 筆 concept note，更新 1 筆 tool note | `wiki/concepts/`, `wiki/tools/` |

---

## 15. daily log metadata 更新

若本次 index 更新是由 daily log 觸發，並且可以修改 daily log metadata，請更新：

```yaml
index_update_status: completed
```

若只更新部分 index：

```yaml
index_update_status: partial
```

若仍需人工確認：

```yaml
index_update_status: needs_review
```

並更新：

```yaml
updated: YYYY-MM-DD
```

若無法修改 daily log，請在回覆摘要中說明：

```text
Daily log metadata was not updated.
```

---

## 16. 完成後回覆格式

完成 index 更新後，請使用以下格式回覆：

```text
Indexes updated.

Input:
- logs/daily/YYYY-MM-DD.md
- wiki/concepts/example_concept.md
- wiki/tools/example_tool.md

Updated indexes:
- indexes/concept_index.md
- indexes/tool_index.md
- indexes/workflow_index.md
- indexes/home.md

Added / updated entries:
- [[example_concept]]
- [[example_tool]]
- [[example_workflow]]

Needs review:
- item_name: reason

Skipped:
- item_name: reason

Status:
- index_update_status: completed / partial / needs_review
- sensitive_review_status: unchecked / needs_review / abstracted

Next step:
- Continue with prompts/05_generate_weekly_summary.md if weekly summary is needed.
- Otherwise continue adding new raw notes.
```

若沒有任何 index 需要更新，請回覆：

```text
No index updates needed.

Input:
- logs/daily/YYYY-MM-DD.md

Reason:
- No new or changed wiki notes were found.

Status:
- index_update_status: needs_review / completed

Next step:
- Review manually if needed.
```

---

## 17. 不要執行的工作

本 prompt 不處理以下工作：

- 不建立新的 wiki 筆記
- 不產生 daily log
- 不產生 weekly summary
- 不產生 monthly review
- 不建立 meeting note
- 不新增新的 index 檔案
- 不新增新的固定資料夾
- 不建立 Knowledge Graph index
- 不把完整 wiki 筆記內容複製到 index
- 不補充來源沒有出現的外部知識
- 不保存敏感資訊原文
- 不刪除 raw note、daily log 或 wiki note
- 不移動圖片或附件

---

## 18. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定 daily log、wiki note 或 extraction summary
- [ ] 已判斷哪些 index 需要更新
- [ ] 已更新對應 index
- [ ] 每個新增 wiki note 都能在對應 index 中被找到
- [ ] 沒有建立多餘 index
- [ ] 沒有把 index 寫成 wiki note 本體
- [ ] 沒有新增完整 Knowledge Graph 區塊到 index
- [ ] 沒有重複新增相同 wiki note 連結
- [ ] Obsidian link 沒有錯誤跳脫底線
- [ ] 敏感資訊已抽象化或只標記狀態
- [ ] 已更新近期更新紀錄
- [ ] 已視情況更新 `home.md`
- [ ] 已視情況更新 daily log 的 `index_update_status`
- [ ] 已回覆更新摘要
