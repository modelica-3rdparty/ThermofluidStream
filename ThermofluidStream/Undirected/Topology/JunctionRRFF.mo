within ThermofluidStream.Undirected.Topology;
model JunctionRRFF "Junction of two rear and two fore ports"

  extends ThermofluidStream.Utilities.DropOfCommonsPlus;

  replaceable package Medium = Media.myMedia.Interfaces.PartialMedium "Medium model"
    annotation (choicesAllMatching=true, Documentation(info="<html>
<p>Medium package for the Junction.</p>
</html>"));
  parameter Boolean assumeConstantDensity = true "= true, if mixture states are determined by mass flow rates"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter SI.MassFlowRate m_flow_reg = dropOfCommons.m_flow_reg "Regularization threshold for small mass flow rates"
    annotation (Dialog(tab="Advanced"));
  parameter Utilities.Units.Inertance L=dropOfCommons.L "Inertance of each branch"
    annotation (Dialog(tab="Advanced"));

  Interfaces.Rear reara(redeclare package Medium=Medium)
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Interfaces.Rear rearb(redeclare package Medium=Medium)
    annotation (Placement(transformation(extent={{-20,80},{20,120}})));
  Interfaces.Fore foreB(redeclare package Medium=Medium)
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
  Interfaces.Fore foreA(redeclare package Medium=Medium)
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  JunctionMN junctionMN(
    displayInstanceName=true,
    final M=2,
    final N=2,
    final assumeConstantDensity=assumeConstantDensity,
    final m_flow_reg=m_flow_reg,
    final L=L,
    redeclare package Medium=Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  connect(foreB, junctionMN.fores[2]) annotation (Line(
      points={{100,0},{98,0.5},{10,0.5}},
      color={28,108,200},
      thickness=0.5));
  connect(foreA, junctionMN.fores[1]) annotation (Line(
      points={{0,-100},{0,-14},{18,-14},{18,-0.5},{10,-0.5}},
      color={28,108,200},
      thickness=0.5));
  connect(junctionMN.rears[1], reara) annotation (Line(
      points={{-10,-0.5},{-12,0},{-100,0}},
      color={28,108,200},
      thickness=0.5));
  connect(rearb, junctionMN.rears[2]) annotation (Line(
      points={{0,100},{0,14},{-18,14},{-18,0.5},{-10,0.5}},
      color={28,108,200},
      thickness=0.5));
  annotation (defaultComponentName = "junction", Icon(coordinateSystem(preserveAspectRatio=true), graphics={
        Text(visible=displayInstanceName,
          extent={{-150,65},{150,25}},
          textString="%name",
          textColor=dropOfCommons.instanceNameColor),
        Line(visible= not displayInstanceName,
          points={{0,0},{0,100}},
          color={28,108,200},
          thickness=0.5),
        Line(visible= displayInstanceName,
          points={{0,0},{0,20}},
          color={28,108,200},
          thickness=0.5),
        Line(visible= displayInstanceName,
          points={{0,70},{0,100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-100,0},{0,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,0},{100,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,-100},{0,0}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-6,6},{6,-6}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Text(
          extent={{-60,120},{-20,80}},
          textColor={175,175,175},
          textString="b"),
        Text(
          extent={{80,-60},{120,-20}},
          textColor={175,175,175},
          textString="B"),
        Text(
          extent={{-20,-120},{-60,-80}},
          textColor={175,175,175},
          textString="A"),
        Text(
          extent={{-80,-20},{-120,-60}},
          textColor={175,175,175},
          textString="a")}),
    Diagram(coordinateSystem(preserveAspectRatio=true)),
    Documentation(info="<html>
<p>Junction with two rears and two fores in a x shape.</p>
</html>"));
end JunctionRRFF;
