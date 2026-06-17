const form = document.querySelector('form')
const reset = document.getElementById('reset')

const persona = document.getElementById('persona')
const forename = document.getElementById('forename')
const surname = document.getElementById('surname')
const begin = document.getElementById('begin')
const end = document.getElementById('end')
const crown = document.getElementById('crown')
const award = document.getElementById('award')

const inputs = [persona, forename, surname, begin, end, crown, award]

const non_persona = inputs.filter(x => x != persona)
const with_persona = []

const non_forename = inputs.filter(x => x != forename && x != surname)
const with_forename = [surname]

const non_surname = non_forename
const with_surname = [forename]

const non_begin = inputs.filter(x => x != begin && x != end)
const with_begin = [end]

const non_end = non_begin
const with_end = [begin]
const non_crown = inputs.filter(x => x != crown)
const with_crown = []

const non_award = inputs.filter(x => x != award)
const with_award = []

function setDisabled(value, ins) {
  ins.forEach(x => {
    x.disabled = value;
    x.labels.forEach(l => {
      l.classList.toggle("disabled", value)
    })
  })
}

function updateDisabled(value, others, group) {
  setDisabled(value, others)
  if (!value) {
    setDisabled(false, group)
  }
}

persona.addEventListener("input", function(event) {
  updateDisabled(persona.value, non_persona, with_persona)
})

forename.addEventListener("input", function(event) {
  updateDisabled(forename.value || surname.value, non_forename, with_forename)
})

surname.addEventListener("input", function(event) {
  updateDisabled(surname.value || forename.value, non_surname, with_surname)
})

begin.addEventListener("input", function(event) {
  updateDisabled(begin.value || end.value, non_begin, with_begin)
})

end.addEventListener("input", function(event) {
  updateDisabled(end.value || begin.value, non_end, with_end)
})

crown.addEventListener("input", function(event) {
  updateDisabled(crown.value, non_crown, with_crown)
})

award.addEventListener("input", function(event) {
  updateDisabled(award.value, non_award, with_award)
})

form.addEventListener("reset", function(event) {
  updateDisabled(false, inputs, [])
})
