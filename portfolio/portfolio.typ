#import "template.typ": *

#show: portfolio.with(
  keywords: ("Embedded Systems", "Rust", "C/C++", "Real-time Systems", "IoT"),
)

#section-bar([Skills], above: 14pt)

#skills(
  ([Programming languages], ([C], [Rust / Rust no\_std], [Bash], [C++], [Python])),
  ([Operating systems], ([Linux], [macOS])),
  ([Technologies], (
    [FreeRTOS / Zephyr],
    [I2C, SPI, CAN, UART, USB, PWM],
    [RISC-V],
    [Yocto],
    [DMA],
    [ARM],
    [Embedded Linux],
    [Radio frequency],
  )),
  ([Tools], ([Git], [CI/CD], [CMake], [GDB], [GitLab / GitHub], [Docker], [Meson])),
)

#section-bar([Experience], above: 16pt)

#experience(
  role: [Senior Embedded Software Engineer],
  company: [Delair, Toulouse],
  date: [05/2026 – Present],
  about: [Delair designs and builds professional drones.],
  missions: (
    (
      [Autopilot software],
      [Develop the drone autopilot software on Zephyr RTOS for several targets, including STM32F4 and STM32H7 MCUs.],
    ),
    (
      [Rust development],
      [Write Zephyr libraries in Rust, as well as Rust tooling that automates software releases.],
    ),
    (
      [Git maintainer],
      [Maintain the team's Git repositories and workflows.],
    ),
  ),
  tech: ([C], [Rust], [Zephyr], [STM32F4], [STM32H7], [Python], [GitLab]),
)

#experience(
  role: [Senior Embedded Software Engineer],
  company: [Qorvo (Automotive BU), Toulouse],
  date: [02/2024 – 05/2026],
  about: [Qorvo is developing a new ARM Cortex-M33-based microcontroller with an integrated UWB radio module. As this MCU is newly developed, we were responsible for creating all low-level software components, including SEGGER J-Link scripts (JTAG/SWD), flash loaders and drivers, and bootloaders.],
  missions: (
    (
      [SDK development],
      [Designed and developed a C-based SDK built on FreeRTOS to enable efficient use of our MCU. The SDK includes a comprehensive Hardware Abstraction Layer (HAL) for peripheral drivers and supports multiple hardware targets, including Qorvo modules integrated with STM32F429 and nRF52840 platforms. It is delivered with extensive technical documentation to facilitate customer integration.],
    ),
    (
      [Project management and DevOps],
      [Led the DevOps and CI/CD initiatives within the team, overseeing Git workflows, toolchains and the unit-testing framework. Established and standardized the team's Git practices. Built the generic Meson build system (replacing CMake), dependency management and development environment, and authored the associated technical documentation. Wrote an ELF memory analyzer in Rust.],
    ),
    (
      [Bootloader development],
      [Led the design and implementation of a C-based bootloader for our ARM Cortex-M33 MCU. The bootloader supports a native OTA update mechanism with an A/B partitioning scheme for safe firmware upgrades and rollback capability. Firmware updates can be delivered over UART or CAN bus.],
    ),
    (
      [Low-level debugging],
      [As a member of the low-level debugging team, investigated and resolved critical system faults, including HardFault and SecureFault exceptions on ARM Cortex-M33. This involved in-depth analysis using GDB, detailed examination of ARM registers and thorough review of technical documentation to determine root causes and implement fixes.],
    ),
    (
      [L3 support],
      [Provided Level 3 technical support for customer issues related to MCU and SDK integration: direct customer communication, root-cause analysis and live debugging sessions to diagnose and resolve complex technical problems.],
    ),
  ),
  tech: (
    [C],
    [FreeRTOS],
    [Rust],
    [Python],
    [ARM TrustZone],
    [Cortex-M33],
    [Cortex-M4],
    [STM32],
    [nRF52],
    [GDB],
    [J-Link],
    [Meson],
    [CMake],
    [Git],
    [GitLab CI/CD],
  ),
)

#experience(
  role: [Embedded Software Consultant],
  company: [Kickmaker, for Naïo Technologies, Toulouse],
  date: [11/2022 – 01/2024],
  about: [Naïo develops robots that support farmers in their work.],
  missions: (
    (
      [Hydraulic cylinder control board],
      [Designed and implemented embedded firmware for a hydraulic cylinder control board using an STM32F4 MCU. Implemented PWM-based motor control and UART communication for configuration and diagnostics. Defined and deployed the full CI/CD pipeline, including the unit-testing framework and automated build and release processes.],
    ),
    (
      [Safety control module],
      [Maintained and developed safety-critical C software running on an Infineon TriCore MCU. The module supervised safety inputs (e.g. emergency stop, fault signals) and performed an immediate power cut-off to ensure safe operation of the robot.],
    ),
    (
      [Simulation bench (HIL)],
      [Designed and implemented a system-level Hardware-in-the-Loop (HIL) simulator to validate safety-critical software. Developed test scenarios emulating real-world inputs (e.g. emergency stop, fault conditions) to verify deterministic power cut-off behavior.],
    ),
    (
      [Robot software (C++)],
      [Contributed to the main robot control software in C++. Worked on guidance algorithms and performed CAN bus debugging and analysis to ensure reliable communication between subsystems.],
    ),
  ),
  tech: ([C], [C++], [CAN], [Linux], [STM32], [GitLab CI/CD]),
)

#experience(
  role: [Embedded Software Consultant],
  company: [Kickmaker, for Leroy Automation, Toulouse],
  date: [04/2022 – 11/2022],
  about: [Radar controller board upgrade (defense sector). Participated in a defense project to extend a radar controller board with support for new hardware components. The project involved maintaining and upgrading a legacy system developed in the early 2000s, requiring work with outdated technologies, standards and toolchains.],
  missions: (
    (
      [Software development (C, safety / embedded context)],
      [Authored the Software Detailed Design (SDD) based on system-level requirements. Defined the project architecture, including repository structure, build system, CI/CD pipeline and unit-testing strategy. Implemented the embedded software in C in compliance with project and quality standards.],
    ),
  ),
  tech: ([C], [Linux], [SNMP], [TCP], [UDP], [GitLab CI/CD], [Doxygen], [V-cycle]),
)

#experience(
  role: [Embedded Software Consultant],
  company: [Kickmaker, for Exxact Robotics, Epernay],
  date: [04/2021 – 04/2022],
  about: [Exxact Robotics develops a system deployed on sprayer tractors, including cameras and image-analysis algorithms for weed detection.],
  missions: (
    (
      [Yocto BSP and Linux image development],
      [Designed and maintained a custom Yocto image for a Xilinx SoC (ARM Cortex-A + Cortex-R). Configured the build system, managed layers and recipes, and tailored the Linux distribution to the project requirements.],
    ),
    (
      [Embedded vision application (C++)],
      [Developed the embedded application managing camera data streams, interfacing with image-recognition algorithms and controlling actuators over CAN bus according to real-time detection outputs.],
    ),
  ),
  tech: ([C++], [Python], [Linux], [OpenCV], [Xilinx], [Yocto], [NVIDIA Xavier], [Jenkins CI/CD], [GitHub], [Agile]),
)

#experience(
  role: [Embedded Software Engineer],
  company: [IMHOTEP création, Lyon],
  date: [02/2021 – 04/2021],
  about: [IMHOTEP création designs and develops connected heating systems for large-scale distribution.],
  missions: (
    (
      [Real-time embedded system development (STM32 / FreeRTOS)],
      [Designed and implemented a real-time control system for a connected heating solution in C, based on an STM32 MCU and FreeRTOS. Managed task scheduling and GPIO drivers.],
    ),
  ),
  tech: ([C], [FreeRTOS], [STM32], [LoRa], [GitLab]),
)

#experience(
  role: [Embedded Software Engineer],
  company: [Sigfox, Toulouse],
  date: [06/2014 – 09/2020],
  about: [Sigfox is an IoT network operator that designs its own low-power wide-area (LPWAN) communication protocol. The company develops and deploys base stations, composed of computing units, radio boards and antennas, to provide nationwide and European network coverage.],
  missions: (
    (
      [Sigfox radio tester],
      [Designed and developed a Sigfox radio tester used to validate network coverage and performance. Selected the electronic components, including the MCU and radio transceiver, and developed the embedded software, drivers and user interface.],
    ),
    (
      [Test bench for Sigfox base stations],
      [Designed and built a test bench dedicated to validating Sigfox base stations. Developed embedded C++ software integrated into the test equipment to automate functional and performance testing.],
    ),
    (
      [Characterization bench for Sigfox base stations],
      [Designed and built a characterization test bench for Sigfox base stations. Implemented Python software to control laboratory equipment such as spectrum analyzers and power supplies for RF and performance analysis.],
    ),
  ),
  tech: (
    [C/C++],
    [Python],
    [MongoDB],
    [Django],
    [HTML/CSS],
    [JavaScript],
    [UML],
    [RF measuring instruments],
    [Confluence],
    [Git],
  ),
)

#experience(
  role: [Personal projects],
  company: [Hobby],
  date: [Since 2013],
  missions: (
    ([Custom drones], [Designed and built custom drones using ArduPilot and Betaflight.]),
  ),
  tech: ([ArduPilot], [Betaflight]),
)

#section-bar([Education], above: 18pt)

#degree[2017 – 2018][Master 2 (MSc) Embedded Systems and Microsystems][Paul Sabatier University, Toulouse]
#degree[2013 – 2014][Professional Bachelor's in Radiocommunication Systems Engineering][Paul Sabatier University, Toulouse]

#section-bar([Languages], above: 18pt)

#grid(
  columns: (1fr, 1fr),
  inset: (top: 6pt),
  language([French], 5, [Native]),
  language([English], 3.5, [Professional working proficiency]),
)
