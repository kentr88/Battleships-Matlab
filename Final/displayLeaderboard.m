function displayLeaderboard(leaderboard)
    %displays leaderboard

    %display leaderboard - title and col titles
    fprintf("Leaderboard\n");
    fprintf("   Name          Score\n");

    %loop for length of leaderboard or stop at 10, whichevers smallest
    for i = 1:min(height(leaderboard), 10)
        fprintf("%d. %s       %d\n", i, string(leaderboard{i, 1}), leaderboard{i, 2});
    end

end