class Student < ApplicationRecord
  enum course: {L1: 0,
    L2: 1,
    L3: 2,
    L4: 3,
    scholars: 4,
    liberal_arts: 5
  }
end
