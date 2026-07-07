# 03 Extract Wiki Notes Prompt

本 prompt 用於指示 Codex 根據 `logs/daily/` 中的每日學習紀錄，萃取並建立正式的 `wiki/` 筆記。

本步驟負責將 daily log 中已整理出的概念、工具、任務、專案、流程、問題、資料、公式、業務背景與術語，轉換成可長期維護的 wiki 筆記。

本步驟會建立或更新 `wiki/` 筆記，但不負責更新 `indexes/`。  
index 更新應由後續 prompt 處理：

```text
prompts/04_update_indexes.md
```

---

## 1. 目標

請讀取指定的 daily log，根據其中的「可萃取成 Wiki 的候選項目」與當日內容，建立或更新正式 wiki 筆記。

目標是將每日學習紀錄中的零散知識，整理成可長期查詢、可互相連結、可被 Obsidian 使用的知識筆記。

完成後，應能回答：

- 哪些內容應該變成正式 wiki 筆記？
- 每個候選項目應放入哪個 `wiki/` 子資料夾？
- 每個筆記應使用哪一個 template？
- 每個筆記和哪些其他筆記有關？
- 是否需要建立 Knowledge Graph 關聯？
- 是否有敏感資訊需要抽象化或標記？
- 哪些 indexes 後續需要更新？

---

## 2. 適用情境

當 daily log 已經產生，且其中包含可整理成 wiki 的候選項目時，使用本 prompt。

常見輸入包括：

```text
logs/daily/YYYY-MM-DD.md
```

例如：

```text
logs/daily/2026-07-03.md
```

本 prompt 適合處理以下內容：

- 概念整理
- 工具整理
- 任務整理
- 專案整理
- 流程整理
- 錯誤排除整理
- 資料筆記整理
- 公式或模型筆記整理
- 業務背景整理
- 術語與縮寫整理

---

## 3. 輸入

使用者會提供一個 daily log 檔案路徑，例如：

```text
logs/daily/2026-07-03.md
```

或提供一段 daily log 內容。

請優先讀取 daily log 中的以下區塊：

```text
## 2. 今日學習重點
## 5. 今日遇到的問題
## 6. 待確認事項
## 7. 可萃取成 Wiki 的候選項目
## 8. 可能需要更新的 Index
## 9. 敏感資訊檢查
## 11. Source Trace
```

若 daily log 中沒有明確列出候選 wiki 項目，請根據 daily log 內容自行判斷候選項目，但只能根據 daily log 與其 source trace 指向的 raw note 內容判斷。

不可以使用外部知識補充 daily log 沒有出現的內容。

---

## 4. 輸出位置

請根據候選項目類型，輸出到對應 `wiki/` 子資料夾。

| 類型 | 輸出位置 | 使用 template |
|---|---|---|
| concept | `wiki/concepts/` | `templates/concept_note.md` |
| tool | `wiki/tools/` | `templates/tool_note.md` |
| workflow | `wiki/workflows/` | `templates/workflow_note.md` |
| task | `wiki/tasks/` | `templates/task_note.md` |
| project | `wiki/projects/` | `templates/project_note.md` |
| troubleshooting | `wiki/troubleshooting/` | `templates/troubleshooting_note.md` |
| data | `wiki/data_notes/` | `templates/data_note.md` |
| formula | `wiki/formulas/` | `templates/formula_note.md` |
| business_context | `wiki/business_context/` | 若已有 template 則使用；若尚未建立，沿用 wiki note 通用格式 |
| glossary | `wiki/glossary/` | 若已有 template 則使用；若尚未建立，沿用 glossary note 通用格式 |

---

## 5. 檔名規則

請使用小寫英文、底線或連字號命名。

建議格式：

```text
wiki/concepts/proof_of_concept.md
wiki/tools/google_adk.md
wiki/workflows/generate_fixed_format_report.md
wiki/business_context/eab_review_process.md
wiki/business_context/cab_deployment_control.md
wiki/glossary/poc.md
```

### 命名原則

- 使用英文檔名。
- 儘量簡短。
- 不使用空格。
- 不使用中文檔名。
- 不使用特殊符號。
- 不使用過長標題。
- 若是縮寫術語，`wiki/glossary/` 可直接使用縮寫小寫，例如 `poc.md`、`api.md`。
- 若是完整概念，應放在 `wiki/concepts/`，例如 `proof_of_concept.md`。
- 若同一主題已有既有筆記，應更新既有筆記，不要建立重複檔案。

---

## 6. 重要原則

請嚴格遵守以下原則。

### 6.1 只能根據 daily log 與 source trace 整理

wiki 筆記只能根據指定 daily log 與其 source trace 對應的 raw note 整理。

不可以：

- 使用外部知識補充 daily log 沒有出現的內容
- 自行補充公司內部流程
- 自行擴寫業務規則
- 自行推論審查邏輯
- 自行加入未提及的工具功能
- 把推測內容寫成已確認事實
- 產生與 daily log 無關的 wiki 筆記

可以：

- 將 daily log 中的內容整理成正式筆記
- 將 raw note 中已出現但 daily log 未完整整理的內容補入 wiki
- 將不確定內容標記為「待確認」
- 將敏感內容抽象化
- 建立 Obsidian 雙向連結
- 建立 Knowledge Graph 關聯區塊

### 6.2 wiki 筆記是長期知識層

wiki 筆記應比 daily log 更穩定、更結構化。wiki 筆記應整理成可查詢、可維護、可連結、可回顧、可延伸、可被 indexes 導覽。

避免寫成：

- 當天流水帳
- 心得文
- 尚未整理的草稿
- 完整原始筆記複製
- 無分類的雜記

### 6.3 不直接更新 indexes

本 prompt 不更新 `indexes/`。可以在完成回覆中列出 Potential index updates，但不要直接修改任何 `indexes/` 檔案。

---

## 7. 類型判斷規則

請依照下列規則判斷候選項目應放入哪個資料夾。

| 類型 | 放入位置 | 判斷重點 |
|---|---|---|
| concept | `wiki/concepts/` | 技術概念、方法、原理、理論、AI 或資料處理概念 |
| tool | `wiki/tools/` | 工具、平台、套件、框架、系統、開發環境 |
| workflow | `wiki/workflows/` | 可重複執行的操作流程、資料處理流程、報告產生流程 |
| task | `wiki/tasks/` | 具體待辦、主管交辦事項、實作任務、文件任務 |
| project | `wiki/projects/` | PoC、Prototype、Demo、較大型工作主題、多任務組成的專案 |
| troubleshooting | `wiki/troubleshooting/` | 錯誤、問題、卡點、排查過程、workaround、解法 |
| data | `wiki/data_notes/` | 資料來源、欄位、格式、API 回傳、資料品質、資料清理 |
| formula | `wiki/formulas/` | 數學公式、統計公式、評分公式、權重計算、模型定義 |
| business_context | `wiki/business_context/` | 業務背景、組織流程、審查流程、上線流程、角色脈絡 |
| glossary | `wiki/glossary/` | 縮寫、英文專有名詞、中文翻譯、術語對照 |

若內容重點是「這個詞是什麼意思」，歸類為 glossary。若是完整概念，歸類為 concept。若是多個任務組成的工作主題，歸類為 project。

---

## 8. Wiki note metadata

每一個 wiki note 最上方都應加入 metadata。

通用格式：

```markdown
---
type: wiki_note
category: concept / tool / workflow / task / project / troubleshooting / data / formula / business_context / glossary
status: draft
source_daily_log:
  - logs/daily/YYYY-MM-DD.md
source_raw_note:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
sensitive_review_status: unchecked
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

### 欄位說明

| 欄位 | 說明 |
|---|---|
| `type` | 固定為 `wiki_note` |
| `category` | wiki 筆記類型 |
| `status` | 筆記目前狀態 |
| `source_daily_log` | 來源 daily log |
| `source_raw_note` | 來源 raw note |
| `sensitive_review_status` | 是否涉及敏感資訊或需抽象化 |
| `created` | 筆記建立日期 |
| `updated` | 筆記最近更新日期 |

可用值：

```text
status: draft / active / reviewed / needs_review / archived
sensitive_review_status: unchecked / needs_review / reviewed / sensitive / abstracted
```

---

## 9. Wiki note 通用結構

若對應 template 已存在，請優先使用 `templates/` 中的正式 template。

若尚未建立對應 template，請使用以下通用結構：

```markdown
---
type: wiki_note
category: concept / tool / workflow / task / project / troubleshooting / data / formula / business_context / glossary
status: draft
source_daily_log:
  - logs/daily/YYYY-MM-DD.md
source_raw_note:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
sensitive_review_status: unchecked
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Note Title

## 1. 摘要

用 2～5 句整理本筆記的核心內容。

## 2. 來源

| 來源類型 | 路徑 | 說明 |
|---|---|---|
| daily_log | logs/daily/YYYY-MM-DD.md |  |
| raw_note | raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md |  |

## 3. 主要內容

根據來源內容整理本筆記的重點。

## 4. 待確認事項

| 待確認內容 | 原因 | 建議確認對象 |
|---|---|---|
|  |  | 使用者 / 主管 / 同事 / 待確認 |

## 5. 敏感資訊檢查

| 檢查項目 | 狀態 | 處理方式 |
|---|---|---|
| 是否涉及內部系統、資料、流程或角色 | 是 / 否 / 待確認 | remove / abstract / mask / keep / pending |

## 6. Knowledge Graph 關聯

此區塊用於建立本筆記與其他 wiki 筆記之間的知識關係。  
請優先使用 Obsidian 雙向連結，例如 `[[note_name]]`。

### 上游知識（Prerequisites）

記錄理解本筆記前，最好先理解的概念、工具、流程、資料或公式。

- 
- 
- 

### 下游知識（Used By）

記錄哪些任務、專案、流程、工具或公式會使用到本筆記內容。

- 
- 
- 

### 相關知識（Related）

記錄和本筆記主題相關，但不是明確上下游關係的知識。

- 
- 
- 

### 關聯類型整理

| 關聯項目 | 關聯類型 | 說明 |
|---|---|---|
| `[[note_name]]` | prerequisite / used_by / related / input / output / similar / depends_on / part_of |  |
```

---

## 10. Knowledge Graph 關聯規則

每一份正式 wiki 筆記都應包含 Knowledge Graph 關聯區塊。

### 10.1 關聯類型

| 關聯類型 | 說明 |
|---|---|
| prerequisite | 理解本筆記前需要先理解的內容 |
| used_by | 本筆記內容會被哪些任務、專案、流程、工具或公式使用 |
| related | 相關但不是明確上下游的內容 |
| input | 本筆記是某個流程、工具、公式或任務的輸入 |
| output | 本筆記是某個流程、工具、公式或任務的輸出 |
| similar | 與另一筆記概念相近，容易混淆或可比較 |
| depends_on | 本筆記依賴另一筆記中的內容 |
| part_of | 本筆記是某個專案、流程或任務的一部分 |

### 10.2 關聯判斷方式

請根據 daily log 與 raw note 中明確出現的關係建立連結。

不應建立關聯的情況：

- 只是你認為可能有關，但來源沒有出現
- 只是一般常識上的關聯
- 需要外部知識才能成立的關聯
- 會暴露敏感內部流程或系統細節的關聯
- 來源沒有明確支持的關聯

若關聯不確定，請放在「待確認事項」，不要寫成確定關聯。

---

## 11. 敏感資訊處理規則

建立 wiki 筆記時，必須檢查是否涉及敏感資訊。

### 11.1 不可保存的內容

不要在 wiki note 中保存：

- 客戶資料
- 保單資料
- 個人資料
- 帳號
- 密碼
- API Key
- Token
- 完整內部系統網址
- 未遮蔽截圖
- 內部資料表完整名稱
- 敏感欄位名稱
- 可反推公司內部架構的系統細節
- 未抽象化的審查規則
- 未抽象化的上線流程
- 可識別具體個人、部門或內部角色的資訊

### 11.2 建議抽象化方式

| 原始內容類型 | 建議抽象化方式 |
|---|---|
| 具體人名 | 使用「主管」、「同事」、「架構師」、「業務窗口」 |
| 具體部門或組織 | 使用「審查單位」、「業務單位」、「系統單位」 |
| 內部系統名稱 | 使用「內部系統」、「來源系統」、「目標系統」 |
| 完整內部網址 | 使用「內部系統連結」 |
| 內部資料表名稱 | 使用「內部資料表」 |
| 敏感欄位名稱 | 使用「識別欄位」、「狀態欄位」、「日期欄位」等抽象名稱 |
| 審查細節 | 使用「審查流程」、「確認項目」、「審查條件」 |
| 上線細節 | 使用「上線前檢核」、「變更確認」、「部署前確認」 |

### 11.3 metadata 標記

```yaml
sensitive_review_status: abstracted
```

或：

```yaml
sensitive_review_status: needs_review
```

或：

```yaml
sensitive_review_status: unchecked
```

---

## 12. 各類筆記建立規則

| 類型 | 使用 template | 應包含重點 | 避免事項 |
|---|---|---|---|
| concept | `templates/concept_note.md` | 概念定義、出現脈絡、用途、關聯、待確認事項、Knowledge Graph | 寫成外部百科、補充來源沒有的教學內容 |
| tool | `templates/tool_note.md` | 工具用途、使用情境、相關任務或專案、相關流程、限制、Knowledge Graph | 寫成完整官方文件、保存登入資訊 |
| workflow | `templates/workflow_note.md` | 流程目的、Input、Processing、Output、工具、任務或專案、Knowledge Graph | 保存未抽象化內部流程細節 |
| task | `templates/task_note.md` | 任務目標、來源、狀態、相關專案、工具或流程、Knowledge Graph | 把大型專案寫成 task |
| project | `templates/project_note.md` | 專案目標、背景、階段、任務、工具、流程、成果、Knowledge Graph | 把單一小任務寫成 project |
| troubleshooting | `templates/troubleshooting_note.md` | 問題描述、情境、可能原因、已嘗試方法、狀態、Knowledge Graph | 保存未遮蔽錯誤訊息或推測原因 |
| data | `templates/data_note.md` | 資料來源、用途、格式、欄位概念、資料品質、敏感性、Knowledge Graph | 保存真實客戶資料或敏感欄位 |
| formula | `templates/formula_note.md` | 公式用途、符號、Input、Output、資料、驗證、敏感性、Knowledge Graph | 保存敏感計算邏輯或未確認公式 |
| business_context | 通用 wiki note 結構 | 背景摘要、出現情境、抽象化角色、相關任務或專案、工具或流程、敏感性、Knowledge Graph | 保存完整內部審查或上線規則 |
| glossary | 簡化 glossary 格式 | 術語對照、使用情境、相關筆記、待確認事項、Knowledge Graph | 把完整概念內容寫進 glossary |

### 12.10 glossary note 簡化格式

若 `templates/glossary_note.md` 尚未存在，請使用以下格式：

```markdown
---
type: wiki_note
category: glossary
status: draft
source_daily_log:
  - logs/daily/YYYY-MM-DD.md
source_raw_note:
  - raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md
sensitive_review_status: unchecked
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Term

## 1. 術語對照

| 項目 | 內容 |
|---|---|
| 術語 |  |
| 英文全名 |  |
| 繁體中文翻譯 |  |
| 類型 | abbreviation / technical_term / tool / business / data / formula / other |
| 定義狀態 | confirmed / needs_review / unknown |

## 2. 使用情境

根據來源筆記整理此術語出現在哪個情境中。

## 3. 相關筆記

- `[[concept_name]]`
- `[[tool_name]]`
- `[[business_context_name]]`

## 4. 待確認事項

| 待確認內容 | 原因 | 建議確認對象 |
|---|---|---|
|  |  | 使用者 / 主管 / 同事 / 待確認 |

## 5. Knowledge Graph 關聯

此區塊用於建立本筆記與其他 wiki 筆記之間的知識關係。  
請優先使用 Obsidian 雙向連結，例如 `[[note_name]]`。

### 上游知識（Prerequisites）

- 

### 下游知識（Used By）

- 

### 相關知識（Related）

- 

### 關聯類型整理

| 關聯項目 | 關聯類型 | 說明 |
|---|---|---|
| `[[note_name]]` | prerequisite / used_by / related / input / output / similar / depends_on / part_of |  |
```

---

## 13. 合併與更新既有筆記規則

建立新 wiki note 前，請先檢查目標資料夾是否已有相同或高度相似主題的筆記。

若已有既有筆記：

- 優先更新既有筆記
- 不要建立重複筆記
- 保留既有內容
- 新增新的 source trace
- 更新 `updated`
- 若新增內容會改變狀態，更新 metadata
- 若新增關聯，更新 Knowledge Graph 區塊

若不確定是否為同一主題，請不要合併，並在回覆中標記：

```text
needs_review: possible duplicate
```

---

## 14. daily log metadata 更新

若可以修改 daily log metadata，請在成功萃取 wiki note 後，更新 daily log metadata。

若全部候選項目都已萃取完成：

```yaml
wiki_extraction_status: completed
```

若只完成部分候選項目：

```yaml
wiki_extraction_status: partial
```

若仍需確認：

```yaml
wiki_extraction_status: needs_review
```

並更新：

```yaml
updated: YYYY-MM-DD
```

若 daily log 疑似包含敏感資訊，請同步標記：

```yaml
sensitive_review_status: needs_review
```

若無法修改 daily log，請在回覆摘要中說明：

```text
Daily log metadata was not updated.
```

---

## 15. 完成後回覆格式

完成 wiki note 萃取後，請用以下格式回覆：

```text
Wiki notes extracted.

Input:
- logs/daily/YYYY-MM-DD.md

Created / updated wiki notes:
- wiki/concepts/example_concept.md
- wiki/tools/example_tool.md
- wiki/workflows/example_workflow.md

Skipped:
- item_name: reason

Needs review:
- item_name: reason

Status:
- wiki_extraction_status: completed / partial / needs_review
- sensitive_review_status: unchecked / needs_review / abstracted

Potential index updates:
- indexes/concept_index.md
- indexes/tool_index.md
- indexes/workflow_index.md
- indexes/business_context_index.md
- indexes/glossary_index.md

Next step:
- Run prompts/04_update_indexes.md
```

若沒有可萃取項目，請回覆：

```text
No wiki notes extracted.

Input:
- logs/daily/YYYY-MM-DD.md

Reason:
- No clear wiki candidates were found.

Status:
- wiki_extraction_status: needs_review

Next step:
- Review the daily log manually or run prompts/04_update_indexes.md only if indexes still need updates.
```

---

## 16. 不要執行的工作

本 prompt 不處理以下工作：

- 不更新 `indexes/`
- 不產生 weekly summary
- 不產生 monthly review
- 不建立 meeting note
- 不新增 root-level project rules
- 不新增新的固定資料夾結構
- 不補充 daily log 沒有出現的外部知識
- 不保存敏感資訊原文
- 不保存未抽象化的公司內部流程細節
- 不建立沒有來源支撐的 Knowledge Graph 關聯
- 不刪除 raw note 或 daily log
- 不移動圖片或附件
- 不把 indexes 當成 wiki note 內容本體

---

## 17. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定 daily log
- [ ] 已確認可萃取成 wiki 的候選項目
- [ ] 已判斷每個候選項目的 wiki 類型
- [ ] 已使用對應 template 或通用 wiki note 結構
- [ ] 已建立或更新 `wiki/` 筆記
- [ ] 每份 wiki 筆記皆包含 metadata
- [ ] 每份 wiki 筆記皆包含來源追蹤
- [ ] 每份 wiki 筆記皆包含敏感資訊檢查
- [ ] 每份 wiki 筆記皆包含 Knowledge Graph 關聯區塊
- [ ] 不確定內容已標記為待確認
- [ ] 敏感內容已移除、遮蔽或抽象化
- [ ] 已避免建立重複筆記
- [ ] 已更新 daily log 的 `wiki_extraction_status`，或在回覆中說明未更新
- [ ] 已列出後續可能需要更新的 indexes
- [ ] 未實際更新 indexes
- [ ] 已提示下一步應執行 `prompts/04_update_indexes.md`
