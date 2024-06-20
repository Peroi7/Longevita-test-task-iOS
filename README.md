# Longevita-test-task-iOS

# Simple app in a advanced way

## Upute: potrebno je klonirati repozitorij iz terminala sa naredbom <ins>git clone</ins> te se prebaciti u develop granu.
Requirements: Xcode 12+

**Libraries - SPM**

* PureLayout - The ultimate API for iOS & OS X Auto Layout
* IHProgressHUD - HUD presentation library

#### UI - zbog jednostavnosti dizajna aplikacije korišten je Storyboard + programski UI. Uz PureLayout library koji sadrži UIView ekstenzije dodavanje constrainta je dosta pojednostavljeno. UI hijerarhija je složena na način da je custom view ( UserInfoInputView ) dodan u vertikalni stack ( UIStackView ) te smo s time postigli da s jednom komponentom upravljamo svim elementima i držali se DRY nacela. Ovisno o dizajnu i preferencama možemo koristiti razne načine autolayouta.

#### Network  -  dodana je Network generička klasa kako bi u narednim korištenjima pojednostavili reusanje istoimene klase. Nije korišten nikakav dodatni library nego nativni iOS kod ( URLSession.dataTask ). Kroz inicijalizaciju Netowrk klase zadani model enkodiramo & dekodiramo ovisno o potrebi. Post request se dogadja "under the hood" te nam completion vraća result enum koji sadrži success ili failure case s čime smo takodjer postigli error hendlanje. U slučaju errora prikazivamo alert na baznom view controlleru.

#### Architecture - MVVM -  korišten je MVVM kao moderna arhitektura. Zbog same učinkovitosti arhitekture gdje je dodan dodatni layer ViewModel gdje stvaramo Model-ViewModel-View vezu u kojem obavljamo request & potrebne tekst validacije & stvaramo s tim clean code princip gdje su stvari organiziranije. Samim tim je projekt testabilniji & jednostavniji za reuse.

![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 13 48 02](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/d0e7b462-f736-4713-ac66-64818f9414cd)
![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 13 20 40](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/8aabf69e-cffd-4dfa-a57d-5fa4dec7e830)
![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 13 22 02](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/8c60c242-4d35-4246-a033-87c93d041eb9)
![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 13 22 44](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/834772b5-e891-4aba-a306-7efdd569e45b)
![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 14 17 28](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/7aa6b120-268e-42f4-8000-ae2e913344aa)
![Simulator Screen Shot - iPhone 12 Pro Max - 2024-06-20 at 13 22 53](https://github.com/Peroi7/Longevita-test-task-iOS/assets/50051000/3a830807-adf4-41ad-b0a9-b546af067de9)














