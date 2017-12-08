function scrollLastTeamIntoView() {
  const teams = document.querySelectorAll('.team');
  const lastTeam = teams[teams.length - 1];

  if (lastTeam !== undefined) {
    lastTeam.scrollIntoView();
  }
}
