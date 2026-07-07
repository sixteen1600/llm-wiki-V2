# 02 Generate Daily Log Prompt

本 prompt 用於指示 Codex 根據 `raw/imported_notes/` 中的原始實習筆記，產生正式的每日學習紀錄 `logs/daily/`。

本步驟只負責「產生 daily log」與「整理當日學習內容」。  
不負責建立正式 `wiki/` 筆記、不負責更新 `indexes/`，也不負責進行完整 Knowledge Graph 整理。

---

## 1. 目標

請讀取指定的 raw note，依照 `templates/daily_log.md` 的格式，產生對應日期的 daily log。

目標是把原始、零散、未分類的實習筆記，整理成一份可以追蹤當日學習狀況的紀錄。

daily log 應該回答以下問題：

- 今天學了什麼？
- 今天做了什麼任務？
- 今天接觸了哪些概念、工具、流程、資料、公式或業務背景？
- 今天有哪些尚未理解或需要確認的內容？
- 今天有哪些內容之後應整理成正式 wiki 筆記？
- 今天是否出現可能敏感或需要抽象化的資訊？
- 下一步應該執行什麼整理流程？

---

## 2. 適用情境

當 `raw/imported_notes/` 中已有匯入完成的原始筆記時，使用本 prompt。

常見輸入來源包括：

- `raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md`
- `raw/imported_notes/YYYY/YYYY_MM_DD_Ddd_01.md`
- `raw/imported_notes/unknown_date/raw_note_01.md`

本 prompt 適合處理：

- 每日學習筆記
- 當日工具操作紀錄
- 當日任務紀錄
- 當日概念學習紀錄
- 當日會議後的粗略紀錄
- 當日業務背景或流程理解
- 當日遇到的錯誤、問題或待確認事項

若原始筆記主要是完整會議紀錄，應優先考慮使用：

```text
prompts/07_process_meeting_note.md
```

若原始筆記包含大量敏感資訊，應先使用：

```text
prompts/08_sensitive_info_review.md
```

---

## 3. 輸入

使用者會提供一個 raw note 檔案路徑，例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

或提供一段已匯入的 raw note 內容。

請優先從 raw note metadata 讀取日期。  
若 metadata 缺少日期，請從檔名、標題或內容中推斷日期。

若日期仍無法確認，請不要自行編造日期，並在 daily log 中標記：

```yaml
date_status: needs_review
```

---

## 4. 輸出位置

daily log 應輸出到：

```text
logs/daily/
```

檔名格式為：

```text
YYYY-MM-DD.md
```

範例：

```text
logs/daily/2026-07-03.md
```

若同一天有多份 raw note，應整合到同一份 daily log，除非使用者明確要求分開。

若日期無法確認，請先輸出到：

```text
logs/daily/unknown_date.md
```

並在檔案內標記：

```yaml
date_status: needs_review
```

---

## 5. 重要原則

請嚴格遵守以下原則。

### 5.1 只能根據 raw note 整理

daily log 只能根據指定 raw note 的內容整理。

不可以：

- 使用外部知識補充 raw note 沒有出現的內容
- 自行推論公司內部流程
- 自行補充未提及的工具用途
- 自行擴寫業務規則
- 自行判斷未確認的內部審查邏輯
- 將推測內容寫成事實

可以：

- 將 raw note 中零散內容整理成清楚段落
- 將明顯屬於同一主題的內容歸類
- 將不確定內容標記為「待確認」
- 將可能應該進入 wiki 的內容列為候選項目
- 將敏感資訊標記為需要審查

### 5.2 daily log 是中間層，不是 wiki 筆記

daily log 的用途是記錄當天學習與工作內容。

daily log 可以包含：

- 今日重點
- 學到的概念
- 接觸的工具
- 做過的任務
- 理解到的流程
- 遇到的問題
- 待確認事項
- 可萃取成 wiki 的候選項目

daily log 不應該包含：

- 完整概念教學
- 完整工具教學
- 完整流程文件
- 完整專案文件
- 完整資料字典
- 完整公式推導
- 完整業務流程細節
- 完整 Knowledge Graph

這些內容應由後續 prompt 處理：

```text
prompts/03_extract_wiki_notes.md
```

### 5.3 不直接更新 indexes

本 prompt 不更新 `indexes/`。

可以在 daily log 中列出：

```text
Potential index updates
```

但不要直接修改任何 `indexes/` 檔案。index 更新應由後續 prompt 處理：

```text
prompts/04_update_indexes.md
```

---

## 6. daily log metadata

請在 daily log 最上方加入 metadata。

```markdown
---
type: daily_log
date: YYYY-MM-DD
source_raw_note:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
date_status: confirmed
sensitive_review_status: unchecked
wiki_extraction_status: not_started
index_update_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

### 欄位說明

| 欄位 | 說明 |
|---|---|
| `type` | 固定為 `daily_log` |
| `date` | daily log 對應日期 |
| `source_raw_note` | 來源 raw note 路徑，可有多個 |
| `date_status` | 日期是否已確認 |
| `sensitive_review_status` | 是否已完成敏感資訊檢查 |
| `wiki_extraction_status` | 是否已萃取正式 wiki 筆記 |
| `index_update_status` | 是否已更新 indexes |
| `created` | daily log 建立日期 |
| `updated` | daily log 最近更新日期 |

### 可用狀態值

```text
date_status: confirmed / inferred / needs_review / unknown
sensitive_review_status: unchecked / needs_review / reviewed / sensitive / abstracted
wiki_extraction_status: not_started / partial / completed / needs_review
index_update_status: not_started / partial / completed / needs_review
```

---

## 7. daily log 建議格式

請依照以下結構產生 daily log。

```markdown
---
type: daily_log
date: YYYY-MM-DD
source_raw_note:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
date_status: confirmed
sensitive_review_status: unchecked
wiki_extraction_status: not_started
index_update_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# YYYY-MM-DD Daily Log

## 1. 今日摘要

簡短整理今天的主要學習與工作內容。

## 2. 今日學習重點

| 類型 | 內容 | 後續整理方向 |
|---|---|---|
| concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting |  |  |

## 3. 今日完成事項

- 
- 
- 

## 4. 今日進行中事項

- 
- 
- 

## 5. 今日遇到的問題

| 問題 | 類型 | 狀態 | 後續處理 |
|---|---|---|---|
|  | tool / workflow / data / formula / business_context / other | unresolved / workaround / solved / pending |  |

## 6. 待確認事項

| 待確認內容 | 原因 | 建議確認對象 |
|---|---|---|
|  |  | 使用者 / 主管 / 同事 / 待確認 |

## 7. 可萃取成 Wiki 的候選項目

| 候選項目 | 建議類型 | 建議位置 | 優先度 |
|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting | wiki/... | 高 / 中 / 低 |

## 8. 可能需要更新的 Index

| Index | 更新原因 | 狀態 |
|---|---|---|
|  |  | pending |

## 9. 敏感資訊檢查

| 檢查項目 | 是否出現 | 處理方式 |
|---|---|---|
| 客戶資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 保單或業務資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 帳號、密碼、API Key、Token | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部系統網址或截圖 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部資料表或欄位名稱 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 未抽象化審查或上線流程 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |

## 10. 明日或下一步

- 
- 
- 

## 11. Source Trace

| 內容 | 來源 raw note | 備註 |
|---|---|---|
|  | raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md |  |
```

---

## 8. 各區塊撰寫規則

### 8.1 今日摘要

請用 3～5 句整理當天主要內容。摘要應包含今日主要學習主題、主要工作或任務、重要工具 / 流程 / 概念 / 業務背景，以及是否有需要後續整理的內容。

不要寫成心得文。不要加入 raw note 沒有出現的外部知識。

### 8.2 今日學習重點

請將 raw note 中出現的重點分類到以下類型：

| 類型 | 說明 |
|---|---|
| concept | 概念、方法、技術原理 |
| tool | 工具、平台、套件、系統 |
| workflow | 可重複執行的流程 |
| task | 具體任務或待辦 |
| project | 專案、PoC、Prototype、Demo |
| data | 資料來源、欄位、格式、資料品質 |
| formula | 公式、模型、指標、計算方式 |
| business_context | 業務背景、審查流程、上線流程、組織脈絡 |
| glossary | 縮寫、術語、英文專有名詞 |
| troubleshooting | 錯誤、問題、卡點或排除經驗 |

若一個項目可能同時屬於多種類型，請選擇最主要的類型，並在備註中說明可能的其他分類。

### 8.3 今日完成事項

列出今天已完成的工作。只列出 raw note 中有明確提到的完成事項。

若 raw note 沒有明確完成事項，請寫：

```text
- 無明確完成事項，待後續確認。
```

### 8.4 今日進行中事項

列出今天仍在進行或尚未完成的事項。

若 raw note 沒有明確進行中事項，請寫：

```text
- 無明確進行中事項，待後續確認。
```

### 8.5 今日遇到的問題

整理 raw note 中提到的問題、卡點、錯誤或未解決情況。

問題類型可使用：

```text
tool
workflow
data
formula
business_context
permission
environment
documentation
other
```

狀態可使用：

```text
unresolved
workaround
solved
pending
needs_review
```

若問題需要正式整理，請在後續候選項目中列入 `wiki/troubleshooting/`。

### 8.6 待確認事項

列出不應自行判斷、需要後續確認的內容，例如日期、術語、業務流程、工具用途、資料欄位、公式邏輯、圖片附件等。

建議確認對象可使用：

```text
使用者
主管
同事
架構師
業務窗口
待確認
```

### 8.7 可萃取成 Wiki 的候選項目

請根據 raw note 內容，列出適合後續整理成正式 wiki 筆記的候選項目。

建議位置請使用以下資料夾：

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

優先度判斷：

| 優先度 | 判斷標準 |
|---|---|
| 高 | 反覆出現、任務核心、專案核心、主管要求、會影響後續理解、容易混淆 |
| 中 | 有學習價值，但目前不是主要任務核心 |
| 低 | 輔助背景，短期內不影響主要工作 |

本區塊只列候選項目，不建立正式 wiki 筆記。

### 8.8 可能需要更新的 Index

根據候選 wiki 項目，列出之後可能需要更新的 index。

| 候選類型 | 可能更新的 index |
|---|---|
| concept | `indexes/concept_index.md` |
| tool | `indexes/tool_index.md` |
| workflow | `indexes/workflow_index.md` |
| task | `indexes/task_index.md` |
| project | `indexes/project_index.md` |
| troubleshooting | `indexes/troubleshooting_index.md` |
| data | `indexes/data_index.md` |
| formula | `indexes/formula_index.md` |
| business_context | `indexes/business_context_index.md` |
| glossary | `indexes/glossary_index.md` |

本區塊只標記 pending，不要實際更新 indexes。

### 8.9 敏感資訊檢查

本步驟做的是 daily log 層級的初步檢查。若 raw note 中明確出現敏感資訊，請不要完整複製到 daily log。

若存在任一敏感或待確認項目，daily log metadata 應標記：

```yaml
sensitive_review_status: needs_review
```

完整敏感資訊審查應由後續 prompt 處理：

```text
prompts/08_sensitive_info_review.md
```

### 8.10 Source Trace

daily log 中的重要整理內容，應盡量追蹤回 raw note。若同一份 daily log 整合多份 raw note，必須標明不同內容來自哪一份 raw note。

---

## 9. raw note metadata 更新

若可以修改原始 raw note metadata，請在成功產生 daily log 後，將 raw note metadata 中的：

```yaml
daily_log_status: not_generated
```

改為：

```yaml
daily_log_status: generated
```

並更新：

```yaml
updated: YYYY-MM-DD
```

若 raw note 疑似包含敏感資訊，請同步標記：

```yaml
sensitive_review_status: needs_review
```

若無法修改 raw note，請在回覆摘要中說明：

```text
Raw note metadata was not updated.
```

---

## 10. 完成後回覆格式

完成 daily log 後，請用以下格式回覆：

```text
Daily log generated.

Input:
- raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md

Output:
- logs/daily/YYYY-MM-DD.md

Status:
- date_status: confirmed / inferred / needs_review
- sensitive_review_status: unchecked / needs_review
- wiki_extraction_status: not_started
- index_update_status: not_started

Wiki candidates:
- concept: ...
- tool: ...
- workflow: ...
- business_context: ...

Next step:
- Run prompts/03_extract_wiki_notes.md
```

若日期無法確認，請改成：

```text
Daily log generated with review needed.

Input:
- raw/imported_notes/unknown_date/raw_note_01.md

Output:
- logs/daily/unknown_date.md

Status:
- date_status: needs_review
- sensitive_review_status: unchecked / needs_review
- wiki_extraction_status: not_started
- index_update_status: not_started

Next step:
- Confirm the note date before running prompts/03_extract_wiki_notes.md
```

---

## 11. 不要執行的工作

本 prompt 不處理以下工作：

- 不建立正式 `wiki/` 筆記
- 不更新 `indexes/`
- 不產生 weekly summary
- 不產生 monthly review
- 不建立 meeting note
- 不建立完整 Knowledge Graph
- 不補充 raw note 沒有出現的外部知識
- 不保存敏感資訊原文
- 不完整重寫原始筆記
- 不刪除 raw note
- 不移動圖片或附件

---

## 12. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定 raw note
- [ ] 已產生 `logs/daily/YYYY-MM-DD.md`
- [ ] daily log 檔名符合日期格式
- [ ] daily log metadata 完整
- [ ] 今日摘要已整理
- [ ] 今日學習重點已分類
- [ ] 今日完成事項已記錄
- [ ] 今日進行中事項已記錄
- [ ] 今日問題與待確認事項已記錄
- [ ] 可萃取成 wiki 的候選項目已列出
- [ ] 可能需要更新的 index 已列出，但尚未實際更新
- [ ] 敏感資訊已初步檢查
- [ ] Source Trace 已建立
- [ ] 未建立正式 wiki 筆記
- [ ] 未更新 indexes
- [ ] 已提示下一步應執行 `prompts/03_extract_wiki_notes.md`
