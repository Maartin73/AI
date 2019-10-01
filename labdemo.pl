% RULES

% rule 1
stimulus_situation(verbal) :- environment(papers);
                              environment(manuals);
                              environment(documents);
                              environment(textbooks).

% rule 2
stimulus_situation(visual) :- environment(pictures);
                              environment(illustrations);
                              environment(photographs);
                              environment(diagrams).

% rule 3
stimulus_situation(physical_object) :- environment(machines);
                              environment(buildings);
                              environment(tools).

% rule 4
stimulus_situation(symbolic) :- environment(numbers);
                              environment(formulas);
                              environment(computer_programs).

% rule 5
stimulus_response(oral) :- job(lecturing);
                           job(advising);
                           job(counselling).
                              
% rule 6
stimulus_response(hands_on) :- job(building);
                           job(reparing);
                           job(troubleshooting).

% rule 7
stimulus_response(documented) :- job(writing);
                           job(typing);
                           job(drawing).

% rule 8
stimulus_response(analytical) :- job(evaluating);
                           job(reasoning);
                           job(investigating).

% rule 9
medium(workshop) :- stimulus_situation(physical_object),
                    stimulus_response(hands_on),
                    feedback(yes).
                    
% rule 10
medium(lecture_tutorial) :- stimulus_situation(symbolic),
                    stimulus_response(analytical),
                    feedback(yes).

% rule 11
medium(videocassette) :- stimulus_situation(visual),
                    stimulus_response(documented),
                    feedback(no).

% rule 12
medium(lecture_tutorial) :- stimulus_situation(visual),
                    stimulus_response(oral),
                    feedback(yes).

% rule 13
medium(lecture_tutorial) :- stimulus_situation(verbal),
                    stimulus_response(analytical),
                    feedback(yes).

% rule 14
medium(role_play_execises) :- stimulus_situation(verbal),
                    stimulus_response(oral),
                    feedback(yes).



%  OBJECTS
environment(papers).
environment(manuals).
environment(documents).
environment(textbooks).
environment(pictures).
environment(illustrations).
environment(photographs).
environment(diagrams).
environment(machines).
environment(buildings).
environment(tools).
environment(numbers).
environment(formulas).
environment(computer_programs).

job(lecturing).
job(advising).
job(counselling).
job(building).
job(reparing).
job(troubleshooting).
job(writing).
job(typing).
job(drawing).
job(evaluating).
job(reasoning).
job(investigating).

stimulus_situation(verbal).
stimulus_situation(visual).
stimulus_situation(physical_object).
stimulus_situation(symbolic).

stimulus_response(oral).
stimulus_response(hands_on).
stimulus_response(documented).
stimulus_response(analytical).

feedback(yes).
feedback(no).






% 3 inputs required: 1 environment 2 job, 3 feedback yes/no                 
% code here is incomplete and you may wish to modify it
go :- 
    getEnvironment,
    % getJob,
    feedback,
    ( stimulus_situation(SS), 
      nl, write('Stimulus situation is '), write(SS), nl,
      medium(M)
    ;
      writeln('Could not advise on an appropriate medium')
    ).
    % cleanInputs.
      
getEnvironment :-
    write('Input the environment '), 
    read(E), 
    assert(environment(E)).

feedback :-       
    write('Is feedback required yes/no '),
    read(F),
    assert(feedback(F)).
      
cleanInputs :- 
    retractall(environment(_)),
    retractall(job(_)),
    retractall(feedback(_)).