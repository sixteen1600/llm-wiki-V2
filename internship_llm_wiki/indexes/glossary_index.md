---

# Glossary Index

本頁用於整理 `wiki/glossary/` 中的術語、縮寫、英文專有名詞、中文翻譯與定義。

`glossary_index.md` 的重點不是保存完整概念說明，而是提供術語查詢入口，幫助快速查詢：

- 某個英文縮寫代表什麼
- 某個英文術語的繁體中文翻譯是什麼
- 術語第一次出現在哪些原始筆記或 log 中
- 術語和哪些概念、工具、流程、任務、專案或業務背景有關
- 哪些術語仍需要確認定義、翻譯或使用情境

---

## 1. Index 說明

本 index 對應以下資料夾：

| 類型 | 位置 | 說明 |
|---|---|---|
| 術語筆記 | `wiki/glossary/` | 實習期間接觸到的縮寫、英文專有名詞、中文翻譯、術語定義與使用情境 |

適合放入 `wiki/glossary/` 的內容包括：

| 類型 | 範例 |
|---|---|
| 英文縮寫 | PoC、API、RAG、LLM、ETL |
| 工具名稱 | Google ADK、Codex、Obsidian |
| 技術術語 | Agent、Embedding、Workflow、Pipeline |
| 資料術語 | Schema、Field、Record、Log、Metadata |
| 專案術語 | Prototype、Demo、MVP、Requirement |
| 業務術語 | Review、Approval、Change Control、Deployment Check |
| 公司情境術語 | 經抽象化後的審查、上線、卡控、文件或角色相關術語 |

不適合直接放入本 index 的內容：

| 不適合內容 | 應放位置 |
|---|---|
| 完整概念說明 | `wiki/concepts/` |
| 工具操作教學 | `wiki/tools/` |
| 可重複執行流程 | `wiki/workflows/` |
| 任務執行內容 | `wiki/tasks/` |
| 專案背景與成果 | `wiki/projects/` |
| 資料欄位與資料結構 | `wiki/data_notes/` |
| 公式、模型或計算方式 | `wiki/formulas/` |
| 業務流程與組織脈絡 | `wiki/business_context/` |

---

## 2. 快速入口

| 區塊 | 用途 |
|---|---|
| [[#3. 術語總表]] | 查看所有已整理術語 |
| [[#4. 縮寫對照表]] | 查看英文縮寫、完整英文與中文翻譯 |
| [[#5. 術語分類]] | 依技術、工具、資料、專案、業務等類型分類 |
| [[#6. 術語來源追蹤]] | 查看術語最早來自哪些原始筆記或 log |
| [[#7. 翻譯與定義確認]] | 檢查術語翻譯、定義與使用情境是否已確認 |
| [[#8. 術語與 Wiki 對應]] | 查看術語對應哪些正式 wiki 筆記 |
| [[#9. 容易混淆的術語]] | 整理相似、名稱接近或容易誤用的術語 |
| [[#10. 待建立術語筆記]] | 查看尚未補成正式 glossary note 的術語 |
| [[#11. 術語到 Wiki 的延伸]] | 查看術語是否需要延伸成其他 wiki 筆記 |

---

## 3. 術語總表

本區塊列出 `wiki/glossary/` 中已建立的術語筆記。

| 術語 | 中文翻譯 | 英文全名 | 縮寫 | 術語類型 | 狀態 | 更新日期 |
|---|---|---|---|---|---|---|
| `[[term_name]]` |  |  |  | technical / tool / data / project / business / formula / other | draft / active / reviewed / needs_review | YYYY-MM-DD |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 術語 | 對應 `wiki/glossary/` 中的術語筆記，建議使用 Obsidian 雙向連結 |
| 中文翻譯 | 術語的繁體中文翻譯 |
| 英文全名 | 若術語是縮寫，填入完整英文名稱 |
| 縮寫 | 若有縮寫，填入縮寫；沒有則留空 |
| 術語類型 | 術語的主要分類 |
| 狀態 | 術語筆記目前整理狀態 |
| 更新日期 | 術語筆記最近更新日期 |

---

## 4. 縮寫對照表

本區塊專門整理英文縮寫、完整英文與中文翻譯。

| 縮寫 | 英文全名 | 中文翻譯 | 使用情境 | 對應筆記 |
|---|---|---|---|---|
| PoC | Proof of Concept | 概念驗證 | 專案或新技術正式投入大量資源前的小型可行性測試 | `[[poc]]` |
|  |  |  |  |  |

### 使用規則

- 若縮寫有多種可能解釋，應標記使用情境。
- 若縮寫是公司內部或專案內用法，應標記為 `needs_review`。
- 若縮寫涉及業務背景、審查流程或內部流程，應同步更新 [[business_context_index]]。
- 若縮寫對應完整概念，應同步更新 [[concept_index]]。
- 若縮寫對應工具名稱，應同步更新 [[tool_index]]。

---

## 5. 術語分類

本區塊依術語性質分類，方便快速查找。

### 技術術語

| 術語 | 中文翻譯 | 相關概念 |
|---|---|---|
| `[[term_name]]` |  | `[[concept_name]]` |

### 工具與平台術語

| 術語 | 中文翻譯 | 相關工具 |
|---|---|---|
| `[[term_name]]` |  | `[[tool_name]]` |

### AI / Agent 術語

| 術語 | 中文翻譯 | 相關筆記 |
|---|---|---|
| `[[term_name]]` |  |  |

### 資料術語

| 術語 | 中文翻譯 | 相關資料筆記 |
|---|---|---|
| `[[term_name]]` |  | `[[data_topic]]` |

### 流程與專案術語

| 術語 | 中文翻譯 | 相關流程 / 專案 |
|---|---|---|
| `[[term_name]]` |  |  |

### 公式、模型與指標術語

| 術語 | 中文翻譯 | 相關公式 |
|---|---|---|
| `[[term_name]]` |  | `[[formula_name]]` |

### 業務與審查術語

| 術語 | 中文翻譯 | 相關業務背景 |
|---|---|---|
| `[[term_name]]` |  | `[[business_context_name]]` |

---

## 6. 術語來源追蹤

本區塊用於追蹤術語最早出現在哪些原始筆記或學習紀錄中。

| 術語 | 首次出現日期 | 原始來源 | 對應 Log | 整理狀態 |
|---|---|---|---|---|
| `[[term_name]]` | YYYY-MM-DD | `raw/imported_notes/YYYY/YYYY_MM_DD_Ddd.md` | `logs/daily/YYYY-MM-DD.md` | not_started / partial / completed |

### 使用規則

- 若術語來自每日原始筆記，應填入 `raw/imported_notes/` 來源。
- 若術語已整理成 daily log，應填入對應 `logs/daily/`。
- 若術語來自會議整理，應填入 `logs/meetings/`。
- 不要在本 index 中複製完整原始筆記內容。
- 若術語來自內部流程、內部系統或會議內容，應使用抽象化描述。

---

## 7. 翻譯與定義確認

本區塊用於追蹤術語的中文翻譯、英文全名與定義是否已確認。

| 術語 | 中文翻譯狀態 | 英文全名狀態 | 定義狀態 | 待確認事項 |
|---|---|---|---|---|
| `[[term_name]]` | confirmed / needs_review / unknown | confirmed / needs_review / unknown | confirmed / needs_review / unknown |  |

### 狀態定義

| 狀態 | 說明 |
|---|---|
| confirmed | 已確認，可作為正式術語使用 |
| needs_review | 可能正確，但仍需使用者、主管、同事或來源文件確認 |
| unknown | 尚未找到明確定義或翻譯 |

### 使用規則

- 若術語是常見公開名詞，可以標記為 `confirmed`。
- 若術語是公司內部、專案內部或會議脈絡中的用法，應標記為 `needs_review`。
- 若術語可能有多種中文翻譯，應保留使用情境。
- 不要把推測翻譯寫成已確認翻譯。

---

## 8. 術語與 Wiki 對應

本區塊用於查看術語對應哪些正式 wiki 筆記。

| 術語 | 對應概念 | 對應工具 | 對應流程 | 對應業務背景 | 對應其他筆記 |
|---|---|---|---|---|---|
| `[[term_name]]` | `[[concept_name]]` | `[[tool_name]]` | `[[workflow_name]]` | `[[business_context_name]]` |  |

### 使用規則

- 若術語本身只是縮寫或翻譯，完整說明應放在對應的正式 wiki 筆記。
- 若術語對應概念，應同步更新 [[concept_index]]。
- 若術語對應工具，應同步更新 [[tool_index]]。
- 若術語對應流程，應同步更新 [[workflow_index]]。
- 若術語對應業務背景，應同步更新 [[business_context_index]]。
- 本區塊只做導覽，不取代正式 wiki 筆記內的 Knowledge Graph 關聯。

---

## 9. 容易混淆的術語

本區塊整理相似、名稱接近或容易誤用的術語。

| 術語 A | 術語 B | 差異重點 | 是否已建立說明 |
|---|---|---|---|
| `[[term_a]]` | `[[term_b]]` |  | 是 / 否 / 待確認 |

### 常見情境

| 情境 | 說明 |
|---|---|
| 相同縮寫不同意義 | 同一縮寫在不同領域或不同公司情境中可能代表不同內容 |
| 中文翻譯接近 | 多個英文術語可能被翻成相似中文，需要補充使用差異 |
| 工具名稱與概念名稱相似 | 某些工具名稱可能和概念名稱接近，但層級不同 |
| 流程名稱與業務背景相似 | 流程是可執行步驟，業務背景是理解情境 |
| 術語與公式符號混淆 | 某些縮寫可能同時作為術語與公式符號 |

---

## 10. 待建立術語筆記

本區塊整理已經出現在 log 中，但尚未建立正式 `wiki/glossary/` 筆記的術語。

| 術語項目 | 來源 | 建議檔案 | 優先度 | 需要補充的內容 |
|---|---|---|---|---|
|  | `logs/daily/YYYY-MM-DD.md` | `wiki/glossary/term_name.md` | 高 / 中 / 低 |  |

### 優先度判斷

| 優先度 | 判斷標準 |
|---|---|
| 高 | 反覆出現、任務核心、專案核心、主管要求、容易混淆、會影響後續理解 |
| 中 | 有學習價值，但目前不是主要任務核心 |
| 低 | 輔助性術語，短期內不影響主要工作 |

---

## 11. 術語到 Wiki 的延伸

有些術語整理後，會需要延伸成其他正式 wiki 筆記。

| 術語 | 可延伸類型 | 建議位置 | 是否已建立 |
|---|---|---|---|
| `[[term_name]]` | concept / tool / workflow / task / project / data / formula / troubleshooting / business_context | `wiki/...` | 是 / 否 / 待確認 |

### 延伸判斷

| 可延伸類型 | 判斷方式 |
|---|---|
| concept | 術語背後有完整概念、理論、方法或原理需要說明 |
| tool | 術語對應具體工具、平台、套件或系統 |
| workflow | 術語涉及可重複執行的流程 |
| task | 術語對應具體任務或待辦 |
| project | 術語屬於某個專案、PoC、Demo 或 Prototype |
| data | 術語涉及資料來源、欄位、資料型態或資料品質 |
| formula | 術語涉及公式、模型、指標、符號或計算方式 |
| troubleshooting | 術語常出現在錯誤訊息、異常狀況或排查過程中 |
| business_context | 術語涉及業務背景、組織流程、審查、上線或卡控情境 |

---

## 12. 術語命名規則

### 檔名命名

建議使用小寫英文與底線。

若術語是縮寫，可以直接使用縮寫小寫：

```text
wiki/glossary/poc.md
wiki/glossary/eab.md
wiki/glossary/cab.md
wiki/glossary/api.md
```

若術語不是縮寫，可使用完整英文術語的短檔名：

```text
wiki/glossary/google_adk.md
wiki/glossary/prototype.md
wiki/glossary/change_control.md
```

注意：

```text
PoC 的術語頁建議使用 wiki/glossary/poc.md
PoC 的完整概念頁則放在 wiki/concepts/proof_of_concept.md
```

### 標題命名

標題建議使用：

```text
# PoC - Proof of Concept
# API - Application Programming Interface
# Google ADK
```

### 中文翻譯格式

建議固定使用：

```text
繁體中文（English）
```

範例：

```text
概念驗證（Proof of Concept）
應用程式介面（Application Programming Interface）
```

---

## 13. 近期更新紀錄

| 日期 | 更新內容 | 相關位置 |
|---|---|---|
| YYYY-MM-DD |  |  |

---

## 14. 維護規則

### 必須維護

- 新增 `wiki/glossary/` 筆記後，必須更新 [[#3. 術語總表]]。
- 若新增英文縮寫，必須更新 [[#4. 縮寫對照表]]。
- 新增術語後，應更新 [[#6. 術語來源追蹤]]。
- 若術語翻譯、英文全名或定義尚未確認，應更新 [[#7. 翻譯與定義確認]]。
- 若術語對應正式 wiki 筆記，應更新 [[#8. 術語與 Wiki 對應]]。
- 若術語容易混淆，應更新 [[#9. 容易混淆的術語]]。
- 若術語需要延伸成概念、工具、流程、任務、專案、資料、公式或業務背景筆記，應更新 [[#11. 術語到 Wiki 的延伸]]。
- 若術語是近期重要學習內容，應更新 [[home]] 的近期學習重點。

### 不建議

- 不要把完整概念說明寫在本 index。
- 不要把本頁當成術語筆記本體。
- 不要在本頁保存客戶資料、保單資料、帳號、密碼、API Key、Token、完整內部系統網址或未遮蔽截圖。
- 不要保存未抽象化的公司內部流程、系統名稱、資料表名稱、欄位代碼或審查規則。
- 不要在本頁建立完整 Knowledge Graph；完整關聯應放在正式 `wiki/glossary/` 筆記中。
- 不要把尚未確認的縮寫、翻譯或定義寫成已確認事實。

---

## 15. 與其他 Index 的關係

| Index | 關係 |
|---|---|
| [[home]] | 從首頁進入本術語索引 |
| [[learning_index]] | 術語通常從 daily log、weekly summary 或 meeting note 中萃取 |
| [[concept_index]] | 術語可能對應完整概念筆記 |
| [[tool_index]] | 術語可能對應工具、平台、套件或系統 |
| [[workflow_index]] | 術語可能出現在流程名稱、步驟或輸出中 |
| [[task_index]] | 術語可能出現在任務內容或交付內容中 |
| [[project_index]] | 術語可能屬於某個專案、PoC 或 Demo |
| [[data_index]] | 術語可能是資料名稱、欄位概念或資料型態 |
| [[formula_index]] | 術語可能是公式名稱、符號、模型或指標 |
| [[troubleshooting_index]] | 術語可能出現在錯誤訊息或問題排查中 |
| [[business_context_index]] | 術語可能涉及業務背景、審查流程、上線流程或組織脈絡 |

---

## 16. 下一步

- [ ] 新增術語到 [[#3. 術語總表]]
- [ ] 檢查是否有英文縮寫需要加入 [[#4. 縮寫對照表]]
- [ ] 檢查術語來源是否已記錄
- [ ] 檢查中文翻譯與英文全名是否已確認
- [ ] 檢查術語是否對應正式 wiki 筆記
- [ ] 檢查是否有容易混淆的術語
- [ ] 檢查是否需要延伸成其他 wiki 筆記
- [ ] 檢查是否需要更新 [[concept_index]]
- [ ] 檢查是否需要更新 [[business_context_index]]
- [ ] 檢查是否需要更新 [[home]] 的近期學習重點
