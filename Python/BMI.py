wght = float(input("Enter weight (kg)"))
if wght <=10 :
    print ("น้ำหนักเบาไป")
    exit(1)
hght = float(input("Enter height (cm)"))
if hght == 0 :
    print ("เป็นไปไม่ได้")
    exit(2)
hm = hght/100
bmi = wght/hm**2
print ("BMI =",bmi)
if bmi< 18.50 :
    print ("น้ำหนักน้อย/ผอม")
    print ("ภาวะเสี่ยงต่อโรค =","เสี่ยงต่อโรคมากกว่าปกติ")
if bmi >= 18.50 <22.9 :
    print ("ปกติ (สุขภาพดี)")
    print ("ภาวะเสี่ยงต่อโรค =","ปกติ")
if bmi>= 23 <24.9 :
    print ("ท้วม/โรคอ้วนระดับ 1")
    print ("ภาวะเสี่ยงต่อโรค =","อันตรายระดับ 1")
if bmi>= 25 >29.9 :
    print ("อ้วน/โรคอ้วนระดับ 2")
    print ("ภาวะเสี่ยงต่อโรค =","อันตรายระดับ 2")
if bmi>= 30:
    print ("อ้วนมาก/โรคอ้วนระดับ 3")
    print ("ภาวะเสี่ยงต่อโรค =","อันตรายระดับ 3")
