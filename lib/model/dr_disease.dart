// ignore_for_file: public_member_api_docs, sort_constructors_first
class Doctor {
  final String name;
  final String specialty;
  final String phone;
  final String location;
  final String gender;

  Doctor({
    required this.name,
    required this.specialty,
    required this.phone,
    required this.location,
    required this.gender,
  });
}

class Disease {
  final String name;
  final List<Doctor> doctors;

  Disease({required this.name, required this.doctors});
}

final Map<String, List<Disease>> medicalDataArabic = {
  "الأمراض الحركية والجهاز العصبي": [
    Disease(
      name: "الشلل الدماغي",
      doctors: [
        Doctor(
          name: "د. أحمد عبد الله",
          specialty: "علاج طبيعي",
          phone: "0991234567",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. سارة محمد",
          specialty: "عصبية أطفال",
          phone: "0987654321",
          location: "حلب",
          gender: 'female',
        ),
        Doctor(
          name: "د. فادي ناصر",
          specialty: "علاج فيزيائي",
          phone: "0965432187",
          location: "حمص",
          gender: 'male',
        ),
        Doctor(
          name: "د. رنا يوسف",
          specialty: "علاج تأهيلي",
          phone: "0956784321",
          location: "طرطوس",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "التصلب اللويحي",
      doctors: [
        Doctor(
          name: "د. خالد مصطفى",
          specialty: "أمراض عصبية",
          phone: "0945678901",
          location: "اللاذقية",
          gender: 'male',
        ),
        Doctor(
          name: "د. هبة علي",
          specialty: "طب أعصاب",
          phone: "0934567890",
          location: "طرطوس",
          gender: 'female',
        ),
        Doctor(
          name: "د. نور الدين سلامة",
          specialty: "علاج طبيعي",
          phone: "0976543218",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. ديما عيسى",
          specialty: "أخصائية تأهيل عصبي",
          phone: "0987654312",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "إصابات الحبل الشوكي",
      doctors: [
        Doctor(
          name: "د. يوسف إبراهيم",
          specialty: "جراحة أعصاب",
          phone: "0956781234",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. مريم حسن",
          specialty: "علاج طبيعي",
          phone: "0943216789",
          location: "حمص",
          gender: 'female',
        ),
        Doctor(
          name: "د. سامي المصري",
          specialty: "علاج وظيفي",
          phone: "0923456781",
          location: "طرطوس",
          gender: 'male',
        ),
        Doctor(
          name: "د. ريما خالد",
          specialty: "إعادة تأهيل حركي",
          phone: "0912345678",
          location: "اللاذقية",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "داء باركنسون",
      doctors: [
        Doctor(
          name: "د. سامر منصور",
          specialty: "علاج أعصاب",
          phone: "0981112233",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. ليلى زين",
          specialty: "علاج طبيعي",
          phone: "0998877665",
          location: "اللاذقية",
          gender: 'female',
        ),
        Doctor(
          name: "د. هيثم درويش",
          specialty: "علاج فيزيائي",
          phone: "0976532189",
          location: "حلب",
          gender: 'male',
        ),
        Doctor(
          name: "د. فادية الأحمد",
          specialty: "أخصائية تأهيل حركي",
          phone: "0965432178",
          location: "طرطوس",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "الجلطات الدماغية",
      doctors: [
        Doctor(
          name: "د. حسام الديب",
          specialty: "جراحة أعصاب",
          phone: "0987654321",
          location: "حلب",
          gender: 'male',
        ),
        Doctor(
          name: "د. هناء كريم",
          specialty: "علاج طبيعي",
          phone: "0976543210",
          location: "طرطوس",
          gender: 'female',
        ),
        Doctor(
          name: "د. محمود سليمان",
          specialty: "إعادة تأهيل عصبي",
          phone: "0954321765",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. ندى فرج",
          specialty: "علاج فيزيائي",
          phone: "0945678901",
          location: "اللاذقية",
          gender: 'female',
        ),
      ],
    ),
  ],
  "الأمراض الوراثية والجينية": [
    Disease(
      name: "متلازمة داون",
      doctors: [
        Doctor(
          name: "د. يوسف إبراهيم",
          specialty: "طب أطفال",
          phone: "0956781234",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. مريم حسن",
          specialty: "استشاري وراثة",
          phone: "0943216789",
          location: "حمص",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "التليف الكيسي",
      doctors: [
        Doctor(
          name: "د. رامي أحمد",
          specialty: "أمراض صدرية",
          phone: "0965432178",
          location: "حلب",
          gender: 'male',
        ),
        Doctor(
          name: "د. هدى ديب",
          specialty: "استشاري أمراض وراثية",
          phone: "0954321765",
          location: "اللاذقية",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "أمراض ضمور العضلات",
      doctors: [
        Doctor(
          name: "د. علي شريف",
          specialty: "طب الأعصاب",
          phone: "0945678901",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. ريم عيسى",
          specialty: "علاج طبيعي",
          phone: "0987654321",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
  ],
  "الأمراض الحسية": [
    Disease(
      name: "فقدان السمع أو ضعفه",
      doctors: [
        Doctor(
          name: "د. حسن إبراهيم",
          specialty: "أذن وأنف وحنجرة",
          phone: "0991112233",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. سلوى قاسم",
          specialty: "أجهزة سمعية",
          phone: "0988765432",
          location: "حمص",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "ضعف البصر أو العمى",
      doctors: [
        Doctor(
          name: "د. رائد محمود",
          specialty: "طب وجراحة العيون",
          phone: "0976543210",
          location: "اللاذقية",
          gender: 'male',
        ),
        Doctor(
          name: "د. ليلى فارس",
          specialty: "تأهيل بصري",
          phone: "0965432109",
          location: "طرطوس",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "اضطرابات النطق والتواصل",
      doctors: [
        Doctor(
          name: "د. سامي نور",
          specialty: "أخصائي نطق",
          phone: "0943216789",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. نهى يوسف",
          specialty: "علاج تواصل",
          phone: "0934567890",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
  ],
  "الأمراض النفسية والعقلية": [
    Disease(
      name: "التوحد",
      doctors: [
        Doctor(
          name: "د. ياسمين علي",
          specialty: "طب نفسي أطفال",
          phone: "0991122334",
          location: "حمص",
          gender: 'female',
        ),
        Doctor(
          name: "د. كريم حسن",
          specialty: "أخصائي توحد",
          phone: "0987651234",
          location: "دمشق",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "اضطراب نقص الانتباه وفرط النشاط",
      doctors: [
        Doctor(
          name: "د. خالد أحمد",
          specialty: "طب نفسي أطفال",
          phone: "0976543210",
          location: "طرطوس",
          gender: 'male',
        ),
        Doctor(
          name: "د. سعاد محمود",
          specialty: "علاج سلوكي",
          phone: "0965432109",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "الاكتئاب واضطرابات القلق",
      doctors: [
        Doctor(
          name: "د. علاء محمود",
          specialty: "طب نفسي",
          phone: "0956789012",
          location: "اللاذقية",
          gender: 'male',
        ),
        Doctor(
          name: "د. هبة شريف",
          specialty: "علاج نفسي",
          phone: "0945671234",
          location: "دمشق",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "الفصام",
      doctors: [
        Doctor(
          name: "د. عمر عيسى",
          specialty: "طب نفسي",
          phone: "0934567890",
          location: "طرطوس",
          gender: 'male',
        ),
        Doctor(
          name: "د. هند شهاب",
          specialty: "علاج نفسي",
          phone: "0923456789",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
  ],
  "الأمراض المزمنة": [
    Disease(
      name: "السكري",
      doctors: [
        Doctor(
          name: "د. رامي يونس",
          specialty: "أمراض غدد",
          phone: "0912345678",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. فاطمة ديب",
          specialty: "تغذية علاجية",
          phone: "0909876543",
          location: "حمص",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "ارتفاع ضغط الدم وأمراض القلب",
      doctors: [
        Doctor(
          name: "د. علي ديب",
          specialty: "طب قلب",
          phone: "0998765432",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. نور سالم",
          specialty: "طب داخلي",
          phone: "0987654321",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
  ],
  "مشاكل الأطفال ذوي الاحتياجات الخاصة": [
    Disease(
      name: "صعوبات التعلم",
      doctors: [
        Doctor(
          name: "د. ليلى سعيد",
          specialty: "اختصاصي تعلم",
          phone: "0941234567",
          location: "دمشق",
          gender: 'female',
        ),
        Doctor(
          name: "د. نور أحمد",
          specialty: "معالج تربوي",
          phone: "0939876543",
          location: "اللاذقية",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "اضطراب نقص الانتباه وفرط النشاط (ADHD)",
      doctors: [
        Doctor(
          name: "د. خالد محمود",
          specialty: "طب نفسي أطفال",
          phone: "0923456789",
          location: "حلب",
          gender: 'male',
        ),
        Doctor(
          name: "د. سهى إبراهيم",
          specialty: "علاج سلوكي",
          phone: "0956784321",
          location: "طرطوس",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "صعوبة النطق",
      doctors: [
        Doctor(
          name: "د. سامر حمدان",
          specialty: "معالج نطق",
          phone: "0991234567",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. هناء العلي",
          specialty: "علاج اضطرابات الكلام",
          phone: "0987654321",
          location: "حمص",
          gender: 'female',
        ),
      ],
    ),
    Disease(
      name: "التأخر في النمو العقلي",
      doctors: [
        Doctor(
          name: "د. رامي يوسف",
          specialty: "طب نفسي أطفال",
          phone: "0965432109",
          location: "دمشق",
          gender: 'male',
        ),
        Doctor(
          name: "د. هبة عادل",
          specialty: "تأهيل إدراكي",
          phone: "0954321765",
          location: "حلب",
          gender: 'female',
        ),
      ],
    ),
  ],
};

final Map<String, List<Disease>> medicalDataEnglish = {
  "Motor Diseases And Nervous System": [
    Disease(name: "Cerebral Palsy", doctors: [
      Doctor(
        name: "Dr. Ahmad Abdullah",
        specialty: "Physical Therapy",
        phone: "0991234567",
        location: "Damascus",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Sara Mohammed",
        specialty: "Pediatric Neurology",
        phone: "0987654321",
        location: "Aleppo",
        gender: "female",
      ),
      Doctor(
        name: "Dr. Fadi Nasser",
        specialty: "Physical Therapy",
        phone: "0965432187",
        location: "Homs",
        gender: "male",
      ),
      Doctor(
          name: "Dr. Rana Youssef",
          specialty: "Rehabilitation Therapy",
          phone: "0956784321",
          location: "Tartus",
          gender: "female")
    ]),
    Disease(name: "Multiple Sclerosis", doctors: [
      Doctor(
        name: "Dr. Khaled Mustafa",
        specialty: "Neurological Diseases",
        phone: "0945678901",
        location: "Latakia",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Hiba Ali",
        specialty: "Neurology",
        phone: "0934567890",
        location: "Tartus",
        gender: "female",
      ),
      Doctor(
        name: "Dr. Nour Eddin Salama",
        specialty: "Physical Therapy",
        phone: "0976543218",
        location: "Damascus",
        gender: "male",
      ),
      Doctor(
          name: "Dr. Dima Issa",
          specialty: "Neurorehabilitation Specialist",
          phone: "0987654312",
          location: "Aleppo",
          gender: "female")
    ]),
    Disease(name: "Spinal Cord Injuries", doctors: [
      Doctor(
        name: "Dr. Youssef Ibrahim",
        specialty: "Neurosurgery",
        phone: "0956781234",
        location: "Damascus",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Mariam Hassan",
        specialty: "Physical Therapy",
        phone: "0943216789",
        location: "Homs",
        gender: "female",
      ),
      Doctor(
        name: "Dr. Sami Al-Masri",
        specialty: "Occupational Therapy",
        phone: "0923456781",
        location: "Tartus",
        gender: "male",
      ),
      Doctor(
          name: "Dr. Rima Khaled",
          specialty: "Motor Rehabilitation",
          phone: "0912345678",
          location: "Latakia",
          gender: "female")
    ]),
    Disease(name: "Parkinson's Disease", doctors: [
      Doctor(
        name: "Dr. Samer Mansour",
        specialty: "Neurological Treatment",
        phone: "0981112233",
        location: "Damascus",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Layla Zain",
        specialty: "Physical Therapy",
        phone: "0998877665",
        location: "Latakia",
        gender: "female",
      ),
      Doctor(
        name: "Dr. Haitham Darwish",
        specialty: "Physical Therapy",
        phone: "0976532189",
        location: "Aleppo",
        gender: "male",
      ),
      Doctor(
          name: "Dr. Fadia Al-Ahmad",
          specialty: "Motor Rehabilitation Specialist",
          phone: "0965432178",
          location: "Tartus",
          gender: "female")
    ]),
    Disease(name: "Stroke", doctors: [
      Doctor(
        name: "Dr. Hossam Al-Deeb",
        specialty: "Neurosurgery",
        phone: "0987654321",
        location: "Aleppo",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Hanaa Karim",
        specialty: "Physical Therapy",
        phone: "0976543210",
        location: "Tartus",
        gender: "female",
      ),
      Doctor(
        name: "Dr. Mahmoud Suleiman",
        specialty: "Neurorehabilitation",
        phone: "0954321765",
        location: "Damascus",
        gender: "male",
      ),
      Doctor(
        name: "Dr. Nada Faraj",
        specialty: "Physical Therapy",
        phone: "0945678901",
        location: "Latakia",
        gender: "female",
      ),
    ])
  ],
  "Genetic and Hereditary Diseases": [
    Disease(
      name: "Down Syndrome",
      doctors: [
        Doctor(
          name: "Dr. Youssef Ibrahim",
          specialty: "Pediatrician",
          phone: "0956781234",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Mariam Hassan",
          specialty: "Genetic Consultant",
          phone: "0943216789",
          location: "Homs",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Cystic Fibrosis",
      doctors: [
        Doctor(
          name: "Dr. Rami Ahmad",
          specialty: "Pulmonology",
          phone: "0965432178",
          location: "Aleppo",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Huda Deeb",
          specialty: "Genetics Consultant",
          phone: "0954321765",
          location: "Latakia",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Muscular Dystrophies",
      doctors: [
        Doctor(
          name: "Dr. Ali Sharif",
          specialty: "Neurology",
          phone: "0945678901",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Reem Issa",
          specialty: "Physical Therapy",
          phone: "0987654321",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
  ],
  "Sensory Disorders": [
    Disease(
      name: "Hearing Loss or Impairment",
      doctors: [
        Doctor(
          name: "Dr. Hassan Ibrahim",
          specialty: "ENT Specialist",
          phone: "0991112233",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Salwa Qassem",
          specialty: "Hearing Devices",
          phone: "0988765432",
          location: "Homs",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Vision Loss or Blindness",
      doctors: [
        Doctor(
          name: "Dr. Raed Mahmoud",
          specialty: "Ophthalmology",
          phone: "0976543210",
          location: "Latakia",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Layla Fares",
          specialty: "Vision Rehabilitation",
          phone: "0965432109",
          location: "Tartous",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Speech and Communication Disorders",
      doctors: [
        Doctor(
          name: "Dr. Sami Nour",
          specialty: "Speech Therapist",
          phone: "0943216789",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Noha Youssef",
          specialty: "Communication Therapy",
          phone: "0934567890",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
  ],
  "Mental and Psychological Disorders": [
    Disease(
      name: "Autism",
      doctors: [
        Doctor(
          name: "Dr. Yasmin Ali",
          specialty: "Child Psychiatrist",
          phone: "0991122334",
          location: "Homs",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Kareem Hassan",
          specialty: "Autism Specialist",
          phone: "0987651234",
          location: "Damascus",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "ADHD (Attention Deficit Hyperactivity Disorder)",
      doctors: [
        Doctor(
          name: "Dr. Khaled Ahmad",
          specialty: "Child Psychiatry",
          phone: "0976543210",
          location: "Tartous",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Suad Mahmoud",
          specialty: "Behavioral Therapy",
          phone: "0965432109",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Depression and Anxiety Disorders",
      doctors: [
        Doctor(
          name: "Dr. Alaa Mahmoud",
          specialty: "Psychiatry",
          phone: "0956789012",
          location: "Latakia",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Heba Sharif",
          specialty: "Psychotherapy",
          phone: "0945671234",
          location: "Damascus",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Schizophrenia",
      doctors: [
        Doctor(
          name: "Dr. Omar Issa",
          specialty: "Psychiatry",
          phone: "0934567890",
          location: "Tartous",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Hend Shahab",
          specialty: "Psychotherapy",
          phone: "0923456789",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
  ],
  "Chronic Diseases": [
    Disease(
      name: "Diabetes",
      doctors: [
        Doctor(
          name: "Dr. Rami Younes",
          specialty: "Endocrinology",
          phone: "0912345678",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Fatima Deeb",
          specialty: "Nutrition Therapy",
          phone: "0909876543",
          location: "Homs",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Hypertension and Heart Diseases",
      doctors: [
        Doctor(
          name: "Dr. Ali Deeb",
          specialty: "Cardiology",
          phone: "0998765432",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Nour Salem",
          specialty: "Internal Medicine",
          phone: "0987654321",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
  ],
  "Special Needs Children's Issues": [
    Disease(
      name: "Learning Disabilities",
      doctors: [
        Doctor(
          name: "Dr. Layla Saeed",
          specialty: "Learning Specialist",
          phone: "0941234567",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Noor Ahmad",
          specialty: "Educational Therapist",
          phone: "0939876543",
          location: "Latakia",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Attention Deficit Hyperactivity Disorder (ADHD)",
      doctors: [
        Doctor(
          name: "Dr. Khaled Mahmoud",
          specialty: "Child Psychiatrist",
          phone: "0923456789",
          location: "Aleppo",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Soha Ibrahim",
          specialty: "Behavioral Therapist",
          phone: "0956784321",
          location: "Tartous",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Speech Difficulties",
      doctors: [
        Doctor(
          name: "Dr. Samer Hamdan",
          specialty: "Speech Therapist",
          phone: "0991234567",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Hana Al-Ali",
          specialty: "Speech Disorders Therapy",
          phone: "0987654321",
          location: "Homs",
          gender: 'male',
        ),
      ],
    ),
    Disease(
      name: "Delayed Mental Development",
      doctors: [
        Doctor(
          name: "Dr. Rami Youssef",
          specialty: "Child Psychiatry",
          phone: "0965432109",
          location: "Damascus",
          gender: 'male',
        ),
        Doctor(
          name: "Dr. Heba Adel",
          specialty: "Cognitive Rehabilitation",
          phone: "0954321765",
          location: "Aleppo",
          gender: 'male',
        ),
      ],
    ),
  ],
};
