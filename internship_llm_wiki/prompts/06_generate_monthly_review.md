# 06 Generate Monthly Review Prompt

本 prompt 用於指示 Codex 根據 `logs/weekly/`、必要的 `logs/daily/` 與 `logs/meetings/`，產生正式的每月學習回顧 `logs/monthly/`。

本步驟負責「月度整理」與「長期學習脈絡回顧」。  
不負責建立正式 `wiki/` 筆記、不負責更新 `indexes/`，也不負責完整敏感資訊審查。

若 monthly review 中發現新的 wiki 候選項目，後續應交由：

```text
prompts/03_extract_wiki_notes.md
```

若 monthly review 產生後需要更新 index，後續應交由：

```text
prompts/04_update_indexes.md
```

若內容可能包含敏感資訊，應先執行或同步參考：

```text
prompts/08_sensitive_info_review.md
```

---

## 1. 目標

請讀取指定月份內的 weekly summary，必要時補充讀取 daily log 與 meeting note，依照 `templates/monthly_review.md` 的格式，產生一份正式 monthly review。

目標是將一個月內的實習學習、任務進展、專案成果、工具使用、流程理解、問題排除與 wiki 建置進度整理成可長期回顧的月度紀錄。

monthly review 應能回答：

- 這個月主要學了什麼？
- 這個月完成了哪些任務或專案？
- 這個月建立或更新了哪些 wiki 筆記？
- 這個月接觸了哪些重要概念、工具、流程、資料、公式或業務背景？
- 這個月有哪些反覆出現的問題或卡點？
- 這個月有哪些待確認事項仍未解決？
- 這個月的實習學習重點如何演進？
- 下個月應該優先補強哪些內容？

---

## 2. 適用情境

當一個月份內已經有多份 weekly summary，且使用者需要彙整月度學習成果時，使用本 prompt。

常見輸入包括：

```text
logs/weekly/YYYY-WW.md
logs/weekly/YYYY-WW.md
logs/weekly/YYYY-WW.md
```

也可能包含：

```text
logs/daily/YYYY-MM-DD.md
logs/meetings/YYYY-MM-DD_meeting_topic.md
```

本 prompt 適合處理：

- 月度學習回顧
- 實習月報草稿
- 月度任務整理
- 月度專案進度整理
- 月度 wiki 建置進度整理
- 月度待確認事項整理
- 月度問題與解法整理
- 下個月學習與工作規劃

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
指定月份
```

例如：

```text
2026-07
```

或：

```text
一組 weekly summary 檔案路徑
```

例如：

```text
logs/weekly/2026-W27.md
logs/weekly/2026-W28.md
logs/weekly/2026-W29.md
logs/weekly/2026-W30.md
```

或：

```text
weekly summary 資料夾與日期範圍
```

例如：

```text
logs/weekly/
date_range: 2026-07-01 to 2026-07-31
```

若有必要，也可以補充讀取：

```text
logs/daily/
logs/meetings/
```

請優先讀取 weekly summary metadata 中的：

```text
week
date_range
source_daily_logs
source_meeting_notes
sensitive_review_status
wiki_extraction_status
index_update_status
```

並優先讀取 weekly summary 中的以下區塊：

```text
本週摘要
本週每日紀錄
本週學習主題
本週完成事項
本週進行中事項
本週問題與卡點
本週待確認事項
本週 Wiki 建置進度
本週可萃取成 Wiki 的候選項目
本週可能需要更新的 Index
敏感資訊檢查
Source Trace
下週建議
```

---

## 4. 輸出位置

monthly review 應輸出到：

```text
logs/monthly/
```

檔名格式建議為：

```text
YYYY-MM.md
```

範例：

```text
logs/monthly/2026-07.md
```

若使用者習慣使用月份名稱，也可以使用：

```text
logs/monthly/2026-07_july_review.md
```

若月份無法確認，請輸出到：

```text
logs/monthly/unknown_month.md
```

並在 metadata 中標記：

```yaml
month_status: needs_review
```

---

## 5. 重要原則

請嚴格遵守以下原則。

### 5.1 只能根據 weekly summary、daily log 與 meeting note 整理

monthly review 只能根據指定月份內的 weekly summary、daily log 與 meeting note 整理。

不可以：

- 使用外部知識補充來源沒有出現的內容
- 自行補充公司內部流程
- 自行擴寫業務規則
- 自行推論審查邏輯
- 自行加入未提及的工具功能
- 將待確認事項寫成已確認事實
- 將 weekly summary 沒有提到的任務寫進月報

可以：

- 合併多週重複主題
- 整理月度脈絡
- 歸納學習進展
- 標記反覆出現的問題
- 整理跨週專案進展
- 將反覆出現的概念、工具或流程列為高優先度 wiki 候選
- 將敏感資訊抽象化或標記待確認

### 5.2 monthly review 是月度回顧層

monthly review 的用途是回顧一個月，不是正式 wiki 筆記本體。

monthly review 可以包含：

- 月度摘要
- 月度學習主題
- 月度完成事項
- 月度進行中事項
- 月度問題與卡點
- 月度待確認事項
- wiki 建置進度
- 下月計畫

monthly review 不應包含：

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

可以在 monthly review 中列出：

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

## 6. Monthly review metadata

請在 monthly review 最上方加入 metadata。

```markdown
---
type: monthly_review
month: YYYY-MM
date_range:
  start: YYYY-MM-DD
  end: YYYY-MM-DD
source_weekly_summaries:
  - logs/weekly/YYYY-WW.md
source_daily_logs:
  - logs/daily/YYYY-MM-DD.md
source_meeting_notes:
  - logs/meetings/YYYY-MM-DD_meeting_topic.md
month_status: confirmed
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
| `type` | 固定為 `monthly_review` |
| `month` | 月份，例如 `2026-07` |
| `date_range` | 本 monthly review 涵蓋的日期範圍 |
| `source_weekly_summaries` | 本月納入的 weekly summary |
| `source_daily_logs` | 必要時補充納入的 daily log，可為空 |
| `source_meeting_notes` | 必要時補充納入的 meeting note，可為空 |
| `month_status` | 月份是否已確認 |
| `sensitive_review_status` | 是否已完成敏感資訊檢查 |
| `wiki_extraction_status` | 是否已從本月內容萃取 wiki 筆記 |
| `index_update_status` | 是否已更新 indexes |
| `created` | monthly review 建立日期 |
| `updated` | monthly review 最近更新日期 |

### month_status 可用值

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

## 7. Monthly review 建議格式

請依照以下結構產生 monthly review。

```markdown
---
type: monthly_review
month: YYYY-MM
date_range:
  start: YYYY-MM-DD
  end: YYYY-MM-DD
source_weekly_summaries:
  - logs/weekly/YYYY-WW.md
source_daily_logs:
  - logs/daily/YYYY-MM-DD.md
source_meeting_notes:
  - logs/meetings/YYYY-MM-DD_meeting_topic.md
month_status: confirmed
sensitive_review_status: unchecked
wiki_extraction_status: not_started
index_update_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# YYYY-MM Monthly Review

## 1. 本月摘要

用 6～10 句整理本月主要學習、工作內容、任務進度、專案成果與後續方向。

## 2. 本月週次紀錄

| 週次 | Weekly Summary | 日期範圍 | 本週重點 | Wiki 萃取狀態 | Index 更新狀態 |
|---|---|---|---|---|---|
| YYYY-WW | `[[YYYY-WW]]` | YYYY-MM-DD to YYYY-MM-DD |  | not_started / partial / completed / needs_review | not_started / partial / completed / needs_review |

## 3. 本月學習主題

| 主題 | 類型 | 出現週次 | 月度整理方向 |
|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting |  | keep / extract_to_wiki / needs_review |

## 4. 本月完成事項

| 完成事項 | 類型 | 對應週次 | 相關筆記 |
|---|---|---|---|
|  | task / project / workflow / documentation / review / other | YYYY-WW |  |

## 5. 本月進行中事項

| 進行中事項 | 類型 | 目前狀態 | 下月建議 |
|---|---|---|---|
|  | task / project / workflow / documentation / review / other | doing / blocked / pending / needs_review |  |

## 6. 本月專案與任務進展

| 專案 / 任務 | 類型 | 本月進展 | 目前狀態 | 下月下一步 |
|---|---|---|---|---|
| `[[project_or_task_name]]` | project / task |  | active / blocked / completed / pending / needs_review |  |

## 7. 本月工具與流程學習

| 工具 / 流程 | 類型 | 本月使用情境 | 熟悉程度 / 驗證狀態 | 後續建議 |
|---|---|---|---|---|
| `[[tool_or_workflow_name]]` | tool / workflow |  | learning / usable / familiar / not_tested / partially_verified / verified / needs_review |  |

## 8. 本月問題與卡點

| 問題 | 類型 | 出現週次 | 影響程度 | 狀態 | 建議處理 |
|---|---|---|---|---|---|
|  | tool / workflow / data / formula / business_context / permission / environment / documentation / other | YYYY-WW | low / medium / high / blocking | unresolved / workaround / solved / pending / needs_review |  |

## 9. 本月待確認事項

| 待確認內容 | 來源週次 | 原因 | 建議確認對象 | 優先度 |
|---|---|---|---|---|
|  | YYYY-WW |  | 使用者 / 主管 / 同事 / 架構師 / 業務窗口 / 待確認 | 高 / 中 / 低 |

## 10. 本月 Wiki 建置進度

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

## 11. 本月可萃取成 Wiki 的候選項目

| 候選項目 | 建議類型 | 建議位置 | 來源週次 | 優先度 |
|---|---|---|---|---|
|  | concept / tool / workflow / task / project / data / formula / business_context / glossary / troubleshooting | wiki/... | YYYY-WW | 高 / 中 / 低 |

## 12. 本月可能需要更新的 Index

| Index | 更新原因 | 狀態 |
|---|---|---|
|  |  | pending |

## 13. 敏感資訊檢查

| 檢查項目 | 是否出現 | 處理方式 |
|---|---|---|
| 客戶資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 保單或業務資料 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 帳號、密碼、API Key、Token | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部系統網址或截圖 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 內部資料表或欄位名稱 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 未抽象化審查或上線流程 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |
| 可識別具體個人、部門或角色 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |

## 14. Source Trace

| 月度整理內容 | 來源 weekly summary / daily log / meeting note | 備註 |
|---|---|---|
|  | logs/weekly/YYYY-WW.md |  |

## 15. 下月建議

- 
- 
- 
```

---

## 8. 各區塊撰寫規則

### 8.1 本月摘要

請用 6～10 句整理本月內容，包含主要學習主題、主要任務或專案、重要工具與流程、完成事項、未完成事項、問題與 wiki 建置進度。

不要寫成心得文。  
不要加入來源沒有提到的外部知識。

### 8.2 本月週次紀錄

列出本月所有納入整理的 weekly summary。

若某週沒有 weekly summary，不要自行編造，可以標記：

```text
missing_weekly_summary
```

### 8.3 本月學習主題

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

月度整理方向可使用：

```text
keep
extract_to_wiki
needs_review
```

### 8.4 本月完成事項

只列來源中明確提到已完成的內容。若來源沒有明確完成事項，請寫：

```text
- 無明確完成事項，待後續確認。
```

不要將「正在做」或「待確認」寫成已完成。

### 8.5 本月進行中事項

請整理本月尚未完成、仍在進行或需要延續到下月的事項。狀態可使用 `doing`、`blocked`、`pending`、`needs_review`。

### 8.6 本月專案與任務進展

從 weekly summary 中整理本月主要專案與任務進展。

處理原則：

- 若專案跨多週出現，應合併成一列。
- 若任務已完成，狀態可標記為 `completed`。
- 若任務仍需確認，狀態應標記為 `needs_review`。
- 若專案或任務卡住，狀態應標記為 `blocked`。
- 不要自行新增來源沒有提到的專案或任務。

### 8.7 本月工具與流程學習

工具熟悉程度可使用：

```text
learning
usable
familiar
needs_review
```

流程驗證狀態可使用：

```text
not_tested
partially_verified
verified
needs_review
```

若流程涉及內部審查、上線或卡控，必須抽象化。

### 8.8 本月問題與卡點

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

若問題跨週反覆出現，請提高優先度，並建議後續整理成：

```text
wiki/troubleshooting/
```

### 8.9 本月待確認事項

請整理一個月內仍需要確認的內容。若同一待確認事項出現在多週，請合併整理，並保留來源週次。

### 8.10 本月 Wiki 建置進度

根據 weekly summary、daily log 或前一步輸出，整理本月 wiki 建置進度。此區塊只做月度整理，不實際建立 wiki 筆記。

### 8.11 本月可萃取成 Wiki 的候選項目

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

### 8.12 本月可能需要更新的 Index

根據本月 wiki 建置進度與候選項目，列出後續可能需要更新的 index。

本 monthly review 本身產生後，也可能需要更新：

```text
indexes/learning_index.md
```

本區塊只標記 pending，不要實際更新 indexes。

### 8.13 敏感資訊檢查

monthly review 不應將 weekly summary、daily log 或 meeting note 中的敏感資訊再次擴散。

若 monthly review 中仍有敏感或待確認內容，metadata 應標記：

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

### 8.14 Source Trace

monthly review 中的重要整理內容，應追蹤回 weekly summary、daily log 或 meeting note。不要在 Source Trace 中複製敏感原文。

---

## 9. weekly summary metadata 更新

若可以修改來源 metadata，請在成功產生 monthly review 後，更新相關 weekly summary。

建議加入或更新：

```yaml
monthly_review_status: included
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

完成 monthly review 後，請使用以下格式回覆：

```text
Monthly review generated.

Input:
- logs/weekly/YYYY-WW.md
- logs/weekly/YYYY-WW.md
- logs/daily/YYYY-MM-DD.md
- logs/meetings/YYYY-MM-DD_meeting_topic.md

Output:
- logs/monthly/YYYY-MM.md

Status:
- month_status: confirmed / inferred / needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

This month:
- completed_items: N
- ongoing_items: N
- projects_or_tasks: N
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
- indexes/project_index.md
- indexes/business_context_index.md

Next step:
- Run prompts/03_extract_wiki_notes.md if new wiki notes should be created.
- Run prompts/04_update_indexes.md after wiki notes or monthly review are finalized.
```

若月份或日期範圍無法確認，請改成：

```text
Monthly review generated with review needed.

Input:
- logs/weekly/YYYY-WW.md

Output:
- logs/monthly/unknown_month.md

Status:
- month_status: needs_review
- sensitive_review_status: unchecked / needs_review / abstracted
- wiki_extraction_status: not_started
- index_update_status: not_started

Needs review:
- month
- date range

Next step:
- Confirm the month and date range before updating indexes.
```

---

## 11. 不要執行的工作

本 prompt 不處理以下工作：

- 不建立正式 `wiki/` 筆記
- 不更新 `indexes/`
- 不建立 meeting note
- 不產生 weekly summary
- 不建立完整 Knowledge Graph
- 不新增新的固定資料夾
- 不補充來源沒有出現的外部知識
- 不保存敏感資訊原文
- 不保存未抽象化的內部流程細節
- 不保存未抽象化的審查或上線流程
- 不刪除 weekly summary、daily log 或 meeting note
- 不移動圖片或附件

---

## 12. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定月份內的 weekly summary
- [ ] 已視情況讀取相關 daily log 或 meeting note
- [ ] 已產生 `logs/monthly/YYYY-MM.md`
- [ ] monthly review 檔名符合規則
- [ ] monthly review metadata 完整
- [ ] 本月摘要已整理
- [ ] 本月週次紀錄已列出
- [ ] 本月學習主題已分類
- [ ] 本月完成事項已整理
- [ ] 本月進行中事項已整理
- [ ] 本月專案與任務進展已整理
- [ ] 本月工具與流程學習已整理
- [ ] 本月問題與卡點已整理
- [ ] 本月待確認事項已整理
- [ ] 本月 wiki 建置進度已整理
- [ ] 可萃取成 wiki 的候選項目已列出
- [ ] 可能需要更新的 index 已列出，但尚未實際更新
- [ ] 敏感資訊已初步檢查
- [ ] Source Trace 已建立
- [ ] 未建立正式 wiki 筆記
- [ ] 未更新 indexes
- [ ] 已提示下一步可執行 `prompts/03_extract_wiki_notes.md` 或 `prompts/04_update_indexes.md`
