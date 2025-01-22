Reason: 
- GetX was chosen as the state management due to its efficiency for small project, and also I already familiar with it
- It implemented using controllers to handle application logic and data, for feature such as adding, deleting, updating, and filtering task. Managed using observable state (Rx) to reflect data changes in the UI in real time.
- Dependency injection is managed through Binding, making it easier to manage dependencies across application.

Tech Stack:
- SQLite
- Dio
- Cached Network Image
- GetX

Project Structure:
lib/
├── data/
│   ├── datasources/     
│   ├── models/         
│   └── repositories/      
├── domain/
│   ├── entities/         
│   ├── repositories/      
│   └── usecases/         
├── presentation/
│   ├── screens/        
│   ├── components/      
│   └── controllers/     
└── main.dart  

