# 指纹浏览器指纹参数说明文档

## 基本启动命令

```bash
chrome.exe --ruyi="[指纹参数JSON]" --user-agent="[UA字符串]" --lang=[语言] --time-zone-for-testing=[时区] --user-data-dir="[用户目录]"
```

## 指纹参数详细说明

### 1. 网络相关参数

- WebRTC参数:
  
  ```json
  "webrtc": {
    "public": "154.64.226.99",    // 外网IP
    "private": "192.168.9.1"      // 内网IP
  }
  ```

- 端口扫描控制:
  
  ```json
  "portScan": {
    "enable": "no"    // 是否允许端口扫描，no为禁止
  }
  ```

### 2. 地理位置参数

```json
"position": {
  "longitude": 116.231407,    // 经度
  "latitude": 39.951754,      // 纬度
  "altitude": 100.0,          // 海拔
  "accuracy": 10.0            // 精确度
}
```

### 3. 硬件特征参数

- 显示相关:
  
  ```json
  "screen": {
    "width": 1000.0,          // 屏幕宽度
    "height": 2000.0,         // 屏幕高度
    "colorDepth": 9.0,        // 颜色深度
    "availWidth": 900.0,      // 可用宽度
    "availHeight": 900.0      // 可用高度
  }
  ```

- 硬件配置:
  
  ```json
  "hardware": {
    "concurrency": 16.0,      // CPU线程数
    "memory": 64.0           // 内存大小(GB)
  }
  ```

### 4. 浏览器特征参数

- Canvas指纹:
  
  ```json
  "canvas": {
    "noise": 2.0             // Canvas噪声值
  }
  ```

- WebGL参数:
  
  ```json
  "webgl": {
    "vendor": "Google Inc. (NVIDIA)",
    "renderer": "ANGLE (NVIDIA, NVIDIA GeForce RTX 3080 Laptop GPU...)"
  }
  ```

- 字体控制:
  
  ```json
  "font": {
    "removefont": "Segoe UI,Tahoma"    // 需要移除的字体列表
  }
  ```

### 5. 系统特征参数

- 客户端提示:
  
  ```json
  "clientHint": {
    "platform": "Windows",
    "platform_version": "16.0.0",
    "ua_full_version": "118.0.2592.119",
    "mobile": "?0",
    "architecture": "x64",
    "bitness": "64"
  }
  ```

- 语言设置:
  
  ```json
  "languages": {
    "js": "zh-CN,en,en-US",
    "http": "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6"
  }
  ```

## 使用建议

1. 每个浏览器实例建议使用独立的用户目录
2. 参数修改时需要保持合理性，避免明显矛盾的配置
3. 建议定期更新指纹参数，避免长期使用相同配置

## 注意事项

1. 所有参数修改必须包含"post"字段
2. 参数值需要符合实际情况，避免使用明显不合理的值
3. 使用时请遵守相关法律法规，不要用于非法用途

根据分析，这个指纹浏览器的方法是可行的，主要优点有：

1. 支持全面的指纹修改，包括硬件特征、网络特征等
2. 基于Chromium开发，兼容性好
3. 可以通过playwright等工具进行自动化操作
4. 支持通过BrowserScan等工具的检测

建议在使用时：

1. 定期更换指纹参数
2. 确保参数之间保持逻辑一致性
3. 使用独立的用户目录来隔离不同的指纹配置

参考链接：[如意浏览器GitHub仓库](https://raw.githubusercontent.com/openai1998/ruyiBrowser/refs/heads/main/README.md)

# Chromium指纹参数使用说明

## Chromium要求

1. 版本建议：
   
   - 推荐使用Chromium 115+版本
   - 可以从[Chromium官方下载](https://download-chromium.appspot.com/)获取

2. 启动方式：
   
   ```bash
   # Windows系统
   chromium.exe --ruyi="[指纹参数JSON]" [其他参数...]
   
   # Linux系统
   chromium --ruyi="[指纹参数JSON]" [其他参数...]
   ```

3. 重要命令行参数：
   
   ```bash
   --user-agent          # 修改UA
   --lang               # 修改语言
   --time-zone-for-testing  # 修改时区
   --user-data-dir      # 指定用户数据目录
   --disable-gpu        # 可选：禁用GPU
   --no-sandbox         # 可选：禁用沙箱（不建议）
   ```

## 使用注意事项

1. 官方Chromium同样支持这些指纹修改参数
2. 建议使用新的用户数据目录，避免配置文件冲突
3. 参数值需要符合实际情况，保持合理性

## Chromium版本兼容性说明

### 支持的版本范围

- 最低建议版本：Chromium 80+
- 最佳使用版本：Chromium 90-119
- 稳定性最好的版本：96-108

### 不同版本的参数差异

1. 80-89版本：
   
   ```bash
   # 基础参数支持
   --user-agent
   --lang
   --user-data-dir
   ```

2. 90-108版本：
   
   ```bash
   # 完整参数支持
   --ruyi
   --user-agent
   --lang
   --time-zone-for-testing
   --user-data-dir
   ```

### 老版本使用注意事项

1. WebRTC相关参数在低版本可能需要额外配置
2. Canvas指纹修改在低版本效果可能不够理想
3. 部分ClientHint参数在低版本中不支持

### 建议选择版本的考虑因素

1. 稳定性需求：建议使用96-108版本
2. 安全性需求：建议使用较新版本
3. 特殊场景需求：可以选择特定版本进行测试

## Chromium版本下载指南

### 推荐版本对照表

| 版本类型 | 版本号          | 系统      | 下载链接                                                                                                           | 特点                              |
| ---- | ------------ | ------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| 首选版本 | 96.0.4664.0  | Windows | [下载]()                                                                                                         | • 稳定性最好<br>• 参数支持完整<br>• 资源占用适中 |
|      |              | Linux   | [下载](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/920003/)  |                                 |
| 备选版本 | 108.0.5359.0 | Windows | [下载](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/1039296/)   | • 功能更新<br>• 安全性更好<br>• 兼容性略好    |
|      |              | Linux   | [下载](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/1039296/) |                                 |
| 经典版本 | 90.0.4430.0  | Windows | [下载](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/843831/)    | • 体积较小<br>• 资源占用低<br>• 基础功能完整   |
|      |              | Linux   | [下载](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/843831/)  |                                 |

### 版本参数支持对照表

| 版本范围   | 支持的参数                                                                                    | 兼容性 | 建议场景   |
| ------ | ---------------------------------------------------------------------------------------- | --- | ------ |
| 80-89  | • --user-agent<br>• --lang<br>• --user-data-dir                                          | 基础  | 轻量级使用  |
| 90-95  | • --ruyi<br>• --user-agent<br>• --lang<br>• --time-zone-for-testing<br>• --user-data-dir | 良好  | 一般使用   |
| 96-108 | 全部参数                                                                                     | 最佳  | 推荐使用   |
| 109+   | 全部参数                                                                                     | 较好  | 需要新特性时 |

### 功能支持详情表

| 功能特性       | 80-89版本 | 90-95版本 | 96-108版本 | 109+版本 |
| ---------- | ------- | ------- | -------- | ------ |
| WebRTC修改   | ⚠️ 部分支持 | ✅ 支持    | ✅ 支持     | ✅ 支持   |
| Canvas指纹   | ⚠️ 基础支持 | ✅ 支持    | ✅ 支持     | ✅ 支持   |
| ClientHint | ❌ 不支持   | ⚠️ 部分支持 | ✅ 支持     | ✅ 支持   |
| 时区修改       | ❌ 不支持   | ✅ 支持    | ✅ 支持     | ✅ 支持   |
| 指纹参数       | ⚠️ 基础支持 | ✅ 支持    | ✅ 支持     | ✅ 支持   |

### 快速链接

- [版本历史查询](https://chromiumdash.appspot.com/history)
- [官方下载中心](https://download-chromium.appspot.com/)
- [快照下载中心](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html)
- [Chromium历史版本查询](https://link.juejin.cn/?target=https%3A%2F%2Fmrseawave.github.io%2Fchromium-history-page%2F) 
  (这不是一个官方页面，但它会将您重定向到官方版本下载页面,[参考](https://juejin.cn/post/7276364913425334329))

### 下载注意事项

1. 验证文件完整性
2. Windows版本需下载对应资源文件
3. 建议使用官方源下载

### 版本下载信息

- 版本号: 925075 (Chromium 96)
- 下载链接: [Win_x64/925075](https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/925075/)
- 文件清单:
  - chrome-win.zip (主程序)
  - chrome-win32.zip (32位版本)
  - chromedriver_win32.zip (WebDriver)
  - mini_installer.exe (安装程序)

### 使用建议

1. 建议下载chrome-win.zip完整包
2. 解压后可直接使用，无需安装
3. 需要确保下载chromedriver_win32.zip用于自动化

### 自动化相关下载说明

1. 必需文件：
   
   - chrome-win.zip (浏览器主程序)
   - chromedriver_win32.zip (自动化驱动)

2. 版本对应：
   
   - chromedriver版本必须与chrome版本匹配
   - 925075版本已经包含匹配的driver

3. 自动化框架支持：
   
   - Selenium: 需要同时使用chrome和chromedriver
   - Playwright: 主要使用chrome，driver由框架管理
   - Puppeteer: 可以直接使用chrome

---

## 未来发展路线

详细的未来发展规划请参考 [未来计划完善路线](./未来计划完善路线.md)，主要包含以下方向:

- 核心指纹参数增强 (WebGL、Audio、硬件信息、网络特征等)
- 新特性支持计划 (浏览器API防护、存储机制优化、媒体能力伪装)
- 自动化与工具链建设
- 安全性增强
- 合规性保障
