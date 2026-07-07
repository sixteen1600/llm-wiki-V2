# 07 Process Meeting Note Prompt

本 prompt 用於指示 Codex 將會議原始紀錄整理成正式的 `logs/meetings/` 會議筆記，並判斷哪些內容可以延伸成 daily log、wiki 筆記、待辦任務、業務背景或問題排除紀錄。

本步驟負責「會議筆記整理」與「會議內容分類」。  
不負責建立正式 `wiki/` 筆記、不負責更新 `indexes/`，也不負責完整敏感資訊審查。

若會議內容可能包含敏感資訊，應先執行或同步參考：

```text
prompts/08_sensitive_info_review.md
```

---

## 1. 目標

請讀取使用者提供的會議原始紀錄，依照 `templates/meeting_note.md` 的格式，整理成正式會議筆記。

目標是讓會議內容可以被後續流程追蹤、回顧與萃取。

完成後，應能回答：

- 這場會議的主題是什麼？
- 會議中討論了哪些重點？
- 會議中產生了哪些待辦事項？
- 會議中提到哪些概念、工具、流程、資料、公式、專案或業務背景？
- 哪些內容需要後續確認？
- 哪些內容可能涉及敏感資訊，需要抽象化或審查？
- 哪些內容應後續整理成正式 wiki 筆記？
- 哪些 indexes 後續可能需要更新？

---

## 2. 適用情境

當使用者提供會議紀錄、會議摘要、會議逐字稿、會議截圖整理、會議後補充筆記或會議相關 raw note 時，使用本 prompt。

常見輸入包括：

- 會議逐字稿
- 會議重點筆記
- 主管交辦事項
- 專案討論紀錄
- 工具導入討論
- PoC 討論紀錄
- 架構檢視討論
- 上線前確認討論
- 報告格式或文件需求討論
- 問題排除或卡點討論
- 會議後的零散補充筆記

若輸入內容主要是一般每日學習紀錄，而不是會議，應使用：

```text
prompts/02_generate_daily_log.md
```

若輸入內容包含大量未遮蔽截圖、內部流程、資料欄位、客戶資料或系統資訊，應先使用：

```text
prompts/08_sensitive_info_review.md
```

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
```

或：

```text
一段會議原始紀錄內容
```

或：

```text
已整理但尚未格式化的會議摘要
```

請優先從內容中判斷：

- 會議日期
- 會議主題
- 會議目的
- 討論重點
- 決議事項
- 待辦事項
- 待確認事項
- 敏感資訊風險
- 後續 wiki 候選項目

若會議日期無法確認，請不要自行編造日期，並標記：

```yaml
date_status: needs_review
```

若會議主題無法確認，請使用簡短暫定名稱：

```text
untitled_meeting
```

並在會議筆記中標記為待確認。

---

## 4. 輸出位置

會議筆記應輸出到：

```text
logs/meetings/
```

檔名格式建議為：

```text
YYYY-MM-DD_meeting_topic.md
```

範例：

```text
logs/meetings/2026-07-03_google_adk_report_discussion.md
logs/meetings/2026-07-03_poc_review_discussion.md
logs/meetings/2026-07-03_business_process_review.md
```

若同一天有多場會議，請使用不同主題命名。

若日期無法確認，請輸出到：

```text
logs/meetings/unknown_date_meeting_topic.md
```

並在 metadata 中標記：

```yaml
date_status: needs_review
```

---

## 5. 重要原則

請嚴格遵守以下原則。

### 5.1 只能根據會議來源整理

會議筆記只能根據使用者提供的會議紀錄或指定來源整理。

不可以：

- 使用外部知識補充會議中沒有提到的內容
- 自行擴寫公司內部流程
- 自行補充審查規則
- 自行推論上線條件
- 自行判斷未確認的業務規則
- 自行加入未提及的工具功能
- 將推測內容寫成已確認決議

可以：

- 將零散會議內容整理成清楚段落
- 將會議內容分類成討論重點、決議、待辦、待確認
- 將可能敏感內容抽象化
- 將不確定內容標記為待確認
- 將可延伸成 wiki 的內容列為候選項目
- 將後續可能需要更新的 index 列為 pending

### 5.2 會議筆記是紀錄層，不是 wiki 筆記

會議筆記應保存會議脈絡與後續行動，但不應寫成正式知識筆記。

會議筆記可以包含：

- 會議目的
- 討論重點
- 決議事項
- 待辦事項
- 待確認事項
- 相關概念、工具、流程、專案或業務背景
- 敏感資訊檢查
- 可萃取成 wiki 的候選項目

會議筆記不應包含：

- 完整概念教學
- 完整工具教學
- 完整流程文件
- 完整專案文件
- 完整資料字典
- 完整公式推導
- 完整內部審查流程
- 完整內部上線流程
- 完整 Knowledge Graph

正式 wiki 筆記應由後續 prompt 處理：

```text
prompts/03_extract_wiki_notes.md
```

### 5.3 不直接更新 indexes

本 prompt 不更新 `indexes/`。

可以在會議筆記中列出：

```text
Potential index updates
```

但不要直接修改任何 index 檔案。

index 更新應由後續 prompt 處理：

```text
prompts/04_update_indexes.md
```

---

## 6. Meeting note metadata

請在 meeting note 最上方加入 metadata。

```markdown
---
type: meeting_note
date: YYYY-MM-DD
meeting_topic: meeting_topic
source:
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
| `type` | 固定為 `meeting_note` |
| `date` | 會議日期 |
| `meeting_topic` | 會議主題，使用簡短英文或底線命名 |
| `source` | 會議來源，可以是 raw note、使用者提供內容或其他紀錄 |
| `date_status` | 日期是否已確認 |
| `sensitive_review_status` | 是否已完成敏感資訊檢查 |
| `wiki_extraction_status` | 是否已萃取正式 wiki 筆記 |
| `index_update_status` | 是否已更新 indexes |
| `created` | 會議筆記建立日期 |
| `updated` | 會議筆記最近更新日期 |

### date_status 可用值

```text
confirmed
inferred
needs_review
unknown
```

### sensitive_review_status 可用值

```text
unchecked
needs_review
reviewed
sensitive
abstracted
```

### wiki_extraction_status 可用值

```text
not_started
partial
completed
needs_review
```

### index_update_status 可用值

```text
not_started
partial
completed
needs_review
```

---

## 7. Meeting note 建議格式

請依照以下結構產生 meeting note。

```markdown
---
type: meeting_note
date: YYYY-MM-DD
meeting_topic: meeting_topic
source:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
date_status: confirmed
sensitive_review_status: unchecked
wiki_extraction_status: not_started
index_update_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# YYYY-MM-DD Meeting Note - Meeting Topic

## 1. 會議摘要

用 3～5 句整理本次會議的目的、主要討論內容與後續方向。

## 2. 會議基本資訊

| 項目 | 內容 |
|---|---|
| 日期 | YYYY-MM-DD |
| 主題 |  |
| 會議類型 | project / tool / workflow / business_context / review / troubleshooting / other |
| 來源 | raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md |
| 敏感資訊狀態 | unchecked / needs_review / reviewed / abstracted / sensitive |

## 3. 討論重點

| 主題 | 重點摘要 | 類型 | 後續整理方向 |
|---|---|---|---|
|  |  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting / other |  |

## 4. 決議事項

| 決議 | 依據 | 狀態 | 備註 |
|---|---|---|---|
|  |  | confirmed / needs_review / pending |  |

## 5. 待辦事項

| 待辦 | 類型 | 負責角色 | 狀態 | 建議位置 |
|---|---|---|---|---|
|  | task / project / workflow / documentation / review / other | 使用者 / 主管 / 同事 / 待確認 | todo / doing / blocked / pending / done | wiki/tasks/ |

## 6. 待確認事項

| 待確認內容 | 原因 | 建議確認對象 | 優先度 |
|---|---|---|---|
|  |  | 使用者 / 主管 / 同事 / 架構師 / 業務窗口 / 待確認 | 高 / 中 / 低 |

## 7. 相關概念、工具、流程與業務背景

| 項目 | 類型 | 說明 | 建議 Wiki 位置 |
|---|---|---|---|
|  | concept / tool / workflow / project / data / formula / business_context / glossary / troubleshooting |  | wiki/... |

## 8. 可能需要建立的 Wiki 筆記

| 候選項目 | 建議類型 | 建議位置 | 優先度 |
|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting | wiki/... | 高 / 中 / 低 |

## 9. 可能需要更新的 Index

| Index | 更新原因 | 狀態 |
|---|---|---|
|  |  | pending |

## 10. 敏感資訊檢查

| 檢查項目 | 是否出現 | 處理方式 |
|---|---|---|
| 客戶資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 保單或業務資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 帳號、密碼、API Key、Token | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部系統網址或截圖 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部資料表或欄位名稱 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 未抽象化審查或上線流程 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 可識別具體個人、部門或角色 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |

## 11. Source Trace

| 內容 | 來源 | 備註 |
|---|---|---|
|  | raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md |  |

## 12. 下一步

- 
- 
- 
```

---

## 8. 各區塊撰寫規則

### 8.1 會議摘要

請用 3～5 句整理會議重點。

摘要應包含：

- 本次會議主要目的
- 本次會議主要討論內容
- 本次會議是否產生待辦或決議
- 本次會議是否有待確認事項
- 本次會議是否涉及需抽象化的內容

不要寫成心得文。  
不要補充會議中沒有出現的外部知識。

### 8.2 會議基本資訊

會議類型可使用：

```text
project
tool
workflow
business_context
review
troubleshooting
data
formula
documentation
other
```

若無法確認會議類型，使用：

```text
other
```

並在待確認事項中補充。

### 8.3 討論重點

類型可使用：

```text
concept
tool
workflow
task
project
data
formula
business_context
glossary
troubleshooting
other
```

後續整理方向可填：

```text
keep_in_meeting_note
extract_to_wiki
create_task
needs_review
ignore
```

若討論內容涉及公司內部流程，請先抽象化後再整理。

### 8.4 決議事項

只記錄會議中明確出現的決議。

若來源沒有明確決議，請寫：

```text
- 無明確決議事項，待後續確認。
```

不要把推測、建議或未確認想法寫成決議。

狀態可使用：

```text
confirmed
needs_review
pending
```

### 8.5 待辦事項

將會議中明確出現的後續行動整理成待辦。

常見待辦類型：

```text
task
project
workflow
documentation
review
testing
implementation
research
other
```

狀態可使用：

```text
todo
doing
blocked
pending
done
```

負責角色應使用抽象角色，不要保留具體人名或內部職稱。

可用角色：

```text
使用者
主管
同事
架構師
業務窗口
審查角色
待確認
```

若待辦需要後續建立正式任務筆記，建議位置填：

```text
wiki/tasks/
```

### 8.6 待確認事項

請列出會議中不應自行判斷的內容，包括日期、主題、決議、角色、流程是否可記錄、審查或上線內容是否可抽象化、截圖附件是否含敏感資訊、術語或縮寫是否需要確認。

### 8.7 相關概念、工具、流程與業務背景

請根據會議內容，列出與本次會議相關的知識項目。可用類型包括 `concept`、`tool`、`workflow`、`task`、`project`、`data`、`formula`、`business_context`、`glossary`、`troubleshooting`。

### 8.8 可能需要建立的 Wiki 筆記

請列出會議後建議建立的 wiki 筆記。

建議位置請使用：

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
| 高 | 會影響後續任務、專案核心、主管要求、反覆出現、容易混淆、涉及流程或審查 |
| 中 | 有學習或整理價值，但目前不是主要任務核心 |
| 低 | 輔助背景，短期內不影響主要工作 |

本區塊只列候選項目，不建立正式 wiki 筆記。

### 8.9 可能需要更新的 Index

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

若本次新增 meeting note，後續也可能更新：

```text
indexes/learning_index.md
```

本區塊只標記 pending，不要實際更新 indexes。

### 8.10 敏感資訊檢查

會議筆記不得保存高風險敏感資訊原文。

若會議來源中出現敏感資訊，請依照以下方式處理：

| 情境 | 處理方式 |
|---|---|
| 客戶資料 | 移除或抽象化 |
| 保單或業務資料 | 抽象化 |
| 帳號、密碼、API Key、Token | 移除 |
| 完整內部系統網址 | 移除或抽象化 |
| 未遮蔽截圖 | 不直接複製，標記待確認 |
| 內部資料表名稱 | 抽象化 |
| 敏感欄位名稱 | 抽象化 |
| 內部審查細節 | 抽象化 |
| 上線流程細節 | 抽象化 |
| 可識別個人或組織資訊 | 抽象化 |

若存在任一敏感或待確認項目，meeting note metadata 應標記：

```yaml
sensitive_review_status: needs_review
```

若已完成抽象化，meeting note metadata 應標記：

```yaml
sensitive_review_status: abstracted
```

若無明顯敏感資訊，meeting note metadata 可標記：

```yaml
sensitive_review_status: unchecked
```

完整敏感資訊審查應由以下 prompt 處理：

```text
prompts/08_sensitive_info_review.md
```

### 8.11 Source Trace

會議筆記中的重要內容應盡量追蹤來源。

Source Trace 應記錄：

- 內容摘要
- 來源 raw note 或使用者提供內容
- 是否有特殊備註

不要在 Source Trace 中複製敏感原文。

若來源內容包含敏感資訊，只記錄：

```text
source contains sensitive information, abstracted in meeting note
```

---

## 9. raw note 或 daily log metadata 更新

若會議筆記來自 raw note，且可以修改 raw note metadata，請更新：

```yaml
meeting_note_status: generated
```

若原本沒有此欄位，可以在不破壞既有 metadata 的前提下加入。

並更新：

```yaml
updated: YYYY-MM-DD
```

若來源疑似包含敏感資訊，請同步標記：

```yaml
sensitive_review_status: needs_review
```

若會議筆記同時應納入 daily log，請不要直接修改 daily log，除非使用者明確要求。

可以在回覆中提示：

```text
This meeting note may also need to be referenced in logs/daily/YYYY-MM-DD.md.
```

---

## 10. 會議內容是否需要進入 daily log

若會議是當日主要學習或工作內容的一部分，請在回覆中建議後續更新 daily log。

判斷標準：

| 情境 | 是否建議更新 daily log |
|---|---|
| 會議產生重要任務 | 是 |
| 會議討論重要專案或 PoC | 是 |
| 會議說明重要工具或流程 | 是 |
| 會議涉及業務背景或審查流程 | 是 |
| 會議只是簡短同步且無後續行動 | 視情況 |
| 會議內容高度敏感且尚未抽象化 | 先審查，不建議直接進 daily log |

若需要更新 daily log，回覆中請標記：

```text
Daily log update suggested:
- logs/daily/YYYY-MM-DD.md
```

但本 prompt 不直接更新 daily log，除非使用者明確要求。

---

## 11. 完成後回覆格式

完成 meeting note 後，請使用以下格式回覆：

```text
Meeting note generated.

Input:
- raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md

Output:
- logs/meetings/YYYY-MM-DD_meeting_topic.md

Status:
- date_status: confirmed / inferred / needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

Action items:
- task: ...
- review: ...

Wiki candidates:
- concept: ...
- tool: ...
- workflow: ...
- business_context: ...
- glossary: ...

Potential index updates:
- indexes/learning_index.md
- indexes/task_index.md
- indexes/business_context_index.md
- indexes/glossary_index.md

Daily log update suggested:
- logs/daily/YYYY-MM-DD.md

Next step:
- Run prompts/03_extract_wiki_notes.md if wiki notes should be created.
- Run prompts/04_update_indexes.md after wiki notes are created.
```

若日期或會議主題無法確認，請改成：

```text
Meeting note generated with review needed.

Input:
- raw/imported_notes/unknown_date/raw_note_01.md

Output:
- logs/meetings/unknown_date_untitled_meeting.md

Status:
- date_status: needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

Needs review:
- meeting date
- meeting topic

Next step:
- Confirm the meeting date and topic before extracting wiki notes.
```

---

## 12. 不要執行的工作

本 prompt 不處理以下工作：

- 不建立正式 `wiki/` 筆記
- 不更新 `indexes/`
- 不建立完整 Knowledge Graph
- 不產生 weekly summary
- 不產生 monthly review
- 不補充來源沒有出現的外部知識
- 不保存敏感資訊原文
- 不保存未抽象化的內部審查流程
- 不保存未抽象化的上線流程
- 不保存可識別具體人名、部門或內部角色的資訊
- 不刪除 raw note
- 不移動圖片或附件
- 不更新 daily log，除非使用者明確要求

---

## 13. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定會議來源
- [ ] 已產生 `logs/meetings/YYYY-MM-DD_meeting_topic.md`
- [ ] meeting note 檔名符合規則
- [ ] meeting note metadata 完整
- [ ] 會議摘要已整理
- [ ] 會議基本資訊已整理
- [ ] 討論重點已分類
- [ ] 決議事項已記錄或標記無明確決議
- [ ] 待辦事項已整理
- [ ] 待確認事項已整理
- [ ] 相關概念、工具、流程與業務背景已標記
- [ ] 可萃取成 wiki 的候選項目已列出
- [ ] 可能需要更新的 index 已列出，但尚未實際更新
- [ ] 敏感資訊已初步檢查
- [ ] Source Trace 已建立
- [ ] 未建立正式 wiki 筆記
- [ ] 未更新 indexes
- [ ] 已提示後續是否需要更新 daily log
- [ ] 已提示下一步可執行 `prompts/03_extract_wiki_notes.md` 或 `prompts/04_update_indexes.md`
