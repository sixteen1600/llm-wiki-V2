# 08 Sensitive Info Review Prompt

本 prompt 用於指示 Codex 檢查 `raw/`、`logs/`、`wiki/`、`indexes/` 中的內容是否包含敏感資訊，並依照專案規則進行標記、抽象化或移除建議。

本步驟負責「敏感資訊審查」與「抽象化建議」。  
不負責產生 daily log、不負責萃取 wiki 筆記、不負責更新 indexes，除非使用者明確要求根據審查結果同步修改 metadata 或 index 狀態。

---

## 1. 目標

請讀取使用者指定的檔案或資料夾，檢查其中是否存在不應保存在實習 LLM Wiki 中的敏感資訊。

目標是確保專案內容符合以下原則：

- 不保存客戶資料
- 不保存保單資料
- 不保存個人資料
- 不保存帳號、密碼、API Key 或 Token
- 不保存完整內部系統網址
- 不保存未遮蔽截圖中的敏感資訊
- 不保存完整內部資料表名稱或敏感欄位名稱
- 不保存未抽象化的公司內部審查流程
- 不保存未抽象化的上線流程
- 不保存可識別具體個人、部門、組織或內部角色的資訊
- 將可學習內容轉成抽象化、非敏感的 wiki 知識

---

## 2. 適用情境

當使用者需要檢查以下內容時，使用本 prompt：

- raw note 匯入後需要檢查是否可進入 daily log
- daily log 產生後需要檢查是否包含敏感資訊
- wiki note 建立後需要檢查是否已充分抽象化
- index 更新後需要檢查是否誤放完整內容
- meeting note 產生前需要先檢查是否可保存
- weekly summary 或 monthly review 產生前需要避免敏感資訊被長期擴散
- 圖片、附件或截圖被引用時，需要判斷是否應移除或標記待確認

---

## 3. 輸入

使用者會提供以下其中一種輸入：

```text
單一檔案路徑
```

例如：

```text
raw/imported_notes/2026/2026_07_03_Fri.md
logs/daily/2026-07-03.md
wiki/business_context/eab_review_process.md
indexes/business_context_index.md
```

或：

```text
資料夾路徑
```

例如：

```text
raw/imported_notes/
logs/daily/
wiki/
indexes/
```

或：

```text
一段需要審查的 Markdown 內容
```

請根據輸入內容進行敏感資訊審查。

若使用者只提供資料夾，請優先檢查最近更新、未完成審查、metadata 標記為 `needs_review` 或 `unchecked` 的檔案。

---

## 4. 輸出模式

本 prompt 可支援兩種輸出模式。

### 4.1 Review Only

只檢查並回報，不直接修改檔案。

適用情境：

- 使用者只想知道是否有風險
- 使用者想先確認修改方向
- 內容可能涉及高度敏感資訊
- 不確定是否可以抽象化

### 4.2 Review and Patch

檢查後直接修改檔案。

適用情境：

- 使用者明確要求直接修正
- 風險內容可以安全移除或抽象化
- 修改不會改變原始學習語意
- 修改規則已明確

若使用者沒有明確要求直接修改，預設使用：

```text
Review Only
```

---

## 5. 敏感資訊分類

請依照以下分類檢查內容。

### 5.1 高風險敏感資訊

若出現以下內容，應視為高風險，原文不應保存在 wiki 中。

| 類型 | 說明 | 建議處理 |
|---|---|---|
| 客戶資料 | 姓名、身分證字號、電話、地址、Email、客戶編號等 | remove / mask |
| 保單資料 | 保單號碼、契約內容、理賠資料、交易資料等 | remove / abstract |
| 帳號密碼 | 帳號、密碼、登入憑證 | remove |
| API Key / Token | API Key、Access Token、Secret、憑證字串 | remove |
| 完整內部網址 | 內部系統 URL、內網網址、管理後台連結 | remove / abstract |
| 未遮蔽截圖 | 含個資、系統資訊、資料表、內部流程的圖片 | remove / needs_review |
| 內部資料表 | 完整資料表名稱、敏感欄位名稱、查詢語句 | abstract / needs_review |
| 內部系統架構 | 可反推系統串接、權限、架構圖或部署資訊 | abstract / needs_review |

### 5.2 中風險敏感資訊

若出現以下內容，通常不應原樣保存，應抽象化。

| 類型 | 說明 | 建議處理 |
|---|---|---|
| 內部審查流程 | 未抽象化的審查規則、核准條件、會議流程 | abstract |
| 上線流程 | 未抽象化的上線卡控、變更管理、部署檢核細節 | abstract |
| 組織角色 | 具體部門、具體職稱、具體權責分工 | generalize |
| 業務規則 | 未公開的業務邏輯、決策條件、計算規則 | abstract / needs_review |
| 內部報告格式 | 未公開的固定格式、審查模板、內部文件標準 | abstract / needs_review |
| 內部資料欄位 | 可能反映公司內部資料模型的欄位名稱 | abstract |

### 5.3 低風險但需注意資訊

以下內容通常可以保留，但仍需判斷是否要抽象化。

| 類型 | 說明 | 建議處理 |
|---|---|---|
| 一般工具名稱 | Google ADK、Codex、Obsidian、PowerShell 等公開工具 | keep |
| 一般技術概念 | PoC、API、RAG、Agent、Workflow 等公開概念 | keep |
| 抽象化流程 | 不含內部細節的流程概念 | keep |
| 抽象角色 | 主管、同事、架構師、審查角色、業務窗口 | keep |
| 非敏感任務 | 學習、測試、整理文件、建立 wiki | keep |
| 公開知識 | 不含公司內部資訊的公開技術知識 | keep |

---

## 6. 建議處理方式

| 處理方式 | 說明 |
|---|---|
| keep | 可保留，無需修改 |
| remove | 應移除，不應保存 |
| mask | 遮蔽部分內容，例如 `***` |
| abstract | 抽象化，保留學習意義但移除具體敏感細節 |
| generalize | 泛化，將具體人名、部門、系統、角色改成一般描述 |
| needs_review | 無法判斷是否可保留，需要使用者或主管確認 |
| pending | 暫不處理，等待使用者指示 |

---

## 7. 抽象化規則

若內容具有學習價值，但包含內部資訊，請優先抽象化，而不是完全刪除。

### 7.1 人員與角色

| 原始內容類型 | 建議抽象化 |
|---|---|
| 具體人名 | 主管、同事、架構師、業務窗口 |
| 具體職稱 | 審查角色、技術角色、業務角色、系統角色 |
| 具體部門 | 業務單位、系統單位、審查單位、資料單位 |
| 具體委員會或會議 | 審查會議、架構檢視、上線檢核、變更確認 |

### 7.2 系統與工具

| 原始內容類型 | 建議抽象化 |
|---|---|
| 內部系統名稱 | 內部系統、來源系統、目標系統 |
| 內部系統網址 | 內部系統連結 |
| 內部 API 路徑 | 內部 API |
| 內部資料庫名稱 | 內部資料庫 |
| 內部資料表名稱 | 內部資料表 |
| 內部欄位名稱 | 日期欄位、狀態欄位、識別欄位、金額欄位 |

### 7.3 業務流程與審查流程

| 原始內容類型 | 建議抽象化 |
|---|---|
| 具體審查規則 | 審查條件、確認項目 |
| 具體核准條件 | 核准條件、風險確認 |
| 具體上線步驟 | 上線前檢核、部署前確認 |
| 具體卡控規則 | 變更確認、流程卡控 |
| 具體報告格式 | 固定格式報告、審查用報告 |
| 具體架構審查細節 | 架構檢視、系統串接確認 |

### 7.4 資料與公式

| 原始內容類型 | 建議抽象化 |
|---|---|
| 客戶值 | 移除或改成假資料 |
| 保單號碼 | 移除 |
| 真實資料列 | 移除或改成範例資料 |
| 內部欄位代碼 | 抽象欄位名稱 |
| 內部評分邏輯 | 評分邏輯摘要 |
| 內部公式細節 | 抽象公式說明 |
| 權重與門檻 | 權重概念、門檻條件，不保留真實值 |

---

## 8. 審查範圍規則

不同資料夾的審查重點不同。

### 8.1 raw/

`raw/` 保留原始筆記，原則上可以較接近原文，但仍需標記風險。

檢查重點：

- metadata 是否標記 `sensitive_review_status`
- 是否包含圖片或附件
- 是否包含明顯高風險資訊
- 是否需要在進入 daily log 前先抽象化

建議：

- 不輕易改寫 raw note 原文
- 若有高風險資訊，標記為 `needs_review`
- 若使用者明確要求修正，才移除或遮蔽

### 8.2 logs/

`logs/` 是整理層，不應保存高風險資訊原文。

檢查重點：

- daily log 是否複製了 raw note 的敏感內容
- meeting note 是否包含可識別人名、部門、內部流程
- weekly / monthly summary 是否擴散了敏感資訊
- Source Trace 是否只保留路徑與摘要，不複製敏感原文

建議：

- 移除或抽象化高風險資訊
- 將 metadata 標記為 `abstracted` 或 `needs_review`
- 保留學習價值，不保留敏感細節

### 8.3 wiki/

`wiki/` 是長期知識層，必須高度抽象化。

檢查重點：

- 是否保存完整內部流程
- 是否保存具體審查條件
- 是否保存具體系統資訊
- 是否保存具體資料欄位或公式邏輯
- Knowledge Graph 關聯是否暴露內部系統架構
- 是否將待確認內容寫成已確認事實

建議：

- 將內部內容抽象化
- 將不確定內容放入待確認事項
- 將 metadata 標記為 `abstracted` 或 `needs_review`
- 保留概念、用途、流程角色與學習重點

### 8.4 indexes/

`indexes/` 只做導覽，不應保存完整內容。

檢查重點：

- 是否把完整概念、完整流程、完整公式放進 index
- 是否保存敏感資訊摘要
- 是否保存未抽象化的內部系統、角色或流程
- 是否建立了不應存在的 index
- 是否加入完整 Knowledge Graph 區塊

建議：

- index 只保留連結、分類、狀態、日期、簡短摘要
- 敏感資訊只標記 `needs_review` 或 `abstracted`
- 不在 index 保存完整敏感內容

---

## 9. Metadata 更新規則

若可以修改檔案，請根據審查結果更新 metadata。

### 9.1 無明顯敏感資訊

```yaml
sensitive_review_status: reviewed
```

### 9.2 已完成抽象化

```yaml
sensitive_review_status: abstracted
```

### 9.3 需要使用者確認

```yaml
sensitive_review_status: needs_review
```

### 9.4 明確含敏感資訊且尚未處理

```yaml
sensitive_review_status: sensitive
```

同時更新：

```yaml
updated: YYYY-MM-DD
```

若檔案沒有 metadata，請不要強行新增，除非該檔案屬於本專案固定格式檔案。

---

## 10. 審查結果表格

完成審查後，請輸出以下表格。

| 檔案 | 風險等級 | 發現項目 | 建議處理 | metadata 建議 |
|---|---|---|---|---|
| `path/to/file.md` | none / low / medium / high |  | keep / remove / mask / abstract / needs_review | reviewed / abstracted / needs_review / sensitive |

### 風險等級定義

| 風險等級 | 說明 |
|---|---|
| none | 未發現敏感資訊 |
| low | 可保留，但建議確認用語是否抽象 |
| medium | 需要抽象化或標記待確認 |
| high | 不應原樣保存，應移除、遮蔽或停止後續擴散 |

---

## 11. 修改建議格式

若是 Review Only 模式，請列出建議修改，不要直接改檔。

格式：

```text
Suggested changes:
- file: logs/daily/YYYY-MM-DD.md
  action: abstract
  reason: contains internal review process detail
  suggestion: replace specific review name with "審查流程"
```

若是 Review and Patch 模式，請直接修改檔案，並回報修改摘要。

格式：

```text
Patched files:
- logs/daily/YYYY-MM-DD.md
  change: abstracted internal review process
  sensitive_review_status: abstracted
```

---

## 12. 圖片與附件檢查

若內容中出現圖片或附件連結，請檢查是否可能包含敏感資訊。

常見格式：

```markdown
![image.png](attachment:image.png)
![screenshot.png](../attachments/screenshot.png)
[report.xlsx](../attachments/report.xlsx)
```

檢查規則：

- 若圖片是內部系統截圖，標記 `needs_review`
- 若圖片可能包含客戶資料，標記 `high`
- 若附件可能包含資料表、報表或匯出資料，標記 `needs_review`
- 若圖片只是公開工具介面或非敏感示意圖，可標記 `low`
- 不要自行打開或移動附件，除非使用者明確要求

建議處理方式：

| 附件類型 | 建議處理 |
|---|---|
| 未遮蔽截圖 | needs_review |
| 內部系統截圖 | remove / abstract / needs_review |
| 報表附件 | needs_review |
| 客戶資料附件 | remove |
| 公開工具示意圖 | keep |
| 不確定內容 | needs_review |

---

## 13. Knowledge Graph 關聯檢查

若檔案是 `wiki/` 筆記，請檢查 Knowledge Graph 關聯是否可能暴露敏感資訊。

需要檢查：

- 是否直接連到內部系統名稱
- 是否直接連到具體部門名稱
- 是否直接連到具體人名
- 是否暴露內部架構關係
- 是否暴露完整上線流程或審查順序
- 是否將待確認關係寫成確定關係

建議處理：

| 問題 | 建議 |
|---|---|
| 具體系統名稱 | 改成抽象系統名稱 |
| 具體部門名稱 | 改成抽象角色或單位 |
| 具體人名 | 改成主管、同事、架構師等抽象角色 |
| 未確認關係 | 移到待確認事項 |
| 敏感流程關係 | 抽象化或移除 |

---

## 14. 不同風險等級的處理策略

### 14.1 none

處理方式：

- 可以保留
- metadata 可設為 `reviewed`
- 不需要額外修改

### 14.2 low

處理方式：

- 通常可以保留
- 可視情況做輕微抽象化
- metadata 可設為 `reviewed` 或 `abstracted`

### 14.3 medium

處理方式：

- 不建議原樣保存
- 應抽象化、泛化或標記待確認
- metadata 應設為 `needs_review` 或 `abstracted`

### 14.4 high

處理方式：

- 不應原樣保存
- 應移除、遮蔽或停止後續使用
- metadata 應設為 `sensitive` 或 `needs_review`
- 若已擴散到 logs、wiki 或 indexes，應標記所有受影響檔案

---

## 15. 完成後回覆格式

完成審查後，請使用以下格式回覆。

### Review Only 模式

```text
Sensitive info review completed.

Mode:
- Review Only

Input:
- path/to/file_or_folder

Summary:
- reviewed_files: N
- high_risk: N
- medium_risk: N
- low_risk: N
- no_risk: N

Findings:
| 檔案 | 風險等級 | 發現項目 | 建議處理 | metadata 建議 |
|---|---|---|---|---|

Suggested changes:
- file:
  action:
  reason:
  suggestion:

Next step:
- Confirm whether to apply suggested changes.
```

### Review and Patch 模式

```text
Sensitive info review completed.

Mode:
- Review and Patch

Input:
- path/to/file_or_folder

Patched files:
- path/to/file.md
  change:
  sensitive_review_status:

Needs review:
- path/to/file.md
  reason:

Summary:
- reviewed_files: N
- patched_files: N
- needs_review: N
- high_risk_remaining: N

Next step:
- Continue with the next prompt only after high-risk items are resolved.
```

---

## 16. 不要執行的工作

本 prompt 不處理以下工作：

- 不產生 daily log
- 不萃取 wiki 筆記
- 不更新 indexes，除非使用者明確要求
- 不產生 weekly summary
- 不產生 monthly review
- 不建立 meeting note
- 不新增新的固定資料夾
- 不建立 Knowledge Graph index
- 不補充來源沒有出現的外部知識
- 不自行判斷公司內部流程是否已正式核准
- 不保存敏感資訊原文
- 不移動圖片或附件，除非使用者明確要求
- 不刪除 raw note，除非使用者明確要求

---

## 17. 成功判斷標準

完成本 prompt 後，應達成以下條件：

- [ ] 已讀取指定檔案或資料夾
- [ ] 已檢查客戶資料、保單資料、個人資料、帳號、密碼、API Key、Token
- [ ] 已檢查內部系統網址、截圖、附件、資料表、欄位名稱
- [ ] 已檢查未抽象化的審查流程、上線流程、組織角色與業務規則
- [ ] 已檢查 Knowledge Graph 關聯是否暴露敏感資訊
- [ ] 已標記每個檔案的風險等級
- [ ] 已提供建議處理方式
- [ ] 已視情況更新 metadata 或提出 metadata 建議
- [ ] 高風險內容未被原樣擴散到 logs、wiki 或 indexes
- [ ] 回覆中沒有再次複製敏感資訊原文
- [ ] 已提示下一步是否可以繼續後續 prompt
