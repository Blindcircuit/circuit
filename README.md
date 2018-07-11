### 프로젝트 진행내역
새롭새 시작시 필요한 명령어
```console
bundle install
bundle exec figaro install   # => .gitignore 생성 및 application.yml에 키 값 삽입
rake db:migrate
```
1. user 테이블 수정 - 선우
2. track 테이블 생성 및 데이터 추가
```console
rails g model track track:string   # => 원하는 컬럼의 자료타입을 선정해서 생성
rake db:migrate # => db를 생성해서 스키마에 반영하기위한 명령어
# DB값을 계속 drop 및 migrate를 하기 때문에 csv파일에 저장해서 업로드 하는게 편할거 같음
csv 파일 반영 방법
- csv파일 삽입 db폴더 바로 밑에(csv파일의 경우 구글 스프레드시트로 작성해야 인코딩 에러없음)
- 입력하는 코드 seeds.rb에 삽입
- console에서 rake db:seed 로 삽입
- 반영 완료
```
