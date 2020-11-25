class Student < ApplicationRecord
  enum course: {level_1: 0,
    level_2: 1,
    level_3: 2,
    level_4: 3,
    scholars: 4,
    liberal_arts: 5
  }

  enum enrollment_status: {yes: 0,
    no: 1,
    break: 2
  }

  enum site: {jiyugaoka: 0,
    shibuya: 1,
    kichijoji: 2,
    yotsuya: 3,
    sakata: 4
  }

  enum school_year: {fifth_grader: 0,
    sixth_grader: 1,
    seventh_grader: 2,
    eighth_grader: 3,
    ninth_grader: 4,
    tenth_grader: 5,
    eleventh_grader: 6,
    twelfth_grader: 7
  }
end
