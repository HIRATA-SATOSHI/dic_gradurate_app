class Student < ApplicationRecord
  enum course: {L1: 0,
    L2: 1,
    L3: 2,
    L4: 3,
    scholars: 4,
    liberal_arts: 5
  }

  enum enrollment_status: {Yes: 0,
    No: 1,
    Break: 2
  }

  enum site: {自由が丘: 0,
    渋谷: 1,
    吉祥寺: 2,
    四谷: 3,
    酒田: 4
  }

  enum school_year: {小5: 0,
    小6: 1,
    中1: 2,
    中2: 3,
    中3: 4,
    高1: 5,
    高2: 6,
    高3: 7
  }
end
