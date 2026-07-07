---

# Troubleshooting Index

本頁用於整理 `wiki/troubleshooting/` 中的錯誤排除筆記。

`troubleshooting_index.md` 的重點不是保存完整排查細節，而是提供問題與解法的導覽入口，幫助快速查詢：

- 遇過哪些錯誤或異常問題
- 問題發生在哪個工具、流程、任務或專案中
- 問題目前是否已解決
- 是否有可重複使用的解法
- 哪些問題仍需要確認或補充
- 哪些問題應延伸成工具、流程、資料或公式筆記

---

## 1. Index 說明

本 index 對應以下資料夾：

| 類型 | 位置 | 說明 |
|---|---|---|
| 錯誤排除筆記 | `wiki/troubleshooting/` | 實習期間遇到的錯誤、異常、排查過程、解法、替代方案與預防方式 |

適合放入 `wiki/troubleshooting/` 的內容包括：

| 類型 | 範例 |
|---|---|
| 安裝錯誤 | 套件安裝失敗、版本衝突、相依套件問題 |
| 環境錯誤 | Python 環境、PowerShell、路徑、權限或設定問題 |
| 執行錯誤 | 程式執行失敗、runtime error、參數錯誤 |
| API 錯誤 | API 呼叫失敗、回傳格式錯誤、權限不足 |
| 資料錯誤 | 檔案格式錯誤、欄位缺失、資料型態不一致 |
| 工具操作問題 | 工具功能不明、操作流程不穩定、設定不一致 |
| 流程問題 | 流程中斷、輸入輸出不一致、步驟缺漏 |
| 權限問題 | 系統、資料、檔案或工具存取權限不足 |
| 審查或確認問題 | 需要主管、同事、架構師或其他角色確認後才能處理 |

---

## 2. 快速入口

| 區塊 | 用途 |
|---|---|
| [[#3. 問題總表]] | 查看所有已整理問題 |
| [[#4. 未解決問題]] | 查看目前仍需處理或確認的問題 |
| [[#5. 已解決問題]] | 查看已解決且可複用的解法 |
| [[#6. 暫時解法或替代方案]] | 查看目前只能 workaround 的問題 |
| [[#7. 問題與工具對應]] | 查看問題發生在哪些工具中 |
| [[#8. 問題與流程 / 任務 / 專案對應]] | 查看問題影響哪些流程、任務或專案 |
| [[#9. 常見問題分類]] | 依問題類型整理錯誤 |
| [[#10. 待建立問題排除筆記]] | 查看尚未補成正式 troubleshooting 筆記的問題 |
| [[#11. 問題到 Wiki 的延伸]] | 查看問題是否需要延伸成其他 wiki 筆記 |

---

## 3. 問題總表

本區塊列出 `wiki/troubleshooting/` 中已建立的錯誤排除筆記。

| 問題 | 問題類型 | 發生位置 | 解決狀態 | 相關工具 | 更新日期 |
|---|---|---|---|---|---|
| `[[troubleshooting_note]]` | install / config / permission / runtime / api / data / workflow / formula / review / other | tool / workflow / task / project / data / environment / other | unresolved / workaround / solved / pending | `[[tool_name]]` | YYYY-MM-DD |

### 欄位說明

| 欄位 | 說明 |
|---|---|
| 問題 | 對應 `wiki/troubleshooting/` 中的錯誤排除筆記，建議使用 Obsidian 雙向連結 |
| 問題類型 | 問題的主要分類 |
| 發生位置 | 問題發生在哪個層面 |
| 解決狀態 | 問題目前處理狀態 |
| 相關工具 | 若問題與特定工具有關，填入工具筆記 |
| 更新日期 | 問題排除筆記最近更新日期 |

---

## 4. 未解決問題

本區塊列出目前仍未解決、仍在排查或需要確認的問題。

| 問題 | 目前狀態 | 卡住原因 | 下一步 | 確認對象 |
|---|---|---|---|---|
| `[[troubleshooting_note]]` | unresolved / pending / needs_review |  |  | 使用者 / 主管 / 同事 / 待確認 |

### 使用規則

- 只放目前仍需要處理的問題。
- 若問題已解決，應移到 [[#5. 已解決問題]]。
- 若問題只能暫時繞過，應同步列入 [[#6. 暫時解法或替代方案]]。
- 不要在本區塊保存完整錯誤訊息，完整內容應寫在正式 troubleshooting 筆記中。
- 若錯誤訊息涉及敏感資訊，必須先抽象化或遮蔽。

---

## 5. 已解決問題

本區塊列出已解決、可回顧或可複用的問題排除經驗。

| 問題 | 解決日期 | 解法摘要 | 可複用情境 | 相關筆記 |
|---|---|---|---|---|
| `[[troubleshooting_note]]` | YYYY-MM-DD |  | install / config / permission / runtime / api / data / workflow / other |  |

### 使用規則

- 問題解決後，應更新此區塊。
- 若解法可重複使用，應考慮是否整理成 `wiki/workflows/`。
- 若解法和特定工具高度相關，應同步更新 [[tool_index]]。
- 若問題與資料欄位或資料品質有關，應同步更新 [[data_index]]。
- 若問題與公式或計算方式有關，應同步更新 [[formula_index]]。

---

## 6. 暫時解法或替代方案

本區塊整理目前尚未根本解決，但已有 workaround 的問題。

| 問題 | 暫時解法 | 適用情境 | 風險或限制 | 是否需後續處理 |
|---|---|---|---|---|
| `[[troubleshooting_note]]` |  |  |  | 是 / 否 / 待確認 |

### 使用規則

- 暫時解法必須明確標記，不可寫成最終解法。
- 若 workaround 可能造成資料錯誤、流程不一致或結果不穩定，必須在風險欄說明。
- 若問題之後需要根本解決，應保留在 [[#4. 未解決問題]] 或標記為 pending。

---

## 7. 問題與工具對應

本區塊用於查看哪些問題發生在特定工具中。

| 工具 | 問題 | 問題類型 | 解決狀態 | 是否需更新工具筆記 |
|---|---|---|---|---|
| `[[tool_name]]` | `[[troubleshooting_note]]` | install / config / permission / runtime / api / usage / other | unresolved / workaround / solved / pending | 是 / 否 / 待確認 |

### 使用規則

- 若問題與工具安裝、設定、操作或限制有關，應同步更新 [[tool_index]]。
- 若工具筆記中需要補充限制、注意事項或常見錯誤，應在此標記。
- 若問題涉及工具操作流程，應同步更新 [[workflow_index]]。

---

## 8. 問題與流程 / 任務 / 專案對應

本區塊用於查看問題影響哪些流程、任務或專案。

| 問題 | 相關流程 | 相關任務 | 相關專案 | 影響程度 |
|---|---|---|---|---|
| `[[troubleshooting_note]]` | `[[workflow_name]]` | `[[task_name]]` | `[[project_name]]` | low / medium / high / blocking |

### 影響程度說明

| 影響程度 | 說明 |
|---|---|
| low | 不影響主要工作，只是輔助性問題 |
| medium | 影響部分流程或效率，但仍可繼續 |
| high | 明顯影響任務或專案進度 |
| blocking | 導致任務或專案無法繼續 |

### 使用規則

- 若問題影響任務進度，應同步更新 [[task_index]]。
- 若問題影響專案進度，應同步更新 [[project_index]]。
- 若問題發生在固定流程中，應同步更新 [[workflow_index]]。
- 若問題需要主管、同事或其他角色確認，應標記為 pending 或 needs_review。

---

## 9. 常見問題分類

本區塊依問題類型整理錯誤，方便查找類似問題。

### 安裝與環境問題

| 問題 | 相關工具 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` | `[[tool_name]]` | unresolved / workaround / solved / pending |

### 設定與權限問題

| 問題 | 相關工具 / 系統 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` |  | unresolved / workaround / solved / pending |

### 執行錯誤

| 問題 | 發生位置 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` |  | unresolved / workaround / solved / pending |

### API 或工具回傳問題

| 問題 | 相關工具 / API | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` |  | unresolved / workaround / solved / pending |

### 資料格式或資料品質問題

| 問題 | 相關資料 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` | `[[data_note]]` | unresolved / workaround / solved / pending |

### 流程中斷或流程不一致

| 問題 | 相關流程 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` | `[[workflow_name]]` | unresolved / workaround / solved / pending |

### 公式、模型或計算問題

| 問題 | 相關公式 | 解決狀態 |
|---|---|---|
| `[[troubleshooting_note]]` | `[[formula_name]]` | unresolved / workaround / solved / pending |

---

## 10. 待建立問題排除筆記

本區塊整理已經出現在 log 中，但尚未建立正式 `wiki/troubleshooting/` 筆記的問題。

| 問題項目 | 來源 | 建議檔案 | 優先度 | 備註 |
|---|---|---|---|---|
|  | `logs/daily/YYYY-MM-DD.md` | `wiki/troubleshooting/issue_short_description.md` | 高 / 中 / 低 |  |

### 優先度判斷

| 優先度 | 判斷標準 |
|---|---|
| 高 | 阻擋任務、反覆出現、影響專案、主管要求、容易再次發生、需要形成標準解法 |
| 中 | 有學習價值，但目前已有替代方案或不是主要任務核心 |
| 低 | 一次性問題，短期內不影響主要工作 |

---

## 11. 問題到 Wiki 的延伸

有些問題排除筆記整理後，會需要延伸成其他正式 wiki 筆記。

| 問題 | 可延伸類型 | 建議位置 | 是否已建立 |
|---|---|---|---|
| `[[troubleshooting_note]]` | tool / workflow / task / project / data / formula / concept / glossary | `wiki/...` | 是 / 否 / 待確認 |

### 延伸判斷

| 可延伸類型 | 判斷方式 |
|---|---|
| tool | 問題與工具安裝、設定、限制或操作高度相關 |
| workflow | 解法形成可重複執行的排查流程或修正流程 |
| task | 問題影響具體任務執行 |
| project | 問題影響專案或 PoC 進度 |
| data | 問題涉及資料來源、欄位、格式或品質 |
| formula | 問題涉及公式、模型、指標或計算方式 |
| concept | 問題反映某個概念理解不足 |
| glossary | 問題涉及縮寫、術語、錯誤訊息或英文專有名詞 |

---

## 12. 近期更新紀錄

| 日期 | 更新內容 | 相關位置 |
|---|---|---|
| YYYY-MM-DD |  |  |

---

## 13. 維護規則

### 必須維護

- 新增 `wiki/troubleshooting/` 筆記後，必須更新 [[#3. 問題總表]]。
- 問題尚未解決時，應更新 [[#4. 未解決問題]]。
- 問題解決後，應更新 [[#5. 已解決問題]]。
- 若只是 workaround，應更新 [[#6. 暫時解法或替代方案]]。
- 若問題與工具有關，應更新 [[#7. 問題與工具對應]] 與 [[tool_index]]。
- 若問題影響流程、任務或專案，應更新 [[#8. 問題與流程 / 任務 / 專案對應]]。
- 若問題涉及資料、公式、概念或術語，應同步更新對應 index。
- 若問題影響近期重點任務或專案，應更新 [[home]]。

### 不建議

- 不要把完整錯誤排查內容寫在本 index。
- 不要把本頁當成 troubleshooting 筆記本體。
- 不要在本頁保存客戶資料、帳號、密碼、API Key、Token、完整內部系統網址或未遮蔽截圖。
- 不要在本頁保存未抽象化的公司內部系統錯誤訊息、資料表名稱或敏感欄位。
- 不要在本頁建立完整 Knowledge Graph；完整關聯應放在正式 `wiki/troubleshooting/` 筆記中。
- 不要把尚未確認的推測寫成已確認原因。

---

## 14. 與其他 Index 的關係

| Index | 關係 |
|---|---|
| [[home]] | 從首頁進入本錯誤排除索引 |
| [[learning_index]] | 問題通常從 daily log、weekly summary 或 meeting note 中萃取 |
| [[concept_index]] | 問題可能反映某個概念理解不足 |
| [[tool_index]] | 問題常與工具安裝、設定或操作有關 |
| [[workflow_index]] | 問題可能發生在固定流程中 |
| [[task_index]] | 問題可能影響任務進度 |
| [[project_index]] | 問題可能影響專案或 PoC 進度 |
| [[data_index]] | 問題可能涉及資料格式、欄位或資料品質 |
| [[formula_index]] | 問題可能涉及公式、模型或計算方式 |
| [[business_context_index]] | 問題可能與審查、權限、上線或業務流程有關 |
| [[glossary_index]] | 問題中的錯誤訊息、縮寫或術語可同步整理到術語索引 |

---

## 15. 下一步

- [ ] 新增問題到 [[#3. 問題總表]]
- [ ] 檢查是否有未解決問題
- [ ] 檢查是否有暫時解法
- [ ] 檢查問題是否與工具或流程有關
- [ ] 檢查問題是否影響任務或專案
- [ ] 檢查是否需要更新 [[tool_index]]
- [ ] 檢查是否需要更新 [[home]] 的最近遇到的問題區塊
