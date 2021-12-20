# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
p1 = Problem.create(name: "Stress")
p2 = Problem.create(name: "Anxiety")
p3 = Problem.create(name: "Depression")
p4 = Problem.create(name: "Irritability")

t1 = Technique.create(
  title: "Cognitive - Behavioral Therapy",
  description: "Elimination of the dependence of emotions and human behavior on his thoughts.",
  age: "25-35",
  gender: 0,
  total_steps: 3,
  duration: "6-7 hours",
  status: 1
)


t2 = Technique.create(
  title: "Lifestyle changes",
  description: "Eliminating the lack of control that makes people feel worse.",
  age: "30-40",
  gender: 1,
  total_steps: 3,
  duration: "5 hours",
  status: 0
)

t3 = Technique.create(
  title: "Inflammation and mood",
  description: "Does a dysfunctional immune system cause inflammation in the body, leading to mood swings?",
  age: "30-45",
  gender: 0,
  total_steps: 3,
  duration: "5 hours",
  status: 1
)

t4 = Technique.create(
  title: "Cognitive elaboration of the predicted future",
  description: "It is necessary to complete the unfinished in the past and live in the present.",
  age: "30-45",
  gender: 0,
  total_steps: 3,
  duration: "10 hours",
  status: 0
)

t5 = Technique.create(
  title: "Cognitive Analytical Therapy",
  description: "A collaborative programme for looking at the way a person thinks, feels and acts, and the events and relationships that underlie these experiences.",
  age: "30-45",
  gender: 0,
  total_steps: 4,
  duration: "7 hours",
  status: 1
)



t1.problems << p1
t1.problems << p3
t2.problems << p2
t2.problems << p4
t3.problems << p1
t4.problems << p2
t4.problems << p3
t4.problems << p4
t5.problems << p2
t5.problems << p4

Coach.create(name: "Adam Loure", email: "mrs.admas@gmail.com", password: "1Q2w3e4!", age: 22, gender: 1)
Coach.create(name: "Ola Marco", email: "olaola@gmail.com", password: "1Q2w3e4!", age: 25,  gender: 0)
Coach.create(name: "James Brown", email: "james@brown.com", password: "1Q2w3e4!", age: 27, gender: 1)
Coach.create(name: "Amelia Adamson", email: "amelia@gmail.com", password: "1Q2w3e4!", age: 23, gender: 0)


Step.create(
  title: "What is cognitive behavioral therapy?",
  body: "Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It’s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past. CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a structured setting. You and your therapist work
  to identify specific negative thought patterns and behavioral responses to challenging or stressful situations. Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder. The principles of CBT can also be applied outside of the therapist’s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.",
  number: 1,
  techniques_id: 1
)


Step.create(
  title: "What is Lifestyle changes?",
  body: "Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It’s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past. CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a structured setting. You and your therapist work
  to identify specific negative thought patterns and behavioral responses to challenging or stressful situations. Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder. The principles of CBT can also be applied outside of the therapist’s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.",
  number: 1,
  techniques_id: 2
)


Step.create(
  title: "What is Inflammation and mood?",
  body: "Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It’s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past. CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a structured setting. You and your therapist work
  to identify specific negative thought patterns and behavioral responses to challenging or stressful situations. Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder. The principles of CBT can also be applied outside of the therapist’s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.",
  number: 1,
  techniques_id: 3
)


Step.create(
  title: "What is Cognitive elaboration of the predicted future?",
  body: "Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It’s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past. CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a structured setting. You and your therapist work
  to identify specific negative thought patterns and behavioral responses to challenging or stressful situations. Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder. The principles of CBT can also be applied outside of the therapist’s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.",
  number: 1,
  techniques_id: 4
)



Step.create(
  title: "What should you do?",
  body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  number: 2,
  techniques_id: 1
)

Step.create(
  title: "What should you do?",
  body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  number: 2,
  techniques_id: 2
)


Step.create(
  title: "What should you do?",
  body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  number: 2,
  techniques_id: 3
)

Step.create(
  title: "What should you do?",
  body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  number: 2,
  techniques_id: 4
)


Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 3,
  techniques_id: 1
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 3,
  techniques_id: 2
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 3,
  techniques_id: 3
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 3,
  techniques_id: 4
)


Step.create(
  title: "What is Cognitive Analytical Therapy?",
  body: "CAT stands for Cognitive Analytic Therapy; a collaborative programme for looking at the way a person thinks, feels and acts, and the events and relationships that underlie these experiences (often from childhood or earlier in life). As its name suggests, it brings together ideas and understanding from different therapies into one user-friendly and effective therapy.
It is a programme of therapy that is tailored to a person’s individual needs and to his or her own manageable goals for change. It is a time-limited therapy - between 4 and 24 weeks, but typically 16. It is available in many parts of the NHS. There are also private CAT therapists across the UK and overseas.
At its heart is an empathic relationship between the client and therapist within the therapeutic boundaries, the purpose of which is to help the client make sense of their situation and to find ways of making changes for the better.",
  number: 1,
  techniques_id: 5
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 2,
  techniques_id: 5
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 3,
  techniques_id: 5
)

Step.create(
  title: "What should you do?",
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  number: 4,
  techniques_id: 5
)


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
