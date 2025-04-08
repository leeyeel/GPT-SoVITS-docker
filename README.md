<div align="center">

<h1>GPT-SoVITS-WebUI</h1>
A Powerful Few-shot Voice Conversion and Text-to-Speech WebUI.<br><br>

[![madewithlove](https://img.shields.io/badge/made_with-%E2%9D%A4-red?style=for-the-badge&labelColor=orange)](https://github.com/RVC-Boss/GPT-SoVITS)

<a href="https://trendshift.io/repositories/7033" target="_blank"><img src="https://trendshift.io/api/badge/repositories/7033" alt="RVC-Boss%2FGPT-SoVITS | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>

<!-- img src="https://counter.seku.su/cmoe?name=gptsovits&theme=r34" /><br> -->

[![Open In Colab](https://img.shields.io/badge/Colab-F9AB00?style=for-the-badge&logo=googlecolab&color=525252)](https://colab.research.google.com/github/RVC-Boss/GPT-SoVITS/blob/main/colab_webui.ipynb)
[![License](https://img.shields.io/badge/LICENSE-MIT-green.svg?style=for-the-badge)](https://github.com/RVC-Boss/GPT-SoVITS/blob/main/LICENSE)
[![Huggingface](https://img.shields.io/badge/🤗%20-online%20demo-yellow.svg?style=for-the-badge)](https://huggingface.co/spaces/lj1995/GPT-SoVITS-v2)
[![Discord](https://img.shields.io/discord/1198701940511617164?color=%23738ADB&label=Discord&style=for-the-badge)](https://discord.gg/dnrgs5GHfG)

</div>

---

## 说明

GPT-SoVITS的docker镜像已经长时间不维护，
本项目可用于本地构建镜像。

## 准备 

运行需要先下载对应模型，参考[文档](https://github.com/RVC-Boss/GPT-SoVITS/blob/main/README.md#pretrained-models),
下载到对应文件后构建docker，会把对应文件打包到docker镜像中。

如果希望减小镜像体积，可以先构建镜像，构建完成后再把模型文件拷贝到对应目录，使用docker的`-v`参数映射到对应目录即可。

## 构建

```
git clone https://github.com/RVC-Boss/GPT-SoVITS.git
cd GPT-SoVITS
docker build . -t breakstring/gpt-sovits:local 或者执行
docker compose up
```
