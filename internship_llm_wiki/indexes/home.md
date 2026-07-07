---

# Internship LLM Wiki Home

本頁是 `internship_llm_wiki` 的首頁，用於快速進入所有學習紀錄、知識筆記、任務、專案、工具、流程、錯誤排除、資料筆記、公式與術語索引。

本專案的主要目標是將實習期間的原始筆記整理成可長期維護、可查詢、可複習、可由 Codex 協助更新的個人 LLM Wiki。

---

## 1. 核心資料流

```text
raw/imported_notes/
        ↓
logs/
        ↓
wiki/
        ↓
indexes/
```

| 階段   | 位置                    | 用途                         |
| ---- | --------------------- | -------------------------- |
| 原始輸入 | `raw/imported_notes/` | 保存每日原始 Markdown 筆記、截圖與附件來源 |
| 時間整理 | `logs/`               | 依日期、週、月與會議整理學習紀錄           |
| 知識整理 | `wiki/`               | 將重要內容整理成正式知識頁              |
| 導覽索引 | `indexes/`            | 建立首頁、分類索引與查詢入口             |

---

## 2. 快速入口

### 學習紀錄

| Index | 說明 |
| ------------------- | ----------------- |
| [[learning_index]] | 查詢每日、每週、每月與會議整理紀錄 |

### 知識筆記

| Index | 說明 |
| ---------------------------- | ----------------------- |
| [[concept_index]] | 查詢概念、理論、技術名詞與抽象知識 |
| [[tool_index]] | 查詢工具、平台、套件與系統操作筆記 |
| [[workflow_index]] | 查詢流程、步驟、輸入輸出與作業方式 |
| [[data_index]] | 查詢資料來源、欄位理解、資料品質與資料處理筆記 |
| [[formula_index]] | 查詢公式、模型、指標、計算方式與符號說明 |
| [[business_context_index]] | 查詢業務背景、組織流程、審查流程與實習情境脈絡 |
| [[glossary_index]] | 查詢縮寫、專有名詞、中文翻譯與術語定義 |

### 任務與專案

| Index | 說明 |
| ------------------ | --------------------- |
| [[task_index]] | 查詢實習任務、待辦事項、任務狀態與產出 |
| [[project_index]] | 查詢較大型的專案、PoC、原型或階段性工作 |

### 問題與解法

| Index | 說明 |
| -------------------------- | ---------------------- |
| [[troubleshooting_index]] | 查詢錯誤、異常、排查過程、解決方式與預防方法 |

---

## 3. 目前重點區域

此區塊用於手動或由 Codex 更新目前最常使用的入口。

### 近期學習重點

| 主題 | 類型 | 相關筆記 | 狀態 |
| -- | ------------------------------------------------------------------------------- | ---- | ------------------------- |
|    | concept / tool / workflow / task / project / data / formula / business_context |      | draft / active / reviewed |

### 進行中任務

| 任務 | 相關專案 | 狀態 | 下一步 |
| -- | ---- | ----------------------------- | --- |
|    |      | todo / doing / blocked / done |     |

### 進行中專案

| 專案 | 目前階段 | 相關任務 | 狀態 |
| -- | ---------------------------------------------------- | ---- | ------------------------- |
|    | planning / poc / implementation / review / completed |      | draft / active / reviewed |

### 最近遇到的問題

| 問題 | 相關工具或流程 | 狀態 | 相關筆記 |
| -- | ------- | -------------------------------- | ---- |
|    |         | unresolved / workaround / solved |      |

---

## 4. Wiki 分類總覽

| 分類   | 位置                       | 對應 Index                     | 說明                |
| ---- | ------------------------ | ---------------------------- | ----------------- |
| 概念筆記 | `wiki/concepts/`         | [[concept_index]]           | 概念、理論、技術名詞、抽象知識   |
| 工具筆記 | `wiki/tools/`            | [[tool_index]]              | 工具、平台、套件、操作方式     |
| 流程筆記 | `wiki/workflows/`        | [[workflow_index]]          | 工作流程、輸入輸出、步驟、判斷條件 |
| 任務筆記 | `wiki/tasks/`            | [[task_index]]              | 任務內容、狀態、成果、待確認事項  |
| 專案筆記 | `wiki/projects/`         | [[project_index]]           | 專案背景、目標、進度、成果     |
| 錯誤排除 | `wiki/troubleshooting/`  | [[troubleshooting_index]]   | 錯誤訊息、原因、解法、預防方式   |
| 資料筆記 | `wiki/data_notes/`       | [[data_index]]              | 資料來源、欄位、品質、清理與轉換  |
| 公式筆記 | `wiki/formulas/`         | [[formula_index]]           | 公式、模型、指標、計算邏輯與符號  |
| 業務背景 | `wiki/business_context/` | [[business_context_index]] | 業務流程、組織脈絡、審查與上線流程 |
| 術語表  | `wiki/glossary/`         | [[glossary_index]]          | 縮寫、英文術語、中文翻譯與定義   |

---

## 5. Logs 分類總覽

| 分類   | 位置               | 說明                  |
| ---- | ---------------- | ------------------- |
| 每日紀錄 | `logs/daily/`    | 每日學習內容、任務、問題與後續整理項目 |
| 每週摘要 | `logs/weekly/`   | 每週學習成果、任務進度與回顧      |
| 每月回顧 | `logs/monthly/`  | 每月能力成長、成果整理與下月計畫    |
| 會議整理 | `logs/meetings/` | 會議重點、決議、提醒與待辦事項     |

所有 `logs/` 內容統一由 [[learning_index]] 管理。

---

## 6. Knowledge Graph 使用方式

本專案的 Knowledge Graph 不另外建立獨立總表，而是分散在每一篇正式 `wiki/` 筆記中。

正式 wiki 筆記會使用以下區塊建立知識關係：

```markdown
## Knowledge Graph 關聯
```

主要關係類型包括：

| 關聯類型           | 用途                   |
| -------------- | -------------------- |
| `prerequisite` | 理解本頁前應先理解的上游知識       |
| `used_by`      | 本頁內容被哪些任務、專案、流程或公式使用 |
| `related`      | 一般相關知識               |
| `input`        | 流程、工具或公式的輸入          |
| `output`       | 流程、工具或公式的輸出          |
| `similar`      | 相似或容易混淆的概念           |
| `depends_on`   | 執行或理解上依賴的工具、資料或流程    |
| `part_of`      | 本頁屬於某個較大的任務、專案或流程    |

使用原則：

- 優先使用 Obsidian 雙向連結，例如 `[[tool_name]]`。
- 不確定頁面是否已存在時，也可以先建立 `[[note_name]]`。
- 不要過度連結，只保留有助於理解、查詢與複習的關聯。
- `indexes/` 負責分類導覽；Knowledge Graph 關係由 `wiki/` 內文維護。

---

## 7. 常用工作流程

### 匯入每日原始筆記

```text
raw/imported_notes/
        ↓
logs/daily/
        ↓
wiki/
        ↓
indexes/
```

操作原則：

1. 將每日原始 Markdown 筆記放入 `raw/imported_notes/`。
2. 使用 Codex 依照 `templates/daily_log.md` 產生每日整理。
3. 從每日整理中萃取正式 wiki 筆記。
4. 更新相關 index。
5. 確認是否有敏感資訊需要移除或抽象化。

---

### 建立正式 wiki 筆記

```text
logs/daily/
        ↓
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

操作原則：

1. 先判斷筆記類型。
2. 使用對應 template。
3. 補上來源、相關 logs、相關任務或專案。
4. 補上 Knowledge Graph 關聯。
5. 更新對應 index。
6. 檢查敏感資訊。

---

### 更新索引

```text
wiki/
        ↓
indexes/
```

更新原則：

1. 新增正式 wiki 筆記後，必須更新對應分類 index。
2. 若是重要筆記，也應更新 `home.md` 的近期重點區域。
3. 若與學習時間線有關，應更新 `learning_index.md`。
4. 若新增公式，應更新 `formula_index.md`。
5. 若新增術語，應更新 `glossary_index.md`。

---

## 8. 近期更新紀錄

| 日期         | 更新內容 | 相關位置 |
| ---------- | ---- | ---- |
| YYYY-MM-DD |      |      |

---

## 9. 需要補齊的頁面

| 頁面或主題 | 建議分類                     | 優先度       | 備註 |
| ----- | ------------------------ | --------- | -- |
|       | `wiki/concepts/`         | 高 / 中 / 低 |    |
|       | `wiki/tools/`            | 高 / 中 / 低 |    |
|       | `wiki/workflows/`        | 高 / 中 / 低 |    |
|       | `wiki/tasks/`            | 高 / 中 / 低 |    |
|       | `wiki/projects/`         | 高 / 中 / 低 |    |
|       | `wiki/troubleshooting/`  | 高 / 中 / 低 |    |
|       | `wiki/data_notes/`       | 高 / 中 / 低 |    |
|       | `wiki/formulas/`         | 高 / 中 / 低 |    |
|       | `wiki/business_context/` | 高 / 中 / 低 |    |
|       | `wiki/glossary/`         | 高 / 中 / 低 |    |

---

## 10. 維護規則

### 必須維護

- 新增正式 wiki 筆記後，必須更新對應 index。
- 新增重要工具、流程、任務或專案後，應更新本頁的「目前重點區域」。
- 新增或修改公式筆記後，必須更新 [[formula_index]]。
- 新增縮寫或專有名詞後，必須更新 [[glossary_index]]。
- 若筆記包含敏感資訊，必須先移除或抽象化。

### 不建議

- 不要把原始筆記內容直接複製到 `indexes/`。
- 不要把 `indexes/` 當成完整筆記使用。
- 不要在 `home.md` 放過多細節。
- 不要建立重複的 index。
- 不要在 `indexes/` 中保存客戶資料、帳號、密碼、API Key、Token、完整內部系統網址或未遮蔽截圖。

---

## 11. 相關規範文件

| 文件                  | 用途                          |
| ------------------- | --------------------------- |
| [[README]]          | 專案總覽與使用方式                   |
| [[PROJECT_RULES]]  | 專案規則與維護原則                   |
| [[CODEX_WORKFLOW]] | Codex 協助整理筆記的流程             |
| [[OBSIDIAN_GUIDE]] | Obsidian 使用方式               |
| [[AGENTS]]          | Codex / Agent 操作本專案時必須遵守的規則 |

---

## 12. 下一步

- [ ] 更新 [[learning_index]]
- [ ] 更新 [[concept_index]]
- [ ] 更新 [[task_index]]
- [ ] 更新 [[project_index]]
- [ ] 更新 [[tool_index]]
- [ ] 更新 [[workflow_index]]
- [ ] 更新 [[troubleshooting_index]]
- [ ] 更新 [[data_index]]
- [ ] 更新 [[formula_index]]
- [ ] 更新 [[business_context_index]]
- [ ] 更新 [[glossary_index]]
