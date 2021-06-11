Docker Compose Service
=========

Role enables a linux host for docker-compose services hosting.
Role by itself doesn't deploy any services.

Requirements
------------

Docker and docker-compose installed.

Example Playbook
----------------

    - hosts: servers
      roles:
         - role: ViacheslavIsaev.enable_docker_compose_service

License
-------

BSD

Author Information
------------------

Viacheslav Isaev has two decades of experience of distributed high payload systems development. He has been in charge of developing control systems for safety-critical facilities like railroads and particle accelerators, high-payload event processing systems for cybersecurity and mobile access points, introducing in house CI/CD practices. His hands-on experience incldues all stages of IT solutions development and operation. Vyacheslav’s interests lays in automation spectr either it is pure software or hardware-software solutions. Vyacheslav defines the key to success in 3 pillars  Domain Driven Design, Behavioral Driven and Test-Driven Development, which are standing on the foundation of  Object Oriented Design and Clean Code practices.
