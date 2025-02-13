
<p align="center">
   <img src="https://github.com/user-attachments/assets/1c884451-06ca-45ff-bab0-0a6a696cd28f" alt="LOGO" width=200/>
   <h1 align="center" >Performance Testing Report</h1>
</p>

To ensure that AlignKit delivers optimal performance and robustness, we conducted various forms of performance testing. Below is a detailed overview of the key tests we performed, along with their results. 

---

> [!Note]
> The following simulation was done on **iPhone 14**, running on iOS 18.1 with a testing procedure of same parameters 

### **1. FPS Stability**  

A consistent and smooth user experience requires the OS to maintain a refresh rate of **60 FPS**. Any significant drops in FPS can lead to visual stuttering and poor performance perception. With AlignKit, we consistently achieved stable FPS, ensuring smooth animations and seamless UI interactions.  

| **Result Comparison** |  
| --- |  
| <img width="420" alt="FPS" src="https://github.com/user-attachments/assets/9948dbf8-d7c5-48f0-9ff1-db3871222e24"> |  

---

### **2. CPU Utilization**  

Managing constraints efficiently is crucial for keeping **CPU utilization** at an optimal level. High CPU usage can lead to increased power consumption and reduced device responsiveness. AlignKit demonstrated highly efficient CPU usage, outperforming comparable alternatives and minimizing computational overhead during layout calculations.  

| **Result Comparison** |  
| --- |  
| <img width="420" alt="CPU U" src="https://github.com/user-attachments/assets/b2ade75d-9284-4505-a6d6-808252e717d7"> |  

---

### **3. Core Animation Layout Duration**  

Core Animation is a critical component of rendering smooth transitions and layouts. The **layout duration** reflects how quickly the system can calculate and prepare layouts for rendering. When AlignKit was used, the Core Animation layout times got significantly reduced, showcasing its efficiency in handling complex constraints and dynamic UI updates.  

| **Result Comparison** |  
| --- |  
| <img width="420" alt="CAU" src="https://github.com/user-attachments/assets/711974e2-9820-4406-8218-41961b85333e"> |  

---

### **4. Memory Usage**  

Efficient memory usage is vital to prevent crashes and maintain smooth app performance, especially on devices with limited resources. In the following perfomance testing AlignKit demonstrated slightly better memory management, leading to a smaller memory footprint compared to other frameworks(Memory footprints were almost the same for all).

| **Result Comparison** |  
| --- |  
| <img width="420" alt="Memory" src="https://github.com/user-attachments/assets/ab4c18c4-2e4c-4e1c-8ca4-8cee3ae253ec"> |  

---

### **5. Boot Constraint Setup Performance**  

The time required to initialize and apply constraints directly impacts the app's launch performance. With AlignKit, we observed a significant improvement in **constraint setup performance** compared to the market alternative, ensuring faster boot times and a smoother user experience right from the start. The perfomance can be further improved by cold starting the framework.  

| **Result Comparison** |  
| --- |  
| <img width="420" alt="BCSP" src="https://github.com/user-attachments/assets/2e83d776-4caa-4661-b136-02e15e8e5186"> |  

---

### **6. Layout Performance**  

The efficiency of the layout engine affects how quickly UI elements are updated, especially during animations or dynamic content changes. AlignKit gave the same perfomance of NSLayoutConstraints in **layout performance**, demonstrating its ability to handle complex scenarios with any lag or delay.  

| **Result Comparison** |  
| --- |  
| <img width="420" alt="LP" src="https://github.com/user-attachments/assets/e7fd3057-052a-4b20-bf37-bd84921514c4"> |  

---

### **Summary**  

The comprehensive performance testing validates that AlignKit not only matches but often surpasses the performance of leading alternatives. From FPS stability to memory management and CPU efficiency, AlignKit proves to be a reliable and modern solution for constraint management, offering a robust and developer-friendly experience.
