#import "template.typ": *

#show: cv.with(
  first-name: me.first-name,
  last-name: me.last-name,
  photo: my-photo,
  headline: me.headline,
  summary: me.summary,
  sidebar: [
    #meta-section("Contact")[
      #for (icon, label, url) in me.contacts {
        side-contact(icon, label, link-to: url)
      }
    ]

    #meta-section("Skills")[
      #side-item[Languages][C, Rust (incl. no\_std), C++, Python, Bash]
      #side-item[Build and CI/CD][GitLab CI, GitHub, Jenkins, CMake, Meson, Docker, Git]
      #side-item[Embedded Linux][Yocto, Linux, NVIDIA Xavier, Xilinx SoC]
      #side-item[Security and updates][Secure bootloaders, A/B OTA and rollback, RSA/ECDSA, ARM TrustZone]
      #side-item[Test and debug][HIL benches, GDB, J-Link, CAN, RF instruments]
      #side-item[MCU and RTOS][FreeRTOS, Zephyr, STM32, Cortex-M, RISC-V]
    ]

    #meta-section("Languages")[
      #side-item[French][Native]
      #side-item[English][Professional working proficiency]
    ]

    #meta-section("Projects")[
      #side-item[Custom drones][Built with ArduPilot and Betaflight, since 2013]
    ]

    #meta-section("Interests")[
      #set text(size: footnotesize, fill: white)
      Home automation, self-hosted servers \
      Mountain biking, running, hiking \
      Reading (sci-fi, science)
    ]
  ],
)

#cv-section[Experience]

#cv-event(role: [Senior Embedded Software Engineer])[05/2026 – Present][Delair, Toulouse][
  #cv-exp(
    [Drone autopilot software],
    [Develop the autopilot software on Zephyr RTOS for several targets (STM32F4, STM32H7); write Zephyr libraries and release-automation tooling in Rust. Git maintainer for the team.],
    [C, Rust, Zephyr, STM32F4, STM32H7, Python, GitLab],
  )
]

#cv-event(role: [Senior Embedded Software Engineer])[02/2024 – 05/2026][Qorvo (Automotive), Toulouse][
  #cv-exp(
    [Secure bootloader with A/B OTA updates],
    [Led the design and implementation of the bootloader for a new Cortex-M33 MCU: A/B partitioning with rollback, RSA/ECDSA image verification, ARM TrustZone, updates over UART and CAN.],
    [C, Rust, Python, RSA/ECDSA, ARM TrustZone, GDB, J-Link],
  )
  #cv-exp(
    [DevOps lead and Git maintainer for all BU projects],
    [Led CI/CD, Git workflows, toolchains and the unit-test framework; standardized Git practices; built the generic Meson build system (replacing CMake), dependency management and development environment; wrote an ELF memory analyzer in Rust.],
    [GitLab CI, Git, Meson, CMake, Python, Rust],
  )
  #cv-exp(
    [MCU SDK and L3 customer support],
    [Developed a FreeRTOS-based C SDK and HAL for several targets, shipped with customer documentation. Provided L3 support: direct customer contact, root-cause analysis, live debugging (HardFault/SecureFault).],
    [C, FreeRTOS, CMake, Cortex-M33/M4, STM32, nRF52],
  )
]

#cv-event(role: [Embedded Software Consultant])[04/2021 – 01/2024][Kickmaker, Toulouse][
  #cv-exp(
    client: [Naïo Technologies],
    date: [11/2022 – 01/2024],
    [Hardware-in-the-loop bench for safety-critical software],
    [Designed a system-level HIL simulator emulating emergency-stop and fault scenarios to verify deterministic power cut-off; maintained the robot's safety control module.],
    [C, Infineon TriCore, HIL, CAN],
  )
  #cv-exp(
    client: [Naïo Technologies],
    date: [11/2022 – 01/2024],
    [CI/CD and release automation on an autonomous farming robot],
    [Defined and deployed the full CI/CD pipeline (unit tests, automated build and release) for an STM32F4 hydraulic control board; developed C++ robot control software and debugged the CAN bus.],
    [C, C++, Rust, GitLab CI, Linux, STM32],
  )
  #cv-exp(
    client: [Leroy Automation],
    date: [04/2022 – 11/2022],
    [Defense radar controller board upgrade],
    [Wrote the Software Detailed Design from system requirements; defined the architecture, build system, CI/CD and unit-test strategy; implemented the C software on a legacy system (V-cycle).],
    [C, Linux, SNMP, TCP/UDP, GitLab CI, Doxygen],
  )
  #cv-exp(
    client: [Exxact Robotics, Epernay],
    date: [04/2021 – 04/2022],
    [Embedded Linux and computer vision for smart sprayers],
    [Built and maintained a custom Yocto BSP and Linux image for a Xilinx SoC (Cortex-A + Cortex-R). Developed a real-time C++ application driving actuators over CAN from camera streams and image recognition.],
    [Yocto, Linux, C++, Python, OpenCV, NVIDIA Xavier, Xilinx, Jenkins, GitHub],
  )
]

#cv-event[02/2021 – 04/2021][IMHOTEP création, Lyon][
  #cv-exp(
    [Real-time control system for connected heating],
    none,
    [C, FreeRTOS, STM32, LoRa, GitLab],
  )
]

#cv-event(role: [Embedded Software Engineer])[06/2014 – 09/2020][Sigfox, Toulouse][
  #cv-exp(
    [Test automation for base stations and radio testers],
    [Built test and characterization benches for base stations: embedded C++ test automation, Python control of lab instruments (spectrum analyzers, power supplies). Designed a network coverage tester (hardware, drivers, UI).],
    [C++, Python, Django, MongoDB, RF instruments, Git],
  )
]

#cv-section[Education]

#cv-education[2017 – 2018][MSc (Master 2) Embedded Systems and Microsystems][Paul Sabatier University, Toulouse]
#cv-education[2013 – 2014][Professional Bachelor's in Radiocommunication Systems Engineering][Paul Sabatier University, Toulouse]
