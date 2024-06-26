import 'package:ezorrio_dev/model/education.dart';
import 'package:ezorrio_dev/model/project.dart';
import 'package:ezorrio_dev/model/work.dart';

class DataRepository {
  String name = 'Emin Guliev';
  String photo = 'https://avatars.githubusercontent.com/u/4018146?s=400&u=474410b93a2c77f660919a1dc9a5655a319e3661&v=4';
  DateTime birth = DateTime(1998, 1, 3);
  String nickname = 'ezorrio';
  String location = 'Oslo, Norway';
  String bio = 'Code 💻... Sleep 😴... Repeat 🔁';
  String studyPlace = 'University of Vienna';
  String studyField = 'MSc Data Science';
  String jobPlace = 'Coop Norge';
  String jobTitle = 'Senior Mobile Application Developer';
  SocialNetworkLinks networkLinks = SocialNetworkLinks();

  static List<String> univiennaCourses = [
    'Parallel Computing',
    'Parallel Architectures and Programming Models',
    'Numerical Algorithms',
    'Natural Language Processing',
    'Mining Massive Data',
    'Foundations of Data Analysis',
    'Data Mining',
    'Combinatorial and Numerical Algorithms',
    'Business Intelligence 1',
    'Algorithms and Data Structures 2',
    'Advanced Software Engineering',
    'Advanced Algorithms',
  ];

  List<Education> education = [
    Education(
        place: 'University of Vienna',
        occupation: 'Master of Computer/Data Science',
        description: 'Passed courses: \n${univiennaCourses.join('\n')}',
        start: DateTime(2020, 3),
        end: DateTime.now()),
    Education(
      place: 'Moscow Power Engineering Institute',
      occupation: 'Bachelor of Computer Science',
      description: 'Studies were focused more on mathematics rather than on programming',
      start: DateTime(2014, 9),
      end: DateTime(2018, 6),
    )
  ];

  List<Project> projects = [
    Project(
        title: 'Phoenix for VK',
        description: 'Alternative open-sourced VK Client for Android\n'
            'Co-founder. Project written from scratch on Java.\n'
            'Distributed on Google Play.\n'
            'Total amount of users all-time of more than 250K.',
        link: 'https://github.com/PhoenixDevTeam/Phoenix-for-VK',
        tags: [
          'android',
          'java',
          'kotlin',
          'rxjava2',
          'vk',
          'material-design',
          'material-components',
          'encryption',
          'gson',
          'exoplayer',
          'firebase-database',
          'firebase-messaging',
          'androidx',
          'mvp'
        ],
        start: DateTime(2014),
        end: DateTime(2019)),
    Project(
        title: 'Yandex Translate (non-official)',
        description: 'Alternative Yandex.Translate for Android\n'
            'Open-source project to improve knowledge on bleeding-edge frameworks and patterns according to that time.',
        link: 'https://github.com/ezorrio/YandexTranslate',
        tags: [
          'android',
          'kotlin',
          'room',
          'yandex',
          'kotlin-extensions',
          'moshi',
          'material-components',
          'moshi',
          'coroutines-android',
          'livedata',
          'androidx',
          'jetpack-android'
        ],
        start: DateTime(2018),
        end: DateTime(2018)),
    Project(
        title: 'News classifier',
        description:
            'Deep learning project which predicts news topic (predefined set, i.e. politics, sports and etc).\n'
            'Focused on Russian text. As source for learning Lenta.ru articles were used',
        tags: ['python', 'tensorflow', 'glove', 'fasttext', 'word2vec', 'cnn', 'rcnn', 'news', 'russian', 'nlp'],
        start: DateTime(2018),
        end: DateTime(2018)),
    Project(
        title: 'Music genre recognition',
        description: 'Machine learning project which predicts music genre based on features\n'
            'Uses Local Sensitive Hashing (LSH). Used FMA as dataset for learning.',
        link: 'https://github.com/ezorrio/genre-classification',
        tags: ['python', 'lsh', 'fma', 'music'],
        start: DateTime(2021),
        end: DateTime(2021))
  ];

  List<Work> works = [
    Work(
      company: 'Coop Norge',
      link: 'https://coop.no',
      position: 'Senior Mobile Application Developer',
      start: DateTime(2022, 12),
      end: DateTime.now(),
      projects: [
        Project(
            title: 'Coop Member App',
            description: 'Responsibilities:\n'
                '- Architecture of the new app, principles and guidelines\n'
                '- Strategy for transitioning legacy code to new defined standards\n'
                '- Implementation of business-critical functionalities\n'
                '- New CI/CD, release management\n'
                '- Identifying technical debt and strategy to solve that',
            tags: [
              'flutter',
              'dart',
              'android',
              'ios',
            ]),
      ],
    ),
    Work(
      company: 'wheel.me',
      link: 'https://wheel.me',
      position: 'Lead Software Developer',
      start: DateTime(2020, 3),
      end: DateTime(2022, 12),
      projects: [
        Project(
            title: 'wheel.me app',
            description: 'Developed a Cross-platform Real-time Flutter application for:\n'
                '- Controlling wheels and groups of wheels\n'
                '- Managing missions, zones, map data and other data\n'
                'Running on Android, iOS, Linux, Windows, macOS and Web\n\n'
                'Working on:\n'
                '- Application design\n'
                '- Code, architecture, CI/CD\n'
                '- AppStore/Google Play Distribution\n\n'
                'Initially was working on the project alone, thus I\'ve created the application, additionally was responsible for everything above-mentioned, including decision-making. Afterwards, as project grew, I\'ve managed a team:\n'
                '- Deadlines estimation\n'
                '- Creation and distribution of tasks\n'
                '- Interviewing new members\n'
                '- Synchronization with other departments of the company',
            tags: [
              'flutter',
              'dart',
              'robotics',
              'platform-widgets',
              'protobuf',
              'grpc',
              'android',
              'ios',
              'macos',
              'windows',
              'linux',
              'web'
            ]),
      ],
    ),
    Work(
      company: 'UnmannedSystems Russia',
      projects: [
        Project(
            title: 'Lockey App',
            description: 'application for device tracking:\n'
                '- control devices such as drones, cars, mobile device and etc.\n'
                '- ability to locate all of devices and view them on chosen map provider (Google/OSM/Yandex)\n'
                '- push notification regarding some changes in device status\n'
                '- custom secure-protocol implemented',
            tags: ['android', 'rxjava', 'mvp', 'firebase', 'google-maps', 'yandex-maps', 'openstreetmaps']),
        Project(
            title: 'Drone Controller',
            description: 'application for DJI drones operation\n'
                '- implemented most operations available via DJI SDK (drone flight modes, calibration, camera streaming & control, drone status view and much more)\n'
                '- transmit videostream from drone-controller device to many others including data-servers',
            tags: ['android', 'rxjava', 'mvp', 'dji-sdk', 'google-maps', 'yandex-maps', 'openstreetmaps']),
        Project(
            title: 'Lockey App for Desktop',
            description: 'application for device tracking (see above) - written in C#',
            tags: ['windows', 'c#', 'google-maps', 'yandex-maps', 'openstreetmaps']),
        Project(
            title: 'VideoCollector for Desktop',
            description:
                '- application for viewing several real-time video streams at once (up to 8) with minimal latency. C# & VLC',
            tags: [
              'windows',
              'c#',
              'vlc',
            ]),
        Project(
            title: 'VideoCollector for Desktop QT',
            description:
                'QT based project proposed by me to develop a cross-platform app with the same features using ffmpeg to get more stable app.',
            tags: [
              'qt',
              'ffmpeg',
              'windows',
              'linux',
              'macos',
            ]),
        Project(
            title: 'DVB-T restreamer (Embedded)',
            description:
                ' Raspberry Pi/Tinkerboard project aiming at producing a portable device to stream video-data from up to 4 cameras transmitted over DVB-T (different frequencies) to save them on local drives / remote servers.',
            tags: ['embedded', 'raspberry-pi', 'tinkerboard', 'dvb-t', 'ffmpeg'])
      ],
      link: 'https://unmannedsystems.ru',
      position: 'Lead Software Developer',
      start: DateTime(2018, 2),
      end: DateTime(2019, 11),
    ),
    Work(
      company: 'i-EXP',
      projects: [
        Project(
            title: 'Maquette Controller',
            description: 'Application for controlling physical maquette of a location\n'
                '- worked with UART and Bluetooth\n'
                '- control each object on maquette (lights, elevator & etc)\n'
                '- support different maquettes\n'
                '- presentation mode, automatic execution of sequence of actions',
            tags: [
              'android',
              'rxjava',
              'uart',
              'bluetooth',
            ]),
        Project(
            title: 'Videowall Controller',
            description: 'Application for controlling custom video display with unspecified amount of panels (3-9)\n'
                '- multithread image output of images to display\n'
                '- control data displayed on each panel\n'
                '- ability to move data between panels\n'
                '- presentation mode',
            tags: [
              'android',
              'rxjava',
              'exoplayer',
              'streaming',
            ]),
        Project(
            title: 'Application for AR Streaming',
            description: '- device location-data processing\n'
                '- appending virtual objects to real video obtained from device\n'
                '- occlusion task resolved - transmit video data in aRGB formal\n'
                '- transformation of coordination system from ARCore into Unity\n'
                '- obtained minimal possible streaming latency\n'
                'Used libraries: Tango, ARCore and Vuforia SDK',
            tags: [
              'android',
              'tango',
              'augmented-reality',
              'virtual-reality',
              'streaming',
            ])
      ],
      link: 'https://i-exp.ru',
      position: 'Android Developer',
      start: DateTime(2017, 9),
      end: DateTime(2018, 3),
    ),
  ];
}

class SocialNetworkLinks {
  static String nickname = 'ezorrio';

  // String facebook = 'https://fb.com/$nickname';
  String email = 'mailto:me@ezorr.io';
  String linkedin = 'https://linkedin.com/$nickname';
  String telegram = 'https://t.me/$nickname';
  String github = 'https://github.com/$nickname';
  String instagram = 'https://instagram.com/$nickname';
  String twitter = 'https://twitter.com/$nickname';
}
