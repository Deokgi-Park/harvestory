/* 관리자에서 생성 작업 */
CREATE USER HARVESTORY IDENTIFIED BY CROPFIT;
GRANT DBA TO HARVESTORY;


/* HARVESTORY 접속 */
/* 회원 */
CREATE TABLE USER (
	USER_ID VARCHAR2(100) NOT NULL, /* 회원아이디 */
	USER_GRADE VARCHAR2(1) NOT NULL, /* 회원등급 */
	USER_PW VARCHAR2(100) NOT NULL, /* 회원비밀번호 */
	USER_PHONE INT NOT NULL, /* 회원휴대폰번호 */
	USER_NAME VARCHAR2(30) NOT NULL, /* 회원이름 */
	USER_ADDRESS VARCHAR2(100) NOT NULL, /* 회원주소 */
	USER_EMAIL VARCHAR2(30), /* 회원이메일 */
	USER_ACCOUNT VARCHAR2(30) NOT NULL, /* 회원계좌번호 */
	USER_STATUS VARCHAR2(1) NOT NULL, /* 회원상태 */
	USER_REPORT INT NOT NULL, /* 신고횟수 */
	USER_ENROLLDATE DATE NOT NULL /* 회원가입일 */
);

COMMENT ON TABLE USER IS '회원';

COMMENT ON COLUMN USER.USER_ID IS '회원아이디';

COMMENT ON COLUMN USER.USER_GRADE IS '회원등급';

COMMENT ON COLUMN USER.USER_PW IS '회원비밀번호';

COMMENT ON COLUMN USER.USER_PHONE IS '회원휴대폰번호';

COMMENT ON COLUMN USER.USER_NAME IS '회원이름';

COMMENT ON COLUMN USER.USER_ADDRESS IS '회원주소';

COMMENT ON COLUMN USER.USER_EMAIL IS '회원이메일';

COMMENT ON COLUMN USER.USER_ACCOUNT IS '회원계좌번호';

COMMENT ON COLUMN USER.USER_STATUS IS '회원상태';

COMMENT ON COLUMN USER.USER_REPORT IS '신고횟수';

COMMENT ON COLUMN USER.USER_ENROLLDATE IS '회원가입일';

CREATE UNIQUE INDEX PK_USER
	ON USER (
		USER_ID ASC
	);

ALTER TABLE USER
	ADD
		CONSTRAINT PK_USER
		PRIMARY KEY (
			USER_ID
		);

/* 증빙서류 */
CREATE TABLE DOCUMENT (
	DOC_NO INT NOT NULL, /* 증빙서류번호 */
	DOC_PATH VARCHAR2(500) NOT NULL, /* 증빙서류경로 */
	DOC_PERMIT VARCHAR2(1) NOT NULL, /* 증빙서류인증여부 */
	DOC_CHNG_NM VARCHAR2(50) NOT NULL, /* 증빙서류변경파일명 */
	DOC_ORGN_NM VARCHAR2(50) NOT NULL, /* 증빙서류기본파일명 */
	DOC_CREATE_DT DATE DEFAULT SYSDATE NOT NULL, /* 증빙서류등록일 */
	DOC_STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 증빙서류상태 */
	USER_ID VARCHAR2(100) NOT NULL /* 회원아이디 */
);

COMMENT ON TABLE DOCUMENT IS '증빙서류';

COMMENT ON COLUMN DOCUMENT.DOC_NO IS '증빙서류번호';

COMMENT ON COLUMN DOCUMENT.DOC_PATH IS '증빙서류경로';

COMMENT ON COLUMN DOCUMENT.DOC_PERMIT IS '증빙서류인증여부';

COMMENT ON COLUMN DOCUMENT.DOC_CHNG_NM IS '증빙서류변경파일명';

COMMENT ON COLUMN DOCUMENT.DOC_ORGN_NM IS '증빙서류기본파일명';

COMMENT ON COLUMN DOCUMENT.DOC_CREATE_DT IS '증빙서류등록일';

COMMENT ON COLUMN DOCUMENT.DOC_STATUS IS '증빙서류상태';

COMMENT ON COLUMN DOCUMENT.USER_ID IS '회원아이디';

CREATE UNIQUE INDEX PK_DOCUMENT
	ON DOCUMENT (
		DOC_NO ASC
	);

ALTER TABLE DOCUMENT
	ADD
		CONSTRAINT PK_DOCUMENT
		PRIMARY KEY (
			DOC_NO
		);

/* 게시판 */
CREATE TABLE BOARD (
	BOARD_NO INT NOT NULL, /* 게시글번호 */
	USER_ID VARCHAR2(100) NOT NULL, /* 회원아이디 */
	BOARD_TITLE VARCHAR2(30) NOT NULL, /* 게시글제목 */
	BOARD_CONTENT CLOB NOT NULL, /* 게시글내용 */
	BOARD_STATUS VARCHAR2(1) NOT NULL, /* 게시글상태 */
	BOARD_DATE DATE NOT NULL /* 게시글등록일 */
);

COMMENT ON TABLE BOARD IS '게시판';

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글번호';

COMMENT ON COLUMN BOARD.USER_ID IS '회원아이디';

COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글제목';

COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '게시글내용';

COMMENT ON COLUMN BOARD.BOARD_STATUS IS '게시글상태';

COMMENT ON COLUMN BOARD.BOARD_DATE IS '게시글등록일';

CREATE UNIQUE INDEX PK_BOARD
	ON BOARD (
		BOARD_NO ASC
	);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD
		PRIMARY KEY (
			BOARD_NO
		);

/* 전자결제시스템 */
CREATE TABLE PAYMENT (
	USER_NO INT NOT NULL, /* 결제번호 */
	USER_ID VARCHAR2(100), /* 회원아이디 */
	PG VARCHAR2(20), /* 구분자 */
	PAY_METHOD VARCHAR2(10), /* 결제수단 */
	ESCROW VARCHAR2(1), /* 결제여부 */
	MERCHANT_UID VARCHAR2(5), /* 가맹점고유주문번호 */
	NAME VARCHAR2(16), /* 주문명 */
	AMOUNT INT NOT NULL, /* 결제할금액 */
	TAX_FREE INT, /* 면세공급가액 */
	CURRENCY VARCHAR2(10), /* 화폐단위 */
	LANGUAGE VARCHAR2(3), /* 언어설정 */
	BUYER_NAME VARCHAR2(10), /* 주문자명 */
	BUYER_TEL VARCHAR2(13), /* 주문자연락처 */
	BUYER_EMAIL VARCHAR2(30), /* 주문자이메일 */
	BUYER_ADDR VARCHAR2(30) NOT NULL, /* 주문자주소 */
	BUYER_POSTCODE VARCHAR2(7), /* 주문자우편번호 */
	CUSTOM_DATA VARCHAR2(10), /* 가맹점임의데이터 */
	NOTICE_URL VARCHAR2(20), /* Notification URL	 */
	company VARCHAR2(15) /* 가맹점상호 */
);

COMMENT ON TABLE PAYMENT IS '전자결제시스템';

COMMENT ON COLUMN PAYMENT.USER_NO IS '결제번호';

COMMENT ON COLUMN PAYMENT.USER_ID IS '회원아이디';

COMMENT ON COLUMN PAYMENT.PG IS '구분자';

COMMENT ON COLUMN PAYMENT.PAY_METHOD IS '결제수단';

COMMENT ON COLUMN PAYMENT.ESCROW IS '결제여부';

COMMENT ON COLUMN PAYMENT.MERCHANT_UID IS '가맹점고유주문번호';

COMMENT ON COLUMN PAYMENT.NAME IS '주문명';

COMMENT ON COLUMN PAYMENT.AMOUNT IS '결제할금액';

COMMENT ON COLUMN PAYMENT.TAX_FREE IS '면세공급가액';

COMMENT ON COLUMN PAYMENT.CURRENCY IS '화폐단위';

COMMENT ON COLUMN PAYMENT.LANGUAGE IS '언어설정';

COMMENT ON COLUMN PAYMENT.BUYER_NAME IS '주문자명';

COMMENT ON COLUMN PAYMENT.BUYER_TEL IS '주문자연락처';

COMMENT ON COLUMN PAYMENT.BUYER_EMAIL IS '주문자이메일';

COMMENT ON COLUMN PAYMENT.BUYER_ADDR IS '주문자주소';

COMMENT ON COLUMN PAYMENT.BUYER_POSTCODE IS '주문자우편번호';

COMMENT ON COLUMN PAYMENT.CUSTOM_DATA IS '가맹점임의데이터';

COMMENT ON COLUMN PAYMENT.NOTICE_URL IS 'Notification URL	';

COMMENT ON COLUMN PAYMENT.company IS '가맹점상호';

CREATE UNIQUE INDEX PK_PAYMENT
	ON PAYMENT (
		USER_NO ASC
	);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT
		PRIMARY KEY (
			USER_NO
		);

/* 전자계약서 */
CREATE TABLE CONTRACT (
	CONTRACT_NO <지정 되지 않음> NOT NULL, /* 전자계약번호 */
	USER_ID VARCHAR2(100), /* 회원아이디 */
	FUNDING_NO INT, /* 펀딩요청번호 */
	AUCTION_NO INT, /* 경매요청번호 */
	IMG_NO INT, /* 이미지번호 */
	CONTRACT_DATE DATE NOT NULL, /* 체결날짜 */
	CONTRACT_ARTICLE VARCHAR2(200), /* 특약조항 */
	CONTRACT_STATUS VARCHAR2(1) NOT NULL /* 계약상태 */
);

COMMENT ON TABLE CONTRACT IS '전자계약서';

COMMENT ON COLUMN CONTRACT.CONTRACT_NO IS '전자계약번호';

COMMENT ON COLUMN CONTRACT.USER_ID IS '회원아이디';

COMMENT ON COLUMN CONTRACT.FUNDING_NO IS '펀딩요청번호';

COMMENT ON COLUMN CONTRACT.AUCTION_NO IS '경매요청번호';

COMMENT ON COLUMN CONTRACT.IMG_NO IS '이미지번호';

COMMENT ON COLUMN CONTRACT.CONTRACT_DATE IS '체결날짜';

COMMENT ON COLUMN CONTRACT.CONTRACT_ARTICLE IS '특약조항';

COMMENT ON COLUMN CONTRACT.CONTRACT_STATUS IS '계약상태';

CREATE UNIQUE INDEX PK_CONTRACT
	ON CONTRACT (
		CONTRACT_NO ASC
	);

ALTER TABLE CONTRACT
	ADD
		CONSTRAINT PK_CONTRACT
		PRIMARY KEY (
			CONTRACT_NO
		);

/* 농산물시세 */
CREATE TABLE PRICE (
	PRODUCTNO VARCHAR2(3) NOT NULL, /* 품목코드 */
	CONDITION VARCHAR2(100), /* 요청메세지 */
	PRICE VARCHAR2(100), /* 응답메세지 */
	PRODUCT_CLS_CODE VARCHAR2(2), /* 구분 */
	PRODUCT_CLS_NAME VARCHAR2(10), /* 구분이름 */
	CATEGORY_CODE VARCHAR2(3), /* 부류코드 */
	CATEGORY_NAME VARCHAR2(10), /* 부류명 */
	LASTEST_DATE DATE, /* 최근조사일 */
	PRODUCTNAME VARCHAR2(20), /* 품목명 */
	ITEM_NAME VARCHAR2(20), /* 품목명2 */
	UNIT VARCHAR2(10), /* 단위 */
	DAY1 VARCHAR2(10), /* 최근조사일자 */
	DPR1 VARCHAR2(10), /* 최근조사일자가격 */
	DAY2 VARCHAR2(10), /* 1일전일자 */
	DPR2 VARCHAR2(10), /* 1일전가격 */
	DAY3 VARCHAR2(10), /* 1개월전일자 */
	DPR3 VARCHAR2(10), /* 1개월전가격 */
	DAY4 VARCHAR2(10), /* 1년전일자 */
	DPR4 VARCHAR2(10), /* 1년전가격 */
	DIRECTION VARCHAR2(2), /* 등락여부 */
	VALUE VARCHAR2(10), /* 등락율 */
	RESULT_CODE VARCHAR2(10) /* 결과코드 */
);

COMMENT ON TABLE PRICE IS '농산물시세';

COMMENT ON COLUMN PRICE.PRODUCTNO IS '품목코드';

COMMENT ON COLUMN PRICE.CONDITION IS '요청메세지';

COMMENT ON COLUMN PRICE.PRICE IS '응답메세지';

COMMENT ON COLUMN PRICE.PRODUCT_CLS_CODE IS '구분';

COMMENT ON COLUMN PRICE.PRODUCT_CLS_NAME IS '구분이름';

COMMENT ON COLUMN PRICE.CATEGORY_CODE IS '부류코드';

COMMENT ON COLUMN PRICE.CATEGORY_NAME IS '부류명';

COMMENT ON COLUMN PRICE.LASTEST_DATE IS '최근조사일';

COMMENT ON COLUMN PRICE.PRODUCTNAME IS '품목명';

COMMENT ON COLUMN PRICE.ITEM_NAME IS '품목명2';

COMMENT ON COLUMN PRICE.UNIT IS '단위';

COMMENT ON COLUMN PRICE.DAY1 IS '최근조사일자';

COMMENT ON COLUMN PRICE.DPR1 IS '최근조사일자가격';

COMMENT ON COLUMN PRICE.DAY2 IS '1일전일자';

COMMENT ON COLUMN PRICE.DPR2 IS '1일전가격';

COMMENT ON COLUMN PRICE.DAY3 IS '1개월전일자';

COMMENT ON COLUMN PRICE.DPR3 IS '1개월전가격';

COMMENT ON COLUMN PRICE.DAY4 IS '1년전일자';

COMMENT ON COLUMN PRICE.DPR4 IS '1년전가격';

COMMENT ON COLUMN PRICE.DIRECTION IS '등락여부';

COMMENT ON COLUMN PRICE.VALUE IS '등락율';

COMMENT ON COLUMN PRICE.RESULT_CODE IS '결과코드';

CREATE UNIQUE INDEX PK_PRICE
	ON PRICE (
		PRODUCTNO ASC
	);

ALTER TABLE PRICE
	ADD
		CONSTRAINT PK_PRICE
		PRIMARY KEY (
			PRODUCTNO
		);

/* 신고 */
CREATE TABLE REPORT (
	REPORT_NO INT NOT NULL, /* 신고번호 */
	REPORT_ID VARCHAR2(30) NOT NULL, /* 신고회원아이디 */
	REPORT_TITLE VARCHAR2(30) NOT NULL, /* 신고제목 */
	REPORT_REASON VARCHAR2(500) NOT NULL, /* 신고내용 */
	REPORT_RESULT VARCHAR2(1) NOT NULL, /* 신고처리결과 */
	USER_ID VARCHAR2(100) /* 회원아이디 */
);

COMMENT ON TABLE REPORT IS '신고';

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고번호';

COMMENT ON COLUMN REPORT.REPORT_ID IS '신고회원아이디';

COMMENT ON COLUMN REPORT.REPORT_TITLE IS '신고제목';

COMMENT ON COLUMN REPORT.REPORT_REASON IS '신고내용';

COMMENT ON COLUMN REPORT.REPORT_RESULT IS '신고처리결과';

COMMENT ON COLUMN REPORT.USER_ID IS '회원아이디';

CREATE UNIQUE INDEX PK_REPORT
	ON REPORT (
		REPORT_NO ASC
	);

ALTER TABLE REPORT
	ADD
		CONSTRAINT PK_REPORT
		PRIMARY KEY (
			REPORT_NO
		);

/* 댓글 */
CREATE TABLE REPLY (
	REPLY_NO INT NOT NULL, /* 댓글번호 */
	BOARD_NO INT, /* 게시글번호 */
	REPLY_CONTENT VARCHAR2(300) NOT NULL, /* 댓글내용 */
	REPLY_DATE DATE NOT NULL, /* 댓글등록일 */
	RELPY_STATUS VARCHAR2(1) NOT NULL /* 댓글상태 */
);

COMMENT ON TABLE REPLY IS '댓글';

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글번호';

COMMENT ON COLUMN REPLY.BOARD_NO IS '게시글번호';

COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '댓글내용';

COMMENT ON COLUMN REPLY.REPLY_DATE IS '댓글등록일';

COMMENT ON COLUMN REPLY.RELPY_STATUS IS '댓글상태';

CREATE UNIQUE INDEX PK_REPLY
	ON REPLY (
		REPLY_NO ASC
	);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			REPLY_NO
		);

/* 리뷰 */
CREATE TABLE REVIEW (
	REVIEW_NO INT NOT NULL, /* 리뷰번호 */
	USER_ID VARCHAR2(100), /* 회원아이디 */
	REVIEW_DATE DATE NOT NULL, /* 리뷰작성일 */
	REVIEW_CONTENT VARCHAR2(300) NOT NULL, /* 리뷰내용 */
	REVIEW_DELIVERY INT NOT NULL, /* 배송별점 */
	REVIEW_QUALITY INT NOT NULL, /* 품질별점 */
	TRADE_NO INT /* 거래글번호 */
);

COMMENT ON TABLE REVIEW IS '리뷰';

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰번호';

COMMENT ON COLUMN REVIEW.USER_ID IS '회원아이디';

COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '리뷰작성일';

COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '리뷰내용';

COMMENT ON COLUMN REVIEW.REVIEW_DELIVERY IS '배송별점';

COMMENT ON COLUMN REVIEW.REVIEW_QUALITY IS '품질별점';

COMMENT ON COLUMN REVIEW.TRADE_NO IS '거래글번호';

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		REVIEW_NO ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			REVIEW_NO
		);

/* 거래글등록(매도인) */
CREATE TABLE TRADE (
	TRADE_NO INT NOT NULL, /* 거래글번호 */
	PRODUCT_CONTENT CLOB, /* 거래글내용 */
	PRODUCT_PRICE NUMBER, /* 거래가격 */
	PRODUCT_CATEGORY NUMBER NOT NULL, /* 거래카테고리 */
	PRODUCT_KIND NUMBER NOT NULL, /* 거래말머리구분 */
	PRODUCT_STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 거래글상태 */
	PRODUCT_DATE DATE DEFAULT SYSDATE NOT NULL, /* 거래등록일 */
	USER_ID VARCHAR2(100) NOT NULL, /* 회원아이디 */
	PRODUCTNO VARCHAR2(3) NOT NULL, /* 품목코드 */
	FUNDING_MINIMUM VARCHAR2(4), /* 펀딩최소달성 */
	FUNDING_PERIOD DATE, /* 펀딩모집기간 */
	FUNDING_PERIOD_END DATE, /* 펀딩모집종료기간 */
	HARVEST_SCHEDULED DATE, /* 수확예정시기 */
	FUNDING_PARTICIPANTS VARCHAR2(4) /* 펀딩참여자수 */
);

COMMENT ON TABLE TRADE IS '거래글등록(매도인)';

COMMENT ON COLUMN TRADE.TRADE_NO IS '거래글번호';

COMMENT ON COLUMN TRADE.PRODUCT_CONTENT IS '거래글내용';

COMMENT ON COLUMN TRADE.PRODUCT_PRICE IS '거래가격';

COMMENT ON COLUMN TRADE.PRODUCT_CATEGORY IS '거래카테고리';

COMMENT ON COLUMN TRADE.PRODUCT_KIND IS '1:판매/2:구매/3:교환';

COMMENT ON COLUMN TRADE.PRODUCT_STATUS IS '거래글상태';

COMMENT ON COLUMN TRADE.PRODUCT_DATE IS '거래등록일';

COMMENT ON COLUMN TRADE.USER_ID IS '회원아이디';

COMMENT ON COLUMN TRADE.PRODUCTNO IS '품목코드';

COMMENT ON COLUMN TRADE.FUNDING_MINIMUM IS '펀딩최소달성';

COMMENT ON COLUMN TRADE.FUNDING_PERIOD IS '펀딩모집기간';

COMMENT ON COLUMN TRADE.FUNDING_PERIOD_END IS '펀딩모집종료기간';

COMMENT ON COLUMN TRADE.HARVEST_SCHEDULED IS '수확예정시기';

COMMENT ON COLUMN TRADE.FUNDING_PARTICIPANTS IS '펀딩참여자수';

CREATE UNIQUE INDEX PK_TRADE
	ON TRADE (
		TRADE_NO ASC
	);

ALTER TABLE TRADE
	ADD
		CONSTRAINT PK_TRADE
		PRIMARY KEY (
			TRADE_NO
		);

/* 거래경매요청(사업자) */
CREATE TABLE AUCTION (
	AUCTION_NO INT NOT NULL, /* 경매요청번호 */
	TRADE_NO INT NOT NULL, /* 거래글번호 */
	AUCTION_SIZE VARCHAR2(20) NOT NULL, /* 요청평수 */
	AUCTION_ITEM VARCHAR2(30) NOT NULL, /* 요청작물 */
	AUCTION_PRICE VARCHAR2(30) NOT NULL, /* 요청금액 */
	AUCTION_RESULT VARCHAR2(1) NOT NULL, /* 요청결과 */
	AUCTION_STATUS VARCHAR2(1) NOT NULL /* 요청상태 */
);

COMMENT ON TABLE AUCTION IS '거래경매요청(사업자)';

COMMENT ON COLUMN AUCTION.AUCTION_NO IS '경매요청번호';

COMMENT ON COLUMN AUCTION.TRADE_NO IS '거래글번호';

COMMENT ON COLUMN AUCTION.AUCTION_SIZE IS '요청평수';

COMMENT ON COLUMN AUCTION.AUCTION_ITEM IS '요청작물';

COMMENT ON COLUMN AUCTION.AUCTION_PRICE IS '요청금액';

COMMENT ON COLUMN AUCTION.AUCTION_RESULT IS '요청결과';

COMMENT ON COLUMN AUCTION.AUCTION_STATUS IS '요청상태';

CREATE UNIQUE INDEX PK_AUCTION
	ON AUCTION (
		AUCTION_NO ASC
	);

ALTER TABLE AUCTION
	ADD
		CONSTRAINT PK_AUCTION
		PRIMARY KEY (
			AUCTION_NO
		);

/* 펀딩요청(매수인) */
CREATE TABLE FUNDIND (
	FUNDING_NO INT NOT NULL, /* 펀딩요청번호 */
	USER_ID VARCHAR2(100) NOT NULL, /* 회원아이디 */
	TRADE_NO INT NOT NULL, /* 거래글번호 */
	FUNDING_FIELD VARCHAR2(20) NOT NULL, /* 펀딩평수 */
	FUNDING_RQ VARCHAR2(100), /* 요청사항 */
	PRODUCT_RECEIPT VARCHAR2(40), /* 상품수령방법 */
	FUNDING_RQ_DATE DATE NOT NULL /* 펀딩요청일 */
);

COMMENT ON TABLE FUNDIND IS '펀딩요청(매수인)';

COMMENT ON COLUMN FUNDIND.FUNDING_NO IS '펀딩요청번호';

COMMENT ON COLUMN FUNDIND.USER_ID IS '회원아이디';

COMMENT ON COLUMN FUNDIND.TRADE_NO IS '거래글번호';

COMMENT ON COLUMN FUNDIND.FUNDING_FIELD IS '펀딩평수';

COMMENT ON COLUMN FUNDIND.FUNDING_RQ IS '요청사항';

COMMENT ON COLUMN FUNDIND.PRODUCT_RECEIPT IS '상품수령방법';

COMMENT ON COLUMN FUNDIND.FUNDING_RQ_DATE IS '펀딩요청일';

CREATE UNIQUE INDEX PK_FUNDIND
	ON FUNDIND (
		FUNDING_NO ASC
	);

ALTER TABLE FUNDIND
	ADD
		CONSTRAINT PK_FUNDIND
		PRIMARY KEY (
			FUNDING_NO
		);

/* 비규격품구매요청(매수인) */
CREATE TABLE PURCHASE (
	PURCHASE_NO INT NOT NULL, /* 거래요청번호 */
	USER_ID VARCHAR2(100) NOT NULL, /* 회원아이디 */
	TRADE_NO INT NOT NULL, /* 거래글번호 */
	PURCHASE_KG VARCHAR2(20) NOT NULL, /* 구매요청중량 */
	PURCHASE_RQ VARCHAR2(100), /* 요청사항 */
	PURCHASE_RQ_DATE DATE NOT NULL /* 비규격품구매요청일 */
);

COMMENT ON TABLE PURCHASE IS '비규격품구매요청(매수인)';

COMMENT ON COLUMN PURCHASE.PURCHASE_NO IS '거래요청번호';

COMMENT ON COLUMN PURCHASE.USER_ID IS '회원아이디';

COMMENT ON COLUMN PURCHASE.TRADE_NO IS '거래글번호';

COMMENT ON COLUMN PURCHASE.PURCHASE_KG IS '구매요청중량';

COMMENT ON COLUMN PURCHASE.PURCHASE_RQ IS '요청사항';

COMMENT ON COLUMN PURCHASE.PURCHASE_RQ_DATE IS '비규격품구매요청일';

CREATE UNIQUE INDEX PK_PURCHASE
	ON PURCHASE (
		PURCHASE_NO ASC
	);

ALTER TABLE PURCHASE
	ADD
		CONSTRAINT PK_PURCHASE
		PRIMARY KEY (
			PURCHASE_NO
		);

/* 이미지 */
CREATE TABLE IMAGE (
	TRADE_NO INT, /* 거래글번호 */
	IMG_KIND INT NOT NULL, /* 이미지종류 */
	IMG_CREATE_DT DATE DEFAULT SYSDATE NOT NULL, /* 이미지등록일 */
	IMG_ORGN_NM VARCHAR2(50) NOT NULL, /* 이미지기본파일명 */
	IMG_CHNG_NM VARCHAR2(50) NOT NULL, /* 이미지변경파일명 */
	IMG_STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 이미지상태 */
	IMG_PATH VARCHAR2(200) NOT NULL, /* 이미지경로 */
	IMG_THUMBNAIL INT DEFAULT 1 NOT NULL, /* 썸네일 */
	IMG_NO INT NOT NULL, /* 이미지번호 */
	BOARD_NO INT, /* 게시글번호 */
	REVIEW_NO INT /* 리뷰번호 */
);

COMMENT ON TABLE IMAGE IS '이미지';

COMMENT ON COLUMN IMAGE.TRADE_NO IS '거래글번호';

COMMENT ON COLUMN IMAGE.IMG_KIND IS 'PROFILE ''1'',  VOUCHER DOCUMENT ''2'', PRODUCT IMAGE ''3'' ';

COMMENT ON COLUMN IMAGE.IMG_CREATE_DT IS '이미지등록일';

COMMENT ON COLUMN IMAGE.IMG_ORGN_NM IS '이미지기본파일명';

COMMENT ON COLUMN IMAGE.IMG_CHNG_NM IS '이미지변경파일명';

COMMENT ON COLUMN IMAGE.IMG_STATUS IS '이미지상태';

COMMENT ON COLUMN IMAGE.IMG_PATH IS '이미지경로';

COMMENT ON COLUMN IMAGE.IMG_THUMBNAIL IS '썸네일';

COMMENT ON COLUMN IMAGE.IMG_NO IS '이미지번호';

COMMENT ON COLUMN IMAGE.BOARD_NO IS '게시글번호';

COMMENT ON COLUMN IMAGE.REVIEW_NO IS '리뷰번호';

CREATE UNIQUE INDEX PK_IMAGE
	ON IMAGE (
		IMG_NO ASC
	);

ALTER TABLE IMAGE
	ADD
		CONSTRAINT PK_IMAGE
		PRIMARY KEY (
			IMG_NO
		);

ALTER TABLE IMAGE
	ADD
		CONSTRAINT IMG_STATUS_CHK
		CHECK (IMG_STATUS IN ('Y', 'N'););

/* 토지정보(매도인) */
CREATE TABLE FIELDINFO (
	FIELD_NO INT NOT NULL, /* 토지고유번호 */
	FIELD_OWNER VARCHAR2(30) NOT NULL, /* 토지소유자 */
	FIELD_ADDRESS VARCHAR2(100) NOT NULL, /* 토지주소 */
	FIELD_SIZE VARCHAR2(20) NOT NULL, /* 토지평수 */
	DOC_NO INT NOT NULL /* 증빙서류번호 */
);

COMMENT ON TABLE FIELDINFO IS '토지정보(매도인)';

COMMENT ON COLUMN FIELDINFO.FIELD_NO IS '토지고유번호';

COMMENT ON COLUMN FIELDINFO.FIELD_OWNER IS '토지소유자';

COMMENT ON COLUMN FIELDINFO.FIELD_ADDRESS IS '토지주소';

COMMENT ON COLUMN FIELDINFO.FIELD_SIZE IS '토지평수';

COMMENT ON COLUMN FIELDINFO.DOC_NO IS '증빙서류번호';

CREATE UNIQUE INDEX PK_FIELDINFO
	ON FIELDINFO (
		FIELD_NO ASC
	);

ALTER TABLE FIELDINFO
	ADD
		CONSTRAINT PK_FIELDINFO
		PRIMARY KEY (
			FIELD_NO
		);

ALTER TABLE DOCUMENT
	ADD
		CONSTRAINT FK_USER_TO_DOCUMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_USER_TO_BOARD
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_USER_TO_PAYMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE CONTRACT
	ADD
		CONSTRAINT FK_USER_TO_CONTRACT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE CONTRACT
	ADD
		CONSTRAINT FK_FUNDIND_TO_CONTRACT
		FOREIGN KEY (
			FUNDING_NO
		)
		REFERENCES FUNDIND (
			FUNDING_NO
		);

ALTER TABLE CONTRACT
	ADD
		CONSTRAINT FK_AUCTION_TO_CONTRACT
		FOREIGN KEY (
			AUCTION_NO
		)
		REFERENCES AUCTION (
			AUCTION_NO
		);

ALTER TABLE CONTRACT
	ADD
		CONSTRAINT FK_IMAGE_TO_CONTRACT
		FOREIGN KEY (
			IMG_NO
		)
		REFERENCES IMAGE (
			IMG_NO
		);

ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_USER_TO_REPORT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_BOARD_TO_REPLY
		FOREIGN KEY (
			BOARD_NO
		)
		REFERENCES BOARD (
			BOARD_NO
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_USER_TO_REVIEW
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_TRADE_TO_REVIEW
		FOREIGN KEY (
			TRADE_NO
		)
		REFERENCES TRADE (
			TRADE_NO
		);

ALTER TABLE TRADE
	ADD
		CONSTRAINT FK_USER_TO_TRADE
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE TRADE
	ADD
		CONSTRAINT FK_PRICE_TO_TRADE
		FOREIGN KEY (
			PRODUCTNO
		)
		REFERENCES PRICE (
			PRODUCTNO
		);

ALTER TABLE AUCTION
	ADD
		CONSTRAINT FK_TRADE_TO_AUCTION
		FOREIGN KEY (
			TRADE_NO
		)
		REFERENCES TRADE (
			TRADE_NO
		);

ALTER TABLE FUNDIND
	ADD
		CONSTRAINT FK_USER_TO_FUNDIND
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE FUNDIND
	ADD
		CONSTRAINT FK_TRADE_TO_FUNDIND
		FOREIGN KEY (
			TRADE_NO
		)
		REFERENCES TRADE (
			TRADE_NO
		);

ALTER TABLE PURCHASE
	ADD
		CONSTRAINT FK_USER_TO_PURCHASE
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE PURCHASE
	ADD
		CONSTRAINT FK_TRADE_TO_PURCHASE
		FOREIGN KEY (
			TRADE_NO
		)
		REFERENCES TRADE (
			TRADE_NO
		);

ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_TRADE_TO_IMAGE
		FOREIGN KEY (
			TRADE_NO
		)
		REFERENCES TRADE (
			TRADE_NO
		);

ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_BOARD_TO_IMAGE
		FOREIGN KEY (
			BOARD_NO
		)
		REFERENCES BOARD (
			BOARD_NO
		);

ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_REVIEW_TO_IMAGE
		FOREIGN KEY (
			REVIEW_NO
		)
		REFERENCES REVIEW (
			REVIEW_NO
		);

ALTER TABLE FIELDINFO
	ADD
		CONSTRAINT FK_DOCUMENT_TO_FIELDINFO
		FOREIGN KEY (
			DOC_NO
		)
		REFERENCES DOCUMENT (
			DOC_NO
		);