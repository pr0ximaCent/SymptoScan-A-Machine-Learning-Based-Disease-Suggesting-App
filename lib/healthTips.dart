import 'package:flutter/material.dart';
import 'package:symptoscan/HomeScreen.dart';

void main() {
  runApp(healthTips());
}

class healthTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disease Information',
      debugShowCheckedModeBanner: false,
      home: DiseaseListPage(),
    );
  }
}

class DiseaseListPage extends StatelessWidget {
  final List<Map<String, String>> diseases = [
    {'name': 'Vertigo (Paroxysmal Positional Vertigo)', 'image': 'vertigo.jpg'},
    {'name': 'AIDS', 'image': 'aids.jpg'},
    {'name': 'Acne', 'image': 'acne.jpg'},
    {'name': 'Alcoholic Hepatitis', 'image': 'alcoholic_hepatitis.jpg'},
    {'name': 'Allergy', 'image': 'allergy.jpg'},
    {'name': 'Arthritis', 'image': 'arthritis.jpg'},
    {'name': 'Bronchial Asthma', 'image': 'bronchial_asthma.jpg'},
    {'name': 'Cervical spondylosis', 'image': 'cervical_spondylosis.jpg'},
    {'name': 'Chicken pox', 'image': 'chicken_pox.jpg'},
    {'name': 'Chronic cholestasis', 'image': 'chronic_cholestasis.jpg'},
    {'name': 'Common Cold', 'image': 'common_cold.jpg'},
    {'name': 'Dengue', 'image': 'dengue.jpg'},
    {'name': 'Diabetes', 'image': 'diabetes.jpg'},
    {'name': 'Dimorphic hemorrhoids (piles)', 'image': 'hemorrhoids.jpg'},
    {'name': 'Drug Reaction', 'image': 'drug_reaction.jpg'},
    {'name': 'Fungal infection', 'image': 'fungal_infection.jpg'},
    {'name': 'GERD', 'image': 'gerd.jpg'},
    {'name': 'Gastroenteritis', 'image': 'gastroenteritis.jpg'},
    {'name': 'Heart attack', 'image': 'heart_attack.jpg'},
    {'name': 'Hepatitis B', 'image': 'hepatitis_b.jpg'},
    {'name': 'Hepatitis C', 'image': 'hepatitis_c.jpg'},
    {'name': 'Hepatitis D', 'image': 'hepatitis_d.jpg'},
    {'name': 'Hepatitis E', 'image': 'hepatitis_e.jpg'},
    {'name': 'Hypertension', 'image': 'hypertension.jpg'},
    {'name': 'Hyperthyroidism', 'image': 'hyperthyroidism.jpg'},
    {'name': 'Hypoglycemia', 'image': 'hypoglycemia.jpg'},
    {'name': 'Hypothyroidism', 'image': 'hypothyroidism.jpg'},
    {'name': 'Impetigo', 'image': 'impetigo.jpg'},
    {'name': 'Jaundice', 'image': 'jaundice.jpg'},
    {'name': 'Malaria', 'image': 'malaria.jpg'},
    {'name': 'Migraine', 'image': 'migraine.jpg'},
    {'name': 'Osteoarthritis', 'image': 'osteoarthritis.jpg'},
    {'name': 'Paralysis (brain hemorrhage)', 'image': 'paralysis.jpg'},
    {'name': 'Peptic ulcer disease', 'image': 'peptic_ulcer_disease.jpg'},
    {'name': 'Pneumonia', 'image': 'pneumonia.jpg'},
    {'name': 'Psoriasis', 'image': 'psoriasis.jpg'},
    {'name': 'Tuberculosis', 'image': 'tuberculosis.jpg'},
    {'name': 'Typhoid', 'image': 'typhoid.jpg'},
    {'name': 'Urinary tract infection', 'image': 'urinary_tract_infection.jpg'},
    {'name': 'Varicose veins', 'image': 'varicose_veins.jpg'},
    {'name': 'Hepatitis A', 'image': 'hepatitis_a.jpg'}
    // Add other diseases with their names and images
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tips'),
        actions: [
          IconButton(
            icon: Icon(Icons.medical_services),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Caution: The health tips provided in this section are for informational purposes only and should not be considered a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare professional before implementing any changes to your health or lifestyle. Individual health conditions and needs vary, and what may be suitable for one person may not be suitable for another. Be mindful of your own health, seek expert guidance, and make informed decisions for your well-being.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(
                      diseases[index]['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseDetailPage(
                            diseaseName: diseases[index]['name']!,
                            imageName: diseases[index]['image']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DiseaseDetailPage extends StatelessWidget {
  final String diseaseName;
  final String imageName;

  DiseaseDetailPage({required this.diseaseName, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Symptoms', _getSymptoms(diseaseName)),
            _buildSection('Prevention', _getPrevention(diseaseName)),
            _buildSection('Remedies', _getRemedies(diseaseName)),
            _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          content,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Image',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Image.asset(
          'assets/$imageName',
          height: 500.0,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }


  String _getSymptoms(String diseaseName) {
    // Provide symptoms based on the diseaseName
    switch (diseaseName) {
      case 'Vertigo (Paroxysmal Positional Vertigo)':
        return 'Dizziness, spinning sensation, nausea, unsteadiness.';
      case 'AIDS':
        return 'Fatigue, weight loss, recurrent infections, night sweats.';
      case 'Acne':
        return 'Pimples, blackheads, whiteheads, inflamed lesions on the skin.';
      case 'Alcoholic Hepatitis':
        return 'Jaundice, abdominal pain, nausea, vomiting, weight loss.';
      case 'Allergy':
        return 'Sneezing, runny or stuffy nose, itchy or watery eyes, skin rash.';
      case 'Arthritis':
        return 'Joint pain, stiffness, swelling, decreased range of motion.';
      case 'Bronchial Asthma':
        return 'Shortness of breath, wheezing, chest tightness, coughing.';
      case 'Cervical spondylosis':
        return 'Neck pain, stiffness, headache, numbness or weakness in the limbs.';
      case 'Chicken pox':
        return 'Red spots, blisters, itching, fever, fatigue.';
      case 'Chronic cholestasis':
        return 'Jaundice, itching, pale stools, dark urine.';
      case 'Common Cold':
        return 'Runny or stuffy nose, sneezing, coughing, sore throat.';
      case 'Dengue':
        return 'High fever, severe headache, joint and muscle pain, rash.';
      case 'Diabetes':
        return 'Increased thirst, frequent urination, fatigue, blurred vision.';
      case 'Dimorphic hemorrhoids (piles)':
        return 'Itching, bleeding, swelling around the anus.';
      case 'Drug Reaction':
        return 'Rash, itching, swelling, fever, nausea.';
      case 'Fungal infection':
        return 'Itching, redness, scaling, rash.';
      case 'GERD':
        return 'Heartburn, regurgitation, chest pain, difficulty swallowing.';
      case 'Gastroenteritis':
        return 'Diarrhea, vomiting, abdominal cramps, fever.';
      case 'Heart attack':
        return 'Chest pain or discomfort, shortness of breath, lightheadedness, nausea.';
      case 'Hepatitis B':
        return 'Jaundice, fatigue, abdominal pain, dark urine.';
      case 'Hepatitis C':
        return 'Jaundice, fatigue, abdominal pain, nausea, vomiting.';
      case 'Hepatitis D':
        return 'Jaundice, abdominal pain, nausea, vomiting, fatigue.';
      case 'Hepatitis E':
        return 'Jaundice, fatigue, abdominal pain, nausea, vomiting.';
      case 'Hypertension':
        return 'High blood pressure, headache, dizziness, chest pain.';
      case 'Hyperthyroidism':
        return 'Weight loss, rapid heartbeat, irritability, heat intolerance.';
      case 'Hypoglycemia':
        return 'Shakiness, sweating, irritability, confusion, dizziness.';
      case 'Hypothyroidism':
        return 'Fatigue, weight gain, cold sensitivity, depression.';
      case 'Impetigo':
        return 'Red sores, fluid-filled blisters, itching, oozing sores.';
      case 'Jaundice':
        return 'Yellowing of the skin and eyes, dark urine, abdominal pain.';
      case 'Malaria':
        return 'Fever, chills, headache, muscle and joint pain, nausea.';
      case 'Migraine':
        return 'Severe headache, nausea, sensitivity to light and sound.';
      case 'Osteoarthritis':
        return 'Joint pain, stiffness, reduced range of motion.';
      case 'Paralysis (brain hemorrhage)':
        return 'Sudden weakness or numbness on one side of the body, difficulty speaking.';
      case 'Peptic ulcer disease':
        return 'Abdominal pain, bloating, nausea, heartburn.';
      case 'Pneumonia':
        return 'Cough, fever, shortness of breath, chest pain.';
      case 'Psoriasis':
        return 'Red, scaly patches on the skin, itching.';
      case 'Tuberculosis':
        return 'Cough, weight loss, night sweats, fatigue.';
      case 'Typhoid':
        return 'High fever, abdominal pain, headache, constipation or diarrhea.';
      case 'Urinary tract infection':
        return 'Pain or burning during urination, frequent urination, cloudy urine.';
      case 'Varicose veins':
        return 'Swollen, twisted veins, aching or heavy legs.';
      case 'Hepatitis A':
        return 'Jaundice, fatigue, abdominal pain, nausea.';

      default:
        return 'Symptoms not available.';
    }
  }

  String _getPrevention(String diseaseName) {
    // Provide prevention measures based on the diseaseName
    switch (diseaseName) {
      case 'Vertigo (Paroxysmal Positional Vertigo)':
        return 'Avoid abrupt head movements, stay hydrated, limit caffeine and alcohol.';
      case 'AIDS':
        return 'Safe sex, use of clean needles, pre-exposure prophylaxis (PrEP), regular testing.';
      case 'Acne':
        return 'Regular cleansing, avoiding excessive oil-based products, not squeezing pimples.';
      case 'Alcoholic Hepatitis':
        return 'Limit alcohol consumption, seek help for alcohol dependence.';
      case 'Allergy':
        return 'Identify and avoid allergens, use antihistamines or other allergy medications.';
      case 'Arthritis':
        return 'Maintain a healthy weight, exercise regularly, protect joints from injury.';
      case 'Bronchial Asthma':
        return 'Avoid triggers (smoke, allergens), use inhalers or other prescribed medications.';
      case 'Cervical spondylosis':
        return 'Maintain good posture, perform neck exercises, use proper ergonomics.';
      case 'Chicken pox':
        return 'Get vaccinated, avoid close contact with infected individuals.';
      case 'Chronic cholestasis':
        return 'Manage underlying liver conditions, lifestyle changes.';
      case 'Common Cold':
        return 'Hand hygiene, avoiding close contact with sick individuals.';
      case 'Dengue':
        return 'Mosquito control measures, using mosquito repellent.';
      case 'Diabetes':
        return 'Healthy diet, regular exercise, weight management.';
      case 'Dimorphic hemorrhoids (piles)':
        return 'High-fiber diet, hydration, avoiding straining during bowel movements.';
      case 'Drug Reaction':
        return 'Avoid known allergens, inform healthcare providers of allergies.';
      case 'Fungal infection':
        return 'Keep skin dry, avoid tight clothing, practice good hygiene.';
      case 'GERD':
        return 'Maintain a healthy weight, avoid trigger foods, elevate the head of the bed.';
      case 'Gastroenteritis':
        return 'Hand hygiene, food safety practices, vaccination where available.';
      case 'Heart attack':
        return 'Maintain a healthy diet, exercise regularly, manage stress.';
      case 'Hepatitis B':
        return 'Get vaccinated, practice safe sex, avoid sharing needles.';
      case 'Hepatitis C':
        return 'Practice safe sex, avoid sharing needles, seek medical treatment for infections.';
      case 'Hepatitis D':
        return 'Get vaccinated for hepatitis B, avoid contact with infected blood.';
      case 'Hepatitis E':
        return 'Practice good hygiene, avoid contaminated water and food.';
      case 'Hypertension':
        return 'Maintain a healthy diet, exercise regularly, manage stress.';
      case 'Hyperthyroidism':
        return 'Take prescribed medications, radioactive iodine treatment, surgery.';
      case 'Hypoglycemia':
        return 'Eat regular meals, monitor blood sugar levels, carry glucose for emergencies.';
      case 'Hypothyroidism':
        return 'Take thyroid hormone replacement medications as prescribed.';
      case 'Impetigo':
        return 'Keep sores clean, use antibiotics as prescribed, practice good hygiene.';
      case 'Jaundice':
        return 'Prevent hepatitis infections, practice good hygiene, vaccination.';
      case 'Malaria':
        return 'Use bed nets, apply insect repellent, take antimalarial medications.';
      case 'Migraine':
        return 'Identify and avoid triggers, take prescribed medications.';
      case 'Osteoarthritis':
        return 'Maintain a healthy weight, exercise regularly, protect joints from injury.';
      case 'Paralysis (brain hemorrhage)':
        return 'Manage underlying conditions, physical therapy, medication.';
      case 'Peptic ulcer disease':
        return 'Avoid spicy foods, alcohol, and smoking; take prescribed medications.';
      case 'Pneumonia':
        return 'Get vaccinated, practice good hand hygiene, avoid smoking.';
      case 'Psoriasis':
        return 'Moisturize skin, use prescribed medications, manage stress.';
      case 'Tuberculosis':
        return 'Complete the full course of prescribed medications.';
      case 'Typhoid':
        return 'Practice good hygiene, avoid contaminated water and food, get vaccinated.';
      case 'Urinary tract infection':
        return 'Stay hydrated, practice good hygiene, urinate after sexual activity.';
      case 'Varicose veins':
        return 'Exercise regularly, elevate legs when resting, avoid prolonged standing or sitting.';
      case 'Hepatitis A':
        return 'Practice good hygiene, vaccination, avoid contaminated water and food.';

      default:
        return 'Prevention measures not available.';
    }
  }

  String _getRemedies(String diseaseName) {
    // Provide remedies based on the diseaseName
    switch (diseaseName) {
      case 'Vertigo (Paroxysmal Positional Vertigo)':
        return 'Epley maneuver, medications for nausea.';
      case 'AIDS':
        return 'Antiretroviral therapy (ART), management of opportunistic infections.';
      case 'Acne':
        return 'Topical treatments (benzoyl peroxide, salicylic acid), oral antibiotics, retinoids.';
      case 'Alcoholic Hepatitis':
        return 'Abstinence from alcohol, supportive care, medications to reduce inflammation.';
      case 'Allergy':
        return 'Avoid allergens, use antihistamines, nasal corticosteroids, or decongestants.';
      case 'Arthritis':
        return 'Pain relievers, anti-inflammatory medications, physical therapy, joint injections.';
      case 'Bronchial Asthma':
        return 'Bronchodilators, inhaled corticosteroids, allergy medications, long-term control medications.';
      case 'Cervical spondylosis':
        return 'Physical therapy, pain medications, muscle relaxants, lifestyle modifications.';
      case 'Chicken pox':
        return 'Antiviral medications, pain relievers, calamine lotion, rest.';
      case 'Chronic cholestasis':
        return 'Medications to improve bile flow, treatment of underlying liver disease.';
      case 'Common Cold':
        return 'Rest, hydration, over-the-counter cold medications, throat lozenges.';
      case 'Dengue':
        return 'Fluid replacement, pain relievers, supportive care.';
      case 'Diabetes':
        return 'Insulin or oral medications, monitoring blood sugar levels, lifestyle changes.';
      case 'Dimorphic hemorrhoids (piles)':
        return 'Topical treatments, dietary changes, minimally invasive procedures.';
      case 'Drug Reaction':
        return 'Discontinuation of the offending drug, supportive care, antihistamines.';
      case 'Fungal infection':
        return 'Antifungal medications (topical or oral), keeping affected areas clean and dry.';
      case 'GERD':
        return 'Antacids, proton pump inhibitors, lifestyle modifications.';
      case 'Gastroenteritis':
        return 'Fluid replacement, anti-diarrheal medications, rest.';
      case 'Heart attack':
        return 'Emergency medical attention, aspirin, nitroglycerin, clot-busting medications.';
      case 'Hepatitis B':
        return 'Antiviral medications, interferon injections, liver transplant in severe cases.';
      case 'Hepatitis C':
        return 'Antiviral medications, liver transplant in severe cases.';
      case 'Hepatitis D':
        return 'Supportive care, antiviral medications.';
      case 'Hepatitis E':
        return 'Supportive care, antiviral medications in severe cases.';
      case 'Hypertension':
        return 'Antihypertensive medications, lifestyle changes, regular monitoring.';
      case 'Hyperthyroidism':
        return 'Antithyroid medications, radioactive iodine treatment, surgery.';
      case 'Hypoglycemia':
        return 'Consuming sugar or glucose, eating regular meals, adjusting medications.';
      case 'Hypothyroidism':
        return 'Thyroid hormone replacement medications.';
      case 'Impetigo':
        return 'Topical or oral antibiotics, keeping sores clean.';
      case 'Jaundice':
        return 'Treatment of underlying cause, supportive care.';
      case 'Malaria':
        return 'Antimalarial medications, bed rest, supportive care.';
      case 'Migraine':
        return 'Pain relievers, triptans, preventive medications, lifestyle changes.';
      case 'Osteoarthritis':
        return 'Pain relievers, physical therapy, lifestyle modifications.';
      case 'Paralysis (brain hemorrhage)':
        return 'Rehabilitation, physical therapy, medication.';
      case 'Peptic ulcer disease':
        return 'Antibiotics (if caused by H. pylori), acid-reducing medications.';
      case 'Pneumonia':
        return 'Antibiotics, rest, hydration, pain relievers.';
      case 'Psoriasis':
        return 'Topical treatments, phototherapy, oral or injected medications.';
      case 'Tuberculosis':
        return 'Antibiotics, often multiple medications for an extended period.';
      case 'Typhoid':
        return 'Antibiotics, supportive care, vaccination for prevention.';
      case 'Urinary tract infection':
        return 'Antibiotics, increased fluid intake, pain relievers.';
      case 'Varicose veins':
        return 'Compression stockings, lifestyle changes, surgical procedures if severe.';
      case 'Hepatitis A':
        return 'Supportive care, vaccination for prevention.';

      default:
        return 'Remedies not available.';
    }
  }
}