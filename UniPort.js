/**
 * Created by nicolas.couet on 03/04/2015.
 */

var ABaseEntity = require('./ABaseEntity.js');

var Uniport = function () {
    ABaseEntity.apply(this, Array.prototype.slice.call(arguments));
};

Uniport.prototype = new ABaseEntity();

Uniport.prototype.move = function() {
    console.log("Slithering...");
    ABaseEntity.prototype.move.call(this, 5);
};

module.exports = Uniport;