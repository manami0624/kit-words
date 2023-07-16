class WordsController < ApplicationController
  
  def index
    @dummy_words = [
      { korean: "객체 지향", japanese: "オブジェクト指向" },
      { korean: "알고리즘", japanese: "アルゴリズム" },
      { korean: "데이터베이스", japanese: "データベース" },
      { korean: "보안", japanese: "セキュリティ" },
      { korean: "디버깅", japanese: "デバッグ"},
      { korean: "설치", japanese: "インストール"},
      { korean: "유효성 검사", japanese: "バリデーション"},
      { korean: "캐시", japanese: "キャッシュ"},
      { korean: "반응형", japanese: "レスポンシブ"},
      { korean: "지원", japanese: "サポート"},
      { korean: "프록시", japanese: "プロキシ"},
      { korean: "데이터 분석", japanese: "データ分析"},
      { korean: "모듈", japanese: "モジュール"},
      { korean: "실시간", japanese: "リアルタイム"},
      { korean: "성능", japanese: "パフォーマンス"},
      { korean: "인코딩", japanese: "エンコーディング"},
      { korean: "배포", japanese: "デプロイ"},
      { korean: "컴파일", japanese: "コンパイル"},
      { korean: "쿼리", japanese: "クエリ"},
      { korean: "명령 줄", japanese: "コマンドライン"},
      { korean: "중첩", japanese: "ネスト"},
      { korean: "저장소", japanese: "リポジトリ"},
      { korean: "병합", japanese: "マージ"},
      { korean: "구성", japanese: "コンフィグレーション"},
      { korean: "오류 처리", japanese: "エラーハンドリング"},
      { korean: "객체", japanese: "オブジェクト"},
      { korean: "매개변수", japanese: "パラメーター"},
      { korean: "응답", japanese: "レスポンス"},
      { korean: "단위 테스트", japanese: "単体テスト"},
      { korean: "통합 테스트", japanese: "結合テスト"}
    ]
      @word = @dummy_words.sample
  end
  
  def random_word
    @word = @dummy_words.sample
  end
end
