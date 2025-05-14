# Simulación del Algoritmo de Grover con Qulacs

Esta aplicación implementa el algoritmo de Grover utilizando la biblioteca **Qulacs** para simulación cuántica. Además de ejecutar el algoritmo, mide el tiempo de ejecución y la desviación estándar de múltiples ejecuciones, monitorea el uso de CPU y RAM, guarda los resultados en archivos CSV y genera gráficos del uso de RAM a lo largo del tiempo. La salida en la consola se enriquece mediante la biblioteca **Rich**.

## Requisitos y Dependencias

Para ejecutar esta aplicación, necesitas instalar las siguientes dependencias con las versiones indicadas:

- **Python**: 3.9.21
- **psutil**: 5.9.0
- **numpy**: 1.26.4
- **qulacs**: 0.6.11
- **matplotlib**: 3.5.0
- **rich**: (versión no especificada, pero necesaria para la salida en consola enriquecida)

Asegúrate de usar estas versiones para garantizar la compatibilidad.

## Instalación

1. **Clonar el repositorio** (si aplica) o descargar los archivos al directorio de trabajo.
2. **Instalar las dependencias**:
    - Usa `pip` para instalarlas manualmente:
      ```bash
      pip install psutil==5.9.0 numpy==1.26.4 qulacs==0.6.11 matplotlib==3.5.0 rich
      ```
    - Si existe un archivo requirements.txt, puedes usar:
      ```bash
      pip install -r requirements.txt
      ```

## Uso

La aplicación se ejecuta desde la línea de comandos con el script principal (`grover_qulacs_main.py`) y acepta los siguientes argumentos:

- `n`: Número de qubits o rango de qubits (por ejemplo, '4' o '4-7'). Debe ser mayor que 2.
- `--cores`: Número de núcleos de CPU a utilizar (por defecto, usa todos los núcleos disponibles).
- `--no-ram`: Deshabilita el monitoreo de RAM.
- `--no-cpu`: Deshabilita el monitoreo de CPU.

### Ejemplos de Ejecución

Ejecutar con 4 qubits y todos los núcleos disponibles:
```bash
python grover_qulacs_main.py 4
```

Ejecutar con un rango de qubits de 4 a 7 y 2 núcleos:
```bash
python grover_qulacs_main.py 4-7 --cores 2
```

Ejecutar con 5 qubits sin monitoreo de RAM:
```bash
python grover_qulacs_main.py 5 --no-ram
```

## Descripción de las Clases Principales

### GroverRunner (`grover_runner.py`)

- **Propósito**: Construye y ejecuta el circuito cuántico del algoritmo de Grover, midiendo su rendimiento.
- **Parámetros de Entrada**:
     - `n`: Número de qubits.
     - `cores`: Número de núcleos de CPU.
     - `ram_monitor`: Instancia de `RAMMonitor` (o `None` si no se usa).
     - `cpu_monitor`: Instancia de `CPUMonitor` (o `None` si no se usa).
     - `console`: Objeto `Console` de Rich para la salida.
- **Métodos Clave**:
     - `_build_circuit()`: Construye el circuito de Grover con el número óptimo de iteraciones.
     - `_run_simulation(num_iterations)`: Ejecuta la simulación varias veces y devuelve los tiempos en nanosegundos.
     - `run()`: Ejecuta el algoritmo, calcula estadísticas (tiempo medio, desviación estándar, uso de CPU/RAM) y devuelve un diccionario con los resultados.

### ResultsHandler (`results_handler.py`)

- **Propósito**: Maneja la visualización de resultados en tablas y su guardado en archivos CSV.
- **Parámetros de Entrada**:
     - `file_name`: Nombre base del archivo CSV.
     - `results_dir`: Directorio donde se guardan los resultados.
    - `console`: Objeto `Console` de Rich.
- **Métodos Clave**:
    - `save_to_csv(data)`: Guarda los datos en un archivo CSV.
    - `display_timing_table(data)`: Muestra una tabla con el tiempo medio y la desviación estándar.
    - `display_usage_table(data)`: Muestra una tabla con el uso promedio de CPU y RAM.
    - `save_console_output()`: Guarda la salida de la consola en un archivo `out.txt`.

### CPUMonitor y RAMMonitor (`ResourceMonitor.py`)

- **Propósito**: Monitorean el uso de CPU y RAM, respectivamente, durante la ejecución.
- **Parámetros de Entrada**:
    - `interval`: Intervalo de muestreo en segundos (por defecto, 0.1).
- **Métodos Clave**:
    - `start()`: Inicia el monitoreo en un hilo separado.
    - `stop()`: Detiene el monitoreo.
    - `average()`: Devuelve el promedio de las lecturas.
    - `max_memory_usage()` (solo `RAMMonitor`): Devuelve el pico máximo de uso de RAM.
    - `memory_usage_in_mb()` (solo `RAMMonitor`): Devuelve el uso de RAM en MB.
    - `real_time_memory_usage(file_name)` (solo `RAMMonitor`): Monitorea y guarda el uso de RAM en tiempo real en un archivo CSV.

### Funciones Auxiliares
### Script Principal (`grover_qulacs_main.py`)

- **Propósito**: Orquesta la ejecución de la aplicación, configurando núcleos, manejando argumentos y coordinando las clases.
- **Funciones Clave**:
    - `set_active_cores(cores)`: Configura el número de núcleos activos mediante variables de entorno y afinidad de CPU.
    - `main()`: Parsea argumentos, configura el entorno, ejecuta el algoritmo para cada número de qubits y guarda los resultados.


### Flujo de la Aplicación

1. **Parseo de Argumentos**: Lee los argumentos de línea de comandos (`n`, `--cores`, `--no-ram`, `--no-cpu`).
2. **Configuración de Núcleos**: Ajusta los núcleos de CPU a utilizar con `set_active_cores()`.
3. **Creación del Directorio de Resultados**: Genera un directorio único (por ejemplo, `results_4_qubits_2_cores`) para almacenar los datos.
4. **Monitoreo Continuo de RAM (si está habilitado)**: Inicia un hilo para registrar el uso de RAM en tiempo real.
5. **Ejecución por Cada `n`**:
    - Crea una instancia de `GroverRunner` y ejecuta el algoritmo.
    - Recopila tiempos y estadísticas de recursos.
    - Usa `ResultsHandler` para mostrar tablas y guardar datos en CSV.
6. **Finalización**: Genera gráficos de uso de RAM y guarda la salida de la consola.

### Notas Adicionales

- **Reinicio del Estado Cuántico**: El estado cuántico se reinicia a `|0>` antes de cada ejecución en `GroverRunner` para garantizar mediciones precisas.
- **Directorio de Resultados**: Se evita la sobrescritura de resultados añadiendo un índice (por ejemplo, `results_4_qubits_2_cores(1)`).
- **Monitoreo Opcional**: El monitoreo de CPU y RAM puede desactivarse para ejecuciones más rápidas o en sistemas con recursos limitados.