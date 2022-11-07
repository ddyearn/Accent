
DROP SEQUENCE sequence_member_id;

DROP SEQUENCE sequence_product_id;

DROP TABLE Purchase CASCADE CONSTRAINTS PURGE;

DROP TABLE Qna_answer CASCADE CONSTRAINTS PURGE;

DROP TABLE Qna CASCADE CONSTRAINTS PURGE;

DROP TABLE Review CASCADE CONSTRAINTS PURGE;

DROP TABLE Cart CASCADE CONSTRAINTS PURGE;

DROP TABLE Product CASCADE CONSTRAINTS PURGE;

DROP TABLE Member CASCADE CONSTRAINTS PURGE;

CREATE TABLE Member
(
	member_id            VARCHAR2(30)  NOT NULL ,
	pwd                  VARCHAR2(200)  NULL ,
	email                VARCHAR2(30)  NULL ,
	tel                  VARCHAR2(30)  NULL ,
	name                 VARCHAR2(30)  NULL ,
	gender               VARCHAR2(30)  NULL ,
	addr                 VARCHAR2(100)  NULL ,
	admin                VARCHAR2(10)  NULL ,
	preference           VARCHAR2(30)  NULL ,
	postcode             VARCHAR2(30)  NULL ,
	residentNum          CHAR(18)  NULL ,
	searchData           CHAR(18)  NULL 
);

CREATE UNIQUE INDEX XPKMember ON Member
(member_id   ASC);

ALTER TABLE Member
	ADD CONSTRAINT  XPKMember PRIMARY KEY (member_id);

CREATE TABLE Purchase
(
	order_id             NUMBER(20,0)  NOT NULL ,
	name                 VARCHAR2(30)  NULL ,
	postcode             VARCHAR2(30)  NULL ,
	addr                 VARCHAR2(100)  NULL ,
	tel                  VARCHAR2(50)  NULL ,
	memo                 VARCHAR2(100)  NULL ,
	date_raised          DATE  NULL ,
	total_price          VARCHAR2(50)  NULL ,
	status               NUMBER(10)  NULL ,
	date_closed          DATE  NULL ,
	date_cancelled       DATE  NULL ,
	member_id            VARCHAR2(30)  NULL 
);

CREATE UNIQUE INDEX XPKOrder ON Purchase
(order_id   ASC);

ALTER TABLE Purchase
	ADD CONSTRAINT  XPKOrder PRIMARY KEY (order_id);

CREATE TABLE Product
(
	product_id           NUMBER  NOT NULL ,
	category             CHAR(20)  NULL ,
	keyword              CHAR(20)  NULL ,
	name                 CHAR(20)  NULL ,
	price                DECIMAL(19,4)  NULL ,
	info                 LONG  NULL ,
	image                ORDImage  NULL ,
	review               ORDDoc  NULL ,
	amount               CHAR(18)  NULL 
);

CREATE UNIQUE INDEX XPKProduct ON Product
(product_id   ASC);

ALTER TABLE Product
	ADD CONSTRAINT  XPKProduct PRIMARY KEY (product_id);

CREATE TABLE Qna
(
	title                VARCHAR2(100)  NULL ,
	content              VARCHAR2(500)  NULL ,
	date                 DATE  NULL ,
	author               VARCHAR2(30)  NULL ,
	product_id           NUMBER  NULL ,
	question_id          CHAR(18)  NOT NULL 
);

CREATE UNIQUE INDEX XPKQna ON Qna
(question_id   ASC);

ALTER TABLE Qna
	ADD CONSTRAINT  XPKQna PRIMARY KEY (question_id);

CREATE TABLE Qna_answer
(
	answer_id            NUMBER(20)  NOT NULL ,
	content              CHAR(100)  NULL ,
	creationDate         DATE  NULL ,
	title                CHAR(100)  NULL ,
	question_id          CHAR(18)  NULL 
);

CREATE UNIQUE INDEX XPKQna_answer ON Qna_answer
(answer_id   ASC);

ALTER TABLE Qna_answer
	ADD CONSTRAINT  XPKQna_answer PRIMARY KEY (answer_id);

CREATE TABLE Review
(
	review_id            NUMBER(20)  NOT NULL ,
	content              VARCHAR2(500)  NULL ,
	author               VARCHAR2(30)  NULL ,
	date_created         DATE  NULL ,
	product_id           NUMBER  NULL 
);

CREATE UNIQUE INDEX XPKReview ON Review
(review_id   ASC);

ALTER TABLE Review
	ADD CONSTRAINT  XPKReview PRIMARY KEY (review_id);

CREATE TABLE Cart
(
	cart_id              NUMBER(20)  NOT NULL ,
	quantity             NUMBER(30)  NULL ,
	member_id            VARCHAR2(30)  NULL ,
	product_id           NUMBER  NULL 
);

CREATE UNIQUE INDEX XPKCart ON Cart
(cart_id   ASC);

ALTER TABLE Cart
	ADD CONSTRAINT  XPKCart PRIMARY KEY (cart_id);

CREATE VIEW Member_info ( member_id,gender,birth ) 
	 AS  SELECT Expr_408,Expr_407,Expr_410
		FROM Member ;

ALTER TABLE Purchase
	ADD (
CONSTRAINT R_26 FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE SET NULL);

ALTER TABLE Qna
	ADD (
CONSTRAINT R_17 FOREIGN KEY (product_id) REFERENCES Product (product_id) ON DELETE SET NULL);

ALTER TABLE Qna_answer
	ADD (
CONSTRAINT R_20 FOREIGN KEY (question_id) REFERENCES Qna (question_id) ON DELETE SET NULL);

ALTER TABLE Review
	ADD (
CONSTRAINT R_23 FOREIGN KEY (product_id) REFERENCES Product (product_id) ON DELETE SET NULL);

ALTER TABLE Cart
	ADD (
CONSTRAINT R_15 FOREIGN KEY (product_id) REFERENCES Product (product_id) ON DELETE SET NULL);

ALTER TABLE Cart
	ADD (
CONSTRAINT R_10 FOREIGN KEY (member_id) REFERENCES Member (member_id) ON DELETE SET NULL);

CREATE  TRIGGER  tD_Member AFTER DELETE ON Member for each row
-- erwin Builtin Trigger
-- DELETE trigger on Member 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Member  Purchase on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00016813", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Purchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="member_id" */
    UPDATE Purchase
      SET
        /* %SetFK(Purchase,NULL) */
        Purchase.member_id = NULL
      WHERE
        /* %JoinFKPK(Purchase,:%Old," = "," AND") */
        Purchase.member_id = :old.member_id;

    /* erwin Builtin Trigger */
    /* Member  Cart on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="member_id" */
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.member_id = NULL
      WHERE
        /* %JoinFKPK(Cart,:%Old," = "," AND") */
        Cart.member_id = :old.member_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Member AFTER UPDATE ON Member for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Member 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Member  Purchase on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0001a4bf", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Purchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="member_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.member_id <> :new.member_id
  THEN
    UPDATE Purchase
      SET
        /* %SetFK(Purchase,NULL) */
        Purchase.member_id = NULL
      WHERE
        /* %JoinFKPK(Purchase,:%Old," = ",",") */
        Purchase.member_id = :old.member_id;
  END IF;

  /* Member  Cart on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="member_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.member_id <> :new.member_id
  THEN
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.member_id = NULL
      WHERE
        /* %JoinFKPK(Cart,:%Old," = ",",") */
        Cart.member_id = :old.member_id;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Purchase BEFORE INSERT ON Purchase for each row
-- erwin Builtin Trigger
-- INSERT trigger on Purchase 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Member  Purchase on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000d5b9", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Purchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="member_id" */
    UPDATE Purchase
      SET
        /* %SetFK(Purchase,NULL) */
        Purchase.member_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Member
            WHERE
              /* %JoinFKPK(:%New,Member," = "," AND") */
              :new.member_id = Member.member_id
        ) 
        /* %JoinPKPK(Purchase,:%New," = "," AND") */
         and Purchase.order_id = :new.order_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Purchase AFTER UPDATE ON Purchase for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Purchase 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Member  Purchase on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000f7b0", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Purchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="member_id" */
  SELECT count(*) INTO NUMROWS
    FROM Member
    WHERE
      /* %JoinFKPK(:%New,Member," = "," AND") */
      :new.member_id = Member.member_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.member_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Purchase because Member does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Product AFTER DELETE ON Product for each row
-- erwin Builtin Trigger
-- DELETE trigger on Product 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Product  Review on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00022ab3", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="product_id" */
    UPDATE Review
      SET
        /* %SetFK(Review,NULL) */
        Review.product_id = NULL
      WHERE
        /* %JoinFKPK(Review,:%Old," = "," AND") */
        Review.product_id = :old.product_id;

    /* erwin Builtin Trigger */
    /* Product  Qna on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Qna"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="product_id" */
    UPDATE Qna
      SET
        /* %SetFK(Qna,NULL) */
        Qna.product_id = NULL
      WHERE
        /* %JoinFKPK(Qna,:%Old," = "," AND") */
        Qna.product_id = :old.product_id;

    /* erwin Builtin Trigger */
    /* Product  Cart on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="product_id" */
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.product_id = NULL
      WHERE
        /* %JoinFKPK(Cart,:%Old," = "," AND") */
        Cart.product_id = :old.product_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Product AFTER UPDATE ON Product for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Product 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Product  Review on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0002861b", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="product_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.product_id <> :new.product_id
  THEN
    UPDATE Review
      SET
        /* %SetFK(Review,NULL) */
        Review.product_id = NULL
      WHERE
        /* %JoinFKPK(Review,:%Old," = ",",") */
        Review.product_id = :old.product_id;
  END IF;

  /* Product  Qna on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Qna"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="product_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.product_id <> :new.product_id
  THEN
    UPDATE Qna
      SET
        /* %SetFK(Qna,NULL) */
        Qna.product_id = NULL
      WHERE
        /* %JoinFKPK(Qna,:%Old," = ",",") */
        Qna.product_id = :old.product_id;
  END IF;

  /* Product  Cart on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="product_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.product_id <> :new.product_id
  THEN
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.product_id = NULL
      WHERE
        /* %JoinFKPK(Cart,:%Old," = ",",") */
        Cart.product_id = :old.product_id;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Qna AFTER DELETE ON Qna for each row
-- erwin Builtin Trigger
-- DELETE trigger on Qna 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Qna  Qna_answer on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000c1a4", PARENT_OWNER="", PARENT_TABLE="Qna"
    CHILD_OWNER="", CHILD_TABLE="Qna_answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="question_id" */
    UPDATE Qna_answer
      SET
        /* %SetFK(Qna_answer,NULL) */
        Qna_answer.question_id = NULL
      WHERE
        /* %JoinFKPK(Qna_answer,:%Old," = "," AND") */
        Qna_answer.question_id = :old.question_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Qna BEFORE INSERT ON Qna for each row
-- erwin Builtin Trigger
-- INSERT trigger on Qna 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Product  Qna on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000d43a", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Qna"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="product_id" */
    UPDATE Qna
      SET
        /* %SetFK(Qna,NULL) */
        Qna.product_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Product
            WHERE
              /* %JoinFKPK(:%New,Product," = "," AND") */
              :new.product_id = Product.product_id
        ) 
        /* %JoinPKPK(Qna,:%New," = "," AND") */
         and Qna.question_id = :new.question_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Qna AFTER UPDATE ON Qna for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Qna 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Qna  Qna_answer on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0001ea66", PARENT_OWNER="", PARENT_TABLE="Qna"
    CHILD_OWNER="", CHILD_TABLE="Qna_answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="question_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.question_id <> :new.question_id
  THEN
    UPDATE Qna_answer
      SET
        /* %SetFK(Qna_answer,NULL) */
        Qna_answer.question_id = NULL
      WHERE
        /* %JoinFKPK(Qna_answer,:%Old," = ",",") */
        Qna_answer.question_id = :old.question_id;
  END IF;

  /* erwin Builtin Trigger */
  /* Product  Qna on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Qna"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="product_id" */
  SELECT count(*) INTO NUMROWS
    FROM Product
    WHERE
      /* %JoinFKPK(:%New,Product," = "," AND") */
      :new.product_id = Product.product_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.product_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Qna because Product does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Qna_answer BEFORE INSERT ON Qna_answer for each row
-- erwin Builtin Trigger
-- INSERT trigger on Qna_answer 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Qna  Qna_answer on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000f08e", PARENT_OWNER="", PARENT_TABLE="Qna"
    CHILD_OWNER="", CHILD_TABLE="Qna_answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="question_id" */
    UPDATE Qna_answer
      SET
        /* %SetFK(Qna_answer,NULL) */
        Qna_answer.question_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Qna
            WHERE
              /* %JoinFKPK(:%New,Qna," = "," AND") */
              :new.question_id = Qna.question_id
        ) 
        /* %JoinPKPK(Qna_answer,:%New," = "," AND") */
         and Qna_answer.answer_id = :new.answer_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Qna_answer AFTER UPDATE ON Qna_answer for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Qna_answer 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Qna  Qna_answer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000f5a5", PARENT_OWNER="", PARENT_TABLE="Qna"
    CHILD_OWNER="", CHILD_TABLE="Qna_answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="question_id" */
  SELECT count(*) INTO NUMROWS
    FROM Qna
    WHERE
      /* %JoinFKPK(:%New,Qna," = "," AND") */
      :new.question_id = Qna.question_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.question_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Qna_answer because Qna does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Review BEFORE INSERT ON Review for each row
-- erwin Builtin Trigger
-- INSERT trigger on Review 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Product  Review on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000dd1f", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="product_id" */
    UPDATE Review
      SET
        /* %SetFK(Review,NULL) */
        Review.product_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Product
            WHERE
              /* %JoinFKPK(:%New,Product," = "," AND") */
              :new.product_id = Product.product_id
        ) 
        /* %JoinPKPK(Review,:%New," = "," AND") */
         and Review.review_id = :new.review_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Review AFTER UPDATE ON Review for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Review 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Product  Review on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000f95c", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="product_id" */
  SELECT count(*) INTO NUMROWS
    FROM Product
    WHERE
      /* %JoinFKPK(:%New,Product," = "," AND") */
      :new.product_id = Product.product_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.product_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Review because Product does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Cart BEFORE INSERT ON Cart for each row
-- erwin Builtin Trigger
-- INSERT trigger on Cart 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Product  Cart on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001bc44", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="product_id" */
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.product_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Product
            WHERE
              /* %JoinFKPK(:%New,Product," = "," AND") */
              :new.product_id = Product.product_id
        ) 
        /* %JoinPKPK(Cart,:%New," = "," AND") */
         and Cart.cart_id = :new.cart_id;

    /* erwin Builtin Trigger */
    /* Member  Cart on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="member_id" */
    UPDATE Cart
      SET
        /* %SetFK(Cart,NULL) */
        Cart.member_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Member
            WHERE
              /* %JoinFKPK(:%New,Member," = "," AND") */
              :new.member_id = Member.member_id
        ) 
        /* %JoinPKPK(Cart,:%New," = "," AND") */
         and Cart.cart_id = :new.cart_id;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Cart AFTER UPDATE ON Cart for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Cart 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Product  Cart on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ee51", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="product_id" */
  SELECT count(*) INTO NUMROWS
    FROM Product
    WHERE
      /* %JoinFKPK(:%New,Product," = "," AND") */
      :new.product_id = Product.product_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.product_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Cart because Product does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Member  Cart on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Member"
    CHILD_OWNER="", CHILD_TABLE="Cart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="member_id" */
  SELECT count(*) INTO NUMROWS
    FROM Member
    WHERE
      /* %JoinFKPK(:%New,Member," = "," AND") */
      :new.member_id = Member.member_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.member_id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Cart because Member does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/

