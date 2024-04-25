function updateLeaderboard(name, score)
    %reads in current leaderboard, adds the new score, resorts and saves.

    %reference for file read 
    %https://au.mathworks.com/matlabcentral/answers/72545-how-to-import-csv-file-in-matlab
    leaderboard = readtable("leaderboard.txt");

    %add current game to leaderboard
    %https://www.mathworks.com/help/matlab/matlab_prog/add-and-delete-table-rows.html
    leaderboard = [leaderboard; {name, score}];

    %sort leaderboard low to high based on score
    %https://au.mathworks.com/help/matlab/ref/double.sortrows.html#d122e1208211
    leaderboard = sortrows(leaderboard, 2);

    displayLeaderboard(leaderboard);

    %resave leaderboard in same format
    %does not save the variable names because they are not used
    %https://au.mathworks.com/matlabcentral/answers/402989-removing-varname-row-when-exporting-table-to-csv
    writetable(leaderboard, "leaderboard.txt", "WriteVariableNames",false);

end