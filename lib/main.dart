import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentFont = 'Caveat';
  
  final Map<String, String> fonts = {
    'Caveat': 'Caveat',
    'ComforterBrush': 'ComforterBrush',
    'Playwrite': 'Playwrite',
  };

  void switchFont() {
    setState(() {
      final keys = fonts.keys.toList();
      final currentIndex = keys.indexOf(currentFont);
      currentFont = keys[(currentIndex + 1) % keys.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NETFLIX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        cardColor: const Color(0xFF1E1E1E),
      ),
      home: NetflixHomePage(
        currentFont: currentFont,
        onFontSwitch: switchFont,
      ),
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String imageUrl;

  const Movie({
    required this.title,
    required this.genre,
    required this.imageUrl,
  });
}

class FeatureCard {
  final String title;
  final String description;
  final IconData icon;

  const FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class FAQ {
  final String question;
  final String answer;

  const FAQ({
    required this.question,
    required this.answer,
  });
}

class NetflixHomePage extends StatefulWidget {
  final String currentFont;
  final VoidCallback onFontSwitch;

  const NetflixHomePage({
    Key? key,
    required this.currentFont,
    required this.onFontSwitch,
  }) : super(key: key);

  @override
  _NetflixHomePageState createState() => _NetflixHomePageState();
}

class _NetflixHomePageState extends State<NetflixHomePage> {
  PageController? _pageController;
  int _expandedFAQIndex = -1;

  final List<Movie> trendingMovies = const [
    Movie(
      title: 'La venganza de Chaturri',
      genre: 'Terror',
      imageUrl: 'assets/images/logo1.jpg',
    ),
    Movie(
      title: 'Jeepers Creepers',
      genre: 'Suspenso',
      imageUrl: 'assets/images/logo2.jpg',
    ),
    Movie(
      title: 'Spiderman',
      genre: 'Acción',
      imageUrl: 'assets/images/logo3.jpg',
    ),
    Movie(
      title: 'David y Aitana',
      genre: 'Comedia',
      imageUrl: 'assets/images/logo4.jpg',
    ),
    Movie(
      title: 'Terrifier',
      genre: 'Terror',
      imageUrl: 'assets/images/logo5.jpg',
    ),
    Movie(
      title: 'Avatar: El Camino del Agua',
      genre: 'Ciencia Ficción',
      imageUrl: 'assets/images/logo6.jpg',
    ),
    Movie(
      title: 'John Wick 4',
      genre: 'Acción',
      imageUrl: 'assets/images/logo7.jpg',
    ),
    Movie(
      title: 'Scream VI',
      genre: 'Terror',
      imageUrl: 'assets/images/logo8.jpg',
    ),
    Movie(
      title: 'Fast X',
      genre: 'Acción',
      imageUrl: 'assets/images/logo9.jpg',
    ),
    Movie(
      title: 'Guardianes de la Galaxia Vol. 3',
      genre: 'Superhéroes',
      imageUrl: 'assets/images/logo10.jpg',
    ),
  ];

  final List<FeatureCard> features = const [
    FeatureCard(
      title: 'Disfruta en tu TV',
      description: 'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV, reproductores de Blu-ray y más.',
      icon: Icons.tv,
    ),
    FeatureCard(
      title: 'Descarga tus series para verlas offline',
      description: 'Guarda tu contenido favorito y siempre tendrás algo para ver.',
      icon: Icons.download,
    ),
    FeatureCard(
      title: 'Disfruta donde quieras',
      description: 'Películas y series ilimitadas en tu teléfono, tablet, laptop y TV.',
      icon: Icons.devices,
    ),
    FeatureCard(
      title: 'Crea perfiles para niños',
      description: 'Los niños vivirán aventuras con sus personajes favoritos en un espacio diseñado exclusivamente para ellos, gratis con tu membresía.',
      icon: Icons.child_care,
    ),
  ];

  final List<FAQ> faqs = const [
    FAQ(
      question: '¿Qué es Netflix?',
      answer: 'Netflix es un servicio de streaming que ofrece una gran variedad de películas, series y documentales premiados en miles de dispositivos conectados a internet.',
    ),
    FAQ(
      question: '¿Cuánto cuesta Netflix?',
      answer: 'Disfruta Netflix en tu smartphone, tablet, smart TV, laptop o dispositivo de streaming, todo por una tarifa plana mensual.',
    ),
    FAQ(
      question: '¿Dónde puedo ver Netflix?',
      answer: 'Ve Netflix donde quieras, cuando quieras. Inicia sesión en tu cuenta de Netflix para ver contenido al instante a través de netflix.com desde tu computadora personal.',
    ),
    FAQ(
      question: '¿Cómo cancelo?',
      answer: 'Netflix es flexible. Sin contratos molestos ni compromisos. Puedes cancelar fácilmente tu cuenta online con dos clics.',
    ),
    FAQ(
      question: '¿Qué puedo ver en Netflix?',
      answer: 'Netflix tiene un amplio catálogo de películas, series, documentales, animes, originales premiados y más.',
    ),
    FAQ(
      question: '¿Es bueno Netflix para los niños?',
      answer: 'La experiencia de Netflix para niños está incluida en tu membresía para que los padres tengan el control mientras los niños disfrutan series y películas familiares en su propio espacio.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'NETFLIX',
          style: TextStyle(
            fontFamily: widget.currentFont,
            fontSize: 28,
            color: const Color(0xFFE50914),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: widget.onFontSwitch,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.font_download, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Aa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE50914),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Iniciar sesión',
              style: TextStyle(
                fontFamily: widget.currentFont,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section (Card estático con fondo de spiderman)
            HeroSection(currentFont: widget.currentFont),
            
            // Trending Section (Carrusel de películas)
            Container(
              color: const Color(0xFF000000),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Tendencias',
                    style: TextStyle(
                      fontFamily: widget.currentFont,
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = constraints.maxWidth;
                      final isSmallScreen = screenWidth < 600;
                      final cardWidth = isSmallScreen ? 140.0 : 160.0;
                      final visibleCards = isSmallScreen ? 2.5 : 4.0;
                      final spacing = isSmallScreen ? 8.0 : 12.0;
                      
                      return SizedBox(
                        height: isSmallScreen ? 280 : 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: spacing),
                          itemCount: trendingMovies.length,
                          itemExtent: cardWidth + spacing,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: spacing),
                              child: TrendingMovieCard(
                                movie: trendingMovies[index],
                                index: index + 1,
                                currentFont: widget.currentFont,
                                cardWidth: cardWidth,
                                isSmallScreen: isSmallScreen,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Features Section
            Container(
              color: const Color(0xFF000000),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Más motivos para unirte',
                    style: TextStyle(
                      fontFamily: widget.currentFont,
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...features.map((feature) => FeatureCardWidget(
                    feature: feature,
                    currentFont: widget.currentFont,
                  )),
                ],
              ),
            ),

            // FAQ Section
            Container(
              color: const Color(0xFF000000),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Preguntas frecuentes',
                    style: TextStyle(
                      fontFamily: widget.currentFont,
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...faqs.asMap().entries.map((entry) {
                    int index = entry.key;
                    FAQ faq = entry.value;
                    return FAQItem(
                      faq: faq,
                      isExpanded: _expandedFAQIndex == index,
                      onTap: () {
                        setState(() {
                          _expandedFAQIndex = _expandedFAQIndex == index ? -1 : index;
                        });
                      },
                      currentFont: widget.currentFont,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final String currentFont;

  const HeroSection({
    Key? key,
    required this.currentFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Container(
      height: screenHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/spiderman.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.red.withOpacity(0.3),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              );
            },
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          // Content - Centered
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 20 : 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer to account for AppBar
                  SizedBox(height: MediaQuery.of(context).padding.top + 80),
                  Text(
                    'Películas y series ilimitadas y mucho más',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: currentFont,
                      fontSize: isSmallScreen ? 32 : 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A partir de S/ 28.90. Cancela cuando quieras.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: currentFont,
                      fontSize: isSmallScreen ? 16 : 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '¿Quieres ver Netflix ya? Ingresa tu email para crear una cuenta o reiniciar tu membresía de Netflix.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: currentFont,
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email field and button
                  Container(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: isSmallScreen
                        ? Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Dirección de email',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE50914),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Comenzar',
                                        style: TextStyle(
                                          fontFamily: currentFont,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Dirección de email',
                                    hintStyle: const TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(0.7),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE50914),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Comenzar',
                                        style: TextStyle(
                                          fontFamily: currentFont,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  // Bottom spacer
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingMovieCard extends StatelessWidget {
  final Movie movie;
  final int index;
  final String currentFont;
  final double cardWidth;
  final bool isSmallScreen;

  const TrendingMovieCard({
    Key? key,
    required this.movie,
    required this.index,
    required this.currentFont,
    required this.cardWidth,
    required this.isSmallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageHeight = isSmallScreen ? 200.0 : 240.0;
    final numberSize = isSmallScreen ? 60.0 : 80.0;
    
    return Container(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: cardWidth,
                  height: imageHeight,
                  child: Image.asset(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.movie,
                              color: Colors.white54,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: isSmallScreen ? 10 : 12,
                                  fontFamily: currentFont,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                left: -12,
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontFamily: currentFont,
                    fontSize: numberSize,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(0.8),
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: TextStyle(
              fontFamily: currentFont,
              fontSize: isSmallScreen ? 12 : 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            movie.genre,
            style: TextStyle(
              fontFamily: currentFont,
              fontSize: isSmallScreen ? 10 : 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCardWidget extends StatelessWidget {
  final FeatureCard feature;
  final String currentFont;

  const FeatureCardWidget({
    Key? key,
    required this.feature,
    required this.currentFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF232323),
            Color(0xFF1a1a1a),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: isSmallScreen
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE50914).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    feature.icon,
                    color: const Color(0xFFE50914),
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      feature.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: currentFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      feature.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: currentFont,
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE50914).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    feature.icon,
                    color: const Color(0xFFE50914),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature.title,
                        style: TextStyle(
                          fontFamily: currentFont,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        feature.description,
                        style: TextStyle(
                          fontFamily: currentFont,
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final FAQ faq;
  final bool isExpanded;
  final VoidCallback onTap;
  final String currentFont;

  const FAQItem({
    Key? key,
    required this.faq,
    required this.isExpanded,
    required this.onTap,
    required this.currentFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: const Color(0xFF2D2D2D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        faq.question,
                        style: TextStyle(
                          fontFamily: currentFont,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.close : Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 16),
                  Text(
                    faq.answer,
                    style: TextStyle(
                      fontFamily: currentFont,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}