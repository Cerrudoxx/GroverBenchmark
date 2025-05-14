# Grover Benchmark

This repository contains the source code developed for my TFG (Trabajo de Fin de Grado) focused on the simulation of quantum circuits using multiple quantum computing frameworks: Qsimov, Qibo, Qiskit, and Qulacs. The project explores the performance of these simulators, measuring execution times and memory consumption using Grover's algorithm.

## Project Overview
The TFG investigates the scalability and efficiency of quantum circuit simulations on classical hardware. Key aspects include:
- **Simulation Frameworks**: Comparative analysis of Qsimov, Qibo, Qiskit, and Qulacs.
- **Metrics**: Execution time and memory usage for circuits with different numbers of qubits and cores.
- **Methodology**: Python scripts automate circuit creation, execution, and performance logging, with results visualized in graphs.
- **Results**: Detailed in the accompanying TFG document (available upon request), with code supporting the experimental data.

## Repository Structure
- `qsimov/`: Qsimov simulation scripts and specific instructions.
- `qibo/`: Qibo simulation scripts and specific instructions.
- `qiskit/`: Qiskit simulation scripts and specific instructions.
- `qulacs/`: Qulacs simulation scripts and specific instructions.

Each simulator folder (`qsimov/`, `qibo/`, `qiskit/`, `qulacs/`) includes a `README.md` file with detailed instructions on how to set up, run, and interpret the respective code.

## How to Use
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/tfg-quantum-simulations.git
   ```
2. **Install Dependencies**: Ensure Python and the required libraries (e.g., `qsimov`, `qibo`, `qiskit`, `qulacs`, `numpy`, `time`) are installed. Refer to each simulator’s `README.md` for specific requirements.
3. **Run the Scripts**: Follow the instructions in the respective simulator folders to execute the simulations.
4. **View Results**: Graphs and data are generated as part of the execution or referenced in the TFG document.

## License
The code in this repository is released under the **GNU General Public License Version 3**. This means you are free to use, modify, and distribute the code, provided you comply with the terms of the license, including sharing any derivative works under the same license. For full details, see the `LICENSE` file or visit [https://www.gnu.org/licenses/gpl-3.0.html](https://www.gnu.org/licenses/gpl-3.0.html).

## Contact
For questions or collaboration, please open an issue in this repository or contact me at jesuscerrudoh@gmail.com.
