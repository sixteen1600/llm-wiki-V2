# 01 Import Raw Note Prompt

本 prompt 用於指示 Codex 將原始實習筆記匯入 `raw/imported_notes/`，並進行最基本的整理與安全檢查。

本步驟只負責「匯入原始筆記」與「建立可追蹤來源」，不負責產生 daily log、不負責萃取 wiki 筆記，也不負責更新 indexes。

---

## 1. 目標

請讀取使用者指定的原始 Markdown 筆記，並將它整理到本專案的 raw note 區域。

目標是讓後續流程可以穩定追蹤：

- 原始筆記來自哪一天
- 原始筆記放在哪個位置
- 原始筆記是否已完成匯入
- 原始筆記是否可能包含敏感資訊
- 後續是否可以安全進入 daily log 產生流程

---

## 2. 適用情境

當使用者提供一份尚未整理的原始實習筆記時，使用本 prompt。

常見來源包括：

- 手動紀錄的 Markdown 筆記
- 從 Obsidian 匯出的每日筆記
- 實習當天的粗略學習紀錄
- 會議前後的原始文字紀錄
- 工具操作過程中的臨時紀錄
- 尚未分類的概念、任務、工具、流程或業務背景內容

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
raw note 檔案路徑
```

或：

```text
一段尚未整理的 Markdown 原始筆記內容
```

若使用者已經指定日期，請依照使用者指定日期處理。  
若使用者未指定日期，請根據原始筆記標題、檔名或內容中的日期推斷。

如果日期無法合理判斷，請不要自行編造日期，改用：

```text
raw/imported_notes/unknown_date/
```

並在匯入摘要中標記：

```text
date_status: needs_review
```

---

## 4. 輸出位置

匯入後的原始筆記應放在：

```text
raw/imported_notes/YYYY/
```

檔名格式建議為：

```text
YYYY_MM_DD_Ddd.md
```

範例：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
```

若同一天有多份原始筆記，請使用編號：

```text
raw/imported_notes/2026/2026_07_03_Fri_01.md
raw/imported_notes/2026/2026_07_03_Fri_02.md
```

若日期無法確認，請使用：

```text
raw/imported_notes/unknown_date/raw_note_01.md
```

---

## 5. 匯入原則

請嚴格遵守以下原則。

### 5.1 保留原始內容

匯入時應盡量保留原始筆記內容。

可以進行的處理：

- 修正明顯的 Markdown 結構錯誤
- 補上匯入用 metadata 區塊
- 移除不必要的空白行
- 將過度混亂的標題層級做最小修正
- 將附件或圖片路徑保留為原始參照
- 標記可能需要後續處理的內容

不可以進行的處理：

- 不要改寫原始筆記語意
- 不要摘要原始筆記
- 不要自行補充原文中沒有的內容
- 不要把原始筆記拆成 wiki 筆記
- 不要直接產生 daily log
- 不要更新 indexes
- 不要移動或刪除使用者提供的原始檔案

---

## 6. Metadata 格式

請在匯入後的 Markdown 檔案最上方加入以下 metadata。

```markdown
---
type: raw_note
source_type: manual_note
import_status: imported
date_status: confirmed
sensitive_review_status: unchecked
daily_log_status: not_generated
wiki_extraction_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

### 欄位說明

| 欄位 | 說明 |
|---|---|
| `type` | 固定為 `raw_note` |
| `source_type` | 原始筆記來源類型 |
| `import_status` | 匯入狀態 |
| `date_status` | 日期是否已確認 |
| `sensitive_review_status` | 是否已完成敏感資訊檢查 |
| `daily_log_status` | 是否已產生 daily log |
| `wiki_extraction_status` | 是否已萃取 wiki 筆記 |
| `created` | 匯入日期 |
| `updated` | 最近更新日期 |

### source_type 可用值

```text
manual_note
obsidian_note
meeting_raw_note
tool_log
imported_markdown
unknown
```

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

### daily_log_status 可用值

```text
not_generated
generated
needs_update
```

### wiki_extraction_status 可用值

```text
not_started
partial
completed
needs_review
```

---

## 7. 匯入後的檔案結構

匯入後的檔案應維持以下結構：

```markdown
---
type: raw_note
source_type: manual_note
import_status: imported
date_status: confirmed
sensitive_review_status: unchecked
daily_log_status: not_generated
wiki_extraction_status: not_started
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# 原始筆記標題

原始內容保留於此。
```

如果原始筆記已經有標題，請保留原標題。  
如果原始筆記沒有標題，請根據日期建立簡單標題：

```markdown
# YYYY-MM-DD Raw Note
```

---

## 8. 敏感資訊初步檢查

本步驟只做「初步標記」，不做完整敏感資訊審查。

若原始筆記可能包含以下內容，請不要直接刪除，而是在 metadata 中標記：

```yaml
sensitive_review_status: needs_review
```

可能敏感的內容包括：

- 客戶資料
- 保單資料
- 個人資料
- 帳號
- 密碼
- API Key
- Token
- 完整內部系統網址
- 未遮蔽截圖
- 內部資料表名稱
- 敏感欄位名稱
- 內部系統架構細節
- 未抽象化的審查規則
- 未抽象化的上線流程
- 可識別具體個人、部門或內部角色的資訊

若筆記中只有抽象化後的業務背景或一般學習內容，可以保留：

```yaml
sensitive_review_status: unchecked
```

完整敏感資訊審查應由後續 prompt 處理：

```text
prompts/08_sensitive_info_review.md
```

---

## 9. 附件與圖片處理

若原始筆記中包含圖片或附件參照，請先保留原始 Markdown 連結。

範例：

```markdown
![image.png](attachment:image.png)
```

本步驟不需要重新命名圖片、不需要移動圖片，也不需要建立 attachment index。

但如果圖片可能包含敏感資訊，請在 metadata 中標記：

```yaml
sensitive_review_status: needs_review
```

並在匯入摘要中補充：

```text
attachment_review: needed
```

---

## 10. 匯入摘要

完成匯入後，請在回覆中提供簡短摘要。

摘要格式如下：

```text
Import completed.

Imported file:
- raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md

Detected date:
- YYYY-MM-DD

Status:
- import_status: imported
- date_status: confirmed / inferred / needs_review
- sensitive_review_status: unchecked / needs_review

Next step:
- Run prompts/02_generate_daily_log.md
```

如果日期無法確認，請改成：

```text
Import completed with review needed.

Imported file:
- raw/imported_notes/unknown_date/raw_note_01.md

Detected date:
- unknown

Status:
- import_status: imported
- date_status: needs_review
- sensitive_review_status: unchecked / needs_review

Next step:
- Confirm the note date before running prompts/02_generate_daily_log.md
```

---

## 11. 不要執行的工作

本 prompt 不處理以下工作：

- 不產生 `logs/daily/`
- 不產生 `logs/weekly/`
- 不產生 `logs/monthly/`
- 不產生 `logs/meetings/`
- 不建立 `wiki/` 筆記
- 不更新 `indexes/`
- 不整理 Knowledge Graph
- 不改寫原始筆記內容
- 不自行補充原始筆記沒有的知識
- 不刪除原始檔案
- 不移動圖片或附件
- 不進行完整敏感資訊審查

---

## 12. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 原始筆記已放入 `raw/imported_notes/`
- [ ] 檔案命名符合專案規則
- [ ] 原始內容大致保留
- [ ] 已加入 metadata
- [ ] 日期狀態已標記
- [ ] 敏感資訊初步狀態已標記
- [ ] 未產生 daily log
- [ ] 未產生 wiki 筆記
- [ ] 未更新 indexes
- [ ] 已提示下一步應執行 `prompts/02_generate_daily_log.md`
