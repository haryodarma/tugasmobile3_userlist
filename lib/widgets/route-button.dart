import 'package:flutter/material.dart';

class RouteButton extends StatefulWidget {
  RouteButton({
    super.key,
    this.bgBefore = Colors.transparent,
    this.bgAfter = Colors.blue,
    this.tcBefore = Colors.blue,
    this.hgBefore = 40,
    this.hgAfter = 50,
    this.wdBefore = 280,
    this.wdAfter = 300,
    this.tcAfter = Colors.white,
    this.tittle = "Unknown",
    this.borderC = Colors.blue,
    this.nameRoute = "/",
  });

  Color bgBefore;
  Color bgAfter;
  Color tcBefore;
  double hgBefore;
  double hgAfter;
  double wdBefore;
  double wdAfter;
  Color tcAfter;
  String tittle;
  Color borderC;
  String nameRoute;
  @override
  State<RouteButton> createState() => _RouteButtonState();
}

class _RouteButtonState extends State<RouteButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() {
        hover = value;
      }),
      hoverColor: Colors.transparent,
      onTap: () => Navigator.of(context).pushNamed(widget.nameRoute),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        alignment: Alignment.center,
        height: hover ? widget.hgAfter : widget.hgBefore,
        width: hover ? widget.wdAfter : widget.wdBefore,
        decoration: BoxDecoration(
            boxShadow:
                hover ? [BoxShadow(color: widget.bgAfter, blurRadius: 10)] : [],
            borderRadius: BorderRadius.circular(100),
            color: hover ? widget.bgAfter : widget.bgBefore,
            border: Border.all(color: widget.borderC, width: 2)),
        child: Text(
          widget.tittle,
          style: TextStyle(
              color: hover ? widget.tcAfter : widget.tcBefore,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
