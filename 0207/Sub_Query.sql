USE practice_sql;

-- 서브쿼리 : 쿼리 내부에 위치하는 또 다른 쿼리, 쿼리 결과를 조건이나 테이블로 사용할 수 있도록 함

-- WHERE 절에서 서브쿼리 : 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정 
-- WHERE 절에서 비교 연산으로 사용될 때 조회하는 컬럼의 개수 및 레코드 개수 주의 


SELECT * FROM employee 
WHERE department_code = (
		SELECT code FROM department WHERE name = '인사부'
);		-- SELECT 뒤의 하나의 컬럼(code)를 적어서 비교해야함 여러개의 컬럼(*) 안됨
		-- WHRER name = '인사부' 를 적지않으면 DV, FI, HR라는 코드가 나옴
        -- department_code = DV, FI, HR 코드가 같을 경우는 있을 수 없음 -> 에러

-- FROM 절에서의 서브 쿼리 : 쿼리 결과 테이블을 다시 FROM 절에 사용하여 복합적인 테이블 조회
SELECT * 
FROM (
	SELECT name AS employee_name, department_code FROM employee
	WHERE department_code IS NULL
) AS SQ -- 서브쿼리 사용할 때 이름이 있어야함
WHERE employee_name = '홍길동';

SELECT * 
FROM (
	SELECT name AS employee_name, department_code FROM employee
	WHERE department_code IS NULL
) AS SQ -- 서브쿼리 사용할 때 이름이 있어야함
WHERE name = '홍길동'; -- 서브쿼리에 name 대신 employee_name를 사용하고 있어서 ERROR

-- 부서 이름이 '개발부'인 사원이름, 부서코드, 부서명을 조회 (결과값이 2개 이상의 테이블이 필요하면 join을 사용해야함 - 서브쿼리 사용x)


-- 부서 이름이 '개발부'인 사원이름, 부서코드를 조회 (서브쿼리만으로도 가능)
SELECT name, department_code
FROM employee
WHERE department_code =(
	SELECT code
	FROM department
	WHERE name = '개발부'
);


-- 과일로 만든 아이스크림 













