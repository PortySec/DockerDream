### Netishot: Network Troubleshooting Docker Image

**Description:**
Netishot is a Docker image based on Alpine Linux, designed for network troubleshooting and diagnostics. It includes a suite of essential tools like `curl`, `netcat`, `ping`, `nmap`, `tcpdump`, and more, offering a lightweight yet powerful environment for network analysis.

**Key Features:**

- **Lightweight Alpine Base**: Minimizes resource usage and speeds up deployment.
- **Comprehensive Toolset**: Equipped with `curl`, `netcat`, `ping`, `nmap`, `tcpdump`, `traceroute`, `iperf3`, and `mtr` for diverse network tasks.
- **Easy to Use**: Simply run the container and start diagnosing network issues.

**How to Use:**

1. **Pull the Image**:

   ```bash
   docker pull portysec/netishot:latest
   ```

2. **Run a Container**:

   ```bash
   docker run -it --rm --name netishot portysec/netishot
   ```

3. **Execute Network Commands**:
   - To check connectivity to a host using `ping`:
     ```bash
     ping google.com
     ```
   - To scan ports on a host using `nmap`:
     ```bash
     nmap -p 80,443 google.com
     ```
   - To capture packets using `tcpdump`:
     ```bash
     tcpdump -i eth0
     ```
   - To perform a network throughput test with `iperf3`:
     ```bash
     iperf3 -c iperf-server-host
     ```

**Customization:**

- Users can easily extend the Dockerfile to include additional tools or configurations specific to their network troubleshooting needs.
