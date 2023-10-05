import 'package:ckeditor/Models/quizmodel.dart';

List<Quiz> quizList = [
    Quiz(
      statement:
          r"""<p>Calculate the current flows through the 10 \(\Omega\)  resistor in the following circuit.
</p>""",
      options: [
        QuizOption(
          id: "id_1",
          option: r""" <p>(A) 1.2 \(\text{A}\) </p>""",
        ),
        QuizOption(
          id: "id_2",
          option: r""" <p>(B) 0.6 \(\text{A}\) </p>""",
        ),
        QuizOption(
          id: "id_3",
          option: r""" <p>(C) 0.2 \(\text{A}\)</p>""",
        ),
        QuizOption(
          id: "id_4",
          option: r""" <p>(D) 2.0 \(\text{A}\)</p>""",
        ),
      ],
    ),
    Quiz(
        statement: 'Newton\'s second law deals with the inertia of an object',
        options: [
          QuizOption(
              id: 'id_1',
              option:
                  r""" <p>  \(x = {-b + \sqrt{b^2+4ac} \over 2a}\)</p>""" "")
        ]),
    Quiz(
        statement:
            r"""<p>Three friends Om, Jay and Jagdish are going around a circular ground. Om takes 12 minutes to complete one round of the ground, while Jay takes 18 minutes and Jagdish takes 25 minutes for the same. If they all start at the same point and at the same time and go in the same direction, after what time will they meet again at the starting point. If the distance between the points \(3,4\) and \(a,0\) is 4, then the value of a is 2 </p>""",
        options: [
          QuizOption(
              id: 'id_1',
              option:
                  r""" <p>Prove that \(\sqrt{\frac{\sec P + 1}{\sec P - 1}} = \csc P + \)cot P
</p>
"""
                  "")
        ]),
    Quiz(
      statement:
          r"""<p>A beam of light is incident through the holes on side A and emerges out of the hole on the other face of the box as shown in the figure. Which of the following could be inside the box?
</p>""",
      options: [
        QuizOption(
          id: "id_1",
          option: r""" <p>(a) Concave lens</p>""",
        ),
        QuizOption(
          id: "id_2",
          option: r""" <p>(b) Rectangular glass slab
</p>""",
        ),
        QuizOption(
          id: "id_3",
          option: r""" <p>(c) Prism
</p>""",
        ),
        QuizOption(
          id: "id_4",
          option: r""" <p>(d) Convex lens</p>""",
        ),
      ],
    ),
    Quiz(
      statement:
          r"""<p>Plasmolysis in a plant cell is defined as breakdown (lysis) of plasma membrane in hypotonic medium Under the Unitary system, either there is only one level of government or the sub-units are subordinate to the central government.</p>""",
      options: [],
    ),
    Quiz(
      statement:
          r"""<p>Objects fall at the same rate because they are affected by the same gravitational force. The physicist Neils Bohr proposed a model for the atom in which the electrons orbit the nucleus in fixed orbits
</p>""",
      options: [],
    ),
    Quiz(
      statement:
          r"""<p>Ammonia is found in many household products, such as window cleaners. It turns red litmus blue. What is its nature?</p>""",
      options: [],
    ),
    Quiz(
      statement:
          r"""<p>If \(\alpha\) and \(\beta\) are the zeroes of the quadratic polynomial \(f(x) =x^2 - x - 2\), then the polynomial whose zeroes are \(\alpha^2 + 1\) and \(\beta^2 + 1\) is</p>""",
      options: [
        QuizOption(
          id: "id_1",
          option: r""" <p>(a) \(x^2 - 7x + 10\)</p>""",
        ),
        QuizOption(
          id: "id_2",
          option: r""" <p>(b) \(x^2 - 4x - 5\)
</p>""",
        ),
        QuizOption(
          id: "id_3",
          option: r""" <p>(c) \(x^2 + 7x + 10\)

</p>""",
        ),
        QuizOption(
          id: "id_4",
          option: r""" <p>(d) \(x^2 - 4x + 5\)</p>""",
        ),
      ],
    ),
  ];