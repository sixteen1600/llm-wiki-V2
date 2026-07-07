# 05 Generate Weekly Summary Prompt

本 prompt 用於指示 Codex 根據 `logs/daily/` 與必要的 `logs/meetings/`，產生正式的每週學習摘要 `logs/weekly/`。

本步驟負責「週次整理」與「一週學習脈絡彙整」。  
不負責建立正式 `wiki/` 筆記、不負責更新 `indexes/`，也不負責完整敏感資訊審查。

若 weekly summary 中發現新的 wiki 候選項目，後續應交由：

```text
prompts/03_extract_wiki_notes.md
```

若 weekly summary 產生後需要更新 index，後續應交由：

```text
prompts/04_update_indexes.md
```

若內容可能包含敏感資訊，應先執行或同步參考：

```text
prompts/08_sensitive_info_review.md
```

---

## 1. 目標

請讀取指定週次範圍內的 daily log，必要時包含 meeting note，依照 `templates/weekly_summary.md` 的格式，產生一份正式 weekly summary。

目標是將一週內分散的每日紀錄整理成可回顧、可追蹤、可延伸的週次摘要。

weekly summary 應能回答：

- 這一週主要學了什麼？
- 這一週完成了哪些任務？
- 這一週有哪些進行中的任務或專案？
- 這一週接觸了哪些概念、工具、流程、資料、公式或業務背景？
- 這一週有哪些問題、卡點或待確認事項？
- 這一週有哪些內容已經整理成 wiki？
- 這一週有哪些內容仍需要萃取成 wiki？
- 下一週應該優先做什麼？

---

## 2. 適用情境

當一週內已經有多份 daily log，且使用者需要彙整週次學習成果時，使用本 prompt。

常見輸入包括：

```text
logs/daily/YYYY-MM-DD.md
logs/daily/YYYY-MM-DD.md
logs/daily/YYYY-MM-DD.md
```

也可能包含：

```text
logs/meetings/YYYY-MM-DD_meeting_topic.md
```

本 prompt 適合處理：

- 一週學習回顧
- 實習週報草稿
- 週次任務整理
- 週次專案進度整理
- 週次 wiki 建置進度整理
- 週次待確認事項整理
- 週次問題與解法整理
- 下週工作規劃

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
指定週次
```

例如：

```text
2026-W27
```

或：

```text
一組 daily log 檔案路徑
```

例如：

```text
logs/daily/2026-07-01.md
logs/daily/2026-07-02.md
logs/daily/2026-07-03.md
```

或：

```text
daily log 資料夾與日期範圍
```

例如：

```text
logs/daily/
date_range: 2026-06-29 to 2026-07-03
```

若有 meeting note 也應納入：

```text
logs/meetings/2026-07-03_google_adk_report_discussion.md
```

請優先讀取 daily log metadata 中的：

```text
date
source_raw_note
sensitive_review_status
wiki_extraction_status
index_update_status
```

並優先讀取 daily log 中的以下區塊：

```text
今日摘要
今日學習重點
今日完成事項
今日進行中事項
今日遇到的問題
待確認事項
可萃取成 Wiki 的候選項目
可能需要更新的 Index
敏感資訊檢查
Source Trace
```

---

## 4. 輸出位置

weekly summary 應輸出到：

```text
logs/weekly/
```

檔名格式建議為：

```text
YYYY-WW.md
```

範例：

```text
logs/weekly/2026-W27.md
```

若使用者習慣使用日期範圍，也可以使用：

```text
logs/weekly/2026-06-29_to_2026-07-03.md
```

若週次無法確認，請輸出到：

```text
logs/weekly/unknown_week.md
```

並在 metadata 中標記：

```yaml
week_status: needs_review
```

---

## 5. 重要原則

請嚴格遵守以下原則。

### 5.1 只能根據 daily log 與 meeting note 整理

weekly summary 只能根據指定週次內的 daily log 與 meeting note 整理。

不可以：

- 使用外部知識補充 daily log 沒有出現的內容
- 自行補充公司內部流程
- 自行擴寫業務規則
- 自行推論審查邏輯
- 自行加入未提及的工具功能
- 將待確認事項寫成已確認事實
- 將 daily log 沒有提到的任務寫進週報

可以：

- 合併相同主題
- 整理一週脈絡
- 歸納一週重點
- 將多日出現的問題標記為高優先度
- 將反覆出現的概念、工具或流程列為 wiki 候選
- 將敏感資訊抽象化或標記待確認

### 5.2 weekly summary 是週次整理層

weekly summary 的用途是回顧一週，不是正式 wiki 筆記本體。

weekly summary 可以包含：

- 一週摘要
- 一週學習主題
- 一週完成事項
- 一週進行中事項
- 一週問題與卡點
- 一週待確認事項
- wiki 建置進度
- 下週計畫

weekly summary 不應包含：

- 完整概念教學
- 完整工具教學
- 完整流程文件
- 完整專案文件
- 完整資料字典
- 完整公式推導
- 完整內部業務流程
- 完整 Knowledge Graph

正式 wiki 筆記應由：

```text
prompts/03_extract_wiki_notes.md
```

處理。

### 5.3 不直接更新 indexes

本 prompt 不更新 `indexes/`。

可以在 weekly summary 中列出：

```text
Potential index updates
```

但不要直接修改任何 index 檔案。

index 更新應由：

```text
prompts/04_update_indexes.md
```

處理。

---

## 6. Weekly summary metadata

請在 weekly summary 最上方加入 metadata。

```markdown
---
type: weekly_summary
week: YYYY-WW
date_range:
  start: YYYY-MM-DD
  end: YYYY-MM-DD
source_daily_logs:
  - logs/daily/YYYY-MM-DD.md
source_meeting_notes:
  - logs/meetings/YYYY-MM-DD_meeting_topic.md
week_status: confirmed
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
| `type` | 固定為 `weekly_summary` |
| `week` | 週次，例如 `2026-W27` |
| `date_range` | 本 weekly summary 涵蓋的日期範圍 |
| `source_daily_logs` | 本週納入的 daily log |
| `source_meeting_notes` | 本週納入的 meeting note，可為空 |
| `week_status` | 週次是否已確認 |
| `sensitive_review_status` | 是否已完成敏感資訊檢查 |
| `wiki_extraction_status` | 是否已從本週內容萃取 wiki 筆記 |
| `index_update_status` | 是否已更新 indexes |
| `created` | weekly summary 建立日期 |
| `updated` | weekly summary 最近更新日期 |

### week_status 可用值

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

## 7. Weekly summary 建議格式

請依照以下結構產生 weekly summary。

```markdown
---
type: weekly_summary
week: YYYY-WW
date_range:
  start: YYYY-MM-DD
  end: YYYY-MM-DD
source_daily_logs:
  - logs/daily/YYYY-MM-DD.md
source_meeting_notes:
  - logs/meetings/YYYY-MM-DD_meeting_topic.md
week_status: confirmed
sensitive_review_status: unchecked
wiki_extraction_status: not_started
index_update_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# YYYY-WW Weekly Summary

## 1. 本週摘要

用 5～8 句整理本週主要學習、工作內容、任務進度與後續方向。

## 2. 本週每日紀錄

| 日期 | Daily Log | 今日重點 | Wiki 萃取狀態 | Index 更新狀態 |
|---|---|---|---|---|
| YYYY-MM-DD | `[[YYYY-MM-DD]]` |  | not_started / partial / completed / needs_review | not_started / partial / completed / needs_review |

## 3. 本週學習主題

| 主題 | 類型 | 出現日期 | 後續整理方向 |
|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting |  | keep / extract_to_wiki / needs_review |

## 4. 本週完成事項

| 完成事項 | 類型 | 對應日期 | 相關筆記 |
|---|---|---|---|
|  | task / project / workflow / documentation / review / other | YYYY-MM-DD |  |

## 5. 本週進行中事項

| 進行中事項 | 類型 | 目前狀態 | 下一步 |
|---|---|---|---|
|  | task / project / workflow / documentation / review / other | doing / blocked / pending / needs_review |  |

## 6. 本週問題與卡點

| 問題 | 類型 | 影響程度 | 狀態 | 建議處理 |
|---|---|---|---|---|
|  | tool / workflow / data / formula / business_context / permission / environment / documentation / other | low / medium / high / blocking | unresolved / workaround / solved / pending / needs_review |  |

## 7. 本週待確認事項

| 待確認內容 | 來源日期 | 原因 | 建議確認對象 | 優先度 |
|---|---|---|---|---|
|  | YYYY-MM-DD |  | 使用者 / 主管 / 同事 / 架構師 / 業務窗口 / 待確認 | 高 / 中 / 低 |

## 8. 本週 Wiki 建置進度

| 類型 | 已建立 / 更新 | 尚未建立 | 需要確認 |
|---|---|---|---|
| concept |  |  |  |
| tool |  |  |  |
| workflow |  |  |  |
| task |  |  |  |
| project |  |  |  |
| troubleshooting |  |  |  |
| data |  |  |  |
| formula |  |  |  |
| business_context |  |  |  |
| glossary |  |  |  |

## 9. 本週可萃取成 Wiki 的候選項目

| 候選項目 | 建議類型 | 建議位置 | 來源日期 | 優先度 |
|---|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting | wiki/... | YYYY-MM-DD | 高 / 中 / 低 |

## 10. 本週可能需要更新的 Index

| Index | 更新原因 | 狀態 |
|---|---|---|
|  |  | pending |

## 11. 敏感資訊檢查

| 檢查項目 | 是否出現 | 處理方式 |
|---|---|---|
| 客戶資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 保單或業務資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 帳號、密碼、API Key、Token | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部系統網址或截圖 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部資料表或欄位名稱 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 未抽象化審查或上線流程 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 可識別具體個人、部門或角色 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |

## 12. Source Trace

| 週次內容 | 來源 daily log / meeting note | 備註 |
|---|---|---|
|  | logs/daily/YYYY-MM-DD.md |  |

## 13. 下週建議

- 
- 
- 
```

---

## 8. 各區塊撰寫規則

### 8.1 本週摘要

請用 5～8 句整理本週內容，包含主要學習主題、主要任務、重要工具與流程、完成事項、未完成事項、問題與下週方向。

不要寫成心得文。  
不要加入來源沒有提到的外部知識。

### 8.2 本週每日紀錄

列出本週所有納入整理的 daily log。

若某天沒有 daily log，不要自行編造，可以標記：

```text
missing_daily_log
```

### 8.3 本週學習主題

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
```

後續整理方向可使用：

```text
keep
extract_to_wiki
needs_review
```

### 8.4 本週完成事項

只列來源中明確提到已完成的內容。若來源沒有明確完成事項，請寫：

```text
- 無明確完成事項，待後續確認。
```

不要將「正在做」或「待確認」寫成已完成。

### 8.5 本週進行中事項

請整理本週尚未完成、仍在進行或需要延續到下週的事項。狀態可使用 `doing`、`blocked`、`pending`、`needs_review`。

### 8.6 本週問題與卡點

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

影響程度可使用：

```text
low
medium
high
blocking
```

狀態可使用：

```text
unresolved
workaround
solved
pending
needs_review
```

若問題反覆出現，請提高優先度，並建議後續整理成：

```text
wiki/troubleshooting/
```

### 8.7 本週待確認事項

請整理一週內仍需要確認的內容。若同一待確認事項出現在多天，請合併整理，並保留來源日期。

### 8.8 本週 Wiki 建置進度

根據 daily log 或前一步輸出，整理本週 wiki 建置進度。此區塊只做週次整理，不實際建立 wiki 筆記。

### 8.9 本週可萃取成 Wiki 的候選項目

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

### 8.10 本週可能需要更新的 Index

根據本週 wiki 建置進度與候選項目，列出後續可能需要更新的 index。

本 weekly summary 本身產生後，也可能需要更新：

```text
indexes/learning_index.md
```

本區塊只標記 pending，不要實際更新 indexes。

### 8.11 敏感資訊檢查

weekly summary 不應將 daily log 或 meeting note 中的敏感資訊再次擴散。

若 weekly summary 中仍有敏感或待確認內容，metadata 應標記：

```yaml
sensitive_review_status: needs_review
```

若已完成抽象化，metadata 應標記：

```yaml
sensitive_review_status: abstracted
```

若無明顯敏感內容，metadata 可標記：

```yaml
sensitive_review_status: unchecked
```

完整敏感資訊審查應由：

```text
prompts/08_sensitive_info_review.md
```

處理。

### 8.12 Source Trace

weekly summary 中的重要整理內容，應追蹤回 daily log 或 meeting note。不要在 Source Trace 中複製敏感原文。

---

## 9. daily log 或 meeting note metadata 更新

若可以修改來源 metadata，請在成功產生 weekly summary 後，更新相關 daily log 或 meeting note。

建議加入或更新：

```yaml
weekly_summary_status: included
```

並更新：

```yaml
updated: YYYY-MM-DD
```

若來源疑似包含敏感資訊，請保留或同步標記：

```yaml
sensitive_review_status: needs_review
```

若無法修改來源檔案，請在回覆摘要中說明：

```text
Source metadata was not updated.
```

---

## 10. 完成後回覆格式

完成 weekly summary 後，請使用以下格式回覆：

```text
Weekly summary generated.

Input:
- logs/daily/YYYY-MM-DD.md
- logs/daily/YYYY-MM-DD.md
- logs/meetings/YYYY-MM-DD_meeting_topic.md

Output:
- logs/weekly/YYYY-WW.md

Status:
- week_status: confirmed / inferred / needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

This week:
- completed_items: N
- ongoing_items: N
- issues: N
- wiki_candidates: N
- needs_review: N

Wiki candidates:
- concept: ...
- tool: ...
- workflow: ...
- business_context: ...
- glossary: ...

Potential index updates:
- indexes/learning_index.md
- indexes/concept_index.md
- indexes/tool_index.md
- indexes/business_context_index.md

Next step:
- Run prompts/03_extract_wiki_notes.md if new wiki notes should be created.
- Run prompts/04_update_indexes.md after wiki notes or weekly summary are finalized.
```

若週次或日期範圍無法確認，請改成：

```text
Weekly summary generated with review needed.

Input:
- logs/daily/YYYY-MM-DD.md

Output:
- logs/weekly/unknown_week.md

Status:
- week_status: needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

Needs review:
- week number
- date range

Next step:
- Confirm the week number and date range before updating indexes.
```

---

## 11. 不要執行的工作

本 prompt 不處理以下工作：

- 不建立正式 `wiki/` 筆記
- 不更新 `indexes/`
- 不建立 meeting note
- 不產生 monthly review
- 不建立完整 Knowledge Graph
- 不新增新的固定資料夾
- 不補充來源沒有出現的外部知識
- 不保存敏感資訊原文
- 不保存未抽象化的內部流程細節
- 不保存未抽象化的審查或上線流程
- 不刪除 daily log 或 meeting note
- 不移動圖片或附件

---

## 12. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定週次內的 daily log
- [ ] 已視情況讀取相關 meeting note
- [ ] 已產生 `logs/weekly/YYYY-WW.md`
- [ ] weekly summary 檔名符合規則
- [ ] weekly summary metadata 完整
- [ ] 本週摘要已整理
- [ ] 本週每日紀錄已列出
- [ ] 本週學習主題已分類
- [ ] 本週完成事項已整理
- [ ] 本週進行中事項已整理
- [ ] 本週問題與卡點已整理
- [ ] 本週待確認事項已整理
- [ ] 本週 wiki 建置進度已整理
- [ ] 可萃取成 wiki 的候選項目已列出
- [ ] 可能需要更新的 index 已列出，但尚未實際更新
- [ ] 敏感資訊已初步檢查
- [ ] Source Trace 已建立
- [ ] 未建立正式 wiki 筆記
- [ ] 未更新 indexes
- [ ] 已提示下一步可執行 `prompts/03_extract_wiki_notes.md` 或 `prompts/04_update_indexes.md`
