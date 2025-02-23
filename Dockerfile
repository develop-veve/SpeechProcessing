# Python 3.9 イメージを使用
FROM python:3.9

# 作業ディレクトリの設定
WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Pythonライブラリのインストール
RUN pip install --upgrade pip && pip install \
    numpy \
    scipy \
    matplotlib \
    librosa \
    torch torchvision torchaudio \
    tensorflow \
    jupyter \
    seaborn \
    pandas \
    scikit-learn \
    SpeechRecognition

# Jupyter Notebook を起動
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
