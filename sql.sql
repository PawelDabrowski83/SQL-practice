-- 1.	Wybierz numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli EMP.
SELECT deptno, ename, mgr
FROM Emp;

-- 2.	Wybierz wszystkie kolumny z tabeli EMP.
SELECT *
FROM Emp;

-- 3.	Wylicz roczną pensję podstawową dla każdego pracownika.
SELECT ename, 12 * SAL
FROM Emp;

-- 4.	Wylicz roczną pensję podstawową dla każdego pracownika gdyby każdemu dać podwyżkę o 250.
SELECT ename, 12 * (SAL + 250)
FROM Emp;

-- 5.	Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem ROCZNA.
SELECT SAL*12 AS Roczna
FROM Emp;

-- 6.	Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem R PENSJA.
SELECT SAL*12 AS "R PENSJA"
FROM Emp;

-- 7.	Połącz EMPNO i nazwisko, opatrz je nagłówkiem EMPLOYEE.
SELECT empno || ename AS "EMPLOYEE"
FROM Emp;

-- 8.	Utwórz zapytanie zwracające wynik w postaci np. „Kowalski pracuje w dziale 20”.
SELECT INITCAP(ename) || ' pracuje w dziale ' || deptno
FROM Emp;

-- 9.	Wylicz roczną pensję całkowitą dla każdego pracownika (z uwzględnieniem prowizji).
SELECT ename, sal*12 + NVL(comm, 0) AS "Pensja roczna"
FROM Emp;

-- 10.	Wyświetl wszystkie numery departamentów występujące w tabeli EMP.
SELECT deptno
FROM Emp;

-- 11.	Wyświetl wszystkie różne numery departamentów występujące w tabeli EMP.
SELECT DISTINCT deptno
FROM Emp;

-- 12.	Wybierz wszystkie wzajemnie różne kombinacje wartości DEPTNO i JOB.
SELECT DISTINCT deptno, job
FROM Emp;

-- 13.	Posortuj wszystkie dane tabeli EMP według ENAME.
SELECT *
FROM Emp
ORDER BY ename;

-- 14.	Posortuj malejąco wszystkie dane tabeli EMP według daty ich zatrudnienia począwszy od ostatnio zatrudnionych.
SELECT * 
FROM Emp
ORDER BY hiredate DESC;

-- 15.	Posortuj dane tabeli EMP według wzrastających wartości kolumn DEPTNO oraz malejących wartości kolumny SAL (bez wypisywania kolumny SAL).
SELECT empno, ename, job, mgr, hiredate, comm, deptno 
FROM Emp
ORDER BY deptno, sal DESC;

-- 16.	Wybierz nazwiska, numery, stanowiska pracy i numery departamentów wszystkich pracowników zatrudnionych na stanowisku CLERK.
SELECT ename, empno, job, deptno
FROM Emp
WHERE job = 'CLERK';

-- 17.	Wybierz  wszystkie nazwy i numery departamentów większe od nr 20.
SELECT dname, deptno
FROM Dept
WHERE deptno > 20;

-- 18.	Wybierz pracowników, których prowizja przekracza miesięczną pensję.
SELECT *
FROM Emp
WHERE NVL(comm, 0) > sal;

-- 19.	Wybierz dane tych pracowników, których zarobki mieszczą się pomiędzy 1000 a 2000.
SELECT *
FROM Emp
WHERE sal >= 1000 AND sal <= 2000;

-- 20.	Wybierz dane pracowników, których bezpośrednimi szefami  są 7902,7566 lub 7788.
SELECT *
FROM Emp
WHERE mgr = 7902 OR mgr = 7566 OR mgr = 7788;

-- 21.	Wybierz dane tych pracowników, których nazwiska zaczynają się na S.
SELECT *
FROM Emp
WHERE ename LIKE 'S%';

-- 22.	Wybierz dane tych pracowników, których nazwiska są czteroliterowe.
SELECT *
FROM Emp
WHERE ename LIKE '____';

-- 23.	Wybierz dane tych pracowników, którzy nie posiadają szefa.
SELECT *
FROM Emp
WHERE mgr IS NULL;

-- 24.	Wybierz dane tych pracowników, których zarobki są poza przedziałem <1000,2000>.
SELECT *
FROM Emp
WHERE sal < 1000 OR sal > 2000;

-- 25.	Wybierz dane tych pracowników, których nazwiska nie zaczynają się na M.
SELECT *
FROM Emp
WHERE ename NOT LIKE 'M%';

-- 26.	Wybierz dane tych pracowników, którzy mają szefa.
SELECT *
FROM Emp
WHERE mgr IS NOT NULL;

-- 27.	Wybierz dane tych pracowników zatrudnionych na stanowisku CLERK których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM Emp
WHERE job = 'CLERK' AND sal >= 1000 AND sal < 2000;

-- 28.	Wybierz dane pracowników zatrudnionych na stanowisku CLERK albo takich, których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM Emp
WHERE job = 'CLERK' OR sal >= 1000 AND sal < 2000;

-- 29.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensją powyżej 1500 oraz wszystkich pracowników na stanowisku  SALESMAN, niezależnie od pensji.
SELECT *
FROM Emp
WHERE (sal > 1500 AND job = 'MANAGER') OR job = 'SALESMAN';

-- 30.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN lecz zarabiających powyżej 1500.
SELECT *
FROM Emp
WHERE job = 'MANAGER' OR (job='SALESMAN' AND sal > 1500);

-- 31.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich departamentów wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT *
FROM Emp
WHERE job = 'MANAGER'
UNION
SELECT *
FROM Emp
WHERE deptno = 10 AND job = 'CLERK';

-- 32.	Wybierz wszystkie dane z tabeli SALGRADE.
SELECT *
FROM Salgrade;

-- 33.	Wybierz wszystkie dane z tabeli DEPT.
SELECT *
FROM Dept;

-- 34.	Wybierz numery i nazwy departamentów sortując według numerów departamentów.
SELECT deptno, dname
FROM Dept
ORDER BY deptno;

-- 35.	Wybierz wszystkie wzajemnie różne stanowiska pracy.
SELECT DISTINCT job
FROM Emp;

-- 36.	Wybierz dane pracowników zatrudnionych w departamentach 10 i 20 we kolejności alfabetycznej ich nazwisk.
SELECT *
FROM Emp
WHERE deptno = 10 OR deptno = 20
ORDER BY ename;

-- 37.	Wybierz nazwiska pracowników, w których nazwisku występuje ciąg „TH” lub „LL”.
SELECT *
FROM Emp
WHERE ename LIKE '%TH%' OR ename LIKE '%LL%';

-- 38.	Wybierz ENAME, DEPTNO i HIREDATE  tych pracowników, którzy zostali zatrudnieni w 1980 r.
SELECT ename, deptno, hiredate
FROM Emp
WHERE EXTRACT(YEAR FROM hiredate) = 1980;

-- 39.	Wybierz nazwiska, roczną pensję oraz prowizję tych wszystkich sprzedawców, których miesięczna pensja przekracza prowizję.
-- Wyniki posortuj według malejących zarobków, potem nazwisk.
SELECT ename, sal*12, comm
FROM Emp
WHERE sal > NVL(comm, 0)
ORDER BY sal DESC, ename;

-- 1.	Połącz dane z tabel EMP i DEPT przy pomocy warunku złączenia w WHERE.
SELECT *
FROM Emp, Dept
WHERE Emp.deptno = Dept.deptno;

-- 2.	Połącz dane z tabel EMP i DEPT przy pomocy INNER JOIN.
SELECT *
FROM Emp
INNER JOIN Dept ON Dept.deptno = Emp.deptno;

-- 3.	Wybierz nazwiska oraz nazwy departamentów  wszystkich pracowników w kolejności alfabetycznej.
SELECT Emp.ename, Dept.dname
FROM Emp, Dept
WHERE Emp.deptno = Dept.deptno;

-- 4.	Wybierz nazwiska wszystkich pracowników wraz z numerami i nazwami departamentów w których są zatrudnieni.
SELECT Emp.ename, Dept.deptno, Dept.dname
FROM Emp, Dept
WHERE Emp.deptno = Dept.deptno;

-- 5.	Dla pracowników o miesięcznej pensji  powyżej 1500 podaj ich nazwiska, miejsca usytuowania ich departamentów oraz nazwy tych departamentów.
SELECT Emp.ename, Dept.loc, Dept.dname
FROM Emp, Dept
WHERE Emp.deptno = Dept.deptno;

-- 6.	Utwórz listę pracowników podając ich nazwisko, zawód, pensję i klasę zarobkową.
SELECT Emp.ename, Emp.job, Emp.sal, Salgrade.grade
FROM Emp, Salgrade
WHERE Emp.sal >= Salgrade.losal AND Emp.sal <= Salgrade.hisal;

-- 7.	Wybierz informacje o pracownikach, których zarobki odpowiadają klasie zarobkowej 3.
SELECT *
FROM Emp
INNER JOIN Salgrade ON Emp.sal >= Salgrade.losal AND Emp.sal <= Salgrade.hisal
WHERE Salgrade.grade = 3;

-- 8.	Wybierz pracowników zatrudnionych w Dallas.
SELECT *
FROM Emp
JOIN Dept ON Emp.deptno = Dept.deptno
WHERE Dept.loc = 'DALLAS';

-- 9.	Wybierz nazwiska pracowników, nazwy działów i klasę zarobkową.
SELECT Emp.ename, Dept.dname, Salgrade.grade
FROM Emp, Dept, Salgrade
WHERE Emp.sal >= Salgrade.losal AND Emp.sal <= Salgrade.hisal AND Dept.deptno = Emp.deptno;

-- 10.	Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane działu pojawiły się, nawet jeśli nie ma w dziale żadnego pracownika.
SELECT *
FROM Dept
LEFT JOIN Emp ON Dept.deptno = Emp.deptno;

-- 11.	Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane pracownika pojawiły się, nawet jeśli pracownik nie jest przypisany do działu.
SELECT *
FROM Dept
RIGHT JOIN Emp ON Dept.deptno = Emp.deptno;

-- 12.	Wybierz pracowników (nazwisko, numer działu) z działu 30 i 20.Wypisz dział 20 bez nazwisk.
SELECT ename, deptno
FROM Emp
WHERE deptno = 30
UNION ALL
SELECT ' ', deptno
FROM Emp
WHERE deptno = 20;

-- 13.	Wypisz stanowiska występujące w dziale 10 oraz 30.
SELECT DISTINCT Emp.job
FROM Emp, Dept
WHERE Dept.deptno = 10 OR Dept.deptno = 30;

-- 14.	Wypisz stanowiska występujące zarówno w dziale 10 jak i 30.
SELECT job
FROM Emp
WHERE deptno = 10
INTERSECT
SELECT job
FROM Emp
WHERE deptno = 30;

-- 15.	Wypisz stanowiska występujące w dziale 10 a nie występujące w dziale 30.
SELECT job
FROM Emp
WHERE deptno = 10
MINUS
SELECT job
FROM Emp
WHERE deptno = 30;

-- 16.	Wybierz pracowników, którzy zarabiają mniej od swoich kierowników.
SELECT *
FROM Emp e1
JOIN Emp e2 ON e1.mgr = e2.empno
WHERE e1.sal < e2.sal;

-- 17.	Dla każdego pracownika wypisz jego nazwisko oraz nazwisko jego szefa. Posortuj według nazwiska szefa.
SELECT E1.ename, E2.ename
FROM Emp E1
JOIN Emp E2 ON E1.mgr = E2.empno
ORDER BY E2.ename;

-- 1.	Oblicz średni zarobek w firmie.
SELECT ROUND(AVG(sal), 2) AS "Average salary"
FROM Emp;

-- 2.	Znajdź minimalne zarobki na stanowisku CLERK.
SELECT MIN(sal)
FROM Emp
WHERE job = 'CLERK';

-- 3.	Znajdź ilu pracowników zatrudniono w departamencie 20.
SELECT COUNT(*)
FROM Emp
WHERE deptno = 20;

-- 4.	Oblicz średnie zarobki na każdym ze stanowisk pracy.
SELECT job, AVG(sal)
FROM Emp
GROUP BY job;

-- 5.	Oblicz średnie zarobki na każdym ze stanowisk pracy z wyjątkiem stanowiska MANAGER.
SELECT job, AVG(sal)
FROM Emp
WHERE job NOT LIKE 'MANAGER'
GROUP BY job;

-- 6.	Oblicz średnie zarobki na każdym ze stanowisk pracy w każdym departamencie.
SELECT job, deptno, AVG(sal)
FROM Emp
GROUP BY job, deptno;

-- 7.	Dla każdego stanowiska oblicz maksymalne zarobki.
SELECT job, MAX(sal)
FROM Emp
GROUP BY job;

-- 8.	Wybierz średnie zarobki tylko tych departamentów, które zatrudniają więcej niż trzech pracowników.
SELECT deptno, AVG(sal), count(*) AS Employees
FROM Emp
GROUP BY deptno
HAVING count(*) > 3;

-- 9.	Wybierz tylko te stanowiska, na których średni zarobek wynosi 3000 lub więcej.
SELECT job, AVG(sal)
FROM Emp
GROUP BY job
HAVING AVG(sal)>= 3000;

-- 10.	Znajdź średnie miesięczne pensje oraz średnie roczne zarobki dla każdego stanowiska, pamiętaj o prowizji.
SELECT job, AVG((sal+NVL(comm, 0))) AS "Miesieczne", AVG((sal+NVL(comm, 0))*12) AS "Roczne"
FROM Emp
GROUP BY job;

-- 11.	Znajdź różnicę miedzy najwyższą i najniższa pensją.
SELECT MAX(sal) - MIN(sal)
FROM Emp;

-- 12.	Znajdź departamenty zatrudniające powyżej trzech pracowników.
SELECT deptno, COUNT(*) AS Pracownicy
FROM Emp
GROUP BY deptno
HAVING COUNT(*) > 3;

-- 13.	Sprawdź, czy wszystkie numery pracowników są rzeczywiście wzajemnie różne.
SELECT empno
FROM Emp
MINUS
SELECT DISTINCT empno
FROM Emp;

-- 14.	Podaj najniższe pensje  wypłacane podwładnym swoich kierowników. 
-- Wyeliminuj grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj według pensji.

-- 15.	Wypisz ilu pracowników ma dział mający siedzibę w DALLAS.
SELECT COUNT(*)
FROM Emp, Dept
WHERE Emp.deptno = Dept.deptno AND Dept.loc = 'DALLAS';

-- 16.	Podaj maksymalne zarobki dla każdej klasy zarobkowej.
SELECT MAX(Emp.sal)
FROM Emp, Salgrade
WHERE Emp.sal >= Salgrade.losal AND Emp.sal <= Salgrade.hisal
GROUP BY Salgrade.grade
ORDER BY Salgrade.grade;

-- 17.	Sprawdź, które wartości zarobków powtarzają się.
SELECT sal, COUNT(*)
FROM Emp
GROUP BY sal
HAVING COUNT(*) > 1;

-- 18.	Podaj średni zarobek pracowników z drugiej klasy zarobkowej.
SELECT AVG(sal)
FROM Emp, Salgrade
WHERE Emp.sal BETWEEN Salgrade.losal AND Salgrade.hisal AND Salgrade.grade = 2;

-- 19.	Sprawdź ilu podwładnych ma każdy kierownik.
SELECT e2.empno, COUNT(*)
FROM Emp e1, Emp e2
WHERE e1.mgr = e2.empno
GROUP BY e2.empno;

-- 20.	Podaj sumę, którą zarabiają razem wszyscy pracownicy z pierwszej klasy zarobkowej.
SELECT sum(sal)
FROM Emp, Salgrade
WHERE Emp.sal BETWEEN Salgrade.losal AND Salgrade.hisal AND Salgrade.grade = 1;

-- 1.	Znajdź pracowników z pensją równą minimalnemu zarobkowi w firmie.
SELECT *
FROM Emp
WHERE sal = (SELECT MIN(sal) FROM Emp);

-- 2.	Znajdź wszystkich pracowników zatrudnionych na tym samym stanowisku co BLAKE.
SELECT *
FROM Emp
WHERE job = (SELECT job FROM Emp WHERE ename = 'BLAKE');

-- 3.	Znajdź pracowników o pensjach z listy najniższych zarobków osiągalnych w departamentach.
SELECT *
FROM Emp
WHERE sal IN (SELECT MIN(sal) FROM Emp GROUP BY deptno);

-- 4.	Znajdź pracowników o najniższych zarobkach w ich departamentach.
SELECT *
FROM Emp
WHERE sal IN (SELECT MIN(sal) FROM Emp GROUP BY deptno);

-- 5.	Stosując operator ANY wybierz pracowników zarabiających powyżej najniższego zarobku z departamentu 30.
SELECT *
FROM Emp
WHERE sal > (SELECT MIN(sal) FROM Emp WHERE deptno = 30);

-- 6.	Znajdź pracowników, których zarobki są wyższe od pensji każdego pracownika z departamentu 30.
SELECT *
FROM Emp
WHERE sal > (SELECT MAX(sal) FROM Emp WHERE deptno = 30);

-- 7.	Wybierz departamenty, których średnie zarobki przekraczają średni zarobek departamentu 30.
SELECT deptno, AVG(sal) AS Average
FROM Emp
WHERE sal > (SELECT AVG(sal) FROM Emp WHERE deptno = 30)
GROUP BY deptno;

-- 8.	Znajdź stanowisko, na którym są najwyższe średnie zarobki.
SELECT *
FROM(
SELECT job, AVG(sal) As Average
FROM Emp
GROUP BY job
ORDER BY Average DESC
)
WHERE ROWNUM = 1;

-- 9.	Znajdź pracowników, których zarobki przekraczają najwyższe pensje z departamentu SALES.
SELECT *
FROM Emp
WHERE sal > (SELECT MAX(sal) FROM Emp, Dept WHERE Emp.deptno = Dept.deptno AND Dept.dname = 'SALES');

-- 10.	Znajdź pracowników, którzy zarabiają powyżej średniej w ich departamentach.
SELECT *
FROM Emp e1
WHERE sal > (SELECT AVG(sal) FROM Emp e2 WHERE e2.deptno = e1.deptno);

-- 11.	Znajdź pracowników, którzy posiadają podwładnych za pomocą operatora EXISTS.
SELECT *
FROM Emp e1
WHERE EXISTS(SELECT 1 FROM Emp e2 WHERE e2.empno = e1.mgr);

-- 12.	Znajdź pracowników, których departament nie występuje w tabeli DEPT.
SELECT *
FROM Emp e1
WHERE NOT EXISTS (SELECT 1 FROM Dept WHERE deptno = e1.deptno);

-- 13.	Wskaż dla każdego departamentu ostatnio zatrudnionych pracowników. Uporządkuj według dat zatrudnienia.
SELECT ename, hiredate, deptno
FROM Emp e1
WHERE hiredate = (SELECT MIN(hiredate) FROM Emp e2 WHERE e1.deptno = e2.deptno)
ORDER BY hiredate;

-- 14.	Podaj ename, sal i deptno dla pracowników, których zarobki przekraczają średnią ich departamentów.
SELECT ename, sal, deptno
FROM Emp e1
WHERE sal > (SELECT AVG(sal) FROM Emp e2 WHERE e1.deptno = e2.deptno);

-- 15.	Stosując podzapytanie znajdź departamenty, w których nikt nie pracuje.
SELECT *
FROM Dept d1
WHERE NOT EXISTS (SELECT 1 FROM Emp e1 WHERE d1.deptno = e1.deptno);

-- 16.	Napisz zapytanie zwracające procentowy udział liczby pracowników w każdym dziale.
SELECT DISTINCT d1.deptno, d1.dname, 
CONCAT(
    TO_CHAR(
             ((SELECT COUNT (*) FROM Emp e2 WHERE e2.deptno = d1.deptno) / 
             (SELECT COUNT(*) FROM Emp WHERE deptno IS NOT NULL) * 100),
             'fm990D000'
             
             )
            
    , '%') AS Percentage
FROM Dept d1, Emp e1;

