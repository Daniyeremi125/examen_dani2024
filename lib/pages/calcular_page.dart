import 'package:flutter/material.dart';
import 'prestamo.dart';

class CalcularPage extends StatelessWidget {
  const CalcularPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    double loanAmount = 10000;
    int loanPeriod = 24;
    double annualInterestRate = 44;

    double calculateMonthlyPayment(double principal, int months, double annualRate) {
      double monthlyRate = annualRate / 12 / 100;
      double factor = (1 + monthlyRate);
      double denominator = 1 - (1 / factor);

      
      for (int i = 0; i < months; i++) {
        denominator *= factor;
      }

      return principal * monthlyRate / denominator;
    }

    double calculateTotalInterest(double monthlyPayment, double principal, int months) {
      return monthlyPayment * months - principal;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Monto del préstamo',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'S/. ${loanAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFC107),
                            ),
                          ),
                          Slider(
                            value: loanAmount,
                            min: 1000,
                            max: 50000,
                            onChanged: (value) {
                              loanAmount = value;
                            },
                            activeColor: const Color(0xFFFFC107),
                            inactiveColor: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('S/ 1,000.00'),
                              Text('S/ 50,000.00'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Plazo del préstamo',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$loanPeriod meses',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Slider(
                            value: loanPeriod.toDouble(),
                            min: 6,
                            max: 36,
                            onChanged: (value) {
                              loanPeriod = value.toInt();
                            },
                            activeColor: const Color(0xFFFFC107),
                            inactiveColor: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('6 meses'),
                              Text('36 meses'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tasa de interés anual',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$annualInterestRate%',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Slider(
                            value: annualInterestRate,
                            min: 10,
                            max: 50,
                            onChanged: (value) {
                              annualInterestRate = value;
                            },
                            activeColor: const Color(0xFFFFC107),
                            inactiveColor: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('10%'),
                              Text('50%'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
             
                double monthlyPayment = calculateMonthlyPayment(loanAmount, loanPeriod, annualInterestRate);
                double totalInterest = calculateTotalInterest(monthlyPayment, loanAmount, loanPeriod);
                double totalPayment = loanAmount + totalInterest;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Prestamo(
                      loanAmount: loanAmount,
                      loanPeriod: loanPeriod,
                      monthlyInterestRate: annualInterestRate / 12,
                      monthlyPayment: monthlyPayment,
                      totalInterest: totalInterest,
                      totalPayment: totalPayment,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                backgroundColor: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
