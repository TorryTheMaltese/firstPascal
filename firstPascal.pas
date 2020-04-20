program firstPascal(input, output);
type
    studentRecord = record
        s_name: String;
        s_class: Integer;
        s_grade: array [1..10] of Integer;
        s_sum: Integer;
    end;

var
    subjects: Integer;
    n: Integer;
    start: Integer;
    students: array [1..100] of studentRecord;
    tmp: studentRecord;

procedure askSubjectsNum(var subjects:Integer);
    begin
        Write('Enter number of Subjects (Max 10) : ');
        ReadLn(subjects);
    end;

procedure addStudent(var students:array of studentRecord; var n:Integer; var subjects:Integer);
    var
        i: Integer;
    begin
        Write('Enter name : ');
        ReadLn(students[n+1].s_name);

        Write('Enter class number : ');
        ReadLn(students[n+1].s_class);

        for i:=1 to subjects do
        begin
            Write('Enter grade ', i, '/', subjects, ' : ');
            ReadLn(students[n+1].s_grade[i]);
            students[n+1].s_sum += students[n+1].s_grade[i];
        end;
        n := n + 1;
    end;
procedure showResult(var n:Integer; var subjects:Integer; var students:array of studentRecord);
    var
        stu, sub : Integer;
    begin
        WriteLn();
        write('num':4,'name':10, 'class':10);
        for sub := 1 to subjects do
        begin
            write(sub:5);
        end;
        write('sum':7);

        WriteLn();
        write('----':4,'----------':10, '----------':10);
        for sub := 1 to subjects do
        begin
            write('-----':5);
        end;
        write('--------':8);
        WriteLn(); 

        for stu := 1 to n do
        begin
            Write(stu:4, students[stu].s_name:10, students[stu].s_class:10);
            for sub := 1 to subjects do
            begin
                write(students[stu].s_grade[sub]:5);
            end;
            write(students[stu].s_sum:7);
            WriteLn(); 
        end;
        WriteLn();
    end;

procedure quickSort(var students:array of studentRecord; var n:Integer; var subjects:Integer; var left:Integer; var right:Integer; var tmp:studentRecord);
    var
        pivot, l, r: Integer;
    begin
        l := left;
        r := right;
        pivot := students[(left + right) div 2].s_sum;

        while l<=r do begin
            while students[l].s_sum < pivot do l+=1;
            while students[r].s_sum > pivot do r-=1;
            if l <= r then begin
                if l <> r then begin
                    tmp := students[l];
                    students[l] := students[r];
                    students[r] := tmp;
                end;
                l+=1; r-=1;
            end;
        end;

        if left < r then quickSort(students, n, subjects, left, r, tmp);
        if l < right then quickSort(students, n, subjects, l, right, tmp);
    end;

begin
    askSubjectsNum(subjects);
    n := 0;
    start := 1;
    while true do begin
    addStudent(students, n, subjects);
    quickSort(students, n, subjects, start, n, tmp);
    showResult(n, subjects, students);
    end;
end.

