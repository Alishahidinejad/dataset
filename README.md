# Smart Healthcare IoT Transaction Dataset Generator

This MATLAB project simulates transaction requests in an **ultra-dense smart healthcare IoT network**. It creates a labeled dataset of valid and malicious transactions that can be used for:

- Anomaly detection
- Risk estimation
- Availability monitoring
- Edge AI validation
- Blockchain-based transaction filtering

---

## 🏥 Use Case: Smart Healthcare IoT

In this scenario, thousands of IoT devices — such as vital monitors, infusion pumps, wearable trackers, and emergency alert buttons — constantly communicate with nearby edge servers. These devices send different types of transaction requests (e.g., patient vitals, device status, alerts).

Some of these transactions may be malicious due to spoofed data, hijacked devices, or unusual patterns. This tool simulates both normal and malicious behaviors based on real-world patterns.

---

## 📂 What You Get

Running the script generates a CSV file:  
`raw_iot_transactions.csv`

Each row is a transaction with the following fields:

| Column         | Description                                           |
|----------------|-------------------------------------------------------|
| `TxID`         | Unique transaction ID                                 |
| `DeviceID`     | ID of the IoT device (1 to 5000)                      |
| `Timestamp`    | When the transaction was generated                    |
| `Type`         | Type of request: Vitals, Status, Alert, Prescription |
| `PacketSize`   | Size in bytes (50–1200 bytes)                         |
| `ResponseTime` | Latency in ms (10–400 ms)                             |
| `EnergyUsed`   | Energy used (in millijoules)                          |
| `Uptime`       | Device uptime percentage                              |
| `Label`        | `"valid"` or `"malicious"` (for training/testing)     |

---

## ⚙️ How to Run

### Prerequisites

- MATLAB R2020 or later  
- No extra toolboxes required

### Run the Script

```matlab
generate_raw_iot_transactions
