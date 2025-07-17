class Patient {
  final int patientId;
  final String name;
  final int age;
  final String address;

  /// [diseaseName] : Patient disease name
  final String diseaseName;

  /// [aboutDisease] : [diseaseName] description (small description)
  final String aboutDisease;

  /// [symptoms] : Patient symptoms of [diseaseName] (if any)
  final List<String> symptoms;

  /// [medicines] : Patient medicines for [diseaseName] (if any)
  final List<String> medicines;

  /// [phone] : Patient phone number (Syrian number) without country code
  final String phone;

  /// [gender] : Patient gender (male or female), always in english
  final String gender;

  /// [condition] : Patient condition
  final String condition;

  /// [lastCommunication] : Last contact with patient
  final DateTime lastCommunication;

  /// [history] : Patient history of consultations or phone calls
  final List<PatientHistory> history;

  /// [bloodType] : Patient blood type (e.g., A+, O-, etc.)
  final String bloodType;

  /// [allergies] : Patient allergies (e.g., Penicillin, Nuts)
  final List<String> allergies;

  /// [otherDiseases] : List of chronic diseases the patient suffers from
  final List<String> otherDiseases;

  /// [surgeries] : Past surgeries or major operations
  final List<String> surgeries;

  /// [heightCm] : Patient height in centimeters
  final int heightCm;

  /// [weightKg] : Patient weight in kilograms
  final int weightKg;

  /// [smoker] : Whether the patient is a smoker
  final bool smoker;

  /// [alcoholUse] : Whether the patient consumes alcohol
  final bool alcoholUse;

  /// [nextAppointment] : Next scheduled appointment with patient (nullable)
  final DateTime? nextAppointment;

  /// [notes] : General notes from the doctor
  final String notes;

  Patient({
    required this.patientId,
    required this.name,
    required this.age,
    required this.phone,
    required this.gender,
    required this.condition,
    required this.lastCommunication,
    required this.history,
    required this.symptoms,
    required this.diseaseName,
    required this.aboutDisease,
    required this.medicines,
    required this.address,
    required this.bloodType,
    required this.allergies,
    required this.otherDiseases,
    required this.heightCm,
    required this.weightKg,
    required this.smoker,
    required this.alcoholUse,
    required this.nextAppointment,
    required this.notes,
    required this.surgeries,
  });
}

/// [HistoryItemType] : Type of the history item (consultation or voice call)
enum HistoryItemType { consultation, voiceCall }

class PatientHistory {
  final int id;

  /// [type] : Type of the history item (consultation or voice call)
  final HistoryItemType type;

  /// [content] : Content of the history item
  final String content;

  /// [date] : Date of the history item in format yyyy-mm-dd hh:mm PM/AM
  final DateTime date;

  /// [medicines] : Patient medicines
  final List<String> medicines;

  final String condition;
  final String note;

  PatientHistory({
    required this.id,
    required this.type,
    required this.content,
    required this.date,
    required this.medicines,
    required this.condition,
    required this.note,
  });
}

/// [patientData] : Patient data in arabic and english
final Map<String, List<Patient>> patientData = {
  'en': [
    Patient(
      patientId: 1,
      name: "Ahmad Mohammed",
      age: 35,
      phone: "0933445566",
      gender: "male",
      condition: "stable",
      lastCommunication: DateTime(2023, 6, 2, 11, 30),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Initial consultation about asthma symptoms",
          date: DateTime(2023, 4, 10, 10, 15),
          medicines: ["Ventolin inhaler"],
          condition: "moderate",
          note:
              "Patient presented with significant wheezing and shortness of breath. Peak flow measurement was 65% of predicted value. Recommended starting with Ventolin every 4-6 hours as needed and scheduled a follow-up in two weeks to assess response to treatment. Advised to monitor symptoms and avoid known triggers like pollen exposure.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Emergency call about worsening symptoms",
          date: DateTime(2023, 4, 25, 16, 20),
          medicines: ["Ventolin", "Oral prednisone"],
          condition: "severe",
          note:
              "Patient reported increased nocturnal symptoms and decreased response to Ventolin. Suspected asthma exacerbation possibly due to recent upper respiratory infection. Prescribed a 5-day course of oral prednisone and instructed to double the dose of inhaled corticosteroids temporarily. Emergency plan provided with clear instructions for when to seek urgent care if symptoms don't improve within 48 hours.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Review of medication effectiveness",
          date: DateTime(2023, 5, 5, 14, 0),
          medicines: ["Ventolin", "Fluticasone inhaler"],
          condition: "improving",
          note:
              "Patient showing good response to increased steroid dose. Peak flow improved to 85% of predicted. Transitioning from oral steroids to higher dose inhaled corticosteroid (Fluticasone). Discussed proper inhaler technique and importance of regular use even when asymptomatic. Added spacer device to improve medication delivery. Scheduled spirometry for next visit.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "Follow-up call about condition",
          date: DateTime(2023, 5, 15, 14, 30),
          medicines: ["Ventolin", "Fluticasone inhaler"],
          condition: "stable",
          note:
              "Patient reports good symptom control with current regimen. No nocturnal symptoms in past week. Using rescue inhaler less than twice weekly. Reinforced importance of continuing controller medication. Discussed developing an asthma action plan for future exacerbations. Patient educated about early warning signs of worsening asthma.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Routine check-up and assessment",
          date: DateTime(2023, 6, 2, 11, 30),
          medicines: ["Ventolin", "Fluticasone inhaler"],
          condition: "stable",
          note:
              "Asthma well-controlled on current medications. Peak flow consistently above 90% of personal best. No limitations in daily activities. Reviewed environmental control measures to reduce allergen exposure. Considered step-down in therapy if control remains good for another 3 months. Provided updated prescription and scheduled follow-up in 3 months unless symptoms worsen.",
        ),
      ],
      symptoms: ["Shortness of breath", "Wheezing", "Coughing"],
      diseaseName: "Asthma",
      aboutDisease: "Chronic disease affecting the airways",
      medicines: ["Ventolin", "Corticosteroid inhaler"],
      address: "Damascus",
      bloodType: "O+",
      allergies: ["Pollen", "Aspirin"],
      otherDiseases: ["Hypertension", "Chronic Sinusitis"],
      surgeries: [],
      heightCm: 175,
      weightKg: 80,
      smoker: true,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 7, 1, 10, 0),
      notes: "Needs continuous follow-up due to symptom severity",
    ),
    Patient(
      patientId: 2,
      name: "Sarah Khaled",
      age: 28,
      phone: "0944556677",
      gender: "female",
      condition: "improving",
      lastCommunication: DateTime(2023, 6, 1, 9, 45),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Initial diagnosis of diabetes",
          date: DateTime(2023, 3, 15, 11, 0),
          medicines: ["Metformin"],
          condition: "new diagnosis",
          note:
              "Patient presented with classic symptoms of diabetes. Random glucose was 285 mg/dL, HbA1c 8.9%. Started on Metformin 500mg twice daily. Provided comprehensive diabetes education including glucose monitoring, dietary modifications, and exercise recommendations. Discussed long-term complications and importance of glycemic control. Scheduled for diabetes education classes and follow-up in 4 weeks.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about insulin dosage",
          date: DateTime(2023, 4, 2, 15, 30),
          medicines: ["Metformin", "Insulin glargine"],
          condition: "uncontrolled",
          note:
              "Patient reports persistent hyperglycemia despite Metformin. Fasting glucose readings consistently above 180 mg/dL. Added basal insulin (glargine) starting at 10 units nightly. Provided detailed instruction on insulin administration, storage, and hypoglycemia management. Emphasized importance of regular glucose monitoring and keeping a detailed log. Scheduled follow-up in 2 weeks to adjust doses.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about diabetes symptoms",
          date: DateTime(2023, 5, 5, 9, 30),
          medicines: ["Metformin", "Insulin glargine"],
          condition: "improving",
          note:
              "Showing better glucose control with insulin added. Fasting glucose now 110-130 mg/dL range. HbA1c down to 7.2%. Adjusted insulin to 12 units nightly based on glucose logs. Noted some mild hypoglycemia in afternoons - advised to have mid-afternoon snack. Discussed carbohydrate counting and insulin dose adjustment principles. Referred to dietitian for personalized meal planning.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "Blood sugar level check",
          date: DateTime(2023, 5, 20, 10, 15),
          medicines: ["Metformin", "Insulin glargine"],
          condition: "stable",
          note:
              "Excellent progress with glycemic control. No episodes of significant hypoglycemia. Continuing current regimen. Discussed importance of foot care and annual eye exams. Ordered urine microalbumin test and lipid panel. Patient demonstrating good technique for glucose monitoring and insulin administration. Considering possible addition of GLP-1 agonist at next visit if weight loss desired.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "Follow-up on symptom improvement",
          date: DateTime(2023, 6, 1, 9, 45),
          medicines: ["Metformin", "Insulin glargine"],
          condition: "improving",
          note:
              "Patient reports stable glucose readings with current regimen. Occasional post-prandial spikes up to 180 mg/dL after large meals. Reinforced importance of consistent carbohydrate intake and regular meal timing. Advised to check post-prandial glucose 2 hours after meals twice weekly for better pattern management. No changes to medications at this time. Will review logs at next appointment.",
        ),
      ],
      symptoms: ["Excessive thirst", "Frequent urination", "Fatigue"],
      diseaseName: "Type 2 Diabetes",
      aboutDisease: "Disorder of glucose metabolism",
      medicines: ["Metformin", "Insulin"],
      address: "Aleppo",
      bloodType: "A-",
      allergies: [],
      otherDiseases: ["Hypothyroidism", "Osteoporosis"],
      surgeries: ["Appendectomy"],
      heightCm: 165,
      weightKg: 70,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 15, 14, 30),
      notes: "Needs daily blood sugar monitoring",
    ),
    Patient(
      patientId: 3,
      name: "Ali Hassan",
      age: 45,
      phone: "0955667788",
      gender: "male",
      condition: "critical",
      lastCommunication: DateTime(2023, 6, 3, 8, 20),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Complaints of intermittent chest pain",
          date: DateTime(2023, 4, 12, 14, 0),
          medicines: ["Aspirin", "Nitroglycerin"],
          condition: "unstable",
          note:
              "Patient describes typical angina symptoms - substernal chest pressure radiating to left arm, provoked by exertion and relieved by rest. ECG shows nonspecific ST changes. Started on aspirin 81mg daily and sublingual nitroglycerin PRN. Scheduled for stress test and echocardiogram. Advised to avoid strenuous activity and seek immediate care if pain persists beyond 15 minutes or is unrelieved by nitroglycerin.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Emergency call about acute chest pain",
          date: DateTime(2023, 5, 1, 18, 45),
          medicines: ["Aspirin", "Nitroglycerin", "Clopidogrel"],
          condition: "acute",
          note:
              "Patient experiencing prolonged chest pain unrelieved by 3 nitroglycerin doses over 45 minutes. Suspected acute coronary syndrome. Instructed to call ambulance immediately. Called ER to alert them of incoming patient with STEMI symptoms. Recommended loading doses of aspirin and clopidogrel while awaiting EMS. Followed up later - patient had 90% LAD occlusion treated with stent placement.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.voiceCall,
          content: "Emergency call about chest pain",
          date: DateTime(2023, 5, 20, 16, 20),
          medicines: ["Aspirin", "Nitroglycerin", "Clopidogrel", "Metoprolol"],
          condition: "post-stent",
          note:
              "Patient reports recurrent but milder chest pain. Concern for possible stent restenosis or incomplete revascularization. Pain different from initial event - more pleuritic in nature. Recommended evaluation in ER to rule out pericarditis or other complications. Later confirmed to be musculoskeletal pain. Adjusted metoprolol dose for better heart rate control. Reinforced importance of dual antiplatelet therapy compliance.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "Post-hospitalization review",
          date: DateTime(2023, 5, 27, 10, 0),
          medicines: ["Aspirin", "Clopidogrel", "Atorvastatin", "Metoprolol"],
          condition: "stable",
          note:
              "Post-MI recovery progressing well. No recurrent angina. Tolerating medications without significant side effects. LDL at goal of <70 mg/dL. Discussed cardiac rehabilitation program and lifestyle modifications including smoking cessation, Mediterranean diet, and gradual exercise program. Reviewed warning signs of complications. Scheduled follow-up echo to assess EF improvement.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "Follow-up on heart condition and medications",
          date: DateTime(2023, 6, 3, 8, 20),
          medicines: ["Aspirin", "Clopidogrel", "Atorvastatin", "Metoprolol"],
          condition: "critical",
          note:
              "Patient reports excellent medication compliance but admits to having resumed smoking occasionally. Strongly reinforced absolute necessity of complete smoking cessation given stent placement. Discussed nicotine replacement options. Mild fatigue reported - adjusted metoprolol timing to bedtime. No chest pain or other cardiac symptoms. Will consider switching to ticagrelor if smoking cessation not achieved by next visit.",
        ),
      ],
      symptoms: ["Chest pain", "Nausea", "Sweating"],
      diseaseName: "Angina",
      aboutDisease: "Heart ischemia",
      medicines: ["Nitroglycerin", "Aspirin"],
      address: "Homs",
      bloodType: "B+",
      allergies: ["Fish"],
      otherDiseases: ["Chronic Kidney Disease", "Peripheral Artery Disease"],
      surgeries: ["Cardiac catheterization"],
      heightCm: 180,
      weightKg: 85,
      smoker: true,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 10, 9, 0),
      notes: "Critical condition requiring close monitoring",
    ),
    Patient(
      patientId: 4,
      name: "Layla Omar",
      age: 60,
      phone: "0966778899",
      gender: "female",
      condition: "stable",
      lastCommunication: DateTime(2023, 6, 2, 14, 15),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Diagnosis of hypertension",
          date: DateTime(2023, 2, 10, 9, 0),
          medicines: ["Amlodipine"],
          condition: "new diagnosis",
          note:
              "New diagnosis of stage 2 hypertension with BP readings consistently 160-170/95-100 mmHg in office. No evidence of end-organ damage on initial evaluation. Started on amlodipine 5mg daily. Provided detailed education about hypertension, including dietary sodium restriction, DASH diet principles, and importance of regular home monitoring. Scheduled follow-up in 4 weeks to assess medication effectiveness and tolerance.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about medication side effects",
          date: DateTime(2023, 3, 5, 16, 30),
          medicines: ["Amlodipine"],
          condition: "side effects",
          note:
              "Patient reports mild ankle edema and facial flushing with amlodipine. BP improving but still above goal at 150/92 mmHg average. Recommended reducing dose to 2.5mg daily and adding losartan 50mg daily to improve efficacy while minimizing side effects. Advised to elevate legs when sitting and monitor edema. Scheduled in-office BP check in 2 weeks.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about high blood pressure",
          date: DateTime(2023, 5, 10, 11, 0),
          medicines: ["Amlodipine", "Losartan"],
          condition: "improving",
          note:
              "Combination therapy working well. Home BP logs show averages of 132/84 mmHg. Edema resolved with lower amlodipine dose. No significant side effects from losartan. Reinforced importance of continued lifestyle modifications - patient reports good compliance with low-sodium diet. Ordered basic metabolic panel to monitor electrolytes and kidney function. Will consider reducing amlodipine further if BP remains controlled.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "Blood pressure follow-up",
          date: DateTime(2023, 5, 17, 13, 15),
          medicines: ["Amlodipine", "Losartan"],
          condition: "stable",
          note:
              "BP remains well-controlled at 128/82 mmHg in office. Lab results normal. Patient reports occasional dizziness when standing quickly - likely mild orthostasis from good BP control. Advised to rise slowly and ensure adequate hydration. Discussed long-term monitoring plan including annual echocardiogram to assess for LVH development. No medication changes at this time.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "Report on home blood pressure readings",
          date: DateTime(2023, 6, 2, 14, 15),
          medicines: ["Amlodipine", "Losartan"],
          condition: "stable",
          note:
              "Patient reports consistent home BP readings in target range (120-135/75-85 mmHg). No medication side effects. Reviewed proper home BP monitoring technique - confirms using correct cuff size and resting adequately before measurements. Encouraged to continue current regimen and lifestyle modifications. Will consider spaced-out follow-up visits (every 6 months) if control remains excellent.",
        ),
      ],
      symptoms: ["Headache", "Dizziness", "Nosebleed"],
      diseaseName: "Hypertension",
      aboutDisease: "Chronic high blood pressure",
      medicines: ["Amlodipine", "Losartan"],
      address: "Latakia",
      bloodType: "A+",
      allergies: [],
      otherDiseases: ["Type 2 Diabetes", "Hyperlipidemia"],
      surgeries: [],
      heightCm: 160,
      weightKg: 65,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 20, 11, 30),
      notes: "Blood pressure currently under control",
    ),
    Patient(
      patientId: 5,
      name: "Mahmoud Ibrahim",
      age: 50,
      phone: "0977889900",
      gender: "male",
      condition: "improving",
      lastCommunication: DateTime(2023, 6, 1, 16, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Diagnosis of arthritis",
          date: DateTime(2023, 1, 15, 10, 30),
          medicines: ["Ibuprofen"],
          condition: "active",
          note:
              "Patient presents with symmetric small joint pain and stiffness lasting >1 hour each morning. Clinical exam shows synovitis in MCPs and PIPs bilaterally. RF and anti-CCP positive. Diagnosed with rheumatoid arthritis. Started on ibuprofen for symptom control and referred to rheumatology for DMARD therapy initiation. Ordered baseline hand X-rays and inflammatory markers. Discussed disease course and importance of early aggressive treatment.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Complaint about joint swelling",
          date: DateTime(2023, 3, 20, 15, 45),
          medicines: ["Ibuprofen", "Methotrexate"],
          condition: "flare",
          note:
              "Patient reports worsening joint symptoms despite NSAIDs. Rheumatologist started methotrexate 2 weeks ago but not yet effective. Advised to continue methotrexate as it may take 4-6 weeks for full effect. Added short-term prednisone taper for symptom control. Reinforced importance of weekly folic acid supplementation with methotrexate. Scheduled follow-up with rheumatologist to assess response.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Treatment response evaluation",
          date: DateTime(2023, 4, 10, 11, 15),
          medicines: ["Methotrexate", "Folic acid"],
          condition: "improving",
          note:
              "Showing good response to methotrexate with 50% reduction in swollen joint count. Morning stiffness decreased to 30 minutes. ESR decreased from 58 to 22 mm/hr. Tolerating medication well with only mild nausea. Increased methotrexate to therapeutic dose. Discussed alcohol avoidance and regular LFT monitoring. Encouraged gentle range-of-motion exercises to maintain joint function.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about arthritis medications",
          date: DateTime(2023, 5, 19, 10, 30),
          medicines: ["Methotrexate", "Folic acid", "Sulfasalazine"],
          condition: "stable",
          note:
              "Patient doing well on current regimen but reports some breakthrough symptoms. Rheumatologist added sulfasalazine as combination therapy. Reviewed potential side effects including GI upset and headache. Emphasized importance of regular blood work to monitor for bone marrow suppression. Patient educated about infection risk and when to hold medications if febrile. No changes to current pain management plan.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Routine check and symptom improvement",
          date: DateTime(2023, 6, 1, 16, 0),
          medicines: ["Methotrexate", "Folic acid", "Sulfasalazine"],
          condition: "improving",
          note:
              "Excellent response to combination DMARD therapy. Minimal joint symptoms reported. Physical exam shows no active synovitis. CRP normalized. Discussed long-term treatment plan including possible transition to biologic agent if remission not sustained. Reviewed importance of continuing medications even when feeling well. Scheduled routine monitoring labs and follow-up in 3 months.",
        ),
      ],
      symptoms: ["Joint pain", "Swelling", "Morning stiffness"],
      diseaseName: "Rheumatoid Arthritis",
      aboutDisease: "Autoimmune disease affecting joints",
      medicines: ["Methotrexate", "Ibuprofen"],
      address: "Hama",
      bloodType: "AB+",
      allergies: ["Shellfish"],
      otherDiseases: ["Psoriasis", "Gastroesophageal Reflux Disease"],
      surgeries: ["Right knee surgery"],
      heightCm: 170,
      weightKg: 75,
      smoker: false,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 25, 15, 0),
      notes: "Noticeable improvement in joint mobility",
    ),
    Patient(
      patientId: 6,
      name: "Noura Ahmed",
      age: 32,
      phone: "0988990011",
      gender: "female",
      condition: "good",
      lastCommunication: DateTime(2023, 5, 30, 12, 30),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Initial consultation about seasonal allergies",
          date: DateTime(2023, 3, 5, 14, 0),
          medicines: ["Loratadine"],
          condition: "moderate",
          note:
              "Patient presents with classic allergic rhinitis symptoms coinciding with spring pollen season. Symptoms significantly impact quality of life and sleep. Started on daily loratadine and nasal saline irrigation. Recommended environmental controls including keeping windows closed, using HEPA filters, and showering after outdoor exposure. Discussed possible step-up to nasal steroids if symptoms not controlled in 2 weeks.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Complaint about worsening symptoms",
          date: DateTime(2023, 4, 15, 10, 30),
          medicines: ["Loratadine", "Fluticasone nasal spray"],
          condition: "severe",
          note:
              "Patient reports minimal improvement with loratadine alone. Added fluticasone nasal spray with detailed instructions for proper administration technique. Emphasized need for regular daily use rather than PRN. Recommended continuing loratadine and adding ocular antihistamine drops for eye symptoms. Advised to monitor for nasal irritation or epistaxis from steroid spray.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about allergy symptoms",
          date: DateTime(2023, 5, 16, 15, 45),
          medicines: ["Loratadine", "Fluticasone nasal spray"],
          condition: "improving",
          note:
              "Significant improvement with combination therapy. Nasal symptoms 80% better, ocular symptoms improved with drops. Using rescue medications less than once weekly. Reviewed proper nasal spray technique - patient was initially aiming spray incorrectly. Discussed long-term management plan including possible allergy testing and immunotherapy if symptoms remain problematic year after year.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about medication dosage",
          date: DateTime(2023, 5, 25, 11, 0),
          medicines: ["Loratadine", "Fluticasone nasal spray"],
          condition: "stable",
          note:
              "Patient inquiring about tapering medications as pollen season winds down. Advised to continue full regimen for 2 more weeks then try reducing fluticasone to once daily if symptoms remain controlled. Loratadine may be discontinued if no symptoms for 1 week. Provided guidance on recognizing when to resume full therapy if symptoms recur. Emphasized that nasal steroids may take several days to become effective again if stopped.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Evaluation of response to new treatment",
          date: DateTime(2023, 5, 30, 12, 30),
          medicines: ["Fluticasone nasal spray"],
          condition: "good",
          note:
              "Allergy symptoms well-controlled on monotherapy with nasal steroid. Successfully discontinued loratadine without symptom recurrence. Pollen counts decreasing - plan to discontinue fluticasone in next 2 weeks unless symptoms persist. Discussed strategies for next allergy season including pre-emptive medication initiation before symptoms begin. Referred for allergy testing to identify specific triggers for potential immunotherapy.",
        ),
      ],
      symptoms: ["Sneezing", "Itchy eyes", "Runny nose"],
      diseaseName: "Allergic Rhinitis",
      aboutDisease: "Allergic reaction to allergens",
      medicines: ["Loratadine", "Nasal corticosteroid spray"],
      address: "Daraa",
      bloodType: "O-",
      allergies: ["Pollen", "Dust mites"],
      otherDiseases: ["Asthma", "Atopic Dermatitis"],
      surgeries: [],
      heightCm: 168,
      weightKg: 60,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 12, 10, 0),
      notes: "Avoid exposure to known allergens",
    ),
    Patient(
      patientId: 7,
      name: "Youssef Nasser",
      age: 40,
      phone: "0999001122",
      gender: "male",
      condition: "stable",
      lastCommunication: DateTime(2023, 6, 2, 10, 45),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Diagnosis of GERD",
          date: DateTime(2023, 2, 20, 9, 30),
          medicines: ["Omeprazole"],
          condition: "active",
          note:
              "Patient presents with typical GERD symptoms - heartburn occurring 3-4 times weekly, often nocturnal, with occasional regurgitation. Symptoms interfere with sleep. Started on omeprazole 20mg daily before breakfast. Recommended dietary modifications including avoiding late meals, reducing caffeine/alcohol, and elevating head of bed. Advised weight loss as BMI is 28.4. Scheduled follow-up in 4 weeks to assess response.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Complaint about frequent heartburn",
          date: DateTime(2023, 4, 5, 18, 15),
          medicines: ["Omeprazole"],
          condition: "persistent",
          note:
              "Patient reports only partial improvement with omeprazole. Admits to frequent coffee consumption and late dinners. Increased omeprazole to 40mg daily and reinforced lifestyle modifications. Added Gaviscon PRN for breakthrough symptoms. Discussed alarm symptoms requiring prompt evaluation (dysphagia, weight loss, anemia). Considered H. pylori testing if symptoms persist despite optimized PPI therapy.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about heartburn",
          date: DateTime(2023, 5, 7, 14, 30),
          medicines: ["Omeprazole", "Ranitidine"],
          condition: "improving",
          note:
              "Better symptom control with higher PPI dose and improved compliance with lifestyle changes. Occasional breakthrough symptoms when eating trigger foods. Added nighttime ranitidine for additional acid suppression. Discussed risks of long-term PPI use including possible nutrient deficiencies and increased infection risk. Plan to attempt step-down therapy after 3 months of good control.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "GERD condition follow-up",
          date: DateTime(2023, 5, 14, 12, 0),
          medicines: ["Omeprazole", "Ranitidine"],
          condition: "stable",
          note:
              "Patient reports excellent symptom control with current regimen. Using rescue medications less than once weekly. Lost 3kg through dietary changes. Reinforced importance of continuing lifestyle modifications even when asymptomatic. Discussed plan for eventual medication taper - will first try reducing omeprazole to 20mg daily if symptoms remain controlled for another month.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Evaluation of new medication effectiveness",
          date: DateTime(2023, 6, 2, 10, 45),
          medicines: ["Omeprazole"],
          condition: "stable",
          note:
              "Maintaining good symptom control on omeprazole 20mg daily alone. Successfully discontinued ranitidine without symptom recurrence. Patient reports consistent compliance with dietary modifications and weight loss of 5kg total. Plan to continue current PPI dose for 2 more months then attempt switching to on-demand therapy. No red flag symptoms reported. Considered for possible endoscopy if symptoms recur after medication reduction.",
        ),
      ],
      symptoms: ["Chest burning", "Difficulty swallowing", "Dry cough"],
      diseaseName: "GERD",
      aboutDisease: "Stomach acid reflux into esophagus",
      medicines: ["Omeprazole", "Ranitidine"],
      address: "Tartus",
      bloodType: "B-",
      allergies: [],
      otherDiseases: ["Hiatal Hernia", "Chronic Gastritis"],
      surgeries: [],
      heightCm: 178,
      weightKg: 90,
      smoker: true,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 18, 16, 0),
      notes: "Should avoid spicy and fatty foods",
    ),
    Patient(
      patientId: 8,
      name: "Hiba Rami",
      age: 25,
      phone: "0911223344",
      gender: "female",
      condition: "good",
      lastCommunication: DateTime(2023, 5, 31, 14, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Blood test revealing anemia",
          date: DateTime(2023, 2, 5, 10, 30),
          medicines: ["Ferrous sulfate"],
          condition: "moderate",
          note:
              "Diagnosed with iron deficiency anemia (Hb 9.2 g/dL, ferritin 8 ng/mL). Started on ferrous sulfate 325mg tid with vitamin C to enhance absorption. Recommended dietary iron sources and avoidance of calcium/antacids with iron doses. Investigated potential causes - patient reports heavy menstrual bleeding. Ordered pelvic ultrasound and GI workup if no improvement after 3 months of therapy. Scheduled follow-up CBC in 1 month.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about iron supplements",
          date: DateTime(2023, 3, 15, 15, 0),
          medicines: ["Ferrous sulfate"],
          condition: "side effects",
          note:
              "Patient reports significant constipation and nausea from iron therapy. Recommended switching to ferrous gluconate which may be better tolerated, and adding stool softener. Advised taking with food if needed despite slightly reduced absorption. Emphasized importance of continuing therapy despite side effects as symptoms should improve with time. Suggested trying alternate day dosing if side effects persist.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about anemia",
          date: DateTime(2023, 5, 12, 9, 15),
          medicines: ["Ferrous gluconate"],
          condition: "improving",
          note:
              "Repeat labs show hemoglobin improved to 11.4 g/dL. Tolerating ferrous gluconate better with fewer GI side effects. Pelvic ultrasound revealed fibroids - referred to gynecology for management of menorrhagia. Discussed possibility of IV iron if oral therapy not fully effective or tolerated. Encouraged to continue therapy for at least 3 months after hemoglobin normalizes to replenish iron stores.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "Report on symptom improvement",
          date: DateTime(2023, 5, 25, 11, 30),
          medicines: ["Ferrous gluconate"],
          condition: "improving",
          note:
              "Patient reports increased energy levels and resolution of pallor. No longer experiencing shortness of breath with routine activities. Last menstrual cycle was lighter following initiation of tranexamic acid by gynecologist. Advised to continue current iron regimen and repeat labs in 1 month. If hemoglobin normalizes at next check, will space out dosing to maintain iron stores.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Follow-up iron level test",
          date: DateTime(2023, 5, 31, 14, 0),
          medicines: ["Ferrous gluconate"],
          condition: "good",
          note:
              "Hemoglobin now normal at 12.8 g/dL, ferritin up to 35 ng/mL. Patient feels back to baseline energy levels. Gynecology managing fibroids effectively with medical therapy. Plan to continue iron at reduced frequency (every other day) for 3 more months to fully replenish stores. Will check iron studies again at that time and consider discontinuing if stores adequate. Educated about signs of recurrence.",
        ),
      ],
      symptoms: ["Fatigue", "Pallor", "Shortness of breath"],
      diseaseName: "Iron Deficiency Anemia",
      aboutDisease: "Low hemoglobin due to iron deficiency",
      medicines: ["Ferrous sulfate", "Vitamin C"],
      address: "Idlib",
      bloodType: "A+",
      allergies: [],
      otherDiseases: ["Celiac Disease", "Hypothyroidism"],
      surgeries: [],
      heightCm: 163,
      weightKg: 55,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 30, 13, 0),
      notes: "Noticeable improvement in hemoglobin level",
    ),
    Patient(
      patientId: 9,
      name: "Wesam Ali",
      age: 55,
      phone: "0922334455",
      gender: "male",
      condition: "improving",
      lastCommunication: DateTime(2023, 6, 1, 17, 15),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Diagnosis of high cholesterol",
          date: DateTime(2023, 1, 10, 14, 0),
          medicines: ["Atorvastatin"],
          condition: "new diagnosis",
          note:
              "Patient with newly identified hyperlipidemia (LDL 190 mg/dL, total cholesterol 280 mg/dL). No established CAD but high risk due to family history. Started on atorvastatin 20mg daily. Recommended therapeutic lifestyle changes including Mediterranean diet and increased physical activity. Ordered baseline LFTs and CK. Discussed importance of medication adherence and follow-up labs in 3 months to assess response.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about dietary plan",
          date: DateTime(2023, 3, 5, 16, 30),
          medicines: ["Atorvastatin"],
          condition: "active",
          note:
              "Patient requesting clarification on dietary recommendations. Provided detailed guidance on reducing saturated fats (<7% of calories), increasing soluble fiber, and incorporating plant sterols. Suggested consultation with dietitian for personalized meal planning. Reports mild muscle aches with statin - recommended taking at bedtime and ensuring adequate hydration. No signs of rhabdomyolysis. Will monitor symptoms and consider dose adjustment if persists.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Blood test review",
          date: DateTime(2023, 4, 15, 10, 0),
          medicines: ["Atorvastatin"],
          condition: "improving",
          note:
              "Repeat lipids show good response to therapy (LDL reduced to 110 mg/dL). Liver enzymes normal. Patient reports improved dietary habits and 4kg weight loss. Muscle symptoms resolved with bedtime dosing. Increased atorvastatin to 40mg daily to achieve more aggressive LDL reduction given high risk profile. Reinforced importance of continued lifestyle modifications even with medication. Scheduled repeat lipids in 3 months.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "Inquiry about cholesterol medications",
          date: DateTime(2023, 5, 18, 17, 30),
          medicines: ["Atorvastatin", "Ezetimibe"],
          condition: "persistent",
          note:
              "Patient concerned about needing additional medication despite statin therapy. LDL at last check was 98 mg/dL - goal is <70 mg/dL for high risk. Added ezetimibe for additional LDL reduction. Explained mechanism and safety profile. Reassured that combination therapy is often needed for high-risk patients. Advised to continue current statin dose as tolerated. Will recheck lipids in 6 weeks to assess combined effect.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "Treatment response evaluation",
          date: DateTime(2023, 6, 1, 17, 15),
          medicines: ["Atorvastatin", "Ezetimibe"],
          condition: "improving",
          note:
              "Excellent response to combination therapy with LDL now at 68 mg/dL. Tolerating medications well with no side effects. Patient has adopted regular exercise routine and lost total of 7kg. Discussed long-term management plan including annual lipid panels and continued focus on lifestyle. No changes to current regimen. Will consider further adjustments only if LDL rises above goal in future monitoring.",
        ),
      ],
      symptoms: [],
      diseaseName: "High Cholesterol",
      aboutDisease: "Elevated blood lipid levels",
      medicines: ["Atorvastatin", "Fibrate"],
      address: "As-Suwayda",
      bloodType: "O+",
      allergies: [],
      otherDiseases: ["Coronary Artery Disease", "Metabolic Syndrome"],
      surgeries: [],
      heightCm: 172,
      weightKg: 88,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 7, 5, 11, 0),
      notes: "Improved cholesterol level but needs follow-up",
    ),
    Patient(
      patientId: 10,
      name: "Rimas Khalil",
      age: 30,
      phone: "0933445566",
      gender: "female",
      condition: "stable",
      lastCommunication: DateTime(2023, 6, 3, 9, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "Diagnosis of migraine",
          date: DateTime(2023, 2, 20, 11, 0),
          medicines: ["Sumatriptan"],
          condition: "active",
          note:
              "Patient presents with classic migraine symptoms - unilateral throbbing headaches with nausea, photophobia lasting 12-24 hours, occurring 2-3 times monthly. No aura symptoms. Identified potential triggers including stress, chocolate, and menstrual cycle. Prescribed sumatriptan for acute treatment with instructions for early administration at headache onset. Recommended headache diary to identify patterns and triggers. Discussed preventive options if frequency increases.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "Emergency call about severe headache attack",
          date: DateTime(2023, 4, 5, 8, 30),
          medicines: ["Sumatriptan", "Naproxen"],
          condition: "acute",
          note:
              "Patient reports severe migraine unresponsive to initial sumatriptan dose. Instructed to take second dose after 2 hours if no relief and add naproxen for synergistic effect. Recommended quiet, dark environment and hydration. Discussed signs requiring ER evaluation (lasting >72 hours, focal neurological symptoms). Later reported good response to rescue medications after 4 hours. Considered adding antiemetic for future attacks.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "Consultation about migraine",
          date: DateTime(2023, 5, 9, 11, 30),
          medicines: ["Sumatriptan", "Propranolol"],
          condition: "chronic",
          note:
              "Headache frequency increased to weekly, consistent with transformation to chronic migraine. Started propranolol for prevention. Reviewed medication overuse risk - patient using sumatriptan ≤2 days/week appropriately. Added magnesium and riboflavin supplements based on evidence for migraine prevention. Referred for stress management techniques. Plan to assess preventive therapy efficacy after 2 months.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "Migraine follow-up",
          date: DateTime(2023, 5, 16, 10, 0),
          medicines: ["Sumatriptan", "Propranolol"],
          condition: "improving",
          note:
              "Patient reports 50% reduction in migraine frequency with propranolol. Better able to manage attacks with early triptan use. Headache diary shows most attacks now associated with work stress and poor sleep. Initiated CBT referral for stress management. Adjusted propranolol dose for optimal balance between efficacy and side effects. Discussed option of switching to CGRP antagonist if current prevention inadequate.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "Report on attack frequency",
          date: DateTime(2023, 6, 3, 9, 0),
          medicines: ["Sumatriptan", "Propranolol"],
          condition: "stable",
          note:
              "Migraine frequency stable at 2-3 monthly, down from weekly. Propranolol well-tolerated. Using acute medications appropriately without overuse. Implementing stress reduction techniques with apparent benefit. No changes to current regimen. Plan to continue preventive therapy for 6 months then consider gradual taper if remission maintained. Provided updated acute treatment plan for breakthrough attacks.",
        ),
      ],
      symptoms: ["Severe headache", "Nausea", "Light sensitivity"],
      diseaseName: "Migraine",
      aboutDisease: "Neurological disorder causing severe headaches",
      medicines: ["Sumatriptan", "Ibuprofen"],
      address: "Deir ez-Zor",
      bloodType: "AB-",
      allergies: ["Chocolate", "Cheese"],
      otherDiseases: ["Fibromyalgia", "Depression"],
      surgeries: [],
      heightCm: 167,
      weightKg: 58,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 22, 14, 0),
      notes: "Avoid known migraine triggers",
    ),
  ],
  'ar': [
    Patient(
      patientId: 1,
      name: "أحمد محمد",
      age: 35,
      phone: "0933445566",
      gender: "male",
      condition: "مستقر",
      lastCommunication: DateTime(2023, 6, 2, 11, 30),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "استشارة أولية حول أعراض الربو",
          date: DateTime(2023, 4, 10, 10, 15),
          medicines: ["بخاخ فينتولين"],
          condition: "متوسط",
          note:
              "ظهر المريض بأعراض واضحة للربو مع صفير شديد وضيق في التنفس. كانت قياسات ذروة الجريان 65% من القيمة المتوقعة. تم وصف بخاخ الفنتولين كل 4-6 ساعات حسب الحاجة مع تحديد موعد متابعة بعد أسبوعين لتقييم الاستجابة للعلاج. نصح المريض بمراقبة الأعراض وتجنب المحفزات المعروفة مثل حبوب اللقاح.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "مكالمة صوتية لتفاقم الأعراض",
          date: DateTime(2023, 4, 25, 16, 20),
          medicines: ["فنتولين", "بريدنيزون فموي"],
          condition: "شديد",
          note:
              "أبلغ المريض عن زيادة في الأعراض الليلية وضعف استجابة للفنتولين. يشتبه في تفاقم الربو ربما بسبب عدوى تنفسية علوية حديثة. وصف دورة من البريدنيزون الفموي لمدة 5 أيام مع تعليمات بمضاعفة جرعة الكورتيكوستيرويد مؤقتاً. تم تقديم خطة طوارئ مع تعليمات واضحة عن متى يطلب الرعاية العاجلة إذا لم تتحسن الأعراض خلال 48 ساعة.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "مراجعة فعالية الأدوية",
          date: DateTime(2023, 5, 5, 14, 0),
          medicines: ["فنتولين", "بخاخ فلوتيكازون"],
          condition: "تحسن",
          note:
              "استجابة جيدة لزيادة جرعة الكورتيكوستيرويد. تحسنت قياسات ذروة الجريان إلى 85% من القيمة المتوقعة. تم الانتقال من الستيرويدات الفموية إلى جرعة أعلى من الكورتيكوستيرويد المستنشق (فلوتيكازون). تمت مناقشة تقنية الاستنشاق الصحيحة وأهمية الاستخدام المنتظم حتى عند عدم وجود أعراض. أضيف جهاز تباعد لتحسين توصيل الدواء.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "مكالمة صوتية لمتابعة الحالة",
          date: DateTime(2023, 5, 15, 14, 30),
          medicines: ["فنتولين", "بخاخ فلوتيكازون"],
          condition: "مستقر",
          note:
              "أبلغ المريض عن تحكم جيد في الأعراض مع النظام الحالي. لا توجد أعراض ليلية خلال الأسبوع الماضي. يستخدم بخاخ الإنقاذ أقل من مرتين أسبوعياً. تم التأكيد على أهمية الاستمرار في الدواء الأساسي. نوقش وضع خطة عمل للربو للتعامل مع أي تفاقم مستقبلي. تم تثقيف المريض عن علامات التحذير المبكرة لتفاقم الربو.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "فحص روتيني وتقييم الحالة",
          date: DateTime(2023, 6, 2, 11, 30),
          medicines: ["فنتولين", "بخاخ فلوتيكازون"],
          condition: "مستقر",
          note:
              "الربو تحت السيطرة جيداً بالأدوية الحالية. قياسات ذروة الجريان ثابتة فوق 90% من أفضل قيمة شخصية. لا يوجد قيود على الأنشطة اليومية. تمت مراجعة إجراءات التحكم البيئي لتقليل التعرض لمسببات الحساسية. تم النظر في تقليل العلاج إذا استمر التحكم الجيد لثلاثة أشهر أخرى. تم إعطاء وصفة طبية محدثة وتحديد موعد متابعة بعد 3 أشهر ما لم تتفاقم الأعراض.",
        ),
      ],
      symptoms: ["ضيق تنفس", "صفير عند التنفس", "سعال"],
      diseaseName: "الربو",
      aboutDisease: "مرض مزمن يصيب الشعب الهوائية",
      medicines: ["فنتولين", "بخاخ كورتيكوستيرويد"],
      address: "دمشق",
      bloodType: "O+",
      allergies: ["غبار الطلع", "الأسبرين"],
      otherDiseases: ["ارتفاع ضغط الدم", "التهاب الجيوب الأنفية المزمن"],
      surgeries: [],
      heightCm: 175,
      weightKg: 80,
      smoker: true,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 7, 1, 10, 0),
      notes: "يحتاج لمتابعة مستمرة بسبب شدة الأعراض",
    ),
    Patient(
      patientId: 2,
      name: "سارة خالد",
      age: 28,
      phone: "0944556677",
      gender: "female",
      condition: "تحسن",
      lastCommunication: DateTime(2023, 6, 1, 9, 45),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص أولي للسكري",
          date: DateTime(2023, 3, 15, 11, 0),
          medicines: ["ميتفورمين"],
          condition: "تشخيص جديد",
          note:
              "ظهر المريض بأعراض كلاسيكية للسكري. مستوى الجلوكوز العشوائي كان 285 مجم/ديسيلتر، وHbA1c 8.9%. بدأ تناول ميتفورمين 500 مجم مرتين يومياً. تم تقديم تثقيف شامل عن السكري بما في ذلك مراقبة الجلوكوز، التعديلات الغذائية، وتوصيات التمارين. تمت مناقشة المضاعفات طويلة المدى وأهمية التحكم في سكر الدم. تم تحديد موعد لحضور فصول تثقيف السكري والمتابعة بعد 4 أسابيع.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن جرعات الأنسولين",
          date: DateTime(2023, 4, 2, 15, 30),
          medicines: ["ميتفورمين", "أنسولين جالارجين"],
          condition: "غير مسيطر عليه",
          note:
              "أبلغ المريض عن استمرار ارتفاع سكر الدم رغم الميتفورمين. قراءات الجلوكوز الصائم باستمرار فوق 180 مجم/ديسيلتر. تم إضافة الأنسولين القاعدي (جالارجين) بجرعة 10 وحدات ليلاً. تم تقديم تعليمات مفصلة عن حقن الأنسولين، التخزين، وإدارة نقص سكر الدم. تم التأكيد على أهمية مراقبة الجلوكوز بانتظام وتسجيل القراءات. تم تحديد موعد متابعة بعد أسبوعين لتعديل الجرعات.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول أعراض السكري",
          date: DateTime(2023, 5, 5, 9, 30),
          medicines: ["ميتفورمين", "أنسولين جالارجين"],
          condition: "تحسن",
          note:
              "تحسن في التحكم بسكر الدم بعد إضافة الأنسولين. مستوى الجلوكوز الصائم الآن في نطاق 110-130 مجم/ديسيلتر. انخفض HbA1c إلى 7.2%. تم تعديل جرعة الأنسولين إلى 12 وحدة ليلاً بناءً على سجل القراءات. لوحظ بعض حالات نقص سكر الدم الخفيف بعد الظهر - نصح بتناول وجبة خفيفة منتصف النهار. تمت مناقشة حساب الكربوهيدرات ومبادئ تعديل جرعة الأنسولين.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "فحص مستوى السكر في الدم",
          date: DateTime(2023, 5, 20, 10, 15),
          medicines: ["ميتفورمين", "أنسولين جالارجين"],
          condition: "مستقر",
          note:
              "تقدم ممتاز في التحكم بسكر الدم. لا توجد نوبات نقص سكر دم كبيرة. يستمر على النظام الحالي. تمت مناقشة أهمية العناية بالقدم وفحوصات العين السنوية. تم طلب تحليل البول للزلال الدقيق وملف الدهون. المريض يظهر تقنية جيدة لمراقبة الجلوكوز وحقن الأنسولين. يتم النظر في إضافة ناهض مستقبلات GLP-1 في الزيارة القادمة إذا رغبت في فقدان الوزن.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "متابعة تحسن الأعراض",
          date: DateTime(2023, 6, 1, 9, 45),
          medicines: ["ميتفورمين", "أنسولين جالارجين"],
          condition: "تحسن",
          note:
              "أبلغ المريض عن قراءات سكر دم مستقرة مع النظام الحالي. بعض الارتفاعات بعد الوجبات الكبيرة تصل إلى 180 مجم/ديسيلتر. تم التأكيد على أهمية انتظام تناول الكربوهيدرات ومواعيد الوجبات. نصح بفحص سكر الدم بعد ساعتين من الوجبات مرتين أسبوعياً لإدارة أفضل للنمط. لم يتم إجراء أي تغييرات على الأدوية حالياً. سيتم مراجعة السجلات في الموعد القادم.",
        ),
      ],
      symptoms: ["عطش شديد", "تبول متكرر", "إرهاق"],
      diseaseName: "السكري النوع الثاني",
      aboutDisease: "اضطراب في استقلاب الجلوكوز",
      medicines: ["ميتفورمين", "أنسولين"],
      address: "حلب",
      bloodType: "A-",
      allergies: [],
      otherDiseases: ["قصور الغدة الدرقية", "هشاشة العظام"],
      surgeries: ["استئصال الزائدة الدودية"],
      heightCm: 165,
      weightKg: 70,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 15, 14, 30),
      notes: "تحتاج إلى مراقبة مستوى السكر يومياً",
    ),
    Patient(
      patientId: 3,
      name: "علي حسن",
      age: 45,
      phone: "0955667788",
      gender: "male",
      condition: "حرج",
      lastCommunication: DateTime(2023, 6, 3, 8, 20),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "شكوى من آلام صدرية متقطعة",
          date: DateTime(2023, 4, 12, 14, 0),
          medicines: ["أسبرين", "نيتروجليسرين"],
          condition: "غير مستقر",
          note:
              "وصف المريض أعراض ذبحة صدرية نموذجية - ضغط تحت عظمة القص ينتشر للذراع الأيسر، يحدث مع الجهد ويختفي مع الراحة. تخطيط القلب يظهر تغيرات غير محددة في قطعة ST. بدأ تناول أسبرين 81 مجم يومياً ونيتروجليسرين تحت اللسان عند الحاجة. تم تحديد موعد لاختبار الجهد وصدى القلب. نصح بتجنب النشاط الشديد وطلب الرعاية الفورية إذا استمر الألم أكثر من 15 دقيقة أو لم يتحسن بالنيتروجليسرين.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "مكالمة طارئة لآلام صدرية حادة",
          date: DateTime(2023, 5, 1, 18, 45),
          medicines: ["أسبرين", "نيتروجليسرين", "كلوبيدوجريل"],
          condition: "حاد",
          note:
              "المريض يعاني من ألم صدر مستمر لم يتحسن بعد 3 جرعات من النيتروجليسرين خلال 45 دقيقة. يشتبه في متلازمة الشريان التاجي الحادة. تم إرشاده لطلب الإسعاف فوراً. تم الاتصال بالطوارئ لتنبيههم عن مريض قادم بأعراض احتشاء عضلة القلب. أوصى بجرعات تحميل من الأسبرين والكلوبيدوجريل أثناء انتظار الإسعاف. تبين لاحقاً أن المريض كان يعاني من انسداد 90% في الشريان التاجي الأمامي وتم تركيب دعامة.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.voiceCall,
          content: "مكالمة طارئة لآلام الصدر",
          date: DateTime(2023, 5, 20, 16, 20),
          medicines: ["أسبرين", "نيتروجليسرين", "كلوبيدوجريل", "ميتوبرولول"],
          condition: "ما بعد الدعامة",
          note:
              "أبلغ المريض عن عودة ألم الصدر لكنه أخف. قلق من احتمال تضيق الدعامة أو عدم اكتمال إعادة التوعية. الألم مختلف عن الحادثة الأولى - أكثر شبهاً بألم غشاء القلب. أوصى بالتقييم في الطوارئ لاستبعاد التهاب التامور أو مضاعفات أخرى. تأكد لاحقاً أنه ألم عضلي هيكلي. تم تعديل جرعة الميتوبرولول لتحسين التحكم في معدل ضربات القلب. تم التأكيد على أهمية الالتزام بالعلاج المثبط للصفائح.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "مراجعة بعد دخول المستشفى",
          date: DateTime(2023, 5, 27, 10, 0),
          medicines: ["أسبرين", "كلوبيدوجريل", "أتورفاستاتين", "ميتوبرولول"],
          condition: "مستقر",
          note:
              "التعافي بعد الاحتشاء يسير بشكل جيد. لا توجد نوبات ذبحة صدرية متكررة. يتقبل الأدوية دون آثار جانبية كبيرة. LDL عند الهدف <70 مجم/ديسيلتر. تمت مناقشة برنامج إعادة تأهيل قلبي وتعديلات نمط الحياة بما في ذلك الإقلاع عن التدخين، حمية البحر المتوسط، وبرنامج تمارين تدريجي. تمت مراجعة علامات التحذير من المضاعفات. تم تحديد موعد لصدى قلب متابعة لتقييم تحسن وظيفة الضخ.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "متابعة حالة القلب والأدوية",
          date: DateTime(2023, 6, 3, 8, 20),
          medicines: ["أسبرين", "كلوبيدوجريل", "أتورفاستاتين", "ميتوبرولول"],
          condition: "حرج",
          note:
              "أبلغ المريض عن التزام ممتاز بالأدوية لكنه اعترف بالعودة للتدخين أحياناً. تم التأكيد بشدة على ضرورة الإقلاع التام عن التدخين نظراً لتركيب الدعامة. تمت مناقشة خيارات بدائل النيكوتين. أبلغ عن تعب خفيف - تم تعديل وقت تناول الميتوبرولول لوقت النوم. لا يوجد ألم صدر أو أعراض قلبية أخرى. سيتم النظر في التحويل إلى تيكاجريلور إذا لم يتحقق الإقلاع عن التدخين بحلول الزيارة القادمة.",
        ),
      ],
      symptoms: ["ألم في الصدر", "غثيان", "تعرق"],
      diseaseName: "ذبحة صدرية",
      aboutDisease: "نقص تروية القلب",
      medicines: ["نيتروجليسرين", "أسبرين"],
      address: "حمص",
      bloodType: "B+",
      allergies: ["الأسماك"],
      otherDiseases: ["أمراض الكلى المزمنة", "أمراض الشرايين الطرفية"],
      surgeries: ["قسطرة قلبية"],
      heightCm: 180,
      weightKg: 85,
      smoker: true,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 10, 9, 0),
      notes: "حالة حرجة تحتاج إلى مراقبة دقيقة",
    ),
    Patient(
      patientId: 4,
      name: "ليلى عمر",
      age: 60,
      phone: "0966778899",
      gender: "female",
      condition: "مستقر",
      lastCommunication: DateTime(2023, 6, 2, 14, 15),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص ارتفاع ضغط الدم",
          date: DateTime(2023, 2, 10, 9, 0),
          medicines: ["أملوديبين"],
          condition: "تشخيص جديد",
          note:
              "تشخيص جديد بارتفاع ضغط الدم من المرحلة الثانية مع قراءات ضغط دم ثابتة 160-170/95-100 ملم زئبق في العيادة. لا يوجد دليل على تلف الأعضاء في التقييم الأولي. بدأ تناول أملوديبين 5 مجم يومياً. تم تقديم تثقيف مفصل عن ارتفاع ضغط الدم، بما في ذلك تقليل الصوديوم الغذائي، مبادئ حمية DASH، وأهمية المراقبة المنزلية المنتظمة. تم تحديد موعد متابعة بعد 4 أسابيع لتقييم فعالية الدواء وتحمل المريض له.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن أعراض جانبية للأدوية",
          date: DateTime(2023, 3, 5, 16, 30),
          medicines: ["أملوديبين"],
          condition: "آثار جانبية",
          note:
              "أبلغ المريض عن تورم خفيف في الكاحل واحمرار في الوجه مع أملوديبين. ضغط الدم يتحسن لكنه لا يزال فوق الهدف بمتوسط 150/92 ملم زئبق. أوصى بتقليل الجرعة إلى 2.5 مجم يومياً وإضافة لوسارتان 50 مجم يومياً لتحسين الفعالية مع تقليل الآثار الجانبية. نصح برفع الساقين عند الجلوس ومراقبة التورم. تم تحديد موعد لفحص ضغط الدم في العيادة بعد أسبوعين.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول ارتفاع ضغط الدم",
          date: DateTime(2023, 5, 10, 11, 0),
          medicines: ["أملوديبين", "لوسارتان"],
          condition: "تحسن",
          note:
              "العلاج المركب يعمل بشكل جيد. سجلات ضغط الدم المنزلية تظهر متوسط 132/84 ملم زئبق. اختفى التورم مع جرعة الأملوديبين الأقل. لا توجد آثار جانبية كبيرة من اللوسارتان. تم التأكيد على أهمية استمرار تعديلات نمط الحياة - أبلغ المريض عن التزام جيد بالنظام الغذائي قليل الملح. تم طلب لوحة أيض أساسية لمراقبة الكهارل ووظائف الكلى. سيتم النظر في تقليل الأملوديبين أكثر إذا استمر التحكم الجيد بضغط الدم.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "متابعة ضغط الدم",
          date: DateTime(2023, 5, 17, 13, 15),
          medicines: ["أملوديبين", "لوسارتان"],
          condition: "مستقر",
          note:
              "ضغط الدم لا يزال تحت السيطرة عند 128/82 ملم زئبق في العيادة. نتائج المختبر طبيعية. أبلغ المريض عن دوخة أحياناً عند الوقوف بسرعة - ربما بسبب انخفاض ضغط الدم الانتصابي مع التحكم الجيد. نصح بالنهوض ببطء وضمان الترطيب الكافي. تمت مناقشة خطة المراقبة طويلة المدى بما في ذلك صدى القلب السنوي لتقييم تضخم البطين الأيسر. لم يتم إجراء أي تغييرات على الأدوية حالياً.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "تقرير عن قراءات ضغط الدم المنزلية",
          date: DateTime(2023, 6, 2, 14, 15),
          medicines: ["أملوديبين", "لوسارتان"],
          condition: "مستقر",
          note:
              "أبلغ المريض عن قراءات ضغط دم منزلية ثابتة في النطاق المستهدف (120-135/75-85 ملم زئبق). لا توجد آثار جانبية للأدوية. تمت مراجعة تقنية قياس ضغط الدم المنزلي الصحيحة - يؤكد استخدام الحجم الصحيح لسوار الجهاز والراحة الكافية قبل القياس. شجع على الاستمرار في النظام الحالي وتعديلات نمط الحياة. سيتم النظر في تباعد مواعيد المتابعة (كل 6 أشهر) إذا استمر التحكم الممتاز.",
        ),
      ],
      symptoms: ["صداع", "دوخة", "نزيف أنفي"],
      diseaseName: "ارتفاع ضغط الدم",
      aboutDisease: "ارتفاع ضغط الدم المزمن",
      medicines: ["أملوديبين", "لوسارتان"],
      address: "اللاذقية",
      bloodType: "A+",
      allergies: [],
      otherDiseases: ["السكري النوع الثاني", "ارتفاع الدهون في الدم"],
      surgeries: [],
      heightCm: 160,
      weightKg: 65,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 20, 11, 30),
      notes: "ضغط الدم تحت السيطرة حالياً",
    ),
    Patient(
      patientId: 5,
      name: "محمود إبراهيم",
      age: 50,
      phone: "0977889900",
      gender: "male",
      condition: "تحسن",
      lastCommunication: DateTime(2023, 6, 1, 16, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص التهاب المفاصل",
          date: DateTime(2023, 1, 15, 10, 30),
          medicines: ["إيبوبروفين"],
          condition: "نشط",
          note:
              "ظهر المريض بأعراض نموذجية لالتهاب المفاصل الروماتويدي - ألم وتيبس في المفاصل الصغيرة يستمر لأكثر من ساعة كل صباح. الفحص السريري يظهر التهاب الغشاء المفصلي في مفاصل الأصابع. كانت اختبارات العامل الروماتويدي وanti-CCP إيجابية. بدأ تناول إيبوبروفين للتحكم في الأعراض وتم تحويله لأخصائي الروماتيزم لبدء علاج DMARD. تم طلب أشعة أساسية لليدين وعلامات الالتهاب. تمت مناقشة مسار المرض وأهمية العلاج المكثف المبكر.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "شكوى من تورم المفاصل",
          date: DateTime(2023, 3, 20, 15, 45),
          medicines: ["إيبوبروفين", "ميثوتريكسات"],
          condition: "تفاقم",
          note:
              "أبلغ المريض عن تفاقم أعراض المفاصل رغم مضادات الالتهاب غير الستيرويدية. بدأ أخصائي الروماتيزم الميثوتريكسات منذ أسبوعين لكنه لم يظهر فعالية بعد. نصح بالاستمرار في الميثوتريكسات حيث قد يستغرق 4-6 أسابيع للفعالية الكاملة. أضيف بريدنيزون قصير المدة للتحكم في الأعراض. تم التأكيد على أهمية تناول حمض الفوليك أسبوعياً مع الميثوتريكسات. تم تحديد موعد متابعة مع أخصائي الروماتيزم لتقييم الاستجابة.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "تقييم استجابة للعلاج",
          date: DateTime(2023, 4, 10, 11, 15),
          medicines: ["ميثوتريكسات", "حمض الفوليك"],
          condition: "تحسن",
          note:
              "استجابة جيدة للميثوتريكسات مع انخفاض 50% في عدد المفاصل المتورمة. انخفض تيبس الصباح إلى 30 دقيقة. انخفض معدل ترسيب كريات الدم من 58 إلى 22 مم/ساعة. يتحمل الدواء جيداً مع غثيان خفيف فقط. تم زيادة جرعة الميثوتريكسات للجرعة العلاجية. تمت مناقشة تجنب الكحول والمراقبة المنتظمة لوظائف الكبد. شجع على تمارين لطيفة للمحافظة على مدى حركة المفاصل.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن أدوية التهاب المفاصل",
          date: DateTime(2023, 5, 19, 10, 30),
          medicines: ["ميثوتريكسات", "حمض الفوليك", "سلفاسالازين"],
          condition: "مستقر",
          note:
              "المريض بحالة جيدة مع النظام الحالي لكنه أبلغ عن بعض الأعراض الاختراقية. أضاف أخصائي الروماتيزم السلفاسالازين كعلاج مركب. تمت مراجعة الآثار الجانبية المحتملة بما في ذلك اضطراب المعدة والصداع. تم التأكيد على أهمية التحاليل الدموية المنتظمة لمراقبة نخاع العظم. تم تثقيف المريض عن خطر العدوى ومتى يحبس الأدوية إذا كان يعاني من الحمى. لم يتم إجراء تغييرات على خطة التحكم في الألم الحالية.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "فحص دوري وتحسن الأعراض",
          date: DateTime(2023, 6, 1, 16, 0),
          medicines: ["ميثوتريكسات", "حمض الفوليك", "سلفاسالازين"],
          condition: "تحسن",
          note:
              "استجابة ممتازة للعلاج المركب. أعراض المفاصل ضئيلة. الفحص السريري لا يظهر التهاب غشاء مفصلي نشط. CRP طبيعي. تمت مناقشة خطة العلاج طويلة المدى بما في ذلك الانتقال المحتمل لعامل بيولوجي إذا لم يتم الحفاظ على الهدأة. تمت مراجعة أهمية الاستمرار في الأدوية حتى مع الشعور بالتحسن. تم تحديد موعد لتحاليل روتينية للمراقبة والمتابعة بعد 3 أشهر.",
        ),
      ],
      symptoms: ["ألم المفاصل", "تورم", "تيبس الصباح"],
      diseaseName: "التهاب المفاصل الروماتويدي",
      aboutDisease: "مرض مناعي ذاتي يصيب المفاصل",
      medicines: ["ميثوتريكسات", "إيبوبروفين"],
      address: "حماة",
      bloodType: "AB+",
      allergies: ["المحار"],
      otherDiseases: ["الصدفية", "ارتجاع المريء"],
      surgeries: ["جراحة الركبة اليمنى"],
      heightCm: 170,
      weightKg: 75,
      smoker: false,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 25, 15, 0),
      notes: "تحسن ملحوظ في حركة المفاصل",
    ),
    Patient(
      patientId: 6,
      name: "نورا أحمد",
      age: 32,
      phone: "0988990011",
      gender: "female",
      condition: "جيد",
      lastCommunication: DateTime(2023, 5, 30, 12, 30),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "استشارة أولية حول الحساسية الموسمية",
          date: DateTime(2023, 3, 5, 14, 0),
          medicines: ["لوراتادين"],
          condition: "متوسط",
          note:
              "ظهر المريض بأعراض كلاسيكية لالتهاب الأنف التحسسي تتزامن مع موسم حبوب اللقاح الربيعي. الأعراض تؤثر بشكل كبير على جودة الحياة والنوم. بدأ تناول لوراتادين يومي وغسول الأنف المالح. أوصى بضوابط بيئية تشمل إبقاء النوافذ مغلقة، استخدام مرشحات HEPA، والاستحمام بعد التعرض للخارج. تمت مناقشة الانتقال المحتمل لستيرويدات الأنف إذا لم تتحكم الأعراض خلال أسبوعين.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "شكوى من تفاقم الأعراض",
          date: DateTime(2023, 4, 15, 10, 30),
          medicines: ["لوراتادين", "بخاخ فلوتيكازون أنفي"],
          condition: "شديد",
          note:
              "أبلغ المريض عن تحسن ضئيل مع اللوراتادين وحده. أضيف بخاخ فلوتيكازون الأنفي مع تعليمات مفصلة عن تقنية الاستخدام الصحيحة. تم التأكيد على الحاجة للاستخدام اليومي المنتظم بدلاً من حسب الحاجة. أوصى بالاستمرار في اللوراتادين وإضافة قطرات مضادات الهيستامين للعين لأعراض العين. نصح بمراقبة تهيج الأنف أو الرعاف من البخاخ الستيرويدي.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول أعراض الحساسية",
          date: DateTime(2023, 5, 16, 15, 45),
          medicines: ["لوراتادين", "بخاخ فلوتيكازون أنفي"],
          condition: "تحسن",
          note:
              "تحسن كبير مع العلاج المركب. تحسنت أعراض الأنف بنسبة 80%، وأعراض العين مع القطرات. يستخدم أدوية الإنقاذ أقل من مرة أسبوعياً. تمت مراجعة تقنية البخاخ الأنفي الصحيحة - كان المريض يوجه البخاخ بشكل غير صحيح في البداية. تمت مناقشة خطة الإدارة طويلة المدى بما في ذلك اختبارات الحساسية المحتملة والعلاج المناعي إذا استمرت الأعراض كمشكلة سنوياً.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن جرعات الأدوية",
          date: DateTime(2023, 5, 25, 11, 0),
          medicines: ["لوراتادين", "بخاخ فلوتيكازون أنفي"],
          condition: "مستقر",
          note:
              "المريض يسأل عن تقليل الأدوية مع انتهاء موسم حبوب اللقاح. أوصى بالاستمرار في النظام الكامل لمدة أسبوعين آخرين ثم محاولة تقليل الفلوتيكازون لمرة يومياً إذا استمر التحكم في الأعراض. يمكن إيقاف اللوراتادين إذا لم تظهر أعراض لمدة أسبوع. قدم إرشادات عن التعرف على متى يستأنف العلاج الكامل إذا عادت الأعراض. تم التأكيد على أن الستيرويدات الأنفية قد تستغرق عدة أيام لتصبح فعالة مرة أخرى إذا توقفت.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "تقييم استجابة للعلاج الجديد",
          date: DateTime(2023, 5, 30, 12, 30),
          medicines: ["بخاخ فلوتيكازون أنفي"],
          condition: "جيد",
          note:
              "أعراض الحساسية تحت السيطرة جيداً مع العلاج الأحادي بالستيرويد الأنفي. تم إيقاف اللوراتادين بنجاح دون عودة الأعراض. تنخفض أعداد حبوب اللقاح - خطة لإيقاف الفلوتيكازون خلال الأسبوعين القادمين ما لم تستمر الأعراض. تمت مناقشة استراتيجيات لموسم الحساسية القادم بما في ذلك بدء الأدوية استباقياً قبل ظهور الأعراض. تم تحويله لاختبارات الحساسية لتحديد المحفزات المحددة للعلاج المناعي المحتمل.",
        ),
      ],
      symptoms: ["عطاس", "حكة في العين", "سيلان الأنف"],
      diseaseName: "حساسية الأنف",
      aboutDisease: "تفاعل تحسسي مع مسببات الحساسية",
      medicines: ["لوراتادين", "بخاخ كورتيكوستيرويد أنفي"],
      address: "درعا",
      bloodType: "O-",
      allergies: ["غبار الطلع", "العث"],
      otherDiseases: ["الربو", "الإكزيما التأتبية"],
      surgeries: [],
      heightCm: 168,
      weightKg: 60,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 12, 10, 0),
      notes: "تجنب التعرض للمواد المسببة للحساسية",
    ),
    Patient(
      patientId: 7,
      name: "يوسف ناصر",
      age: 40,
      phone: "0999001122",
      gender: "male",
      condition: "مستقر",
      lastCommunication: DateTime(2023, 6, 2, 10, 45),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص ارتجاع المريء",
          date: DateTime(2023, 2, 20, 9, 30),
          medicines: ["أوميبرازول"],
          condition: "نشط",
          note:
              "ظهر المريض بأعراض نموذجية لارتجاع المريء - حرقة تحدث 3-4 مرات أسبوعياً، غالباً ليلية، مع قلس أحياناً. الأعراض تتداخل مع النوم. بدأ تناول أوميبرازول 20 مجم يومياً قبل الإفطار. أوصى بتعديلات غذائية تشمل تجنب الوجبات المتأخرة، تقليل الكافيين/الكحول، ورفع رأس السرير. نصح بفقدان الوزن حيث أن مؤشر كتلة الجسم 28.4. تم تحديد موعد متابعة بعد 4 أسابيع لتقييم الاستجابة.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "شكوى من حرقة متكررة",
          date: DateTime(2023, 4, 5, 18, 15),
          medicines: ["أوميبرازول"],
          condition: "مستمر",
          note:
              "أبلغ المريض عن تحسن جزئي فقط مع أوميبرازول. يعترف باستهلاك القهوة المتكرر والعشاء المتأخر. تم زيادة أوميبرازول إلى 40 مجم يومياً وتأكيد تعديلات نمط الحياة. أضيف جافيسكون حسب الحاجة للأعراض الاختراقية. تمت مناقشة أعراض الإنذار التي تتطلب تقييماً عاجلاً (عسر البلع، فقدان الوزن، فقر الدم). تم النظر في اختبار جرثومة المعدة إذا استمرت الأعراض رغم العلاج الأمثل بمثبطات مضخة البروتون.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول حرقة المعدة",
          date: DateTime(2023, 5, 7, 14, 30),
          medicines: ["أوميبرازول", "رانيتيدين"],
          condition: "تحسن",
          note:
              "تحكم أفضل في الأعراض مع جرعة مثبطات مضخة البروتون الأعلى وتحسن الالتزام بتعديلات نمط الحياة. بعض الأعراض الاختراقية عند تناول أطعمة محفزة. أضيف رانيتيدين ليلاً لقمع الحمض الإضافي. تمت مناقشة مخاطر الاستخدام طويل الأمد لمثبطات مضخة البروتون بما في ذلك نقص المغذيات المحتمل وزيادة خطر العدوى. خطة لمحاولة تقليل العلاج بعد 3 أشهر من التحكم الجيد.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "متابعة حالة ارتجاع المريء",
          date: DateTime(2023, 5, 14, 12, 0),
          medicines: ["أوميبرازول", "رانيتيدين"],
          condition: "مستقر",
          note:
              "أبلغ المريض عن تحكم ممتاز في الأعراض مع النظام الحالي. يستخدم أدوية الإنقاذ أقل من مرة أسبوعياً. فقد 3 كجم من خلال التغييرات الغذائية. تم التأكيد على أهمية الاستمرار في تعديلات نمط الحياة حتى عند عدم وجود أعراض. تمت مناقشة خطة التقليل التدريجي للأدوية - سيتم أولاً محاولة تقليل أوميبرازول إلى 20 مجم يومياً إذا استمر التحكم في الأعراض لشهر آخر.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "تقييم فعالية الأدوية الجديدة",
          date: DateTime(2023, 6, 2, 10, 45),
          medicines: ["أوميبرازول"],
          condition: "مستقر",
          note:
              "الحفاظ على تحكم جيد في الأعراض مع أوميبرازول 20 مجم يومياً فقط. توقف بنجاح عن رانيتيدين دون عودة الأعراض. أبلغ المريض عن التزام ثابت بالتعديلات الغذائية وفقدان إجمالي 5 كجم. خطة للاستمرار بجرعة مثبطات مضخة البروتون الحالية لشهرين آخرين ثم محاولة التحول للعلاج حسب الحاجة. لم يتم الإبلاغ عن أي أعراض إنذارية. يتم النظر في إمكانية إجراء تنظير داخلي إذا عادت الأعراض بعد تقليل الدواء.",
        ),
      ],
      symptoms: ["حرقة في الصدر", "صعوبة البلع", "سعال جاف"],
      diseaseName: "ارتجاع معدي مريئي",
      aboutDisease: "ارتجاع حمض المعدة إلى المريء",
      medicines: ["أوميبرازول", "رانيتيدين"],
      address: "طرطوس",
      bloodType: "B-",
      allergies: [],
      otherDiseases: ["فتق الحجاب الحاجز", "التهاب المعدة المزمن"],
      surgeries: [],
      heightCm: 178,
      weightKg: 90,
      smoker: true,
      alcoholUse: true,
      nextAppointment: DateTime(2023, 6, 18, 16, 0),
      notes: "يجب تجنب الأطعمة الحارة والدهنية",
    ),
    Patient(
      patientId: 8,
      name: "هبة رامي",
      age: 25,
      phone: "0911223344",
      gender: "female",
      condition: "جيد",
      lastCommunication: DateTime(2023, 5, 31, 14, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "فحص دم يكشف عن فقر الدم",
          date: DateTime(2023, 2, 5, 10, 30),
          medicines: ["كبريتات الحديدوز"],
          condition: "متوسط",
          note:
              "تم تشخيص فقر الدم الناجم عن نقص الحديد (الهيموغلوبين 9.2 جم/ديسيلتر، الفيريتين 8 نانوغرام/مل). بدأ تناول كبريتات الحديدوز 325 مجم ثلاث مرات يومياً مع فيتامين سي لتعزيز الامتصاص. أوصى بمصادر الحديد الغذائية وتجنب الكالسيوم/مضادات الحموضة مع جرعات الحديد. تم التحقيق في الأسباب المحتملة - أبلغت المريضة عن نزيف طمثي غزير. تم طلب فحص بالموجات فوق الصوتية للحوض وعمل جهاز هضمي إذا لم يحدث تحسن بعد 3 أشهر من العلاج. تم تحديد موعد لتحليل دم متابعة بعد شهر.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن مكملات الحديد",
          date: DateTime(2023, 3, 15, 15, 0),
          medicines: ["كبريتات الحديدوز"],
          condition: "آثار جانبية",
          note:
              "أبلغت المريضة عن إمساك وغثيان شديدين من علاج الحديد. أوصى بالتحول إلى غلوكونات الحديدوز الذي قد يكون أسهل تحملاً، وإضافة ملين براز. نصح بتناوله مع الطعام إذا لزم الأمر رغم الامتصاص الأقل قليلاً. تم التأكيد على أهمية الاستمرار في العلاج رغم الآثار الجانبية حيث يجب أن تتحسن مع الوقت. اقترح تجربة الجرعات يوم بعد يوم إذا استمرت الآثار الجانبية.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول فقر الدم",
          date: DateTime(2023, 5, 12, 9, 15),
          medicines: ["غلوكونات الحديدوز"],
          condition: "تحسن",
          note:
              "أظهرت التحاليل المتكررة تحسن الهيموغلوبين إلى 11.4 جم/ديسيلتر. تتحمل غلوكونات الحديدوز بشكل أفضل مع آثار جانبية معدية معوية أقل. كشف فحص الحوض عن أورام ليفية - تم تحويلها لطبيب نساء لإدارة غزارة الطمث. تمت مناقشة إمكانية الحديد الوريدي إذا لم يكن العلاج الفموي فعالاً بالكامل أو غير محتمل. شجع على الاستمرار في العلاج لمدة 3 أشهر على الأقل بعد تطبيع الهيموغلوبين لتجديد مخازن الحديد.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "تقرير عن تحسن الأعراض",
          date: DateTime(2023, 5, 25, 11, 30),
          medicines: ["غلوكونات الحديدوز"],
          condition: "تحسن",
          note:
              "أبلغت المريضة عن زيادة مستويات الطاقة واختفاء الشحوب. لم تعد تعاني من ضيق التنفس مع الأنشطة الروتينية. كان آخر دورة شهرية أخف بعد بدء حمض الترانيكساميك من قبل طبيب النساء. نصح بالاستمرار في نظام الحديد الحالي وإعادة التحاليل بعد شهر. إذا تطبيع الهيموغلوبين في الفحص القادم، سيتم تباعد الجرعات للحفاظ على مخازن الحديد.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "فحص متابعة لمستوى الحديد",
          date: DateTime(2023, 5, 31, 14, 0),
          medicines: ["غلوكونات الحديدوز"],
          condition: "جيد",
          note:
              "الهيموغلوبين الآن طبيعي عند 12.8 جم/ديسيلتر، الفيريتين ارتفع إلى 35 نانوغرام/مل. المريضة تشعر بأنها عادت إلى مستويات طاقتها الأساسية. طبيب النساء يدير الأورام الليفية بشكل فعال بالعلاج الدوائي. خطة للاستمرار في الحديد بوتيرة أقل (يوم بعد يوم) لثلاثة أشهر أخرى لتجديد المخازن بالكامل. سيتم فحص مخازن الحديد مرة أخرى في ذلك الوقت والنظر في التوقف إذا كانت كافية. تم تثقيفها عن علامات التكرار.",
        ),
      ],
      symptoms: ["إرهاق", "شحوب", "ضيق تنفس"],
      diseaseName: "فقر الدم الناجم عن نقص الحديد",
      aboutDisease: "انخفاض مستوى الهيموغلوبين بسبب نقص الحديد",
      medicines: ["كبريتات الحديدوز", "فيتامين سي"],
      address: "إدلب",
      bloodType: "A+",
      allergies: [],
      otherDiseases: ["الداء البطني", "قصور الغدة الدرقية"],
      surgeries: [],
      heightCm: 163,
      weightKg: 55,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 30, 13, 0),
      notes: "تحسن ملحوظ في مستوى الهيموغلوبين",
    ),
    Patient(
      patientId: 9,
      name: "وسام علي",
      age: 55,
      phone: "0922334455",
      gender: "male",
      condition: "تحسن",
      lastCommunication: DateTime(2023, 6, 1, 17, 15),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص ارتفاع الكوليسترول",
          date: DateTime(2023, 1, 10, 14, 0),
          medicines: ["أتورفاستاتين"],
          condition: "تشخيص جديد",
          note:
              "مريض بفرط شحميات الدم حديث التحديد (LDL 190 مجم/ديسيلتر، الكوليسترول الكلي 280 مجم/ديسيلتر). لا يوجد دليل على مرض الشريان التاجي لكنه عالي الخطورة بسبب التاريخ العائلي. بدأ تناول أتورفاستاتين 20 مجم يومياً. أوصى بتغييرات نمط الحياة العلاجية بما في ذلك حمية البحر المتوسط وزيادة النشاط البدني. تم طلب اختبارات وظائف الكبد والكرياتين كيناز الأساسية. تمت مناقشة أهمية الالتزام بالأدوية والمتابعة بعد 3 أشهر لتقييم الاستجابة.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن نظام غذائي",
          date: DateTime(2023, 3, 5, 16, 30),
          medicines: ["أتورفاستاتين"],
          condition: "نشط",
          note:
              "المريض يطلب توضيحاً للتوصيات الغذائية. قدم إرشادات مفصلة عن تقليل الدهون المشبعة (<7% من السعرات)، زيادة الألياف القابلة للذوبان، ودمج الستيرولات النباتية. اقترح استشارة أخصائي تغذية للتخطيط للوجبات الشخصية. أبلغ عن آلام عضلية خفيفة مع الستاتين - أوصى بتناوله عند النوم وضمان الترطيب الكافي. لا توجد علامات على انحلال العضلات. سيتم مراقبة الأعراض والنظر في تعديل الجرعة إذا استمرت.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "مراجعة تحاليل الدم",
          date: DateTime(2023, 4, 15, 10, 0),
          medicines: ["أتورفاستاتين"],
          condition: "تحسن",
          note:
              "أظهرت الدهون المتكررة استجابة جيدة للعلاج (انخفض LDL إلى 110 مجم/ديسيلتر). إنزيمات الكبد طبيعية. أبلغ المريض عن تحسن العادات الغذائية وفقدان 4 كجم. اختفت الأعراض العضلية مع الجرعة عند النوم. تم زيادة أتورفاستاتين إلى 40 مجم يومياً لتحقيق خفض أكثر عدوانية لـ LDL نظراً للملف الشخصي عالي الخطورة. تم التأكيد على أهمية استمرار تعديلات نمط الحياة حتى مع الدواء. تم تحديد موعد لدهون متابعة بعد 3 أشهر.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.voiceCall,
          content: "استفسار عن أدوية الكوليسترول",
          date: DateTime(2023, 5, 18, 17, 30),
          medicines: ["أتورفاستاتين", "إزيتيميب"],
          condition: "مستمر",
          note:
              "المريض قلق بشأن الحاجة لدواء إضافي رغم علاج الستاتين. LDL في آخر فحص كان 98 مجم/ديسيلتر - الهدف <70 مجم/ديسيلتر للخطورة العالية. أضيف إزيتيميب لخفض LDL الإضافي. تم شرح آلية العمل والملف الآمن. طمأن أن العلاج المركب غالباً ما يكون ضرورياً للمرضى عاليي الخطورة. نصح بالاستمرار في جرعة الستاتين الحالية كما يتحمل. سيتم إعادة فحص الدهون بعد 6 أسابيع لتقييم التأثير المشترك.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.consultation,
          content: "تقييم استجابة للعلاج",
          date: DateTime(2023, 6, 1, 17, 15),
          medicines: ["أتورفاستاتين", "إزيتيميب"],
          condition: "تحسن",
          note:
              "استجابة ممتازة للعلاج المركب مع LDL الآن عند 68 مجم/ديسيلتر. يتحمل الأدوية جيداً بدون آثار جانبية. تبني المريض روتين تمارين منتظم وفقد إجمالي 7 كجم. تمت مناقشة خطة الإدارة طويلة المدى بما في ذلك ملف الدهون السنوي والاستمرار في التركيز على نمط الحياة. لا تغييرات على النظام الحالي. سيتم النظر في مزيد من التعديلات فقط إذا ارتفع LDL فوق الهدف في المراقبة المستقبلية.",
        ),
      ],
      symptoms: [],
      diseaseName: "ارتفاع الكوليسترول",
      aboutDisease: "ارتفاع مستوى الدهون في الدم",
      medicines: ["أتورفاستاتين", "فايبرات"],
      address: "السويداء",
      bloodType: "O+",
      allergies: [],
      otherDiseases: ["مرض الشريان التاجي", "متلازمة التمثيل الغذائي"],
      surgeries: [],
      heightCm: 172,
      weightKg: 88,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 7, 5, 11, 0),
      notes: "تحسن في مستوى الكوليسترول ولكن يحتاج لمتابعة",
    ),
    Patient(
      patientId: 10,
      name: "ريماس خليل",
      age: 30,
      phone: "0933445566",
      gender: "female",
      condition: "مستقر",
      lastCommunication: DateTime(2023, 6, 3, 9, 0),
      history: [
        PatientHistory(
          id: 1,
          type: HistoryItemType.consultation,
          content: "تشخيص الصداع النصفي",
          date: DateTime(2023, 2, 20, 11, 0),
          medicines: ["سوماتريبتان"],
          condition: "نشط",
          note:
              "ظهرت المريضة بأعراض الصداع النصفي الكلاسيكية - صداع نابض أحادي الجانب مع غثيان، حساسية للضوء يستمر 12-24 ساعة، يحدث 2-3 مرات شهرياً. لا توجد أعراض هالة. تم تحديد محفزات محتملة تشمل الإجهاد، الشوكولاتة، والدورة الشهرية. وصف سوماتريبتان للعلاج الحاد مع تعليمات للتناول المبكر عند بدء الصداع. أوصى بمذكرات الصداع لتحديد الأنماط والمحفزات. تمت مناقشة خيارات الوقاية إذا زاد التكرار.",
        ),
        PatientHistory(
          id: 2,
          type: HistoryItemType.voiceCall,
          content: "مكالمة طارئة لنوبة صداع شديدة",
          date: DateTime(2023, 4, 5, 8, 30),
          medicines: ["سوماتريبتان", "نابروكسين"],
          condition: "حاد",
          note:
              "أبلغت المريضة عن صداع نصفي شديد لا يستجيب للجرعة الأولى من سوماتريبتان. تم إرشادها لأخذ جرعة ثانية بعد ساعتين إذا لم يحدث تحسن وإضافة نابروكسين للتأثير التآزري. أوصى ببيئة هادئة مظلمة وترطيب. تمت مناقشة علامات الحاجة لتقييم الطوارئ (استمرار >72 ساعة، أعراض عصبية بؤرية). أبلغت لاحقاً عن استجابة جيدة لأدوية الإنقاذ بعد 4 ساعات. تم النظر في إضافة مضاد للقيء للنوبات المستقبلية.",
        ),
        PatientHistory(
          id: 3,
          type: HistoryItemType.consultation,
          content: "استشارة حول الصداع النصفي",
          date: DateTime(2023, 5, 9, 11, 30),
          medicines: ["سوماتريبتان", "بروبرانولول"],
          condition: "مزمن",
          note:
              "زاد تكرار الصداع إلى أسبوعي، يتسق مع التحول للصداع النصفي المزمن. بدأ بروبرانولول للوقاية. تمت مراجعة خطر الإفراط في استخدام الدواء - المريضة تستخدم سوماتريبتان ≤2 يوم/أسبوع بشكل مناسب. أضيف المغنيسيوم والريبوفلافين بناءً على الأدلة للوقاية من الصداع النصفي. أحيلت لتقنيات إدارة الإجهاد. خطة لتقييم فعالية العلاج الوقائي بعد شهرين.",
        ),
        PatientHistory(
          id: 4,
          type: HistoryItemType.consultation,
          content: "متابعة الصداع النصفي",
          date: DateTime(2023, 5, 16, 10, 0),
          medicines: ["سوماتريبتان", "بروبرانولول"],
          condition: "تحسن",
          note:
              "أبلغت المريضة عن انخفاض 50% في تكرار الصداع النصفي مع بروبرانولول. تحسن القدرة على إدارة النوبات مع استخدام التريبتان المبكر. تظهر مذكرات الصداع أن معظم النوبات الآن مرتبطة بإجهاد العمل وقلة النوم. بدأ إحالة للعلاج المعرفي السلوكي لإدارة الإجهاد. تم تعديل جرعة بروبرانولول للتوازن الأمثل بين الفعالية والآثار الجانبية. تمت مناقشة خيار التحويل لمضاد مستقبلات CGRP إذا كان الوقاية الحالية غير كافية.",
        ),
        PatientHistory(
          id: 5,
          type: HistoryItemType.voiceCall,
          content: "تقرير عن تكرار النوبات",
          date: DateTime(2023, 6, 3, 9, 0),
          medicines: ["سوماتريبتان", "بروبرانولول"],
          condition: "مستقر",
          note:
              "تكرار الصداع النصفي مستقر عند 2-3 شهرياً، منخفض من أسبوعي. يتحمل البروبرانولول جيداً. تستخدم أدوية الحادة بشكل مناسب دون إفراط. تطبق تقنيات تقليل الإجهاد بفائدة واضحة. لا تغييرات على النظام الحالي. خطة للاستمرار في العلاج الوقائي لمدة 6 أشهر ثم النظر في التخفيض التدريجي إذا استمرت الهدأة. قدم خطة علاج محدثة للنوبات الاختراقية.",
        ),
      ],
      symptoms: ["صداع شديد", "غثيان", "حساسية للضوء"],
      diseaseName: "الصداع النصفي",
      aboutDisease: "اضطراب عصبي يسبب صداعًا شديدًا",
      medicines: ["سوماتريبتان", "إيبوبروفين"],
      address: "دير الزور",
      bloodType: "AB-",
      allergies: ["الشوكولاتة", "الجبن"],
      otherDiseases: ["الألم العضلي الليفي", "الاكتئاب"],
      surgeries: [],
      heightCm: 167,
      weightKg: 58,
      smoker: false,
      alcoholUse: false,
      nextAppointment: DateTime(2023, 6, 22, 14, 0),
      notes: "تجنب المحفزات المعروفة للصداع",
    ),
  ],
};

final List<String> patientListViewHeader = [
  'name',
  'age',
  'gender',
  'phone',
  'address',
  'disease',
  'condition',
  'aboutDisease',
  'symptoms',
  'medicines',
  //
  'bloodType',
  'allergies',
  'otherDiseases',
  'surgeries',
  'heightCm',
  'weightKg',
  'smoker',
  'alcoholUse',
  'notes',
  //
  'lastCommunication',
  'nextAppointment',
];

List patientListViewData(Patient patient) => [
  patient.name,
  patient.age, // int
  patient.gender,
  patient.phone,
  patient.address,
  patient.diseaseName,
  patient.condition,
  patient.aboutDisease,
  patient.symptoms, // list
  patient.medicines, // list
  patient.bloodType,
  patient.allergies, // list
  patient.otherDiseases, // list
  patient.surgeries, // list
  patient.heightCm,
  patient.weightKg,
  patient.smoker,
  patient.alcoholUse,
  patient.notes,
  patient.lastCommunication,
  patient.nextAppointment,
];
