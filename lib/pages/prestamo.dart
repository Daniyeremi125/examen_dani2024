import 'package:flutter/material.dart';
import 'alerta_page.dart';

class Prestamo extends StatelessWidget {
  final double loanAmount;
  final int loanPeriod;
  final double monthlyInterestRate;
  final double monthlyPayment;
  final double totalInterest;
  final double totalPayment;

  const Prestamo({
    Key? key,
    required this.loanAmount,
    required this.loanPeriod,
    required this.monthlyInterestRate,
    required this.monthlyPayment,
    required this.totalInterest,
    required this.totalPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Detalles del préstamo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Monto del préstamo', 'S/ ${loanAmount.toStringAsFixed(2)}'),
            _buildDetailRow('Período en meses', '$loanPeriod'),
            _buildDetailRow('Interés mensual %', '${monthlyInterestRate.toStringAsFixed(1)} %'),
            _buildDetailRow('Cuota mensual', 'S/ ${monthlyPayment.toStringAsFixed(2)}'),
            _buildDetailRow('Total de interés a pagar', 'S/ ${totalInterest.toStringAsFixed(2)}'),
            _buildDetailRow('Total a pagar', 'S/ ${totalPayment.toStringAsFixed(2)}'),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Alerta(), 
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Saca tu préstamo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFC107),
            ),
          ),
        ],
      ),
    );
  }
}
