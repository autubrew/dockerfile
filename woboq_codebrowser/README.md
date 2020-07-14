## 介绍
[woboq_codebrowser](https://github.com/woboq/woboq_codebrowser) 项目的 docker 版，通过分析 C/C++、Qt 等项目的源码生成 html 文件，方便在线浏览。

## 使用

### linux kernel

```bash
docker pull autubrew/woboq-codebrowser:linux
docker run --rm --env URL=<url> -v `pwd`/output:/root/output autubrew/woboq-codebrowser:linux
```

+ `<url>`：linux 源码完整下载地址，如 `http://ftp.sjtu.edu.cn/sites/ftp.kernel.org/pub/linux/kernel/v5.x/linux-5.4.46.tar.xz`

 生成的 html 结果可直接部署到 nginx、httpd 等服务上。

ps：在 `codebrowser_generator` 阶段会报出很多类似 `Error: xxx expected '(' after 'asm'` 、 `error: unknown argument: 'xxx'` 或 `warning: optimization flag 'xxx' is not supported` 的错误或警告，暂不清楚原因，可能与编译器版本配置有关，暂不影响生成的 html 代码浏览。
