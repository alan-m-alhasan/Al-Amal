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
  final List<String> symptoms;
  final List<String> appropriateMedicines;
  final String description;

  Disease({
    required this.name,
    required this.doctors,
    required this.symptoms,
    required this.appropriateMedicines,
    required this.description,
  });
}

final Map<String, List<Disease>> medicalDataArabic = {
  "الأمراض الحركية والجهاز العصبي": [
    Disease(
      name: "الشلل الدماغي",
      description:
          "الشلل الدماغي هو مجموعة من الاضطرابات العصبية التي تؤثر على الحركة وتناغم العضلات. ينتج عن تلف في الدماغ أثناء النمو المبكر، غالباً قبل الولادة أو خلالها. يتميز بضعف التنسيق الحركي وتيبس العضلات وصعوبة في التوازن. تختلف شدته من حالات خفيفة تؤثر على حركة طرف واحد إلى حالات شديدة تعيق الحركة تماماً. يعالج عبر برامج متكاملة تشمل العلاج الطبيعي والأجهزة المساعدة.",

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
      symptoms: [
        "ضعف في العضلات أو تيبسها",
        "حركات لا إرادية",
        "مشاكل في التوازن والتنسيق",
        "تأخر في المهارات الحركية",
        "صعوبات في المشي أو الحركة",
      ],
      appropriateMedicines: [
        "باكلوفين (للتشنجات العضلية)",
        "ديازيبام (للتقلصات العضلية)",
        "تيزانيدين (مرخي عضلي)",
        "بوتوكس (للتشنجات الموضعية)",
        "أدوية للسيطرة على الألم إذا لزم الأمر",
      ],
    ),
    Disease(
      name: "التصلب اللويحي",
      description:
          "مرض مناعي ذاتي مزمن يصيب الجهاز العصبي المركزي حيث يهاجم الجهاز المناعي الغمد النخاعي (المايلين) المحيط بالأعصاب. يؤدي هذا إلى إعاقة نقل الإشارات العصبية بين الدماغ وأجزاء الجسم. يتميز بفترات من الانتكاس والهدأة مع أعراض تختلف حسب المنطقة المصابة. أكثر شيوعاً بين الشباب (20-40 سنة) وقد يسبب إعاقات حركية وحسية تدريجية. العلاج يركز على إبطاء تقدم المرض وإدارة الأعراض.",

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
      symptoms: [
        "تنميل أو ضعف في الأطراف",
        "فقدان جزئي أو كلي للبصر",
        "رؤية مزدوجة أو ضبابية",
        "إرهاق شديد",
        "دوار ومشاكل في التوازن",
      ],
      appropriateMedicines: [
        "إنترفيرون بيتا-1أ (أفونكس، ربيف)",
        "جلاتيرامير أسيتات (كوباكسون)",
        "فينغوليمود (جيلينيا)",
        "ناتاليزوماب (تيسابري)",
        "أوكريليزوماب (أوكريفوس)",
      ],
    ),
    Disease(
      name: "إصابات الحبل الشوكي",
      description:
          "تحدث نتيجة تلف في النخاع الشوكي بسبب الحوادث أو الإصابات الرياضية أو الأمراض. تؤدي إلى فقدان جزئي أو كلي للإحساس والحركة أسفل موقع الإصابة. تعتمد الشدة على موقع الإصابة ومدى اكتمالها، وقد تسبب شللاً رباعياً أو شللاً نصفيّاً. تتضمن المضاعفات مشاكل في المثانة والأمعاء والتهابات رئوية وتقرحات جلدية. إعادة التأهيل تشمل العلاج الطبيعي والوظيفي والتكيف مع الأدوات المساعدة.",

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
      symptoms: [
        "فقدان الإحساس في الأطراف",
        "ضعف أو شلل في العضلات",
        "فقدان السيطرة على المثانة أو الأمعاء",
        "ألم شديد أو وخز في المنطقة المصابة",
        "صعوبات في التنفس",
      ],
      appropriateMedicines: [
        "مرخيات العضلات مثل باكلوفين",
        "مسكنات الألم مثل غابابنتين",
        "الكورتيكوستيرويدات لعلاج الالتهاب",
        "مضادات الاكتئاب للألم العصبي",
        "أدوية لتحسين وظيفة المثانة",
      ],
    ),
    Disease(
      name: "داء باركنسون",
      description:
          "اضطراب تنكسي عصبي تدريجي يصيب الخلايا المنتجة للدوبامين في الدماغ. يتميز ببطء الحركة والرعشة أثناء الراحة وتيبس العضلات واضطراب التوازن. تظهر الأعراض عادة بعد سن الـ60 وتتطور ببطء على مدى سنوات. قد يصاحبه الاكتئاب واضطرابات النوم ومشاكل في الذاكرة. العلاج يشمل الأدوية لتعويض الدوبامين والعلاج الطبيعي لتحسين الحركة والمرونة.",

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
      symptoms: [
        "رعشة في اليدين أو الأطراف",
        "بطء في الحركة",
        "تيبس العضلات",
        "مشاكل في التوازن والوقوف",
        "تغيرات في الكلام والكتابة",
      ],
      appropriateMedicines: [
        "ليفودوبا/كاربيدوبا (سينيميت)",
        "براميبيكسول (ميرابيكس)",
        "روبينيرول (ريكويب)",
        "سيليجيلين (إلدبرايل)",
        "أمانتادين (سيميتريل)",
      ],
    ),
    Disease(
      name: "الجلطات الدماغية",
      description:
          "حالة طبية طارئة تحدث عند انقطاع تدفق الدم إلى جزء من الدماغ. تنقسم إلى نوعين: إقفارية (انسداد وعاء دموي) ونزفية (تمزق وعاء دموي). تتطلب تدخلاً عاجلاً خلال الساعات الأولى لتقليل الضرر الدائم. قد تؤدي إلى شلل نصفي أو صعوبات في الكلام والبلع أو فقدان البصر. إعادة التأهيل تشمل العلاج الطبيعي والنطق والوظيفي لاستعادة المهارات المفقودة.",

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
      symptoms: [
        "ضعف مفاجئ أو خدر في الوجه أو الذراع أو الساق",
        "ارتباك مفاجئ أو صعوبة في الكلام",
        "مشاكل مفاجئة في الرؤية",
        "دوخة مفاجئة أو فقدان التوازن",
        "صداع شديد مفاجئ بدون سبب معروف",
      ],
      appropriateMedicines: [
        "منشط بلاسمينوجين النسيجي (tPA) لعلاج الجلطة الحادة)",
        "الأسبرين للوقاية من الجلطات",
        "كلوبيدوجريل (بلافيكس)",
        "وارفارين (كومادين) كمميع للدم",
        "أدوية خفض ضغط الدم إذا لزم الأمر",
      ],
    ),
  ],
  "الأمراض الوراثية والجينية": [
    Disease(
      name: "متلازمة داون",
      description:
          "اضطراب جيني ناتج عن وجود نسخة إضافية من الكروموسوم 21. يتميز بملامح وجه مميزة وقصر القامة وضعف العضلات. يصاحبها درجات متفاوتة من الإعاقة الذهنية وتأخر في النمو والتطور. تزيد احتمالية الإصابة بعيوب خلقية في القلب والجهاز الهضمي. الرعاية تشمل برامج التدخل المبكر والعلاج الطبيعي والتأهيل التعليمي الخاص. متوسط العمر المتوقع تحسن بشكل ملحوظ مع التقدم الطبي.",

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
      symptoms: [
        "ملامح وجه مميزة (وجه مسطح، عيون لوزية)",
        "قصر القامة",
        "ضعف في العضلات",
        "تأخر في النمو والتطور",
        "درجات متفاوتة من الإعاقة الذهنية",
      ],
      appropriateMedicines: [
        "فيتامينات ومكملات غذائية حسب الحاجة",
        "هرمونات الغدة الدرقية إذا لزم الأمر",
        "أدوية لعلاج مشاكل القلب إذا كانت موجودة",
        "أدوية لتحسين النمو إذا لزم الأمر",
        "مساعدات إنزيمية لتحسين الهضم",
      ],
    ),
    Disease(
      name: "التليف الكيسي",
      description:
          "مرض وراثي يصيب الغدد الخارجية ويؤدي لإنتاج مخاط سميك ولزج. يؤثر بشكل رئيسي على الجهاز التنفسي والهضمي، مسبباً التهابات رئوية متكررة وسعال مزمناً. في البنكرياس يمنع إفراز الإنزيمات الهاضمة مما يؤدي لسوء الامتصاص. أكثر شيوعاً عند ذوي الأصول الأوروبية ويتطلب علاجاً يومياً. إدارة المرض تشمل العلاج التنفسي والمكملات الإنزيمية والمضادات الحيوية.",

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
      symptoms: [
        "سعال مستمر مع بلغم كثيف",
        "التهابات رئوية متكررة",
        "صعوبة في زيادة الوزن",
        "براز دهني كريه الرائحة",
        "عقم عند الذكور",
      ],
      appropriateMedicines: [
        "إنزيمات البنكرياس (كريون، بانكريليباز)",
        "موسعات الشعب الهوائية",
        "مضادات حيوية للعدوى الرئوية",
        "مذيبات المخاط (دورناز ألفا)",
        "مكملات الفيتامينات القابلة للذوبان في الدهون",
      ],
    ),
    Disease(
      name: "أمراض ضمور العضلات",
      description:
          "مجموعة من الأمراض الوراثية التي تسبب ضعفاً وتلفاً تدريجياً في العضلات الهيكلية. أشهرها ضمور دوشين الذي يصيب الذكور ويظهر في الطفولة المبكرة. يتميز بضعف عضلي تصاعدي يبدأ من الحوض والأطراف السفلية. يؤدي في مراحله المتقدمة لمشاكل في التنفس والقلب. العلاج يشمل الكورتيكوستيرويدات لإبطاء التقدم والعلاج الطبيعي للحفاظ على المدى الحركي.",

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
      symptoms: [
        "ضعف تدريجي في العضلات",
        "صعوبة في المشي أو الجري",
        "سقوط متكرر",
        "تأخر في المهارات الحركية",
        "مشاكل في التنفس والبلع في المراحل المتقدمة",
      ],
      appropriateMedicines: [
        "الكورتيكوستيرويدات (بريدنيزون، ديفلازاكورت)",
        "إيتيبليرسن (لضمور العضلات الشوكي)",
        "نوسينيرسن (سبينرازا)",
        "أدوية لتحسين وظيفة القلب إذا لزم الأمر",
        "مسكنات الألم حسب الحاجة",
      ],
    ),
  ],
  "الأمراض الحسية": [
    Disease(
      name: "فقدان السمع أو ضعفه",
      description:
          "حالة تتراوح بين الصمم الكامل وصعوبة سماع الأصوات المنخفضة. ينقسم إلى نوعين: توصيلي (مشكلة في الأذن الخارجية أو الوسطى) وحسي عصبي (تلف في الأذن الداخلية أو العصب السمعي). قد يكون خلقيّاً أو مكتسباً بسبب الشيخوخة أو الضوضاء أو العدوى. يستخدم التشخيص اختبارات السمع مثل قياس السمع. العلاج يشمل المعينات السمعية أو غرسات القوقعة حسب شدة الحالة.",

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
      symptoms: [
        "صعوبة في فهم الكلام خاصة مع وجود ضوضاء",
        "الحاجة لرفع صوت التلفزيون أو الراديو",
        "طلب تكرار الكلام من الآخرين",
        "طنين في الأذن",
        "صعوبة في سماع الأصوات عالية التردد",
      ],
      appropriateMedicines: [
        "المضادات الحيوية لالتهابات الأذن إذا كانت السبب",
        "الكورتيكوستيرويدات لالتهابات الأذن الداخلية",
        "أدوية لتحسين الدورة الدموية للأذن الداخلية",
        "مضادات الهيستامين لحالات الحساسية",
        "أدوية لعلاج طنين الأذن إذا لزم الأمر",
      ],
    ),
    Disease(
      name: "ضعف البصر أو العمى",
      description:
          "فقدان البصر الذي لا يمكن تصحيحه بالنظارات الطبية أو العدسات اللاصقة. يشمل حالات مثل التنكس البقعي وإعتام عدسة العين والزرق واعتلال الشبكية السكري. قد يكون جزئياً (ضعف البصر) أو كلياً (العمى). يؤثر على القدرة على القراءة والتنقل المستقل والتعرف على الوجوه. التأهيل يشمل تعلم برايل واستخدام العصا البيضاء والتقنيات المساعدة والتكيف مع البيئة.",

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
      symptoms: [
        "رؤية ضبابية أو مشوشة",
        "صعوبة في الرؤية الليلية",
        "الحساسية للضوء",
        "فقدان الرؤية المحيطية",
        "الحاجة إلى تقريب الأشياء للرؤية بوضوح",
      ],
      appropriateMedicines: [
        "قطرات العين لعلاج الجلوكوما",
        "مكملات الفيتامينات لبعض أنواع الضمور البقعي",
        "أدوية لعلاج التهاب العين إذا كان السبب",
        "أدوية لتحسين الدورة الدموية للعين",
        "الكورتيكوستيرويدات لبعض حالات التهاب العين",
      ],
    ),
    Disease(
      name: "اضطرابات النطق والتواصل",
      description:
          "تشمل صعوبات في إنتاج الأصوات أو طلاقة الكلام أو فهم اللغة. تتضمن التلعثم وعسر الكلام (بعد السكتة الدماغية) واضطرابات الصوت. قد تكون ناتجة عن إصابات عصبية أو تشوهات خلقية أو اضطرابات نمائية. تؤثر على التواصل الاجتماعي والأداء الأكاديمي والمهني. العلاج يشمل جلسات التخاطب وتمارين التنفس واستراتيجيات التواصل البديل.",

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
      symptoms: [
        "صعوبة في نطق الكلمات أو الأحرف",
        "التلعثم أو التردد في الكلام",
        "سرعة الكلام أو بطئه بشكل غير طبيعي",
        "صعوبة في فهم الكلام",
        "مشاكل في تنظيم الأفكار للتعبير عنها",
      ],
      appropriateMedicines: [
        "أدوية لعلاج الأسباب الكامنة مثل ADHD إذا كانت موجودة",
        "مضادات الاكتئاب لبعض حالات القلق المرتبط بالكلام",
        "أدوية لتحسين الوظيفة العصبية إذا لزم الأمر",
        "منشطات للذاكرة والتركيز في بعض الحالات",
        "مكملات غذائية لتحسين الوظيفة العصبية",
      ],
    ),
  ],
  "الأمراض النفسية والعقلية": [
    Disease(
      name: "التوحد",
      description:
          "اضطراب نمائي عصبي يظهر في الطفولة المبكرة ويستمر مدى الحياة. يتميز بصعوبات في التواصل والتفاعل الاجتماعي وأنماط سلوكية متكررة. تتفاوت شدته من حالات عالية الأداء إلى حالات تحتاج دعم مكثف. قد يصاحبه حساسية حسية مفرطة أو إعاقات ذهنية. التدخل المبكر يشمل العلاج السلوكي وبرامج التعليم الفردي ودعم الأسرة.",

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
      symptoms: [
        "صعوبات في التفاعل الاجتماعي",
        "تأخر في تطور اللغة",
        "سلوكيات متكررة ونمطية",
        "صعوبة في فهم المشاعر",
        "حساسية مفرطة للمؤثرات الحسية",
      ],
      appropriateMedicines: [
        "ريسبيريدون (ريسبردال) للسلوك العدواني",
        "أريبيبرازول (أبيليفاي) للتهيج",
        "ميلتونين لاضطرابات النوم",
        "مثبطات استرداد السيروتونين الانتقائية للقلق",
        "أدوية لتحسين التركيز إذا لزم الأمر",
      ],
    ),
    Disease(
      name: "اضطراب نقص الانتباه وفرط النشاط",
      description:
          "حالة عصبية تطورية تظهر في مرحلة الطفولة وتستمر غالباً حتى البلوغ. تشمل ثلاثة أنواع: نقص انتباه سائد، فرط نشاط سائد، أو مشترك. يؤثر على التحكم في الانتباه والاندفاعية وتنظيم النشاط الحركي. قد يؤدي لصعوبات أكاديمية ومشاكل في العلاقات الاجتماعية. العلاج متعدد الأوجه يشمل الأدوية المنشطة والعلاج السلوكي والتعديلات التعليمية.",

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
      symptoms: [
        "صعوبة في التركيز",
        "فرط في النشاط الحركي",
        "الاندفاع وعدم التفكير قبل التصرف",
        "صعوبة في اتباع التعليمات",
        "نسيان متكرر للأشياء اليومية",
      ],
      appropriateMedicines: [
        "ميثيلفينيديت (ريتالين، كونسيرتا)",
        "ديكستروأمفيتامين (أديرال)",
        "أتوموكسيتين (ستراتيرا)",
        "غوانفاسين (إنتونيف)",
        "كلونيدين (كابفاي)",
      ],
    ),
    Disease(
      name: "الاكتئاب واضطرابات القلق",
      description:
          "الاكتئاب: اضطراب مزاجي يتميز بحزن دائم وفقدان الاهتمام واضطرابات النوم والشهية. اضطرابات القلق: تشمل نوبات الهلع والرهاب والقلق العام والتوتر ما بعد الصدمة. تؤثر على التفكير والطاقة والقدرة على العمل اليومي. قد تكون ناتجة عن عوامل بيولوجية ونفسية وبيئية متداخلة. العلاج يشمل الأدوية المضادة للاكتئاب والعلاج النفسي وتغيير نمط الحياة.",

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
      symptoms: [
        "حزن مستمر أو مزاج سيء",
        "فقدان الاهتمام بالأنشطة المفضلة",
        "تغيرات في الشهية والنوم",
        "إرهاق مستمر",
        "أفكار سلبية أو انتحارية",
      ],
      appropriateMedicines: [
        "فلوكستين (بروزاك)",
        "سيرترالين (زولوفت)",
        "إسيتالوبرام (ليكسابرو)",
        "فينلافاكسين (إيفكسور)",
        "بوسبيرون للقلق",
      ],
    ),
    Disease(
      name: "الفصام",
      description:
          "اضطراب نفسي شديد يؤثر على التفكير والمشاعر والسلوك. يتميز بأعراض إيجابية (الهلاوس والأوهام) وسلبية (الانسحاب الاجتماعي). عادة ما يظهر في مرحلة المراهقة المتأخرة أو البلوغ المبكر. يحتاج إلى علاج طويل الأمد بالأدوية المضادة للذهان والعلاج النفسي. إعادة التأهيل تشمل التدريب على المهارات الاجتماعية والدعم الوظيفي لمنع الانتكاس.",

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
      symptoms: [
        "هلوسة سمعية أو بصرية",
        "أوهام ومعتقدات غير واقعية",
        "تفكير وسلوك غير منظم",
        "انخفاض في التعبير العاطفي",
        "انسحاب اجتماعي",
      ],
      appropriateMedicines: [
        "ريسبيريدون (ريسبردال)",
        "أولانزابين (زيبريكسا)",
        "كويتيابين (سيروكويل)",
        "أريبيبرازول (أبيليفاي)",
        "كلوزابين (كلوزاريل) للحالات المقاومة",
      ],
    ),
  ],
  "الأمراض المزمنة": [
    Disease(
      name: "السكري",
      description:
          "مرض استقلابي مزمن يتميز بارتفاع مستوى الجلوكوز في الدم. النوع الأول: نقص إنتاج الإنسولين بسبب تلف خلايا البنكرياس (مناعة ذاتية). النوع الثاني: مقاومة خلايا الجسم للإنسولين أو نقص إنتاجه. يؤدي إلى مضاعفات خطيرة تشمل اعتلال الشبكية والكلى والأعصاب والقلب. الإدارة تشمل مراقبة السكر والنظام الغذائي والتمارين والأدوية أو الإنسولين.",

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
      symptoms: [
        "العطش الشديد",
        "كثرة التبول",
        "الجوع الشديد",
        "فقدان الوزن غير المبرر",
        "تعب وإرهاق",
      ],
      appropriateMedicines: [
        "أنسولين (للسكري النوع الأول)",
        "ميتفورمين (جلوكوفاج)",
        "غليبوريد (دايونيل)",
        "إمباغليفلوزين (جارديانس)",
        "ليрагلوتايد (فيكتوزا)",
      ],
    ),
    Disease(
      name: "ارتفاع ضغط الدم وأمراض القلب",
      description:
          "ارتفاع ضغط الدم: (القاتل الصامت) حيث نادراً ما تكون له أعراض واضحة. يؤدي إلى إجهاد جدران الشرايين وزيادة خطر الجلطات والسكتات الدماغية. أمراض القلب تشمل قصور القلب والذبحة الصدرية واضطرابات النظم القلبي. العوامل المؤثرة تشمل الوراثة والسمنة والتدخين والإجهاد. العلاج يشمل تعديل نمط الحياة والأدوية الخافضة للضغط ومميعات الدم.",
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
      symptoms: [
        "صداع شديد",
        "الدوخة أو الدوار",
        "نزيف الأنف",
        "ألم في الصدر",
        "ضيق في التنفس",
      ],
      appropriateMedicines: [
        "أملوديبين (نورفاسك)",
        "لوسارتان (كوزار)",
        "أتينولول (تينورمين)",
        "هيدروكلوروثيازيد",
        "فوروسيميد (لازيكس) لذوي القصور القلبي",
      ],
    ),
  ],
  "مشاكل الأطفال ذوي الاحتياجات الخاصة": [
    Disease(
      name: "صعوبات التعلم",
      description:
          "اضطرابات تؤثر على قدرة الطفل على اكتساب المهارات الأكاديمية الأساسية. تشمل عسر القراءة (صعوبة القراءة) وعسر الكتابة وعسر الحساب. لا تعكس انخفاض الذكاء بل اختلاف في معالجة المعلومات. تظهر في مرحلة الدراسة المبكرة وتستمر مدى الحياة. التدخل يشمل تقييمات متخصصة وبرامج تعليمية فردية وتعديلات في طرق التدريس.",

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
      symptoms: [
        "صعوبة في القراءة أو الكتابة أو الحساب",
        "مشاكل في تذكر المعلومات",
        "صعوبة في تنظيم المهام",
        "بطء في تعلم المهارات الجديدة",
        "صعوبة في اتباع التعليمات",
      ],
      appropriateMedicines: [
        "منشطات للذاكرة والتركيز إذا لزم الأمر",
        "أوميغا 3 كمكمل غذائي",
        "فيتامينات ب المركبة",
        "أدوية لعلاج أي اضطرابات مصاحبة",
        "مكملات الزنك والمغنيسيوم",
      ],
    ),
    Disease(
      name: "اضطراب نقص الانتباه وفرط النشاط (ADHD)",
      description:
          "اضطراب عصبي تطوري يؤثر على التحكم في الانتباه والنشاط الحركي. يتميز بصعوبة التركيز والاندفاعية والحركة الزائدة غير المناسبة. يؤثر سلباً على الأداء الأكاديمي والعلاقات الأسرية والاجتماعية. يتطلب تشخيص دقيق من قبل أخصائيين لتمييزه عن مشاكل سلوكية أخرى. العلاج يشمل الأدوية المنشطة والعلاج السلوكي وتعديل البيئة التعليمية.",

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
      symptoms: [
        "صعوبة في التركيز",
        "التململ وكثرة الحركة",
        "الاندفاع في التصرفات",
        "صعوبة في انتظار الدور",
        "ميل إلى مقاطعة الآخرين",
      ],
      appropriateMedicines: [
        "ميثيلفينيديت (ريتالين، كونسيرتا)",
        "ديكستروأمفيتامين (أديرال)",
        "أتوموكسيتين (ستراتيرا)",
        "غوانفاسين (إنتونيف)",
        "كلونيدين (كابفاي)",
      ],
    ),
    Disease(
      name: "صعوبة النطق",
      description:
          "تشمل اضطرابات النطق (صعوبة نطق الأصوات) والطلاقة (التأتأة) والصوت (بحّة أو فقدان الصوت). قد تكون ناتجة عن تشوهات تشريحية أو عصبية أو سمعية أو نفسية. تؤثر على التواصل اللفظي وتقدير الذات والقدرة على التعبير. التدخل المبكر ضروري لمنع تبعات نفسية واجتماعية. العلاج يشمل تمارين النطق واللغة واستراتيجيات تحسين الطلاقة.",

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
      symptoms: [
        "صعوبة في تشكيل الكلمات",
        "التلعثم أو التردد في الكلام",
        "صعوبة في فهم الكلام",
        "مشاكل في تنظيم الأفكار للتعبير عنها",
        "تأخر في تطوير اللغة",
      ],
      appropriateMedicines: [
        "أدوية لعلاج الأسباب الكامنة إذا وجدت",
        "مكملات غذائية لتحسين الوظيفة العصبية",
        "أدوية لتحسين التنسيق الحركي إذا لزم الأمر",
        "مضادات القلق إذا كانت تؤثر على الكلام",
        "فيتامينات ب لدعم الجهاز العصبي",
      ],
    ),
    Disease(
      name: "التأخر في النمو العقلي",
      description:
          "انخفاض ملحوظ في الأداء الفكري (معدل ذكاء أقل من 70) والقدرات التكيفية. يظهر قبل سن 18 ويؤثر على التواصل والرعاية الذاتية والمهارات الاجتماعية. قد يكون مصحوباً باضطرابات جسدية أو سلوكية أو حسية. يتطلب تقييم متعدد التخصصات لتحديد نقاط القوة والاحتياجات. الدعم يشمل التعليم الخاص والتدريب المهني والرعاية الشاملة لتحقيق الاستقلالية.",

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
      symptoms: [
        "تأخر في الجلوس أو المشي",
        "تأخر في الكلام",
        "صعوبة في تعلم المهارات اليومية",
        "مشاكل في الذاكرة",
        "صعوبة في حل المشكلات البسيطة",
      ],
      appropriateMedicines: [
        "هرمون النمو في بعض الحالات",
        "فيتامينات ومكملات غذائية حسب الحاجة",
        "أدوية لتحسين الوظيفة العصبية",
        "أدوية لعلاج أي اضطرابات مصاحبة",
        "مكملات أوميغا 3 لدعم النمو العصبي",
      ],
    ),
  ],
};

final Map<String, List<Disease>> medicalDataEnglish = {
  "Motor Diseases And Nervous System": [
    Disease(
      name: "Cerebral Palsy",
      description:
          "Cerebral palsy is a group of neurological disorders that affect movement and muscle coordination. It results from damage to the brain during early development, often before or during birth. It is characterized by poor motor coordination, stiff muscles, and difficulty with balance. Severity ranges from mild cases affecting one limb to severe cases completely impairing movement. Treatment involves comprehensive programs including physical therapy and assistive devices.",
      doctors: [
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
          gender: "female",
        ),
      ],
      symptoms: [
        "Muscle weakness or stiffness",
        "Involuntary movements",
        "Problems with balance and coordination",
        "Delayed motor skills",
        "Difficulty walking or moving",
      ],
      appropriateMedicines: [
        "Baclofen (for muscle spasticity)",
        "Diazepam (for muscle contractions)",
        "Tizanidine (muscle relaxant)",
        "Botox (for localized spasticity)",
        "Pain medicines if needed",
      ],
    ),
    Disease(
      name: "Multiple Sclerosis",
      description:
          "A chronic autoimmune disease affecting the central nervous system where the immune system attacks the myelin sheath surrounding nerves. This disrupts nerve signal transmission between the brain and body. Characterized by periods of relapse and remission with symptoms varying by affected area. Most common in young adults (20-40 years) and may cause progressive motor and sensory disabilities. Treatment focuses on slowing disease progression and managing symptoms.",
      doctors: [
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
          gender: "female",
        ),
      ],
      symptoms: [
        "Numbness or weakness in limbs",
        "Partial or complete vision loss",
        "Double or blurred vision",
        "Severe fatigue",
        "Dizziness and balance problems",
      ],
      appropriateMedicines: [
        "Interferon beta-1a (Avonex, Rebif)",
        "Glatiramer acetate (Copaxone)",
        "Fingolimod (Gilenya)",
        "Natalizumab (Tysabri)",
        "Ocrelizumab (Ocrevus)",
      ],
    ),
    Disease(
      name: "Spinal Cord Injuries",
      description:
          "Occurs due to damage to the spinal cord from accidents, sports injuries, or diseases. Leads to partial or complete loss of sensation and movement below the injury site. Severity depends on injury location and completeness, potentially causing quadriplegia or paraplegia. Complications include bladder/bowel problems, pneumonia, and skin ulcers. Rehabilitation involves physical/occupational therapy and adapting to assistive devices.",
      doctors: [
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
          gender: "female",
        ),
      ],
      symptoms: [
        "Loss of sensation in limbs",
        "Muscle weakness or paralysis",
        "Loss of bladder or bowel control",
        "Severe pain or tingling in affected area",
        "Breathing difficulties",
      ],
      appropriateMedicines: [
        "Muscle relaxants like Baclofen",
        "Pain relievers like Gabapentin",
        "Corticosteroids to reduce inflammation",
        "Antidepressants for neuropathic pain",
        "Medicines to improve bladder function",
      ],
    ),
    Disease(
      name: "Parkinson's Disease",
      description:
          "A progressive neurodegenerative disorder affecting dopamine-producing cells in the brain. Characterized by slow movement, resting tremors, muscle rigidity, and balance problems. Symptoms typically appear after age 60 and develop slowly over years. May be accompanied by depression, sleep disorders, and memory problems. Treatment includes dopamine-replacement medicines and physical therapy to improve movement and flexibility.",
      doctors: [
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
          gender: "female",
        ),
      ],
      symptoms: [
        "Tremors in hands or limbs",
        "Slowed movement (bradykinesia)",
        "Muscle stiffness",
        "Balance and posture problems",
        "Speech and writing changes",
      ],
      appropriateMedicines: [
        "Levodopa/Carbidopa (Sinemet)",
        "Pramipexole (Mirapex)",
        "Ropinirole (Requip)",
        "Selegiline (Eldepryl)",
        "Amantadine (Symmetrel)",
      ],
    ),
    Disease(
      name: "Stroke",
      description:
          "A medical emergency occurring when blood flow to part of the brain is interrupted. Divided into ischemic (blocked blood vessel) and hemorrhagic (ruptured blood vessel) types. Requires immediate intervention within first hours to reduce permanent damage. May cause hemiplegia, speech/swallowing difficulties, or vision loss. Rehabilitation includes physical, speech, and occupational therapy to regain lost skills.",
      doctors: [
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
      ],
      symptoms: [
        "Sudden weakness or numbness in face, arm or leg",
        "Sudden confusion or trouble speaking",
        "Sudden vision problems",
        "Sudden dizziness or loss of balance",
        "Sudden severe headache with no known cause",
      ],
      appropriateMedicines: [
        "Tissue plasminogen activator (tPA) for acute stroke",
        "Aspirin for stroke prevention",
        "Clopidogrel (Plavix)",
        "Warfarin (Coumadin) as blood thinner",
        "Blood pressure medicines if needed",
      ],
    ),
  ],
  "Genetic and Hereditary Diseases": [
    Disease(
      name: "Down Syndrome",
      description:
          "A genetic disorder caused by an extra copy of chromosome 21. Characterized by distinct facial features, short stature, and muscle weakness. Accompanied by varying degrees of intellectual disability and developmental delays. Increased risk of congenital heart and digestive system defects. Care involves early intervention programs, physical therapy, and specialized education. Life expectancy has significantly improved with medical advances.",
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
      symptoms: [
        "Distinct facial features (flat face, almond-shaped eyes)",
        "Short stature",
        "Muscle weakness",
        "Delayed growth and development",
        "Varying degrees of intellectual disability",
      ],
      appropriateMedicines: [
        "Vitamins and nutritional supplements as needed",
        "Thyroid hormones if required",
        "Medicines for heart problems if present",
        "Growth improvement medicines if needed",
        "Enzyme supplements to improve digestion",
      ],
    ),
    Disease(
      name: "Cystic Fibrosis",
      description:
          "A genetic disorder affecting exocrine glands, producing thick, sticky mucus. Primarily impacts respiratory and digestive systems, causing chronic lung infections and persistent cough. In pancreas, it prevents digestive enzyme secretion leading to malabsorption. More common in people of European descent and requires daily treatment. Management includes respiratory therapy, enzyme supplements, and antibiotics.",
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
      symptoms: [
        "Persistent cough with thick mucus",
        "Frequent lung infections",
        "Difficulty gaining weight",
        "Greasy, foul-smelling stools",
        "Male infertility",
      ],
      appropriateMedicines: [
        "Pancreatic enzymes (Creon, Pancrelipase)",
        "Bronchodilators",
        "Antibiotics for lung infections",
        "Mucolytics (Dornase alfa)",
        "Fat-soluble vitamin supplements",
      ],
    ),
    Disease(
      name: "Muscular Dystrophies",
      description:
          "A group of genetic diseases causing progressive weakness and degeneration of skeletal muscles. Most notably Duchenne muscular dystrophy affecting males in early childhood. Characterized by ascending muscle weakness starting from pelvis and lower limbs. In advanced stages leads to respiratory and cardiac problems. Treatment includes corticosteroids to slow progression and physical therapy to maintain range of motion.",
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
      symptoms: [
        "Progressive muscle weakness",
        "Difficulty walking or running",
        "Frequent falls",
        "Delayed motor skills",
        "Breathing and swallowing problems in advanced stages",
      ],
      appropriateMedicines: [
        "Corticosteroids (Prednisone, Deflazacort)",
        "Eteplirsen (for Duchenne muscular dystrophy)",
        "Nusinersen (Spinraza)",
        "Medicines to improve heart function if needed",
        "Pain relievers as required",
      ],
    ),
  ],
  "Sensory Disorders": [
    Disease(
      name: "Hearing Loss or Impairment",
      description:
          "Condition ranging from complete deafness to difficulty hearing low sounds. Divided into conductive (problem in outer/middle ear) and sensorineural (damage to inner ear/auditory nerve). May be congenital or acquired due to aging, noise, or infection. Diagnosis uses hearing tests like audiometry. Treatment includes hearing aids or cochlear implants depending on severity.",
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
      symptoms: [
        "Difficulty understanding speech, especially with background noise",
        "Needing to turn up TV or radio volume",
        "Asking others to repeat themselves",
        "Tinnitus (ringing in the ears)",
        "Trouble hearing high-pitched sounds",
      ],
      appropriateMedicines: [
        "Antibiotics for ear infections if present",
        "Corticosteroids for inner ear inflammation",
        "Medicines to improve inner ear circulation",
        "Antihistamines for allergy-related cases",
        "Medicines for tinnitus if needed",
      ],
    ),
    Disease(
      name: "Vision Loss or Blindness",
      description:
          "Vision loss that cannot be corrected with glasses or contact lenses. Includes conditions like macular degeneration, cataracts, glaucoma, and diabetic retinopathy. May be partial (low vision) or complete (blindness). Affects ability to read, move independently, and recognize faces. Rehabilitation involves learning braille, using white cane, assistive technologies, and environmental adaptation.",
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
      symptoms: [
        "Blurred or hazy vision",
        "Difficulty seeing at night",
        "Light sensitivity",
        "Loss of peripheral vision",
        "Needing to hold objects close to see",
      ],
      appropriateMedicines: [
        "Eye drops for glaucoma",
        "Vitamin supplements for some types of macular degeneration",
        "Medicines to treat eye inflammation if present",
        "Medicines to improve eye circulation",
        "Corticosteroids for certain eye inflammations",
      ],
    ),
    Disease(
      name: "Speech and Communication Disorders",
      description:
          "Include difficulties producing sounds, speech fluency, or language comprehension. Encompass stuttering, dysarthria (after stroke), and voice disorders. May result from neurological injuries, congenital abnormalities, or developmental disorders. Affect social communication, academic performance, and career. Treatment involves speech therapy, breathing exercises, and alternative communication strategies.",
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
      symptoms: [
        "Difficulty pronouncing words or sounds",
        "Stuttering or hesitating when speaking",
        "Abnormally fast or slow speech rate",
        "Trouble understanding speech",
        "Problems organizing thoughts for expression",
      ],
      appropriateMedicines: [
        "Medicines for underlying conditions like ADHD if present",
        "Antidepressants for some anxiety-related speech issues",
        "Medicines to improve neurological function if needed",
        "Memory and focus enhancers in some cases",
        "Nutritional supplements to support neurological function",
      ],
    ),
  ],
  "Mental and Psychological Disorders": [
    Disease(
      name: "Autism",
      description:
          "A neurodevelopmental disorder appearing in early childhood and lasting throughout life. Characterized by difficulties in communication, social interaction, and repetitive behaviors. Severity varies from high-functioning cases to those needing intensive support. May be accompanied by sensory hypersensitivity or intellectual disabilities. Early intervention includes behavioral therapy, individualized education programs, and family support.",
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
      symptoms: [
        "Difficulties with social interaction",
        "Delayed language development",
        "Repetitive and stereotyped behaviors",
        "Trouble understanding emotions",
        "Over-sensitivity to sensory stimuli",
      ],
      appropriateMedicines: [
        "Risperidone (Risperdal) for aggressive behavior",
        "Aripiprazole (Abilify) for irritability",
        "Melatonin for sleep disorders",
        "SSRIs for anxiety",
        "Medicines to improve focus if needed",
      ],
    ),
    Disease(
      name: "ADHD (Attention Deficit Hyperactivity Disorder)",
      description:
          "A neurodevelopmental condition appearing in childhood and often continuing into adulthood. Includes three types: predominantly inattentive, hyperactive-impulsive, or combined. Affects attention control, impulsivity, and activity regulation. May lead to academic difficulties and social relationship problems. Treatment involves stimulant medicines, behavioral therapy, and educational modifications.",
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
      symptoms: [
        "Difficulty concentrating",
        "Hyperactivity",
        "Impulsiveness",
        "Trouble following instructions",
        "Frequent forgetfulness",
      ],
      appropriateMedicines: [
        "Methylphenidate (Ritalin, Concerta)",
        "Dextroamphetamine (Adderall)",
        "Atomoxetine (Strattera)",
        "Guanfacine (Intuniv)",
        "Clonidine (Kapvay)",
      ],
    ),
    Disease(
      name: "Depression and Anxiety Disorders",
      description:
          "Depression: A mood disorder characterized by persistent sadness, loss of interest, and sleep/appetite disturbances. Anxiety disorders: Include panic attacks, phobias, generalized anxiety, and PTSD. Affect thinking, energy, and daily functioning. May result from biological, psychological, and environmental factors. Treatment includes antidepressants, psychotherapy, and lifestyle changes.",
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
      symptoms: [
        "Persistent sadness or low mood",
        "Loss of interest in favorite activities",
        "Changes in appetite and sleep",
        "Constant fatigue",
        "Negative or suicidal thoughts",
      ],
      appropriateMedicines: [
        "Fluoxetine (Prozac)",
        "Sertraline (Zoloft)",
        "Escitalopram (Lexapro)",
        "Venlafaxine (Effexor)",
        "Buspirone for anxiety",
      ],
    ),
    Disease(
      name: "Schizophrenia",
      description:
          "A severe mental disorder affecting thinking, emotions, and behavior. Characterized by positive symptoms (hallucinations/delusions) and negative symptoms (social withdrawal). Typically appears in late adolescence or early adulthood. Requires long-term treatment with antipsychotic medicines and psychotherapy. Rehabilitation includes social skills training and vocational support to prevent relapse.",
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
      symptoms: [
        "Hallucinations (hearing or seeing things)",
        "Delusions (false beliefs)",
        "Disorganized thinking and behavior",
        "Reduced emotional expression",
        "Social withdrawal",
      ],
      appropriateMedicines: [
        "Risperidone (Risperdal)",
        "Olanzapine (Zyprexa)",
        "Quetiapine (Seroquel)",
        "Aripiprazole (Abilify)",
        "Clozapine (Clozaril) for treatment-resistant cases",
      ],
    ),
  ],
  "Chronic Diseases": [
    Disease(
      name: "Diabetes",
      description:
          "A chronic metabolic disorder characterized by high blood glucose levels. Type 1: Lack of insulin production due to pancreatic cell damage (autoimmune). Type 2: Body cell resistance to insulin or insufficient production. Leads to serious complications including retinopathy, kidney disease, nerve damage, and heart disease. Management involves blood sugar monitoring, diet, exercise, and medicines or insulin.",
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
      symptoms: [
        "Excessive thirst",
        "Frequent urination",
        "Extreme hunger",
        "Unexplained weight loss",
        "Fatigue and irritability",
      ],
      appropriateMedicines: [
        "Insulin (for Type 1 diabetes)",
        "Metformin (Glucophage)",
        "Glyburide (DiaBeta)",
        "Empagliflozin (Jardiance)",
        "Liraglutide (Victoza)",
      ],
    ),
    Disease(
      name: "Hypertension and Heart Diseases",
      description:
          "Hypertension: (The silent killer) with rarely noticeable symptoms. Stresses artery walls and increases risk of clots and strokes. Heart diseases include heart failure, angina, and arrhythmias. Contributing factors include genetics, obesity, smoking, and stress. Treatment involves lifestyle modifications, blood pressure medicines, and blood thinners.",
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
      symptoms: [
        "Severe headaches",
        "Dizziness or lightheadedness",
        "Nosebleeds",
        "Chest pain",
        "Shortness of breath",
      ],
      appropriateMedicines: [
        "Amlodipine (Norvasc)",
        "Losartan (Cozaar)",
        "Atenolol (Tenormin)",
        "Hydrochlorothiazide",
        "Furosemide (Lasix) for heart failure",
      ],
    ),
  ],
  "Special Needs Children's Issues": [
    Disease(
      name: "Learning Disabilities",
      description:
          "Disorders affecting a child's ability to acquire basic academic skills. Include dyslexia (reading difficulty), dysgraphia, and dyscalculia. Do not reflect low intelligence but differences in information processing. Appear in early school years and persist throughout life. Intervention involves specialized assessments, individualized education programs, and teaching modifications.",
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
      symptoms: [
        "Difficulty with reading, writing or math",
        "Problems remembering information",
        "Trouble organizing tasks",
        "Slow to learn new skills",
        "Difficulty following instructions",
      ],
      appropriateMedicines: [
        "Memory and focus enhancers if needed",
        "Omega-3 as nutritional supplement",
        "B-complex vitamins",
        "Medicines for any co-occurring disorders",
        "Zinc and magnesium supplements",
      ],
    ),
    Disease(
      name: "Attention Deficit Hyperactivity Disorder (ADHD)",
      description:
          "A neurodevelopmental disorder affecting attention control and motor activity. Characterized by difficulty concentrating, impulsivity, and inappropriate excessive movement. Negatively impacts academic performance and family/social relationships. Requires accurate diagnosis by specialists to distinguish from other behavioral issues. Treatment includes stimulant medicines, behavioral therapy, and educational environment modifications.",
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
      symptoms: [
        "Trouble focusing",
        "Fidgeting and excessive movement",
        "Impulsive behavior",
        "Difficulty waiting for turn",
        "Tendency to interrupt others",
      ],
      appropriateMedicines: [
        "Methylphenidate (Ritalin, Concerta)",
        "Dextroamphetamine (Adderall)",
        "Atomoxetine (Strattera)",
        "Guanfacine (Intuniv)",
        "Clonidine (Kapvay)",
      ],
    ),
    Disease(
      name: "Speech Difficulties",
      description:
          "Include speech disorders (difficulty producing sounds), fluency (stuttering), and voice (hoarseness or loss). May result from anatomical, neurological, hearing, or psychological abnormalities. Affect verbal communication, self-esteem, and expression ability. Early intervention is crucial to prevent psychological and social consequences. Treatment involves speech/language exercises and fluency improvement strategies.",
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
      symptoms: [
        "Trouble forming words",
        "Stuttering or hesitating when speaking",
        "Difficulty understanding speech",
        "Problems organizing thoughts for expression",
        "Delayed language development",
      ],
      appropriateMedicines: [
        "Medicines for underlying causes if present",
        "Nutritional supplements to support neurological function",
        "Medicines to improve motor coordination if needed",
        "Anti-anxiety medicines if affecting speech",
        "B vitamins for nervous system support",
      ],
    ),
    Disease(
      name: "Delayed Mental Development",
      description:
          "Significant below-average intellectual functioning (IQ below 70) and adaptive abilities. Appears before age 18 and affects communication, self-care, and social skills. May be accompanied by physical, behavioral, or sensory disorders. Requires multidisciplinary assessment to identify strengths and needs. Support includes special education, vocational training, and comprehensive care to achieve independence.",
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
      symptoms: [
        "Delayed sitting or walking",
        "Delayed speech",
        "Difficulty learning daily skills",
        "Memory problems",
        "Trouble solving simple problems",
      ],
      appropriateMedicines: [
        "Growth hormone in some cases",
        "Vitamins and nutritional supplements as needed",
        "Medicines to improve neurological function",
        "Medicines for any co-occurring disorders",
        "Omega-3 supplements for neurological support",
      ],
    ),
  ],
};
//
//
//
//
