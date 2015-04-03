/**
 * Created by nicolas.couet on 03/04/2015.
 */

toto = require('./ABaseEntity.js');

exports.UniPort = function () {
    this.prototype = Object.create(toto.ABaseEntity.prototype);
}