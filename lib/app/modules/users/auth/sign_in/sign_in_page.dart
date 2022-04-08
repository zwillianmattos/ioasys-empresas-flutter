import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -50,
                    child: Container(
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo-markdown.png",
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              title: RichText(
                text: TextSpan(
                    text: 'Boas vindas, \n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Você está no Empresas.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16)),
                    ]),
              ),
              titlePadding: EdgeInsets.only(left: 16, right: 20, bottom: 31),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Digite seus dados para continuar."),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(Color(0xFF8A8A8A)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      
                                      borderRadius:
                                          BorderRadius.circular(46.0))),
                              side: MaterialStateProperty.all(BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.none))),
                          child: Text("Entrar".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
