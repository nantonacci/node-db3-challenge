const db = require("../data/db-config.js");

function find() {
  return db("Schemes");
}

function findById(id) {
  return db("Schemes").where({ id });
}

function findSteps(id) {
  return db("steps")
    .join("Schemes", "Schemes.id", "steps.scheme_id")
    .select("steps.id", "Schemes.scheme_name", "steps.instructions")
    .where({ scheme_id: id });
}

function add(schemeData) {
  return db("Schemes").insert(schemeData);
}

// stretch
function addStep(stepData, id) {
  return db("steps")
    .join("Schemes", "Schemes.id", "steps.scheme_id")
    .where({ scheme_id: id })
    .insert(stepData);
}

function update(changes, id) {
  return db("Schemes")
    .where({ id })
    .update(changes);
}

function remove(id) {
  return db("Schemes")
    .where({ id })
    .del();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};
