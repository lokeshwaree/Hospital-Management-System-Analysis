create database HMS

USE HMS

CREATE TABLE PATIENT(
PatientID CHAR(5),
Fname VARCHAR(10),
Lname VARCHAR(10),
Contact VARCHAR(15),
Age INT)

INSERT INTO PATIENT
(PatientID, Fname, Lname, Contact, Age)
VALUES
('P0001', 'John', 'Doe', '123-456-7890', 35),
('P0002', 'Jane', 'Smith', '987-654-3210', 25),
('P0003', 'Michael', 'Johnson', '555-555-5555', 62),
('P0004', 'David', 'Lee', '111-222-3333', 33),
('P0005', 'Sarah', 'Brown', '444-555-6666', 21),
('P0006', 'John', 'Doe', '777-888-9999', 28),
('P0007', 'Jane', 'Smith', '333-222-1111', 30),
('P0008', 'Michael', 'Johnson', '666-777-8888', 41),
('P0009', 'David', 'Lee', '999-888-7777', 41),
('P0010', 'Sarah', 'Brown', '222-333-4444', 60);

SELECT * FROM PATIENT

CREATE TABLE DOCTOR (
    DoctorID VARCHAR(10) PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Speciality VARCHAR(100),
    ContactEmail VARCHAR(100)
);

INSERT INTO DOCTOR (DoctorID, Fname, Lname, Speciality, ContactEmail)
VALUES 
('D0001', 'Dr. John', 'Doe', 'General Physician', 'john.doe@example.com'),
('D0002', 'Dr. Jane', 'Smith', 'Pediatrician', 'jane.smith@example.com'),
('D0003', 'Dr. Michael', 'Johnson', 'Cardiologist', 'michael.j@example.com');

SELECT * FROM DOCTOR

CREATE TABLE APPOINTMENT (
    AppointmentID VARCHAR(10) PRIMARY KEY,
    PatientID VARCHAR(10),
    DoctorID VARCHAR(10),
    Date DATETIME,
    EndTime DATETIME,
    Status VARCHAR(20)
);

INSERT INTO APPOINTMENT (AppointmentID, PatientID, DoctorID, Date, EndTime, Status)
VALUES
('A0001', 'P0001', 'D0001', '2023-11-07 10:00', '2023-11-07 11:15', 'Scheduled'),
('A0002', 'P0002', 'D0002', '2023-11-08 11:00', '2023-11-08 12:06', 'Completed'),
('A0003', 'P0003', 'D0003', '2023-11-09 12:00', '2023-11-09 13:21', 'Cancelled'),
('A0004', 'P0002', 'D0001', '2023-11-10 13:00', '2023-11-10 14:17', 'Scheduled'),
('A0005', 'P0005', 'D0002', '2023-11-11 14:00', '2023-11-11 15:45', 'Completed'),
('A0006', 'P0006', 'D0003', '2023-11-12 15:00', '2023-11-12 16:15', 'Cancelled'),
('A0007', 'P0007', 'D0001', '2023-11-13 16:00', '2023-11-13 17:09', 'Scheduled'),
('A0008', 'P0008', 'D0002', '2023-11-14 17:00', '2023-11-14 18:29', 'Completed'),
('A0009', 'P0004', 'D0003', '2023-11-15 18:00', '2023-11-15 19:11', 'Cancelled'),
('A0010', 'P0010', 'D0001', '2023-11-16 19:00', '2023-11-16 20:05', 'Scheduled');

SELECT * FROM APPOINTMENT

CREATE TABLE PATIENT_APPOINTMENT (
    PatientID VARCHAR(10),
    AppointmentID VARCHAR(10),
    PRIMARY KEY (PatientID, AppointmentID)
);

INSERT INTO PATIENT_APPOINTMENT (PatientID, AppointmentID)
VALUES
('P0001', 'A0001'),
('P0002', 'A0002'),
('P0003', 'A0003'),
('P0004', 'A0004'),
('P0005', 'A0005'),
('P0006', 'A0006'),
('P0007', 'A0007'),
('P0008', 'A0008'),
('P0009', 'A0009'),
('P0010', 'A0010'),
('P0001', 'A0004'),
('P0002', 'A0005'),
('P0003', 'A0006');

SELECT * FROM PATIENT_APPOINTMENT

CREATE TABLE PATIENT_HISTORY (
 HistoryID VARCHAR(10) PRIMARY KEY,
    PatientID VARCHAR(10),
    Date DATETIME,
    Condition VARCHAR(50),
    Surgeries VARCHAR(100),
    Medication VARCHAR(50)
);
INSERT INTO PATIENT_HISTORY(HistoryID, PatientID, Date, Condition, Surgeries, Medication)
VALUES
('H0001', 'P0001', '2023-11-01 08:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0002', 'P0002', '2023-11-02 09:00', 'Diabetes', 'None', 'Metformin'),
('H0003', 'P0003', '2023-11-03 10:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0004', 'P0004', '2023-11-04 11:00', 'Migraine', 'Appendectomy', 'Ibuprofen'),
('H0005', 'P0005', '2023-11-05 12:00', 'Diabetes', 'None', 'Insulin'),
('H0006', 'P0006', '2023-11-06 13:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0007', 'P0007', '2023-11-07 14:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0008', 'P0008', '2023-11-08 15:00', 'Diabetes', 'None', 'Metformin'),
('H0009', 'P0009', '2023-11-09 16:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0010', 'P0010', '2023-11-10 17:00', 'Migraine', 'Appendectomy', 'Ibuprofen');

SELECT * FROM PATIENT_HISTORY

CREATE TABLE PRESCRIPTION (
    PatientID VARCHAR(10),
    HistoryID VARCHAR(10),
    DateFilled DATETIME,
    PRIMARY KEY (PatientID, HistoryID)
);

INSERT INTO PRESCRIPTION (PatientID, HistoryID, DateFilled)
VALUES
('P0001', 'H0001', '2023-11-04 08:30'),
('P0002', 'H0002', '2023-11-05 09:45'),
('P0003', 'H0003', '2023-11-06 10:30'),
('P0004', 'H0004', '2023-11-07 11:15'),
('P0005', 'H0005', '2023-11-08 12:45'),
('P0006', 'H0006', '2023-11-09 13:30'),
('P0007', 'H0007', '2023-11-10 14:15'),
('P0008', 'H0008', '2023-11-11 15:45'),
('P0009', 'H0009', '2023-11-12 16:30'),
('P0010', 'H0010', '2023-11-13 17:15');

SELECT * FROM PRESCRIPTION

CREATE TABLE MEDICATION(
    Medication VARCHAR(50) PRIMARY KEY,
    Cost_in_Dollars DECIMAL(5, 2)
);
INSERT INTO MEDICATION (Medication, Cost_in_Dollars)
VALUES
('Lisinopril', 10.00),
('Metformin', 15.00),
('Albuterol', 12.00),
('Ibuprofen', 8.00),
('Insulin', 20.00);

SELECT * FROM MEDICATION

/*Find the names of patients who have attended appointments scheduled by Dr. John Doe.*/

SELECT P.FNAME,P.LNAME FROM PATIENT P
JOIN APPOINTMENT A
ON A.PatientID = P.PatientID
JOIN DOCTOR D
ON D.DoctorID=A.DoctorID
WHERE 
    d.Fname = 'Dr.John' AND 
    d.Lname = 'Doe' AND
    a.Status = 'Scheduled'

/*This query is used to find and list the names of patients who have an upcoming scheduled appointment with Dr. John Doe.*/

--------------------------------------------------------------

/*Calculate the average age of all patients.*/

select AVG(AGE) AS 'AVERAGE_AGE' FROM PATIENT

---------------------------------------------------------------

/*Create a stored procedure to get the total number of appointments for a given patient.*/

CREATE PROCEDURE GetTotalAppointmentsForPatient
    @PatientID VARCHAR(10), 
    @TotalAppointments INT OUTPUT
AS
BEGIN
    -- Calculate the total number of appointments for the given patient
    SELECT @TotalAppointments = COUNT(*)
    FROM APPOINTMENT
    WHERE PatientID = @PatientID;
END;
GO

DECLARE @TotalAppointments INT;  
EXEC GetTotalAppointmentsForPatient 
@PatientID = 'P0001', ----IT CAN BE REPLACE BY OTHER PATIENTID
@TotalAppointments = @TotalAppointments OUTPUT;
SELECT @TotalAppointments; 

/*This procedure helps in quickly retrieving appointment counts for a patient, which can be useful for scheduling, 
tracking patient care, and managing appointment-related data.*/

-----------------------------------------------------------------------------

/*Create a trigger to update the appointment status to 'Completed' when the appointment date has passed.*/

CREATE TRIGGER trgUpdateAppointmentStatus
ON APPOINTMENT
AFTER INSERT
AS
BEGIN
    -- Update the appointment status to 'Completed' if the appointment date has passed
    UPDATE APPOINTMENT
    SET Status = 'Completed'
    FROM APPOINTMENT a
    JOIN INSERTED i ON a.AppointmentID = i.AppointmentID
    WHERE a.Date < GETDATE() AND a.Status <> 'Completed';
END;

select * from APPOINTMENT

INSERT INTO APPOINTMENT (AppointmentID, PatientID, DoctorID, Date, EndTime, Status)
VALUES ('A0011', 'P0001', 'D0001', '2023-09-01 10:00', '2023-09-01 11:00', 'Scheduled');

SELECT * FROM APPOINTMENT WHERE AppointmentID = 'A0011';

INSERT INTO APPOINTMENT (AppointmentID, PatientID, DoctorID, Date, EndTime, Status)
VALUES ('A0012', 'P0002', 'D0002', '2024-12-01 10:00', '2024-12-01 11:00', 'Scheduled');

SELECT * FROM APPOINTMENT WHERE AppointmentID = 'A0012';

/*This setup automates the process of updating appointment statuses based on their date, 
which helps maintain accurate status information without manual intervention.*/

------------------------------------------------------------------------------------

/*Find the names of patients along with their appointment details and the corresponding doctor's name.*/

SELECT P.FNAME,P.LNAME,A.*,D.Fname,D.Lname FROM PATIENT P
JOIN APPOINTMENT A
ON A.PatientID = P.PatientID
JOIN DOCTOR D
ON D.DoctorID=A.DoctorID

---------------------------------------------------------------------------------

/*Find the patients who have a medical history of diabetes and their next appointment is scheduled within the next 7 days*/

SELECT P.PatientID, P.Fname, P.Lname, A.AppointmentID, A.Date, PH.Condition
FROM PATIENT P
JOIN PATIENT_HISTORY PH ON P.PatientID = PH.PatientID
JOIN APPOINTMENT A ON P.PatientID = A.PatientID
WHERE PH.Condition = 'Diabetes'
AND A.Status = 'Scheduled'
AND A.Date BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE());

/*This query can be useful for scheduling follow-ups or managing appointments for patients with specific medical conditions.*/

---------------------------------------------------------------------

/*Find patients who have multiple appointments scheduled.*/

SELECT PatientID, COUNT(AppointmentID) AS AppointmentCount
FROM APPOINTMENT
WHERE Status = 'Scheduled'
GROUP BY PatientID
HAVING COUNT(AppointmentID) > 1;

--There are no patient who had schedulded the multiple appoinments

--------------------------------------------------------------------------

/*Calculate the average duration of appointments for each doctor.*/

SELECT 
    A.DoctorID,
    D.Fname AS DoctorFirstName,
    D.Lname AS DoctorLastName,
    AVG(DATEDIFF(MINUTE, A.Date, A.EndTime)) AS AvgAppointmentDurationInMinutes
FROM 
    APPOINTMENT A
JOIN 
    DOCTOR D ON A.DoctorID = D.DoctorID
GROUP BY 
    A.DoctorID, D.Fname, D.Lname;

/*By calculating the average duration in minutes of each doctor we can conclude that 
Dr. Jane Smith has higher average appoinment duaration than other doctors.*/

--------------------------------------------------------------------------------

/*Find Patients with Most Appointments*/

SELECT PatientID, COUNT(AppointmentID) AS AppointmentCount
FROM PATIENT_APPOINTMENT
GROUP BY PatientID
HAVING COUNT(AppointmentID) > 1;

/*This query helps in identifying patients with multiple appointments,
which can be useful for analyzing patient engagement, managing appointment schedules, or targeting follow-uP*/

---------------------------------------------------------------------------------

/*Calculate the total cost of medication for each patient.*/

SELECT 
    P.PatientID,
    SUM(M.Cost_in_Dollars) AS TotalMedicationCost
FROM 
    PRESCRIPTION PR
JOIN 
    PATIENT_HISTORY PH ON PR.HistoryID = PH.HistoryID
JOIN 
    MEDICATION M ON PH.Medication = M.Medication
JOIN 
    PATIENT P ON PR.PatientID = P.PatientID
GROUP BY 
    P.PatientID;

/*This information helps in understanding the total expenditure on medications for each patient, 
which can be useful for billing, financial analysis, or managing medication costs.*/

------------------------------------------------------------------------

/*Create a stored procedure named CalculatePatientBill that calculates the total bill for a 
patient based on their medical history and medication costs. The procedure should take the PatientID as a parameter 
and calculate the total cost by summing up the medication costs and applying a charge of $50 for each surgery in the patient's medical history. 
If the patient has no medical history, the procedure should still return a basic charge of $50*/

CREATE PROCEDURE CalculatePatientBill
    @PatientID VARCHAR(10)
AS
BEGIN
    DECLARE @TotalCost DECIMAL(10, 2) = 0;
    DECLARE @SurgeryCount INT = 0;
    DECLARE @MedicationCost DECIMAL(10, 2) = 0;

    -- Calculate the cost of medications for the patient
    SELECT @MedicationCost = SUM(M.Cost_in_Dollars)
    FROM PATIENT_HISTORY PH
    JOIN MEDICATION M ON PH.Medication = M.Medication
    WHERE PH.PatientID = @PatientID;

    -- Calculate the number of surgeries for the patient
    SELECT @SurgeryCount = COUNT(*)
    FROM PATIENT_HISTORY
    WHERE PatientID = @PatientID AND Surgeries <> 'None';

    -- Calculate total cost
    SET @TotalCost = ISNULL(@MedicationCost, 0) + (@SurgeryCount * 50);

    -- If no medical history, return a basic charge of $50
    IF @TotalCost = 0
    BEGIN
        SET @TotalCost = 50;
    END

    -- Return the total cost
    SELECT @TotalCost AS TotalBill;
END;

EXEC CalculatePatientBill @PatientID = 'P0001';

/*Output: The final bill reflects the sum of medication costs and applicable surgery charges (or a basic charge if no surgeries are present).

This procedure ensures that the patient's bill accurately reflects both their medication costs and any additional charges due to their surgical history.*/
